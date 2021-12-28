TrackA = SoundSpecs.MUS_Q4B_PRO_Finale
TrackB = SoundSpecs.MUS_Q4B_PRO_Prologue
TrackNone = SoundSpecs.MUS_NULL

-- this makes sure music will continue to update even during npc scenes
set_cinematic_update_mode( true )

if SAVE.auto_load_music ~= nil then
	prt( "AutoRequesting: " .. SAVE.auto_load_music )
	request_music_track( SAVE.auto_load_music )
end

while true do

local request_music_save = false

	-- ================================================================================
	-- Do checks for making track change requests here
	-- ================================================================================

	--Music for the boss fight TEMP simple right now.
  	if is_in_volume( get_hero(), AUD_MUS_FINALE ) then
	    request_music_track( "BossFight" )
	end
	
	--Music for the start of the prologue Temp simple right now.
  	if is_in_volume( get_hero(), AUD_MUS_PROLOGUE ) then
	    request_music_track( "StartGame" )
	end
	
	--Stops music before the Sprok cinematic
  	if is_in_volume( get_hero(), MUS_KILL) then
	    request_music_track( "NoMusic" )
	end
	
	
	--[[Changes music to lighthouse when ratchet starts up the ramp
	if is_in_volume( get_hero(), AUD_MUS_Lighthouse ) and SAVE.auto_load_music ~= "LightHouse" then
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
	
	--this starts the music on the taxi to viper caverns
	if is_in_volume (get_hero(), AUD_MUS_Taxi) then
	    request_music_track( "TaxiRide" )
	    request_music_save = true
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

		-- This plays at the start of the Boss fight
		if (MUSIC_TRACK_REQUEST == "BossFight") then
			play_music( TrackA, 0, true, 1, 1, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
		end
		
		-- This plays at the start of the prologue gameplay.
		if (MUSIC_TRACK_REQUEST == "StartGame") then
			play_music( TrackB, 0, true, 1, 2, 0 );
			SAVE.auto_load_music = MUSIC_TRACK_REQUEST;
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
