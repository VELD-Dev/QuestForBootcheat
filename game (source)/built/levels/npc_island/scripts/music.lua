TrackA = SoundSpecs.MUS_Q4B_NPC_Beach_Battle
TrackB = SoundSpecs.MUS_Q4B_NPC_Isle_Discover
TrackC = SoundSpecs.MUS_Q4B_NPC_Lighthouse
TrackD = SoundSpecs.MUS_Q4B_NPC_Windmill_Explore
-- TrackE = SoundSpecs.MUS_Q4B_VC_Fight_Out2
TrackF = SoundSpecs.MUS_Q4B_NPC_LiteExplore
TrackG = SoundSpecs.MUS_Q4B_VC_PBattle_End
TrackH = SoundSpecs.MUS_Q4B_NPC_BargeRide
TrackI = SoundSpecs.MUS_NPC_Mayors_Theme
--TrackJ = SoundSpecs.MUS_Q4B_Well_Done
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

	--Music stinger for island reveal
  	--[[
  	if is_in_volume( get_hero(), AUD_MUS_Reveal_Stinger ) then
	    request_music_track( "IsleDiscover" )
	    prt("discovery")
	end
	--]]
	--The discovery stinger starts on a delay from the top of the zipline.
  	if is_in_volume( get_hero(), AUD_MUS_Explore ) then
		wait(2.75)
		request_music_track( "IsleDiscover" )
	    prt("discovery")
	end

	--The Windmill Explore theme starts at the begining of the mayor scene
  	if request_mayor_music then
		request_music_track( "WindmillExplore" )
	    prt("windmill exploration theme")
		request_music_save = true
		request_mayor_music = false
	end
	--Changes music to lighthouse when ratchet starts up the ramp  --changed to after npc scene with becon opp. 4/28 cro
	if (not lighthouse_music_requested) and (SAVE.tal_searched_for_bolt) then
      lighthouse_music_requested = true
	    request_music_track( "LightHouse" )
	    request_music_save = true
	end
	
	--this stops the music when docking in viper caverns
	if is_in_volume( get_hero(), AUD_MUS_KILL_WIND) then
	    request_music_track( "NoMusic" )
	end
	
	--[[if is_in_volume( get_hero(), AUD_VOL_KILL_MUS) then
	    request_music_track( "NoMusic" )
	end --]]
	
	--this starts the beach battle muisc...hopefully
	if SAVE.scene_battle_mayor_intro and (not battle_started) and victoriousmuisc3 == nil then
		request_music_track( "BeachBattle" )
		victoriousmuisc3 = true
		request_music_save = true
	end

	--this changes the music to the light explore theme after all the windmills are done
	if ontolighthouse == nil then
	  if SAVE.auto_load_music == "WindmillExplore" and all_windmills_done and COcomplete then
		--wait(15.0)
		request_music_track( "LiteExplore" )
		request_music_save = true
		ontolighthouse = true
		COcomplete = false
	  end
	end
	
	--this stops the music after the light house is done --back to light explore after lighthouse cro 4/28, back to stopping music 5/21
	if lighthousedone == nil then
	  if SAVE.scene_lighthouse_view_played and (not SAVE.scene_battle_mayor_intro) then
	   --wait (10.0)  -- trying something new with this call here...see liteexplore2 at bottom, \changed this for now cro 5/21 1:50pm\
	   request_music_track( "LiteExplore" ) 
	   request_music_save = true
	   lighthousedone = true
	  end
	end
	
	--[[restarting the liteexplore theme after the flyover of the completed beacon
	if corestart == nil and SAVE.scene_lighthouse_view_played == true then
		request_music_track( "LiteExplore" )
		corestart = true
		request_music_save = true
	end
	--]]
	--Theme for the mayor scenes in the obsidian eye room.  -- this is for the obsidian eye reveal script.
  	if mayortheme1 then
	   request_music_track( "MayorTheme" )
	end

	--Theme for the mayor scenes in the obsidian eye room. -- this is for the obsidian eye end script.
  	if mayortheme2 then
	   request_music_track( "MayorTheme" )
	end	

	-- stinger call for after darkwater leaves.
	if victoriousmuisc then
	   request_music_track( "BeachSting" ) 
	   wait (1.0)
	   victoriousmuisc = false
	end
	
	--calling no muisc after beach stinger for save state.
	if victoriousmuisc2 then
	   request_music_track( "Loligager" ) 
	   request_music_save = true
	   wait (1.0)
	   victoriousmuisc2 = false
	end
	
	--restarting the lite explore theme after doing the mayor/obsidian eye stuff.
	if explorerestart then
	   request_music_track( "LiteExplore" ) 
	   request_music_save = true
	   wait (1.0)
	   explorerestart = false
	end
		
	if is_in_volume( get_hero(), AUD_MUS_After_VC1) and SAVE.completed_viper_cavern and vcCOLANDER == nil then
	   request_music_track( "NoMusic" ) 
	   request_music_save = true
	   prt("i'm not breaking the game")
	   wait (1.0)
	   vcCOLANDER = false
	end
	
	--taking out the barge ride cro 4/28 
	--[[this starts the music on the taxi to viper caverns
	if is_in_volume (get_hero(), AUD_MUS_Taxi) then
	    request_music_track( "TaxiRide" )
	    request_music_save = true
	end
	]]--
	
	-- ================================
	-- SPECIAL CONSIDERATION MUSIC CHECKPOINTS
	-- ================================
    
	-- ================================================================================
	-- Check to see if a new music track has been requested
	if(get_music_track_request()) then
		-- ================================================================================
		-- Do checks for which track to play here
		-- ================================================================================

		-- This plays at the reveal of NPC Island
		if (MUSIC_TRACK_REQUEST == "IsleDiscover") then
			play_music( TrackB, 2, true, 0, 1, 0 );
		end
		
		-- This plays during the beach battle after VC
		if (MUSIC_TRACK_REQUEST == "BeachBattle") then
			play_music( TrackA, 0, true, 1, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This plays during the lighthouse puzzle
		if (MUSIC_TRACK_REQUEST == "LightHouse") then
			play_music( TrackC, 0, true, 2, 3, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This plays during the island exploration section
		if (MUSIC_TRACK_REQUEST == "WindmillExplore") then
			play_music( TrackD, 0, true, 0, 2, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This plays during exploration of NPC island without a windmill component.
		if (MUSIC_TRACK_REQUEST == "LiteExplore") then
			play_music( TrackF, 0, true, 1, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This plays during the bardge ride to Viper Caverns
		if (MUSIC_TRACK_REQUEST == "TaxiRide") then
			play_music( TrackH, 0, true, 1, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- Stinger for end of Beach Battle
		if (MUSIC_TRACK_REQUEST == "BeachSting") then
			play_music( TrackG, 2, true, 0, 1, 0 );
			play_music( TrackNone, 0, true, 0, 0, 0 );
			play_music( TrackNone, 1, true, 0, 0, 0 );
		end
		
		-- This plays during the Mayor scenes in the Obsidian eye room.
		if (MUSIC_TRACK_REQUEST == "MayorTheme") then
			play_music( TrackI, 0, true, 0, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- Muisc call for after completing the beachbattle...starts liteexplore after a few minutes.
		if (MUSIC_TRACK_REQUEST == "Loligager") then
			play_music( TrackNone, 0, true, 0, 0, 0 );
			play_music( TrackNone, 1, true, 0, 0, 0 );
			play_music( TrackF, 0, true, 12, 1, 120 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		--[[Calls a variant of liteexplore for after the beacon is completed
		if (MUSIC_TRACK_REQUEST == "LiteExplore2") then
			play_music( TrackNone, 0, true, 0, 0, 0 );
			play_music( TrackNone, 1, true, 0, 0, 0 );
			play_music( TrackF, 0, true, 1, 1, 30 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		--]]
		
		--[[ This plays when the player completes a job well done.
		if (MUSIC_TRACK_REQUEST == "SuperStar") then
			play_music( TrackJ, 2, true, 0, 1, 0 );
		end]]--
		
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
