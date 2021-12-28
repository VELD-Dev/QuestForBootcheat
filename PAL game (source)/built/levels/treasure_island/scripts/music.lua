TrackA = SoundSpecs.MUS_Q4B_TI_Spooky
TrackB = SoundSpecs.MUS_Q4B_TI_MiniBoss
TrackC = SoundSpecs.MUS_VC2_Main_Combat_Theme
TrackD = SoundSpecs.MUS_Q4B_TI_MiniBoss_Death
TrackE = SoundSpecs.MUS_Q4B_TI_MiniBoss_PopOut
TrackF = SoundSpecs.MUS_Q4B_TI_Organ_Fly
TrackG = SoundSpecs.MUS_Q4B_TI_Brew_Fly
TrackH = SoundSpecs.MUS_Q4B_NPC_Beach_Battle
TrackNone = SoundSpecs.MUS_NULL

-- this makes sure music will continue to update even during npc scenes
set_cinematic_update_mode( true )

if SAVE.auto_load_music ~= nil then
	prt( "AutoRequesting: " .. SAVE.auto_load_music )
	request_music_track( SAVE.auto_load_music )
end

local request_music_save = false

SAVE.sproketco2 = false

-- This is very bad, don't do this. - AY
-- SAVE.completed_organ_puzzle = false

local requested_organ_music = false

while true do


    								
	-- ================================================================================
	-- Do checks for making track change requests here
	-- ================================================================================

	--The main spooky music for TI
  	if is_in_volume( get_hero(), MUS_TI_Spooky ) and SAVE.Andthebeatgoeson and not SAVE.battlefield_finished and not COTI then
	    request_music_track( "SpookyTheme" )
	    prt("Starting spooky")
	    request_music_save = true
	    COTI = true
	end
	
	--This starts the music for the brew completed flyover
	if allformegrog then
	    request_music_track( "BrewFly" )
	    --wait(1.0)
	    allformegrog = false
	end
	
	--This starts the music for the brew completed flyover
	if musictomyears then
	    request_music_track( "OrganFly" )
	    wait(1.0)
	    musictomyears = false
	end
	
	--music for the battle after the light puzzle is complete
	if SAVE.completed_light_puzzle and not SAVE.battlefield_finished then
		request_music_track( "BeachBattle" )
	    request_music_save = true
	end
	
	
	--The fighting theme for VC2
  	if is_in_volume( get_hero(), MUS_VC_Combat2 ) then
	    request_music_track( "VC2Fight" )
	    request_music_save = true
	end
	
	--Starts the cave fight theme after sprocket is dead
  	if is_in_volume( get_hero(), MUS_VC_Sproket ) and not is_alive( vc2_shinglepirate ) then
	    request_music_track( "DeathtoSproket" )
	    request_music_save = true
	end
	
	--This starts the music for the MiniBoss conversation
	if SAVE.vc2_scene_shingle_trigger and is_alive( vc2_shinglepirate ) and not SAVE.sproketco1 then
	    request_music_track( "SproketIntro" )
	    --request_music_save = true
	    wait(1.0)
	    SAVE.sproketco1 = true
	end
	
	-- this restarts the vc2 theme if ratchet dies after triggering the sproket npc scene
	if SAVE.vc2_scene_shingle_trigger and is_alive( vc2_shinglepirate ) and not is_in_volume( get_hero(), MUS_VC_Sproket ) and not COmustbestopped then
		request_music_track( "VC2Fight" )
		request_music_save = true
		COmustbestopped = true
    end
	
	--This starts the music for the MiniBoss fight
	if  SAVE.fightsproket and is_alive( vc2_shinglepirate ) and is_in_volume( get_hero(), MUS_VC_Sproket ) and not SAVE.sproketco2 then
	    request_music_track( "SproketFight" )
	    prt("Sproket aint so tuff")
	    request_music_save = true
	    wait(1.0)
	    SAVE.sproketco2 = true
	end
	
	--This stops the music if the organ puzzle hasn't been completed
	if  requested_organ_music == false and is_in_volume( get_hero(), MUS_TI_Kill_Music) then
	    request_music_track( "NoMusic" )
	    organdead = true
	    request_music_save = true
	--[[else if is_in_volume( get_hero(), MUS_TI_Kill_Music) and organdead == nil then
	    request_music_track( "SpookyTheme" )
	    organdead = true
	    request_music_save = true
	  end--]]
	end
	
	--This restarts the spooky music after the organ puzzle is complete
	if organflyaudiodone and not requested_organ_music then
	   wait(1.0)
	   request_music_track( "SpookyTheme" )
	   request_music_save = true
	   requested_organ_music = true -- this makes sure we only request it once, and that we don't keep requesting it for the duration of the level
	end
	
	--This restarts the spooky music after the brew puzzle fly through
	if requested_brewstinger_music then
	   prt("i like to drink")
	   request_music_track( "SpookyTheme" )
	   request_music_save = true
	   requested_brewstinger_music = nil -- this makes sure we only request it once, and that we don't keep requesting it for the duration of the level
	end
	
	--The main spooky music for TI again, again
  	if is_in_volume( get_hero(), MUS_TI_Spooky_Restart ) then
	    request_music_track( "SpookyTheme" )
	    organdead = nil
	    request_music_save = true
	end
	
	--This kills the music at the end of the level.
	if turnmusicoff and not COKILL42 then
	    request_music_track( "NoMusic" )
	    prt("Death to dirge")
	    COKILL42 = true
	end
	
	--[[	--The main spooky music for TI after going through Viper Caverns2
  	if is_in_volume( get_hero(), MUS_TI_Spooky2 ) then
	    request_music_track( "SpookyTheme" )
	    request_music_save = true
	end
	--]]
	
	--[[I'm commenting out npc stuff so i can still ref it later
	--this starts the beach battle muisc...hopefully
	if SAVE.scene_battle_mayor_intro and not battle_started then
		request_music_track( "BeachBattle" )
		request_music_save = true
	end

	--this changes the music to the light explore theme after all the windmills are done
	if ontolighthouse == nil then
	  if SAVE.auto_load_music == "WindmillExplore" and all_windmills_done then
		wait(5.0)
		request_music_track( "LiteExplore" )
		request_music_save = true
		ontolighthouse = true
	  end
	end
	
	--this stops the music after the light house is done
	if lighthousedone == nil then
	  if crank_is_complete( lighthouse_top_bolt ) then
	   wait (4.0)
	   request_music_track( "NoMusic" ) 
	   request_music_save = true
	   lighthousedone = true
	  end
	end
	--]]
	
	-- ================================
	-- SPECIAL CONSIDERATION MUSIC CHECKPOINTS
	-- ================================
    
	-- ================================================================================
	-- Check to see if a new music track has been requested
	if(get_music_track_request()) then
		-- ================================================================================
		-- Do checks for which track to play here
		-- ================================================================================

		
		-- This plays at the start of Treasure Island
		if (MUSIC_TRACK_REQUEST == "SpookyTheme") then
			play_music( TrackA, 0, true, 1, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This stinger plays for the brew puzzle completed flyover
		if (MUSIC_TRACK_REQUEST == "BrewFly") then
			play_music( TrackG, 2, true, 0, 1, 0 );
			play_music( TrackNone, 0, true, 0, 0, 0 );
		end
		
		-- This stinger plays for the organ puzzle completed flyover
		if (MUSIC_TRACK_REQUEST == "OrganFly") then
			play_music( TrackF, 2, true, 0, 1, 0 );
		end
		
		-- This plays during the battle after completeing the light puzzle
		if (MUSIC_TRACK_REQUEST == "BeachBattle") then
			play_music( TrackH, 0, true, 1, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This plays during Viper Caverns 2
		if (MUSIC_TRACK_REQUEST == "VC2Fight") then
			play_music( TrackC, 0, true, 1, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This plays during the island exploration section
		if (MUSIC_TRACK_REQUEST == "SproketFight") then
			play_music( TrackB, 0, true, 1, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This stinger plays after Sproket has been defeated then plays spooky theme after that
		if (MUSIC_TRACK_REQUEST == "DeathtoSproket") then
			play_music( TrackD, 2, true, 0, 1, 0 );
			play_music( TrackA, 0, true, 1, 2, 3 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This plays during the island exploration section
		if (MUSIC_TRACK_REQUEST == "SproketIntro") then
			play_music( TrackE, 0, true, 0, 1, 0 );
			--SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
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
