----------------------------------------------------------------------------------------------------
-- Main Script 
----------------------------------------------------------------------------------------------------
run_script("gameplay")
run_script("music")
run_script("island_checkpoints")
run_script("missions")
run_script("hoolefoid_conv")
run_script("cheat_menu")



-- Special cheat for checking arrival from VC
--[[
if not SAVE.scene_battle_mayor_intro then
	SAVE.completed_training = true
	SAVE.scene_mayor_intro = true
	SAVE.obsidian_eye_revealed = true
	SAVE.completed_viper_cavern = true
	SAVE.npc_start_on_taxi = true
	SAVE.talwynfree = true
	hero_give_weapon(get_hero(), WPN_COMBUSTER, 0)
	hero_give_weapon(get_hero(), WPN_GRENADE, 0)
	hero_give_weapon(get_hero(), WPN_TORNADO, 0)
	hero_give_weapon(get_hero(), WPN_RAVAGER, 0)
end
--]]
----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

local debug_skiptraining_on = false
local debug_into_battle_on = false
local village_grindcam_active = false
local wmill_grindcam_active = false
local platforming_camadjust_active  = false
local platforming_camadjust_active1  = false
local hero_controls_locked = false
local last_time_check_barge_volume_executed = 30
local wait_between_volume_check = 30
local birds_hidden = false

----------------------------------------------------------------------------------------------------
-- Initialization
----------------------------------------------------------------------------------------------------

-- Windmill #1 - Managing collision that prevents retraversal.
coll_off( ni_windmill_platform_collision_wall )

-- hiding NPC villagers used in battlefield cinematic.
obviate( npc_battle_villager1 )
obviate( npc_battle_villager2 )
obviate( npc_battle_villager3 )

-- Hide the Catapult on the Beach
obviate( beach_wrench_catapult )
obviate( beach_wrench_springpad )

-- Hides the Swing and Hookshots in the village
obviate_pod( village_swing_and_hookshots )

-- Example: setting the NPCs to be non-pushable
npc_setcollisionignore(npc_windmill, get_hero() )
npc_setcollisionignore(npc_mayor, get_hero() )
npc_setcollisionignore(npc_lighthouse, get_hero() )
npc_setcollisionignore(npc_smuggler, get_hero() )
npc_setcollisionignore(N01_npc_villager, get_hero() )
npc_setcollisionignore(N02_npc_villager, get_hero() )
npc_setcollisionignore(N03_npc_villager, get_hero() )
npc_setcollisionignore(N04_npc_villager, get_hero() )
npc_setcollisionignore(N05_npc_villager, get_hero() )
npc_setcollisionignore(N06_npc_villager, get_hero() )
npc_setcollisionignore(N07_npc_villager, get_hero() )
npc_setcollisionignore(N08_npc_villager, get_hero() )
npc_setcollisionignore(N09_npc_villager, get_hero() )
npc_setcollisionignore(N10_npc_villager, get_hero() )
npc_setcollisionignore(NC01_npc_villager, get_hero() )
npc_setcollisionignore(NC02_npc_villager, get_hero() )
npc_setcollisionignore(NC03_npc_villager, get_hero() )
ally_setcollisionignore(tal, get_hero() )

-- Turns off all the power cables
bangle_off( wmill1_powercables, 0, true )
bangle_off( wmill2_powercables, 0, true )
bangle_off( wmill3_powercables, 0, true )
bangle_off( wmill4_powercables, 0, true )
bangle_off( wmill5_powercables, 0, true )


-- Hides Battleifield objects
deactivate( undead_FX_controller )
obviate( battle_darkwater_ship ) 
obviate( captain_darkwater_slaghead )
obviate( battle_turret )
--obviate_pod( battle_cover_objects )
obviate_pod( battle_ammo_spawners )
obviate_pod( battlefield_health_pod )
obviate_pod( b1_w0_pirates_pod )
-- obviate_pod( b1_w1_pirates_pod ) --- Auto obviates
-- obviate_pod( b1_w2_pirates_pod ) --- Auto obviates
-- obviate_pod( b1_w3_pirates_pod ) --- Auto obviates
-- obviate_pod( b1_w4_pirates_pod ) --- Auto obviates
-- obviate_pod( b1_w5_pirates_pod ) --- Auto obviates
obviate_pod( b2_w1_pirates_pod )
obviate_pod( b2_w2_pirates_pod )
obviate_pod( b2_w3_pirates_pod )
obviate_pod( b2_w4_pirates_pod )
obviate_pod( b2_w5_pirates_pod )

-- Clear enemy awareness
foreach_moby_in_pod( battlefield_undead_pirates_pod , awareness_clear_targettypes )
 
 -- Removes the water death path in the Battlefield
deactivate( battlefield_water_death_plane )

-- Turn off ghostly mist controllers.
deactivate( undeadFog1 )
deactivate( undeadFog2 )
deactivate( undeadFog3 )
deactivate( undeadFog4 )
deactivate( undeadFog5 )
deactivate( undeadFog6 )
deactivate( undeadFog7 )
deactivate( undeadFog8 )
deactivate( undeadFog9 )
deactivate( undeadFog10 )
deactivate( undeadFog11 )
deactivate( undeadFog12 )
deactivate( undeadFog13 )
deactivate( undeadFog14 )
deactivate( undeadFog15 )
deactivate( undeadFog16 )

----------------------------
--- END OF GAME SEQUENCE ---
----------------------------
if SAVE.finale_completed then

	--to get rid of floating empty text boxes
	obviate(npc_mayor)
	obviate(npc_windmill)
	obviate(npc_lighthouse)
	deactivate(npc_smuggler)
	deactivate(taxi_to_vc)
	
  complete_game();
	--queue_scene("scene_return_from_boss")	--taken out per the bri(y)an's request
	--wait()	--if we ever put the above scene back in this wait() will prevent black boxes from appearing on the following cinematics
	queue_cinematic("l01_s11_works_rt")		--uncommented this line again due to a bug - Bill
	queue_cinematic("l01_s13_book3_rt")   --queue_movie("s11_works_rt") -- **** TEMP FOR FOCUS!!!! ****
	wait(0)
  show_credits()
  wait(0)
  show_frontend()
  wait(60)
  
end

-- setup taxi & hero position
if SAVE.npc_start_on_taxi then

  prt( "Starting on Taxi!" )

  hero_warp( get_hero(), taxi_entrance_warp_vol_1 )
  
  --lock controls while out in the ocean
  hero_lockout_control(get_hero(), true, true, false)
  hero_controls_locked = true
  
  --I'm only warping talwyn if you free her - Bill
  if SAVE.talwynfree then
	ally_warp( tal, taxi_entrance_warp_vol_2 )
  end
  
  if not SAVE.completed_viper_cavern then
    ally_warp( rustypete, taxi_entrance_warp_vol_3 )
  else
    obviate( rustypete )
  end
  
  activate_cam(get_hero(), scene_obsidianeye_petearriving_cam)
  SAVE.npc_start_on_taxi = false;

else
  
	prt( "Not starting on Taxi!" )
  
  if not SAVE.obsidian_eye_revealed then
   -- deactivate( taxi_to_vc )
    obviate( taxi_to_vc )
  else
    unobviate( taxi_to_vc )
    --activate( taxi_to_vc )
  end

  taxi_warp( taxi_to_vc, taxi_tal_warp_vol )
  --[[
  if SAVE.completed_training and (not has_valid_checkpoint()) then
    if SAVE.scene_battle_mayor_intro then
      hero_warp( get_hero(), battle_start_hero_warp_vol )
      prt("Moving Ratchet battle start position")
    else
      hero_warp( get_hero(), checkpoint_beach_respawn_vol )
      prt("Moving Ratchet beach start position")
    end
  end
  ]]--

	--Rewrote this to accomodate for the obsidian eye checkpoint reload position
  	if SAVE.completed_training and not has_valid_checkpoint() then
		if SAVE.scene_battle_mayor_intro then
			hero_warp(get_hero(), battle_start_hero_warp_vol)
		else
			if SAVE.island_checkpoints_number == 7 then
				hero_warp(get_hero(), checkpoint_obsidian_eye_respawn_vol)
			else
				hero_warp(get_hero(), checkpoint_beach_respawn_vol)
			end

			SAVE.windmill_line = SAVE.windmill_number
			if not SAVE.windmill_number == nil and SAVE.windmill_number < 5 then
				SAVE.windmill_hud_on = true
			end
		end
	end
end

run_script("island_training");
run_script("island_training_audio");
run_script("island_help_messages");
if SAVE.completed_training then
  run_script("island_prebattle");
end
if SAVE.completed_viper_cavern then
  run_script("island_battle");
  run_script("island_battle_audio");
  --deactivate(taxi_to_vc)
  prt("deactivating Taxi in the Main Script Line 105")
end
if SAVE.completed_island_battle then
  run_script("island_postbattle");
  --activate(taxi_to_vc)
end
 
local hit_first_checkpoint = false;

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

while true do

----------------------------------------------------------------------------------------------------
-- TEMP DEBUG - Must remove everything in this section 
----------------------------------------------------------------------------------------------------
--[[
-- Skip need to play training
	if is_in_volume( get_hero(), DEBUG_TEMP_skip_training_vol ) and not debug_skiptraining_on then
			SAVE.completed_training = true
			SAVE.scene_mayor_intro = true
			hero_warp( get_hero(), DEBUG_TEMP_skip_training_start_vol, true )
			run_script("island_prebattle")
			debug_skiptraining_on = true
			prt("DEBUG skipping training")
	end

-- Skip need to play battlefield
	if is_in_volume( get_hero(), DEBUG_TEMP_into_battle_vol ) and not debug_into_battle_on then
			hero_give_weapon(get_hero(), WPN_COMBUSTER, 0)
			hero_give_weapon(get_hero(), WPN_GRENADE, 0)
			hero_give_weapon(get_hero(), WPN_TORNADO, 0)
			hero_give_weapon(get_hero(), WPN_RAVAGER, 0)
			SAVE.completed_training = true
			SAVE.scene_mayor_intro = true
			SAVE.completed_viper_cavern = true
			SAVE.obsidian_eye_revealed = true
			SAVE.npc_start_on_taxi = true
			hero_warp( get_hero(), DEBUG_TEMP_skip_to_battlefield_vol, true )
			run_script("island_battle")
			debug_into_battle_on = true
			prt("DEBUG into Battlefield")
	end
--]]
	

	--unlock controls if you started on the taxi and came into the bay
	if is_in_volume(taxi_to_vc, taxi_stop_vol) and  hero_controls_locked then
		 hero_controls_locked = false
		 hero_lockout_control(get_hero(), false, false, false)
		 deactivate_cam(get_hero(), scene_obsidianeye_petearriving_cam)
		 --activate opening view cam here
--		 activate_cam(get_hero(), opening_view_cam_bay)
	end

----------------------------------------------------------------------------------------------------
-- END OF DEBUG
----------------------------------------------------------------------------------------------------				

----------------------------------------------------------------------------------------------------
-- STAGE SCRIPTS
----------------------------------------------------------------------------------------------------	

  -- start the appropriate script
  if SAVE.completed_viper_cavern and not SAVE.completed_island_battle then
    run_script("island_battle");
  elseif SAVE.completed_viper_cavern and SAVE.completed_island_battle then
    run_script("island_postbattle");
  elseif not SAVE.completed_training then
    run_script("island_training");
    run_script("island_training_audio");
  else 
    run_script("island_prebattle");
  end
 
----------------------------------------------------------------------------------------------------
-- Training Completes
----------------------------------------------------------------------------------------------------	
	-- TODO - change this condition so that it is true when training is done
	if is_in_volume( get_hero(), training_done_vol ) then
	  prt( "Training segment complete." )
    SAVE.completed_training = true
	end
	
----------------------------------------------------------------------------------------------------
-- Training Completes
----------------------------------------------------------------------------------------------------	
  	--tell the player they need to go look for darkwater if they are milling about near the barge
	if (last_time_check_barge_volume_executed + wait_between_volume_check < get_current_time() and SAVE.scene_postbattle_smuggler_state == 1 and not SAVE.scene_postbattle_smuggler_decoded and is_in_volume(get_hero(), DockAndBargeVolume)) then
		last_time_check_barge_volume_executed = get_current_time()
		popup_message( L01_PROMPT_GPLAY_MUSTFINDGUIDE  , 5 )
	end
  
----------------------------------------------------------------------------------------------------
-- LEVEL TRANSITIONS
----------------------------------------------------------------------------------------------------	

  if hit_first_checkpoint and is_in_volume( get_hero(), taxi_transition_vol ) then
  
    if SAVE.completed_island_battle then

      -- TRANSITION TO TREASURE ISLAND
      --------------------------------
      SAVE.ti_start_on_taxi = true
      set_level( LEVEL_TREASURE_ISLAND );
    
    elseif not SAVE.completed_viper_cavern then
    
      -- TRANSITION TO VIPER CAVERNS
      ------------------------------
      SAVE.vc_start_on_taxi = true
      set_level( LEVEL_VIPER_CAVERNS );
      
    else
    
      prt( "UNKNOWN TRANSITION STATE!" );
      
    end
  
    wait(1)
    
  end

  if not hit_first_checkpoint and is_in_volume( get_hero(), checkpoint_beach_vol ) then
    hit_first_checkpoint = true
  end
  
----------------------------------------------------------------------------------------------------
-- Grind Rail
----------------------------------------------------------------------------------------------------	
--[[
-- camera for Grind Rail from Village to Wmill5
	if is_in_volume( get_hero(), grindrail_village_cam_vol ) and not village_grindcam_active then
		prt( "Village Grind Rail cam activated" )
      --activate_cam( get_hero(), grindrail_village_to_wmill_cam )
     village_grindcam_active = true
    end

	if is_in_volume( get_hero(), checkpoint_wmill5_vol ) and village_grindcam_active then
      prt( "Village Grind Rail cam deactivated" )
      deactivate_cam( get_hero(), grindrail_village_to_wmill_cam )
      village_grindcam_active = false
	end

-- camera for Grind Rail from Wmill5 to Wmill4
	if is_in_volume( get_hero(), grindrail_wmill_cam_vol  ) and not wmill_grindcam_active then
		prt( "Wmill Grind Rail cam activated" )
      --activate_cam( get_hero(), grindrail_wmill_to_wmill_cam )
      wmill_grindcam_active =  true
    end

	if is_in_volume( get_hero(), grindrail_wmill_cam_end_vol ) and wmill_grindcam_active  then
      prt( "Wmill Grind Rail cam deactivated" )
      --deactivate_cam( get_hero(), grindrail_wmill_to_wmill_cam  )
     wmill_grindcam_active =  false
	end
 --]]
----------------------------------------------------------------------------------------------------
-- Camera adjustments for platforming
----------------------------------------------------------------------------------------------------	

--Dam 
update_camera_adjust_area( get_hero(), "damcamupdatefake", platforming_cam_adjust_area2, 6.34, 18, 75.5, 2.15, 2 )

-- Windmill #3
update_camera_adjust_area( get_hero(), "wincamupdatefake", platforming_cam_adjust_area, 6, 30, 75.5, 3, 2 )

--[[
--Dam -----------------------------------------
	if is_in_area( get_hero(), platforming_cam_adjust_area2 ) and not platforming_camadjust_active1 then
		set_follow_cam(get_hero(), 6.34, 18, 0, 2.15)
		platforming_camadjust_active1 = true
    end

	if not is_in_area( get_hero(), platforming_cam_adjust_area2 ) and platforming_camadjust_active1 then
		reset_follow_cam( get_hero() )
		platforming_camadjust_active1 = false
	end

-- Windmill #3---------------------------------
	if is_in_area( get_hero(), platforming_cam_adjust_area ) and not platforming_camadjust_active then
		set_follow_cam( get_hero(), 6, 30, 0.0, 3 )
		platforming_camadjust_active = true
    end

	if not is_in_area( get_hero(), platforming_cam_adjust_area ) and platforming_camadjust_active then
		reset_follow_cam( get_hero() )
		platforming_camadjust_active = false
	end
--]]
	
----------------------------------------------------------------------------------------------------
-- Hiding/Unhiding Ambient Pteradactyls
----------------------------------------------------------------------------------------------------	
	if not SAVE.completed_island_battle and SAVE.completed_viper_cavern and birds_hidden == false then
		birds_hidden = true
		car_spawner_obviate(A01_cont01)
		car_spawner_obviate(A01_cont02)
		car_spawner_obviate(A01_cont03)
		car_spawner_obviate(A01_cont04)
		
		car_spawner_obviate(A02_cont01)
		car_spawner_obviate(A02_cont02)
		
		car_spawner_obviate(A03_cont01)
		car_spawner_obviate(A03_cont02)
		car_spawner_obviate(A03_cont03)
		
		car_spawner_obviate(A04_cont01)
		car_spawner_obviate(A04_cont02)
		car_spawner_obviate(A04_cont03)
		
		car_spawner_obviate(A05_cont01)
		
		car_spawner_obviate(A06_cont01)
		
		car_spawner_obviate(A07_cont01)
		car_spawner_obviate(A07_cont02)
		
		car_spawner_obviate(A08_cont01)
		car_spawner_obviate(A08_cont02)
		car_spawner_obviate(A08_contA1)
		
		car_spawner_obviate(A09_cont01)
		car_spawner_obviate(A09_cont02)		
	end
	
	if SAVE.completed_island_battle and birds_hidden then
		birds_hidden = nil
		car_spawner_unobviate(A01_cont01)
		car_spawner_unobviate(A01_cont02)
		car_spawner_unobviate(A01_cont03)
		car_spawner_unobviate(A01_cont04)
		
		car_spawner_unobviate(A02_cont01)
		car_spawner_unobviate(A02_cont02)
		
		car_spawner_unobviate(A03_cont01)
		car_spawner_unobviate(A03_cont02)
		car_spawner_unobviate(A03_cont03)
		
		car_spawner_unobviate(A04_cont01)
		car_spawner_unobviate(A04_cont02)
		car_spawner_unobviate(A04_cont03)
		
		car_spawner_unobviate(A05_cont01)
		
		car_spawner_unobviate(A06_cont01)
		
		car_spawner_unobviate(A07_cont01)
		car_spawner_unobviate(A07_cont02)
		
		car_spawner_unobviate(A08_cont01)
		car_spawner_unobviate(A08_cont02)
		car_spawner_unobviate(A08_contA1)
		
		car_spawner_unobviate(A09_cont01)
		car_spawner_unobviate(A09_cont02)
	end

----------------------------------------------------------------------------------------------------
-- End of Main Loop
----------------------------------------------------------------------------------------------------	

wait()
  
end

