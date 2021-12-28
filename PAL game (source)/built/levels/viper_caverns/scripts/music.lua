TrackA = SoundSpecs.MUS_Q4B_VC_Fight_Out2
TrackB = SoundSpecs.MUS_Q4B_VC_PBattle_End
TrackC = SoundSpecs.MUS_VC_Cave_Viper_Stinger2
TrackD = SoundSpecs.MUS_VC_Cave_Viper_Stinger1
--TrackE = SoundSpecs.MUS_VC_Cave_Viper_Fight
TrackF = SoundSpecs.MUS_VC_Tal_Trapped
TrackG = SoundSpecs.MUS_VC_Tal_Free
TrackH = SoundSpecs.MUS_VC_Cavern_Intro
TrackI = SoundSpecs.MUS_VC_Ship_Reveal
TrackJ = SoundSpecs.MUS_VC_Exploration
TrackNone = SoundSpecs.MUS_NULL

-- this makes sure music will continue to update even during npc scenes
set_cinematic_update_mode( true )

if SAVE.auto_load_music ~= nil then
	prt( "AutoRequesting: " .. SAVE.auto_load_music )
	request_music_track( SAVE.auto_load_music )
end

local request_music_save = false

while true do

	local all_windmills_done = SAVE.windmill1_complete and 
	                           SAVE.windmill2_complete and 
	                           SAVE.windmill3_complete and 
	                           SAVE.windmill4_complete and 
	                           SAVE.windmill5_complete;
    								
	-- ================================================================================
	-- Do checks for making track change requests here
	-- ================================================================================
	
	--[[if  cave_in_active and taltrappedCO == nil then
		wait(3.0)
		request_music_track( "TalTrapped" )
		taltrappedCO = true
		prt("poor tal")
	end
	
	if stoptaltrapped and taltrappedCO2 == nil then
		request_music_track( "NoMusic" )
		taltrappedCO2 = true
		prt("no soup for you")
	end
	]]--
	if talfreed and talfreeCO == nil then
		request_music_track( "TalFree" )
		talfreeCO = true
		prt("yay tal")
	end
	
	if darkwaterflyCO then
		request_music_track( "ShipReveal" )
		wait(1.0)
		darkwaterflyCO = false
		prt("goonies")
	end
	
	if bargeCO then
		request_music_track( "HereWeAre" )
		wait(1.0)
		bargeCO = false
		prt("to late to turn back now")
	end
	
	if is_in_volume(get_hero(), AUD_MUS_VC_EXP) then
		request_music_track( "FunkyExp" )
		request_music_save = true
		prt("you're no indy")
	end
	
	if is_in_volume(get_hero(), VOL_MUS_Viper_Stinger) and ViperScare2 == nil then
		request_music_track( "ViperScare2" )
		ViperScare2 = true
		prt("scary viper II")
	end
	
	if ViperScareStinger and ViperScare1 == nil then
		request_music_track( "ViperScare1" )
		ViperScare1 = true
		prt("scary viper I")
	end
	
	--[[paul and i decided this did not fit so well cro 5/8 if (is_in_volume(get_hero(), MUS_ViperFight_Start) and is_grinding( get_hero())) then
		request_music_track("ViperFight")
		prt("scary viper theme")
	end
	
	if is_in_volume(get_hero(), MUS_ViperFight_Stop) then
		request_music_track( "NoMusic" )
	end
	]]--
	if is_in_volume(get_hero(), AUD_VOL_KILL_MUS) and SAVE.auto_load_music == "VCFightOut" then
		request_music_track( "PBattleEnd" )
		fightstinger = true
		prt("no soup for you2")
	end
	
	if is_in_volume(get_hero(), AUD_VOL_KILL_SV) and fightstinger then
		request_music_track( "NoMusic" )
	end
	
	if is_in_volume(get_hero(), AUD_VOL_KILL_MUS2) and fightstinger then
		request_music_track( "NoMusic" )
	end
	
	if is_in_volume(get_hero(), AUD_VOL_KILL_MUS3) and fightstinger then
		request_music_track( "NoMusic" )
	end
	
	-- ================================
	-- SPECIAL CONSIDERATION MUSIC CHECKPOINTS
	-- ================================
    
	-- ================================================================================
	-- Check to see if a new music track has been requested
	if(get_music_track_request()) then
		-- ================================================================================
		-- Do checks for which track to play here
		-- ================================================================================

		-- This plays at the end of the Pirate Battle in VC
		if (MUSIC_TRACK_REQUEST == "PBattleEnd") then
			play_music( TrackNone, 0, true, 0, 0, 0 );
			play_music( TrackB, 2, true, 0, 1, 0 );
		end
		
		-- This plays during the fight out of Viper Caverns
		if (MUSIC_TRACK_REQUEST == "VCFightOut") then
			play_music( TrackA, 0, true, 1, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This plays during the exploration of the ships just before Darkwaters ship
		if (MUSIC_TRACK_REQUEST == "FunkyExp") then
			play_music( TrackJ, 0, true, 1, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This is a stinger for the Shadow Viper scare
		if (MUSIC_TRACK_REQUEST == "ViperScare2") then
			play_music( TrackC, 2, true, 0, 1, 0 );
		end
		
		-- This is a stinger for the Shadow Viper scare
		if (MUSIC_TRACK_REQUEST == "ShipReveal") then
			play_music( TrackI, 2, true, 0, 1, 0 );
		end
		
		-- This is a stinger for the intro scene to Viper Caverns
		if (MUSIC_TRACK_REQUEST == "HereWeAre") then
			play_music( TrackH, 2, true, 0, 1, 0 );	
		end
		
		-- This is a stinger for the Cave Viper introduction
		if (MUSIC_TRACK_REQUEST == "ViperScare1") then
			play_music( TrackD, 2, true, 0, 1, 0 );
			
		end
		
		--[[This is plays during the GrindRail sequence past the viper and through the ship.  TEMP TEST 5/6 cro
		if (MUSIC_TRACK_REQUEST == "ViperFight") then
			play_music( TrackE, 0, true, 0, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		--]]
		-- This plays during the fight out of Viper Caverns
		--[[if (MUSIC_TRACK_REQUEST == "TalTrapped") then
			play_music( TrackF, 0, true, 0, 4, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		]]--
		-- This is a stinger for the free tal scene
		if (MUSIC_TRACK_REQUEST == "TalFree") then
			play_music( TrackG, 2, true, 0, 1, 0 );
			
		end
		
		-- Null Music theme
		if (MUSIC_TRACK_REQUEST == "NoMusic") then
			play_music( TrackNone, 0, true, 0, 0, 0 );
			play_music( TrackNone, 1, true, 0, 0, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		if request_music_save then
		    request_auto_save()
			request_music_save = false
		end		
	
	-- ================================================================================
	end -- end if the if(new_track) check
	wait() -- wait till next frame to check again
end

-- Music Track System Functions:
--   request_music_track( track_name ) 
--     - Submits a request to change the current music track
--   get_music_track_request() 
--     - Checks to see if there is a pending track change to run
--   do_music_track_transition_check( moby, volume, front_track, back_track, <pre_delay = 0.5>, <retrigger_delay = 5> )
--     - Does the checks for requesting a music track change from passing through the center plane
--       of the volume. The pre_delay and retrigger_delay are both optional, and do not need to be set.
--
-- Music Track System Global Values:
--   MUSIC_TRACK_REQUEST - When get_music_track_request() returns true, this value 
--                         contains the name of the new music track to play.
--   CURRENT_MUSIC_TRACK - Contains the name of the currently playing music track.
