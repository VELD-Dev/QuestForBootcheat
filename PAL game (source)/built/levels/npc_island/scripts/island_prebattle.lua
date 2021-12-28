----------------------------------------------------------------------------------------------------
-- Gameplay Script 
----------------------------------------------------------------------------------------------------

-- This script is loaded for NPC_ISLAND when the player has not yet
-- completed viper caverns.  This script is reponsible for handling
-- the windmill and lighthouse repairs, as well as transitioning into 
-- the viper caverns script.

----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

local tal_to_beacon = false
local wmill1cam_active = false
local wmill2cam_active = false
local wmill2cam_active = false
local wmill3cam_active = false
local wmill4cam_active = false
local wmill5cam_active = false
local wmill1_boltcam_on = false
local wmill2_boltcam_on = false
local wmill3_boltcam_on = false
local wmill4_boltcam_on = false
local wmill5_boltcam_on = false
local wmill5_top_cam = false
local show_beacon = false
local turbinecam_active = false
local lighthouse_bottomcam = false
local lighthouse_topcam = false
local meet_pete = false
local everyone_aboard = false
local catapult_cam = false
--local lighthouse_mag_cam_active = false
local zipline_cam = false

if SAVE.windmill_number == nil then
	SAVE.windmill_number = 0
end

----------------------------------------------------------------------------------------------------
-- Initialization
----------------------------------------------------------------------------------------------------

--shows the location text for hoolefar, windmills and the lighthouse
run_script("locations")

ally_setcollisionignore(rustypete, get_hero())

if not SAVE.completed_viper_cavern then
	ally_unequipitem(tal, ALLY_ITEM_GUN)
end
		
-- no bolt until paid for (see scene_lighthouse)
if SAVE.lighthouse_bottom_bolt_replaced then
	unobviate( beacon_btm_bolt )
	activate( beacon_btm_bolt )
else
	obviate( beacon_btm_bolt )
	deactivate( beacon_btm_bolt )
end

-- Turns off all the power cables
bangle_off( wmill1_powercables, 0, true )
bangle_off( wmill2_powercables, 0, true )
bangle_off( wmill3_powercables, 0, true )
bangle_off( wmill4_powercables, 0, true )
bangle_off( wmill5_powercables, 0, true )

-- check status of each windmill completion
if SAVE.windmill1_complete then

  play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Turbine1, INV_FAN_SOURCE ) --restarting sound after death
  play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Electricity, INV_ELEC_SOURCE ) --restarting sound after death
  
  crank_set_complete( windmill1_crank )
  bangle_on( wmill1_powercables, 0, true )
  door_close( wmill1_fan_housing )
  open_windmill( windmill1_blades, true )
  door_open( water_tunnel_door )
  obviate( ni_windmill_platform_2 ) --Stop the player from climbing back up this
  coll_on( ni_windmill_platform_collision_wall )
  
	if not SAVE.completed_island_battle then
		door_open( beach_door_to_village )
		door_open( beach_door_to_beacon )
	end
	
  if not SAVE.completed_viper_cavern then
    unobviate( beach_wrench_springpad )
  end
  
end

if SAVE.windmill2_complete then

  play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Turbine1, INV_FAN_SOURCE2 ) --restarting sound after death
  play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Electricity, INV_ELEC_SOURCE2 )--restarting sound after death

	crank_set_complete( windmill2_crank )
  bangle_on( wmill2_powercables, 0, true )
  open_windmill( windmill2_blades, true )
  door_close( wmill2_fan_housing ) 
  
  --Stop the player from climbing back up this
  obviate(ni_windmill_magboot_plate_22)
  obviate(ni_windmill_magboot_plate_24)
  
end

if SAVE.windmill3_complete then

  play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Turbine1, INV_FAN_SOURCE3 ) --restarting sound after death
  play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Electricity, INV_ELEC_SOURCE3 ) --restarting sound after death

  crank_set_complete( windmill3_crank )
	bangle_on( wmill3_powercables, 0, true )
  open_windmill( windmill3_blades, true )
  door_close( wmill3_fan_housing )
  
  --Stop the player from climbing back up this
  obviate(ni_windmill_magboot_plate_649)
  obviate(ni_windmill_magboot_plate_650)

end

if SAVE.windmill4_complete then

  play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Turbine1, INV_FAN_SOURCE4 ) --restarting sound after death
  play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Electricity, INV_ELEC_SOURCE4 ) --restarting sound after death

  crank_set_complete( windmill4_crank )
 	bangle_on( wmill4_powercables, 0, true ) 
  open_windmill( windmill4_blades, true )
  door_close( wmill4_fan_housing )
  
  --Stop the player from climbing back up this
  obviate( wmill4_wrench_spring1 )
  
end

if SAVE.windmill5_complete then

  crank_set_complete( windmill5_crank )
	bangle_on( wmill5_powercables, 0, true )  
  open_windmill( windmill5_blades, true )
  door_close( wmill5_fan_housing )
  
  play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Turbine1, INV_FAN_SOURCE5 ) --restarting sound after death
  play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Electricity, INV_ELEC_SOURCE5 )--restarting sound after death
  
end

-- this opens the beacon dome and tells the lighthouse to start updating
if SAVE.windmill1_complete and SAVE.windmill2_complete and SAVE.windmill3_complete and SAVE.windmill4_complete and SAVE.windmill5_complete then
   activate( lighthouse );
end

-- completing the last bolt will cause the lighthouse to fully activate
if SAVE.lighthouse_complete then
  crank_set_complete( lighthouse_top_bolt )
elseif SAVE.lighthouse_btm_bolt then
  crank_set_complete( beacon_btm_bolt )
end

-- activate taxi when appropriate
if not is_activated( taxi_to_vc ) and SAVE.obsidian_eye_revealed then
  unobviate( taxi_to_vc )
  prt("activating Taxi in the Pre Battle Script Line 117")
end

if not SAVE.island_prebatte_meet_pete and SAVE.obsidian_eye_revealed then
  deactivate( taxi_to_vc )
end

if SAVE.completed_viper_cavern and not SAVE.completed_island_battle then
	--deactivate( taxi_to_vc )
	prt("deactivating Taxi in the Pre Battle Script Line 122")
	
end

--should do this in main after this weekend to not get this script to run at all
if not SAVE.completed_viper_cavern then
	--put the mayor in his place	
	npc_warp(npc_mayor, scene_mayor_intro_path_warp_vol)

	--Put NPCs in their various locations when you respawn(hopefully)--
	--Mayor
	if SAVE.island_prebattle_mayor_location == 1 and not is_in_volume(npc_mayor, scene_mayor_walkto_vol) then
		npc_warp(npc_mayor, scene_mayor_walkto_vol)
	elseif SAVE.island_prebattle_mayor_location == 2 and not is_in_volume(npc_mayor, obsidian_eye_mayor_warp_vol) then
		npc_warp(npc_mayor, obsidian_eye_mayor_warp_vol)
	end

	--Tal
	if SAVE.island_prebattle_tal_location == 1 and not is_in_volume(tal, tal_restart_beacon_vol) then
		ally_warp(tal, tal_restart_beacon_vol)
	elseif SAVE.island_prebattle_tal_location == 2 and not is_in_volume(tal, obsidian_eye_tal_warp_vol) then
		ally_warp(tal, obsidian_eye_tal_warp_vol)
	elseif SAVE.island_prebattle_tal_location == 3 and not is_in_volume(tal, dock_tal_warp_vol) then
		ally_warp(tal, dock_tal_warp_vol)
	elseif SAVE.island_prebattle_tal_location == 4 and not is_in_volume(tal, tal_at_beacon_bolt_vol) then
		ally_warp(tal, tal_at_beacon_bolt_vol)
	elseif SAVE.island_prebattle_tal_location == 5 then
		obviate(tal)
	end

	--Rusty Pete
	if SAVE.island_prebattle_rustypete_location == 1 and not is_in_volume(rustypete, dock_rusty_pete_warp_vol) then
		ally_warp(rustypete, dock_rusty_pete_warp_vol)
	end
end

if not has_scene_played("scene_mayor") then
	obviate(npc_mayor)
	deactivate(npc_mayor)
	ally_followpathhover( tal, training_tal_to_mayor_path, 12, 12, 17 )
end

--if you die after you completed the bolt this will turn on the beacon plates again
if crank_is_complete(beacon_btm_bolt) then
	activate(ni_lighthouse_magplate_11)
	activate(ni_lighthouse_magplate_12)
	activate(ni_lighthouse_magplate_22)
	activate(ni_lighthouse_magplate_23)
	activate(ni_lighthouse_magplate_27)
	activate(ni_lighthouse_magplate_28)
	activate(ni_lighthouse_magplate_29)
	activate(ni_lighthouse_magplate_30)
	activate(ni_lighthouse_magplate_33)
	activate(ni_lighthouse_magplate_34)
	activate(ni_lighthouse_magplate_35)
	activate(ni_lighthouse_magplate_37)
	activate(ni_lighthouse_magplate_38)
	activate(ni_lighthouse_magplate_39)
	activate(ni_lighthouse_magplate_43)
	activate(ni_lighthouse_magplate_44)
	activate(ni_lighthouse_magplate_46)
	activate(ni_lighthouse_magplate_47)
	activate(ni_lighthouse_magplate_48)
	activate(ni_lighthouse_magplate_49)
	activate(ni_lighthouse_magplate_50)
	activate(ni_lighthouse_magplate_51)
	activate(ni_lighthouse_magplate_52)
	activate(ni_lighthouse_magplate_56)
	activate(ni_lighthouse_magplate_57)
	activate(ni_lighthouse_magplate_58)
	activate(ni_lighthouse_magplate_59)
	activate(ni_lighthouse_magplate_60)
	mainstreetelectricalparade = play_sound(SoundSpecs.AMB_NPC_Lighthouse_Electricity, INV_ELEC_LIGHT)
    mainstreetelectricalparade2 = play_sound(SoundSpecs.AMB_NPC_Lighthouse_Electricity, INV_ELEC_LIGHT2)
    beaconinfo2 = play_sound(SoundSpecs.AMB_NPC_Lighthouse_Info, INV_Beacon_Info)
end

--light fx for the lighthouse
if SAVE.windmill_number == 5 then
	bangle_on(ni_lighthouse_light_1, 0, false)
	deactivate(npc_windmill)
	
	if crank_is_complete(beacon_btm_bolt) then
		bangle_on(ni_lighthouse_light_1, 1, false)
	else
		bangle_off(ni_lighthouse_light_1, 1, false)
	end

else
	bangle_off(ni_lighthouse_light_1, 0, false)
	bangle_off(ni_lighthouse_light_1, 1, false)
end


--**************************************************************************************************
-- Main Loop --
--**************************************************************************************************

while not SAVE.completed_viper_cavern do
	
	local all_windmills_done = SAVE.windmill1_complete and 
	                           SAVE.windmill2_complete and 
	                           SAVE.windmill3_complete and 
	                           SAVE.windmill4_complete and 
	                           SAVE.windmill5_complete;
	
	if not SAVE.windmill1_complete and crank_is_complete( windmill1_crank ) then
		SAVE.windmill1_complete = true
		
		if not SAVE.completed_viper_cavern then
			--    unobviate( beach_wrench_catapult )
			unobviate( beach_wrench_springpad )
		end
		SAVE.windmill_hud_on = true
		SAVE.windmill_number = SAVE.windmill_number + 1
		SAVE.windmill_line = SAVE.windmill_number
		request_auto_save()
		prt( "Windmill 1 repaired." );
		prt("number of windmills complete: " .. tostring(SAVE.windmill_number))
		
		npc_warp(npc_windmill, scene_windmill_npc_pos1)	--turn him so he faces ratchet
		
		queue_scene( "scene_wmill1_done")
		wait()
			
		--Change a couple of the villagers paths so they can now go through the open doors
		npc_set_mode(N02_npc_villager, NPC_MODE_ACTIVE)
		npc_set_path(N02_npc_villager, N02_npc_path_open_door, NPC_PATROL_PINGPONG)
		npc_set_mode(N03_npc_villager, NPC_MODE_ACTIVE)
		npc_set_path(N03_npc_villager, N03_npc_path_open_door, NPC_PATROL_PINGPONG)
	end
	
	if not SAVE.windmill2_complete and crank_is_complete( windmill2_crank ) then
		SAVE.windmill2_complete = true
		SAVE.windmill_hud_on = true
		SAVE.windmill_number = SAVE.windmill_number + 1
		SAVE.windmill_line = SAVE.windmill_number
		request_auto_save()
		prt( "Windmill 2 repaired." );
		prt("number of windmills complete: " .. tostring(SAVE.windmill_number))
		queue_scene( "scene_wmill2_done")
		wait()   
    end
	
	if not SAVE.windmill3_complete and crank_is_complete( windmill3_crank ) then
		SAVE.windmill3_complete = true
		SAVE.windmill_hud_on = true
		SAVE.windmill_number = SAVE.windmill_number + 1
		SAVE.windmill_line = SAVE.windmill_number
		request_auto_save()
		prt( "Windmill 3 repaired." );
		prt("number of windmills complete: " .. tostring(SAVE.windmill_number))
		queue_scene( "scene_wmill3_done")
		wait()
	end
	
	if not SAVE.windmill4_complete and crank_is_complete( windmill4_crank ) then
		SAVE.windmill4_complete = true
		SAVE.windmill_hud_on = true
		SAVE.windmill_number = SAVE.windmill_number + 1
		SAVE.windmill_line = SAVE.windmill_number
		request_auto_save()
		prt( "Windmill 4 repaired." );
		prt("number of windmills complete: " .. tostring(SAVE.windmill_number))
		queue_scene( "scene_wmill4_done")
		wait()
	end
	
	if not SAVE.windmill5_complete and crank_is_complete( windmill5_crank ) then
		SAVE.windmill5_complete = true
		SAVE.windmill_hud_on = true
		SAVE.windmill_number = SAVE.windmill_number + 1
		SAVE.windmill_line = SAVE.windmill_number
		request_auto_save()
		prt( "Windmill 5 repaired." );
		prt("number of windmills complete: " .. tostring(SAVE.windmill_number))
		queue_scene( "scene_wmill5_done")
		wait()
	end
	
	--Play windmill operator's congrats lines when you complete a windmill
	if SAVE.windmill_number == 1 and SAVE.windmill_line == 1 then
		prt("windmill ops first line")
		speak_and_wait(npc_windmill, DialogueSpecs.NI_WMO_FIXING_REMAINING_4)
		SAVE.windmill_line = nil
		request_auto_save()
	elseif SAVE.windmill_number == 2 and SAVE.windmill_line == 2 then
		prt("windmill ops first line")
		announce(DialogueSpecs.NI_WMO_FIXING_REMAINING_3)
		SAVE.windmill_line = nil
		request_auto_save()
	elseif SAVE.windmill_number == 3 and SAVE.windmill_line == 3 then
		prt("windmill ops first line")
		announce(DialogueSpecs.NI_WMO_FIXING_REMAINING_2)
		SAVE.windmill_line = nil
		request_auto_save()
	elseif SAVE.windmill_number == 4 and SAVE.windmill_line == 4 then
		prt("windmill ops first line")
		announce(DialogueSpecs.NI_WMO_FIXING_REMAINING_1)
		SAVE.windmill_line = nil
		request_auto_save()
	elseif SAVE.windmill_number == 5 and SAVE.windmill_line == 5 then
		if not SAVE.island_prebattle_beacon_btm_bolt_complete then
			announce(DialogueSpecs.NI_WMO_WIND_TOWER_ACTIVE)
		end
		deactivate(npc_windmill)
		SAVE.windmill_line = nil
		request_auto_save()
	end
	
	if not SAVE.lighthouse_complete and crank_is_complete( lighthouse_top_bolt ) then
	  SAVE.lighthouse_complete = true
	  request_auto_save()
	  	prt( "Lighthouse repaired.  Go to the Obisidian Eye." );
	  --activate( taxi_to_vc );
	  prt("activating Taxi in the Pre Battle Script Line 179")
	end
	
	--reactivate the mayor when he gets to his new home
	if is_in_volume(npc_mayor, scene_mayor_walkto_vol) then
		activate(npc_mayor)
	end
	
	--trigger the first scene if you do it before the lighthouse
	if (is_triggered( npc_mayor ) and not SAVE.lighthouse_complete) then
		untrigger( npc_mayor )
		queue_scene( "scene_mayor" )
		wait(0)
	elseif (is_triggered(npc_mayor) and SAVE.lighthouse_complete) then
		untrigger(npc_mayor)
		queue_scene("scene_mayor_obsidianeye")
		wait(0)
	end
	
	--reactivate lighthouse operator when he's back in his original position
	if is_in_volume(npc_lighthouse, scene_lighthouse_warp_vol) then
		activate(npc_lighthouse)
	end
	
	--trigger the lighthouse operator's scene
	if is_triggered( npc_lighthouse ) then
		untrigger( npc_lighthouse )
		queue_scene( "scene_lighthouse" )
		wait(0)
		
		--after the lighthouse scene, tal says her line and flies off IF ratchet hasn't walked near her yet
		if SAVE.scene_lighthouse_findbolt_first and not SAVE.tal_searched_for_bolt then
			
			--ally_warp(tal, tal_at_beacon_bolt_vol)
			ally_followpathhover( tal, tal_fly_in_seach_of_bolt_path, 12, 12, 7 )
			speak(tal, DialogueSpecs.NI_BOP_WIND_ACTIVE_FIND_BOLT_RESPONSE)
			wait(1.0)
			SAVE.island_prebattle_tal_location = 5
			SAVE.tal_searched_for_bolt = true
		end
		
		--if he's up with the bolt, have him walk back down to his original position
		if SAVE.scene_lighthouse_operator_at_bolt then
			deactivate(npc_lighthouse)
			npc_set_mode(npc_lighthouse, NPC_MODE_ACTIVE)
			npc_set_path(npc_lighthouse, scene_lighthouse_bolt_walk_down_path, NPC_PATROL_ONCE)
		end

	end
	
	--if ratchet walks near tal after completing the boltcrank, she says her line and flies off(and set up smuggler scene)
	if SAVE.windmill_number == 5 and is_in_volume(get_hero(), tal_beacon_conv_vol) and not SAVE.tal_searched_for_bolt then
		
		speak_and_wait(tal, DialogueSpecs.NI_BOP_WIND_ACTIVE_FIND_BOLT_RESPONSE)
		SAVE.tal_searched_for_bolt = true
		ally_followpathhover( tal, tal_fly_in_seach_of_bolt_path, 12, 12, 7 )
		SAVE.island_prebattle_tal_location = 5
		
		if SAVE.scene_smuggler_initial_contact then
			SAVE.scene_smuggler_state = 2
		end
	
		--no matter what he has the bolt now
		SAVE.scene_smuggler_get_bolt = true
		request_auto_save()
	end
		
	--hiding tal after some random fly-bys
	if is_in_area(tal, tal_flightpath_obviate_layer) then
		obviate(tal)
	else
		unobviate(tal)
	end
	
	if is_triggered( npc_windmill ) then
		untrigger( npc_windmill )
		queue_scene( "scene_windmill" )
		wait(0)
	end
	
	if is_triggered( npc_smuggler ) then
		untrigger( npc_smuggler )
		queue_scene( "scene_smuggler" )
		wait(0)
	end
		
	-- save state of first bolt crank
	if (not SAVE.lighthouse_btm_bolt) and crank_is_complete(beacon_btm_bolt) then
		activate(ni_lighthouse_magplate_11)
		activate(ni_lighthouse_magplate_12)
		activate(ni_lighthouse_magplate_22)
		activate(ni_lighthouse_magplate_23)
		activate(ni_lighthouse_magplate_27)
		activate(ni_lighthouse_magplate_28)
		activate(ni_lighthouse_magplate_29)
		activate(ni_lighthouse_magplate_30)
		activate(ni_lighthouse_magplate_33)
		activate(ni_lighthouse_magplate_34)
		activate(ni_lighthouse_magplate_35)
		activate(ni_lighthouse_magplate_37)
		activate(ni_lighthouse_magplate_38)
		activate(ni_lighthouse_magplate_39)
		activate(ni_lighthouse_magplate_43)
		activate(ni_lighthouse_magplate_44)
		activate(ni_lighthouse_magplate_46)
		activate(ni_lighthouse_magplate_47)
		activate(ni_lighthouse_magplate_48)
		activate(ni_lighthouse_magplate_49)
		activate(ni_lighthouse_magplate_50)
		activate(ni_lighthouse_magplate_51)
		activate(ni_lighthouse_magplate_52)
		activate(ni_lighthouse_magplate_56)
		activate(ni_lighthouse_magplate_57)
		activate(ni_lighthouse_magplate_58)
		activate(ni_lighthouse_magplate_59)
		activate(ni_lighthouse_magplate_60)
		mainstreetelectricalparade = play_sound(SoundSpecs.AMB_NPC_Lighthouse_Electricity, INV_ELEC_LIGHT)
        mainstreetelectricalparade2 = play_sound(SoundSpecs.AMB_NPC_Lighthouse_Electricity, INV_ELEC_LIGHT2)
		SAVE.lighthouse_btm_bolt = true
		request_auto_save()
	end

----------------------------------------------------------------------------------------------------
-- Meeting Mayor for first time. (Tal flies off to Beacon afterwards)
----------------------------------------------------------------------------------------------------

-- Grab player into scene.	
	if not SAVE.scene_mayor_intro and is_in_volume( get_hero(), scene_mayor_intro_vol ) then
		if is_zipping(get_hero()) then
			fade_to_black(1.5)
			wait(1.5)
		else
			fade_to_black(0.5)
			wait(0.1)
      update_off(get_hero());
			wait(0.4)
      update_on(get_hero());
		end

		hero_warp(get_hero(), scene_mayor_hero_pos, true)
		hero_lockout_control(get_hero(), true)
		wait(1.0)
		letter_box_on(0)
		
		activate_cam(get_hero(), scene_mayor_cam5)
		fade_from_black(1.0)
		wait(0.5)
		
		show_location(L01_PLACE_GPLAY_HOOLEFARISLAND, locations_show_time)
		unobviate(npc_mayor)
		npc_warp(npc_mayor, scene_mayor_intro_path_warp_vol)
		npc_set_mode(npc_mayor, NPC_MODE_ACTIVE)
		npc_set_path(npc_mayor, scene_mayor_mayor_intro_path, NPC_PATROL_ONCE)
		ally_warp(tal, scene_mayor_tal_path_warp)
		ally_followpathhover(tal, scene_mayor_tal_intro_path, 12, 12, 7)
		wait(7.2)
			
		fade_to_black(1.0)
		wait(1.0)
		
		queue_scene( "scene_mayor" )
		wait(0)
		letter_box_off(0)
		
		deactivate(npc_mayor)
		npc_set_mode(npc_mayor, NPC_MODE_ACTIVE)
		npc_set_path(npc_mayor, mayor_walk_to_eye_path, NPC_PATROL_ONCE)
		
		speak(tal, DialogueSpecs.NI_TAL_GO_BEACON, true)  --this is radio now so i changed to 2D. cro 5/15
		ally_followpathhover( tal, beach_tal_to_beacon_path, 12, 12, 7 )
		
		hero_lockout_control(get_hero(), false)
		
		SAVE.island_prebattle_mayor_location = 1
		SAVE.island_prebattle_tal_location = 1
		request_auto_save()
	end

	
----------------------------------------------------------------------------------------------------
-- Meeting Mayor for Obsidian Eye reveal and Rusty Pete arrival
----------------------------------------------------------------------------------------------------	
	
	if SAVE.lighthouse_complete and not SAVE.obsidian_eye_revealed and is_in_volume( get_hero(), obsidian_eye_reveal_vol ) then
		deactivate(npc_mayor)
		queue_scene( "scene_obsidian_eye_reveal" )
		wait(0.2)
		
		queue_cinematic("l01_s05_book2_rt")
		wait(0.2)
		
		queue_scene("scene_obsidian_eye_end")
		wait(0.2)
		
		--Dialogue not in yet
		prt("Tal line here in the future")
		ally_followpathhover( tal, tal_fly_to_pete_path, 12, 12, 7 )
		activate(npc_mayor)
		
		prt("Unobviate taxi to Viper Caverns")
		unobviate( taxi_to_vc )
		ally_warp( rustypete, dock_rusty_pete_warp_vol )

		SAVE.obsidian_eye_revealed = true
		SAVE.island_prebattle_tal_location = 3
		SAVE.island_prebattle_rustypete_location = 1
		request_auto_save()
		
		--activate( taxi_to_vc )
		prt("activating Taxi in the Pre Battle Script Line 294")
		
	end

----------------------------------------------------------------------------------------------------
-- Talking to Pete about going to Viper Caverns
----------------------------------------------------------------------------------------------------	

	if SAVE.obsidian_eye_revealed and is_in_volume( get_hero(), scene_rustypete_arrives_vol ) and not SAVE.island_prebatte_meet_pete then
		
		SAVE.island_prebatte_meet_pete = true
		request_auto_save()
		
		queue_scene("scene_rustypete_arrives")
		wait(0)
	end

	--switch the var so we can trigger the scene again (have to see what to do to get it to be a triangle prompt)
	if SAVE.obsidian_eye_revealed and not is_in_volume( get_hero(), scene_rustypete_arrives_vol ) and SAVE.island_prebatte_meet_pete then
		prt("mete_pete = false")
		SAVE.island_prebatte_meet_pete = false
		wait(0)
		request_auto_save()
	end
----------------------------------------------------------------------------------------------------
-- Prep for departure to Viper Caverns
----------------------------------------------------------------------------------------------------	

--- Do this in the scene
	if SAVE.scene_rustypete_arrives and not everyone_aboard then
		--activate( taxi_to_vc )
		prt("warping allies onto the taxi")
		prt("activating Taxi in the Pre Battle Script Line 321")
		ally_warp( tal, taxi_tal_warp_vol )
		ally_warp( rustypete, taxi_rustypete_warp_vol )
		everyone_aboard = true
	end

----------------------------------------------------------------------------------------------------
-- Windmill Ascension Cameras
----------------------------------------------------------------------------------------------------

-- Windmill #1---------------------------------
	if is_in_area( get_hero(), wmill1_camera_trigger_area ) and not wmill1cam_active and not is_in_volume( get_hero(), wmill1_boltcrank_cam_vol) then
		prt( "Windmill1 cam activated" )
      activate_cam( get_hero(), mwill1_camera1 ) 
      wmill1cam_active = true
    end

	if not is_in_area( get_hero(), wmill1_camera_trigger_area ) and wmill1cam_active then
      prt( "Windmill1 cam deactivated" )
      deactivate_cam( get_hero(), mwill1_camera1 )
      wmill1cam_active = false
	end


-- Windmill #2---------------------------------
	if is_in_volume( get_hero(), wmill2_camera_trigger ) and not wmill2cam_active and not is_in_volume( get_hero(), wmill2_boltcrank_cam_vol) then
		prt( "Windmill2 cam activated" )
      activate_cam( get_hero(), wmill2_camera1 ) 
      wmill2cam_active = true
    end

	if not is_in_volume( get_hero(), wmill2_camera_trigger ) and wmill2cam_active then
      prt( "Windmill2 cam deactivated" )
      deactivate_cam( get_hero(), wmill2_camera1 )
      wmill2cam_active = false
	end


-- Windmill #3---------------------------------
	if is_in_volume( get_hero(), wmill3_camera_trigger ) and not wmill3cam_active and not is_in_volume( get_hero(), wmill3_boltcrank_cam_vol) then
		prt( "Windmill3 cam activated" )
      activate_cam( get_hero(), wmill3_camera1 ) 
      wmill3cam_active = true
    end

	if not is_in_volume( get_hero(), wmill3_camera_trigger ) and wmill3cam_active then
      prt( "Windmill3 cam deactivated" )
      deactivate_cam( get_hero(), wmill3_camera1 )
      wmill3cam_active = false
	end	



-- Windmill #4---------------------------------
	if is_in_area( get_hero(), wmill4_camera_trigger_area ) and not wmill4cam_active and not is_in_volume( get_hero(), wmill4_boltcrank_cam_vol) then
		prt( "Windmill4 cam activated" )
      activate_cam( get_hero(), wmill4_camera1 ) 
      wmill4cam_active = true
    end

	if not is_in_area( get_hero(), wmill4_camera_trigger_area ) and wmill4cam_active then
      prt( "Windmill4 cam deactivated" )
      deactivate_cam( get_hero(), wmill4_camera1 )
      wmill4cam_active = false
	end	
	
	
-- Windmill #5---------------------------------	


----------------------------------------------------------------------------------------------------
-- Windmill Boltcrank Cameras
----------------------------------------------------------------------------------------------------

-- Windmill #1---------------------------------
	if is_in_volume( get_hero(), wmill1_boltcrank_cam_vol ) and is_cranking( get_hero(), windmill1_crank ) and not wmill1_boltcam_on then
		prt( "Windmill1 Bolt Crank cam activated" )
      activate_cam( get_hero(), wmill1_boltcrank_cam ) 
      wmill1_boltcam_on = true
	end
	
	if not is_cranking( get_hero(), windmill1_crank ) and wmill1_boltcam_on then
		deactivate_cam( get_hero(), wmill1_boltcrank_cam )
		prt( "Windmill1 Bolt Crank cam deactivated" )
		wmill1_boltcam_on = false
	end
	
	if is_in_volume( get_hero(), wmill1_boltcrank_cam_vol )  and not is_active_cam( get_hero(), mwill1_camera1 ) then
		if not is_cranking( get_hero(), windmill1_crank ) and not crank_is_complete( windmill1_crank ) then
			prt( "Windmill1 Bolt Crank cam RE-activated" )
			activate_cam( get_hero(), mwill1_camera1 ) 
		end
   end
	
-- Windmill #2---------------------------------
	if is_in_volume( get_hero(), wmill2_boltcrank_cam_vol ) and is_cranking( get_hero(), windmill2_crank ) and not wmill2_boltcam_on then
		prt( "Windmill2 Bolt Crank cam activated" )
      activate_cam( get_hero(), wmill2_boltcrank_cam ) 
      wmill2_boltcam_on = true
	end
	
	if not is_cranking( get_hero(), windmill2_crank ) and wmill2_boltcam_on then
		deactivate_cam( get_hero(), wmill2_boltcrank_cam )
		prt( "Windmill2 Bolt Crank cam deactivated" )
		wmill2_boltcam_on = false
	end

	if is_in_volume( get_hero(), wmill2_boltcrank_cam_vol )  and not is_active_cam( get_hero(), wmill2_camera1 ) then
		if not is_cranking( get_hero(), windmill2_crank ) and not crank_is_complete( windmill2_crank ) then
			prt( "Windmill2 Bolt Crank cam RE-activated" )
			activate_cam( get_hero(), wmill2_camera1 ) 
		end
   end

-- Windmill #3---------------------------------
	if is_in_volume( get_hero(), wmill3_boltcrank_cam_vol ) and is_cranking( get_hero(), windmill3_crank ) and not wmill3_boltcam_on then
		prt( "Windmill3 Bolt Crank cam activated" )
      activate_cam( get_hero(), wmill3_boltcrank_cam ) 
      wmill3_boltcam_on = true
	end
	
	if not is_cranking( get_hero(), windmill3_crank ) and wmill3_boltcam_on then
		deactivate_cam( get_hero(), wmill3_boltcrank_cam )
		prt( "Windmill3 Bolt Crank cam deactivated" )
		wmill3_boltcam_on = false
	end

	if is_in_volume( get_hero(), wmill3_boltcrank_cam_vol )  and not is_active_cam( get_hero(), wmill3_camera1 ) then
		if not is_cranking( get_hero(), windmill3_crank ) and not crank_is_complete( windmill3_crank ) then
			prt( "Windmill3 Bolt Crank cam RE-activated" )
			activate_cam( get_hero(), wmill3_camera1 ) 
		end
   end
   
-- Windmill #4---------------------------------
	if is_in_volume( get_hero(), wmill4_boltcrank_cam_vol ) and is_cranking( get_hero(), windmill4_crank ) and not wmill4_boltcam_on then
		prt( "Windmill4 Bolt Crank cam activated" )
      activate_cam( get_hero(), wmill4_boltcrank_cam ) 
      wmill4_boltcam_on = true
	end
	
	if not is_cranking( get_hero(), windmill4_crank ) and wmill4_boltcam_on then
		deactivate_cam( get_hero(), wmill4_boltcrank_cam )
		prt( "Windmill4 Bolt Crank cam deactivated" )
		wmill4_boltcam_on = false
	end
		
	if is_in_volume( get_hero(), wmill4_boltcrank_cam_vol )  and not is_active_cam( get_hero(), wmill4_camera1 ) then
		if not is_cranking( get_hero(), windmill4_crank ) and not crank_is_complete( windmill4_crank ) then
			prt( "Windmill4 Bolt Crank cam RE-activated" )
			activate_cam( get_hero(), wmill4_camera1 ) 
		end
   end

-- Windmill #5---------------------------------
	if is_in_volume( get_hero(), wmill5_boltcrank_cam_vol ) and is_cranking( get_hero(), windmill5_crank ) and not wmill5_boltcam_on then
		prt( "Windmill5 Bolt Crank cam activated" )
      activate_cam( get_hero(), wmill5_boltcrank_cam ) 
      wmill5_boltcam_on = true
	end
	
	if not is_cranking( get_hero(), windmill5_crank ) and wmill5_boltcam_on then
		deactivate_cam( get_hero(), wmill5_boltcrank_cam )
		prt( "Windmill5 Bolt Crank cam deactivated" )
		wmill5_boltcam_on = false
	end
	
		if is_in_volume( get_hero(), wmill5_boltcrank_cam_vol )  and not is_active_cam( get_hero(), wmill5_post_teleport_cam ) then
		if not is_cranking( get_hero(), windmill5_crank ) and not crank_is_complete( windmill5_crank ) then
			prt( "Windmill5 Bolt Crank cam RE-activated" )
			activate_cam( get_hero(), wmill5_post_teleport_cam ) 
		end
   end
	
----------------------------------------------------------------------------------------------------
-- Windmill Special Case Cameras
----------------------------------------------------------------------------------------------------	
	
	-- camera for when at the top of Wmill 5.
	if is_in_volume( get_hero(), wmill5_top_vol ) and crank_is_complete( windmill5_crank ) and not wmill5_top_cam then
		activate_cam( get_hero(), wmill5_post_teleport_cam )
		prt("Top of Wmill #5 cam activate")
		wmill5_top_cam = true
	end
	
	--- deactiivates cam when Ratchet starts down G-rail.
	if not is_in_volume( get_hero(), wmill5_top_vol ) and wmill5_top_cam then
		deactivate_cam( get_hero(), wmill5_post_teleport_cam )
		prt("deactivating Wmill 5 top cam")
		wmill5_top_cam = false
	end
	
----------------------------------------------------------------------------------------------------
-- Lighthouse Cameras
----------------------------------------------------------------------------------------------------	
	--Activates camera when you're cranking the node at the bottom
	if is_in_volume( get_hero(), lighthouse_btm_bolt_vol) and is_cranking( get_hero(), beacon_btm_bolt) and not lighthouse_bottomcam then
		prt("Lighthouse Bottom Bolt Cam activated")
		activate_cam( get_hero(), lighthouse_first_bolt_cam)
		lighthouse_bottomcam = true
	end
	
	--Deactivates the camera
	if not is_cranking( get_hero(), beacon_btm_bolt) and lighthouse_bottomcam then
		prt("Lighthouse Bottom Bolt Cam deactivated")
		deactivate_cam( get_hero(), lighthouse_first_bolt_cam)
		lighthouse_bottomcam = false
	end

	--stop the player from falling off while it's raising
	if crank_is_complete(beacon_btm_bolt) and not SAVE.island_prebattle_beacon_btm_bolt_complete then
		SAVE.island_prebattle_beacon_btm_bolt_complete = true
		hero_lockout_control(get_hero(), true)
		wait(2.0)
		hero_lockout_control(get_hero(), false)
		bangle_on(ni_lighthouse_light_1, 1, false)
	end

	--Activates the camera when you're cranking the node at the top
	if is_in_volume( get_hero(), lighthouse_top_bolt_vol) and is_cranking( get_hero(), lighthouse_top_bolt) and not lighthouse_topcam then
		prt("Lighthouse Top Bolt Cam activated")
		activate_cam( get_hero(), lighthouse_final_cam)
		lighthouse_topcam = true
	end
	
	--Deactives the camera
	if not is_cranking( get_hero(), lighthouse_top_bolt) and lighthouse_topcam then
		prt("Lighthouse Top Bolt Cam deactivated")
		deactivate_cam( get_hero(), lighthouse_final_cam)
		lighthouse_topcam = false
		
	end

	--Shows the lighthouse view scene if the top bolt is finished
	if crank_is_complete(lighthouse_top_bolt) and not SAVE.scene_lighthouse_view_played then
		SAVE.island_prebattle_mayor_location = 2
		SAVE.island_prebattle_tal_location = 2
		request_auto_save()
			
		queue_scene("scene_lighthouse_view")
		wait()
			
		prt(tostring(SAVE.scene_lighthouse_view_played))
			
		--Tal's flyover to obsidian eye room
		unobviate(tal)
		ally_warp(tal, tal_fly_to_eye_warp_vol)
		ally_followpathhover( tal, tal_fly_to_obsidian_eye_path, 12, 12, 7 )
	end
		
	--Keeps the door open if you died but already saw the scene where it opens
	if SAVE.lighthouse_complete and door_is_closed(obsidian_eye_door) then
		door_open(obsidian_eye_door)
	end
	
----------------------------------------------------------------------------------------------------
-- Lighthouse mag ramp Camera
----------------------------------------------------------------------------------------------------
	--Sets up the follow camera when ratchet gets onto the mag ramp
	if is_in_volume( get_hero(), lighthouse_magramp_cam_vol ) and not lighthouse_mag_cam_active then
		prt( "lighthouse_mag_cam cam activated" )
		activate_cam( get_hero(), lighthouse_mag_cam ) 
		lighthouse_mag_cam_active = true
    end

	if not is_in_volume( get_hero(), lighthouse_magramp_cam_vol ) and lighthouse_mag_cam_active then
		prt( "lighthouse_mag_cam_active cam deactivated" )
		deactivate_cam( get_hero(), lighthouse_mag_cam )
		lighthouse_mag_cam_active = false
	end	
	
	--reset lighthouse platform if player falls off
	if (not on_lighthouse) and is_in_volume( get_hero(), lighthouse_magramp_cam_vol ) then
    on_lighthouse = true
	elseif on_lighthouse and (not is_in_volume( get_hero(), lighthouse_magramp_cam_vol )) then
    wait(2.0)
    set_pos( lighthouse_wrench_platform_sliding, get_pos(lighthouse_wrench_platform_vol) )
    on_lighthouse = false
  end

----------------------------------------------------------------------------------------------------
-- Catapult Cams
----------------------------------------------------------------------------------------------------
	if is_in_volume(get_hero(), catapult_cam_vol1) and not catapult_cam and (is_using_jump_pad(get_hero(), village_wrench_catapult) or is_using_jump_pad(get_hero(), village_wmile4_catapult)) then
		catapult_cam = true
		activate_cam(get_hero(), catapult_cam_2)
	end

	if catapult_cam and not (is_using_jump_pad(get_hero(), village_wrench_catapult) or is_using_jump_pad(get_hero(), village_wmile4_catapult)) then
		catapult_cam = false
		deactivate_cam(get_hero(), catapult_cam_2)
	end
	
----------------------------------------------------------------------------------------------------
-- Grav Ramp Cam
----------------------------------------------------------------------------------------------------	
	if is_in_volume(get_hero(), grav_ramp_stuff_vol) and is_on_grav_surface(get_hero()) then
		activate_cam(get_hero(), grav_ramp_stuff_cam)
	else
		deactivate_cam(get_hero(), grav_ramp_stuff_cam)
	end

wait()
	
end

