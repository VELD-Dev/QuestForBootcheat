----------------------------------------------------------------------------------------------------
-- Gameplay Script 
----------------------------------------------------------------------------------------------------

-- This script is loaded for NPC_ISLAND when the player has completed
-- viper caverns.  This script is reponsible for setting up the NPC ISLAND
-- pirate invasion battlefield, running the battle, and 
-- the windmill and lighthouse repairs, as well as transitioning into 
-- the viper caverns script.


----------------------------------------------------------------------------------------------------
-- Global  Variables
----------------------------------------------------------------------------------------------------

-- used for audio scripting
play_BATTLE_EYE_vo = false
play_BATTLE_CANNON_vo = false
play_BATTLE_FIRE_vo = false
play_BATTLE_SLAG_DARKWATER1_vo = false
play_BATTLE_SLAG_DARKWATER2_vo = false
play_BATTLE_SLAG_DARKWATER3_vo = false
play_BATTLE_SLAG_DARKWATER4_vo = false
play_BATTLE_SLAG_DARKWATER5_vo = false
play_BATTLE_SLAG_DARKWATER5_vo = false
play_BATTLE_HOTHEAD_vo = false
play_BATTLE_HOTHEAD_RESPONSE_vo = false
play_BATTLE_HOTHEAD_RESPONSE2_vo = false
play_BATTLE_WEAPONS_vo = false
play_BATTLE_TURRET_vo = false
play_BATTLE_TURRET_RESPONSE_vo = false
play_BATTLE_TURRET_RESPONSE2_vo = false
play_BATTLE_BS_vo = false
play_BATTLE_TAKE_OUT_TURRETS_vo = false
play_BATTLE_TURRET_DESTROYED_vo = false
play_BATTLE_SECOND_TURRET_DESTROYED = false
play_BATTLE_THIRD_TURRET_DESTROYED_RESPONSE_vo = false
play_BATTLE_THIRD_TURRET_DESTROYED_RESPONSE2_vo = false
play_BATTLE_THIRD_TURRET_DESTROYED_vo = false
play_BATTLE_AT_DOOR_vo = false
play_BATTLE_SHIP_COMES_ABOUT_vo = false
play_BATTLE_SHIP_DESTROYED_vo = false

TURRET_VO_FINISHED = false

----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

local battle_ready = false
local battle_started = false
local b1_w0_launched = false
local b1_w1_launched = false
local b1_w2_launched = false
local b1_w3_launched = false
local b1_w4_launched = false
local b1_w5_launched = false
local exit_turret = false
local b2_w0_launched = false
local b2_w0x_launched = false
local battle1_complete = false
local b2_w1_launched = false
local b2_w2_launched = false
local b2_w3_launched = false
local b2_w4_launched = false
local b2_w5_launched = false
local battleship_stage1  = false
local battleship_stage2  = false
local battleship_move_stage2 = false
local battleship_runaway = false
local island_battle_move_ship = 0
local battleship_move_after_turret = false


----------------------------------------------------------------------------------------------------
-- Initialization
----------------------------------------------------------------------------------------------------

-- Give Ratchet full ammo
hero_give_all_ammo(get_hero())

ally_equipitem(tal, ALLY_ITEM_GUN)

-- Disable the taxi
deactivate( taxi_to_vc )
 
-- Get NPC's into position.
npc_warp( npc_mayor, scene_battle_mayor_beach_warp_vol  )
obviate( npc_smuggler )

-- Hide Catapult off the beach
obviate( beach_wrench_catapult )
obviate( beach_wrench_springpad )

-- Hide windmill platform
obviate( ni_windmill_platform_2 )
coll_on( ni_windmill_platform_collision_wall ) -- collision for Windmill #1 to stop retraversal

-- Hide beach crates that may not have been destroyed.
obviate_pod( beach_crates_pod )
unobviate_pod( battlefield_health_pod )

--Hide ambient villagers
foreach_moby_in_pod(NPC_POD, obviate)
obviate(npc_windmill)
obviate(npc_lighthouse)

-- Battlefield Controller
battlefieldcontroller_addtarget( battlefield_controller, get_hero(), 1, 2 )
battlefieldcontroller_addtarget( battlefield_controller, tal, 2, 2 )
battlefieldcontroller_addtarget( battlefield_controller, obsidian_eye_door, 2, 3 )

-- Turn ON ghostly mist controllers.
force_track_fx( undeadFog1, true ) 
force_track_fx( undeadFog2, true ) 
force_track_fx( undeadFog3, true ) 
force_track_fx( undeadFog4, true ) 
force_track_fx( undeadFog5, true ) 
force_track_fx( undeadFog6, true ) 
force_track_fx( undeadFog7, true ) 
force_track_fx( undeadFog8, true ) 
force_track_fx( undeadFog9, true ) 
force_track_fx( undeadFog10, true ) 
force_track_fx( undeadFog11, true ) 
force_track_fx( undeadFog12, true ) 
force_track_fx( undeadFog13, true ) 
force_track_fx( undeadFog14, true ) 
force_track_fx( undeadFog15, true ) 
force_track_fx( undeadFog16, true ) 


-- Run Tal's script if she was saved.
if SAVE.talwynfree and not SAVE.completed_island_battle then
	run_script("island_battle_tal")
	run_script("island_battle_audio_tal")
	
	--and put her in her place if she's free
	if SAVE.island_battle_tal_location == 1 and not is_in_volume(tal, bat1_tal_pos_vol) then
		ally_warp(tal, bat1_tal_pos_vol)
	end

end

--Put NPCs in their various locations when you respawn(hopefully)--
--Mayor
if not SAVE.island_battle_mayor_location and not is_in_volume(npc_mayor, scene_battle_mayor_beach_warp_vol) then
	npc_warp(npc_mayor, scene_battle_mayor_beach_warp_vol)
elseif SAVE.island_battle_mayor_location == 1 and not is_in_volume(npc_mayor, obsidian_eye_mayor_warp_vol) then
	npc_warp(npc_mayor, obsidian_eye_mayor_warp_vol)
end

--denied
obviate(rustypete)

--Show location
if is_in_volume(get_hero(), show_location_volume) and not SAVE.NPC_Island_Location_Shown then
	SAVE.NPC_Island_Location_Shown = true
	show_location(L01_PLACE_GPLAY_HOOLEFARISLAND, 4)
end
	
----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

while not SAVE.completed_island_battle do

	-- Ammo Spawners start giving out ammo
	spawner_spawn( battle_ammo_spawner1, ART_CLASS_AMMO_CRATE )
	spawner_spawn( battle_ammo_spawner2, ART_CLASS_AMMO_CRATE )
	spawner_spawn( battle_ammo_spawner3, ART_CLASS_AMMO_CRATE )

	-- Start scene with the Mayor upon returning to NPC Island
	if is_in_volume( get_hero(), scene_battle_mayor_vol ) and not SAVE.scene_battle_mayor_intro then
		queue_scene( "scene_battle_mayor")
		wait()
		SAVE.island_battle_tal_location = 1
		SAVE.island_battle_mayor_location = 1
		request_auto_save()
	end	


	-- Start up the battle once the Mayor scene is over.
	if SAVE.scene_battle_mayor_intro and not battle_ready then

			if not SAVE.battle_begun and not SAVE.island_battle1_complete then
				hero_warp( get_hero(), battle_start_hero_warp_vol )
				SAVE.battle_begun = true
				prt("first time battle setup")
			else
				set_pf_position(battle_darkwater_ship, battle_darkwater_ship_stop1_vol)
				unobviate( battle_darkwater_ship )
				unobviate( captain_darkwater_slaghead   )
				wait(0.25)	
				activate( undead_FX_controller )
				prt("Battle setup")
			end

			obviate_pod( battle_npcs_pod )			
			door_close( beach_door_to_village )
			door_close( beach_door_to_beacon )
			door_close( obsidian_eye_door )
			door_close( water_tunnel_door )
			unobviate_pod( battle_ammo_spawners )
			activate( undeadFog1 )
			activate( undeadFog2 )
			activate( undeadFog3 )
			activate( undeadFog4 )
			activate( undeadFog5 )
			activate( undeadFog6 )
			activate( undeadFog7 )
			activate( undeadFog8 )
			activate( undeadFog9 )
			activate( undeadFog10 )
			activate( undeadFog11 )
			activate( undeadFog12 )
			activate( undeadFog13 )
			activate( undeadFog14 )
			activate( undeadFog15 )
			activate( undeadFog16 )
			activate( battlefield_water_death_plane )
			set_follow_cam( get_hero(), 8.52, 10, 0, 1.85 )
			prt("Battle ready")
			battle_ready = true
	end

----------------------------------------------------------------------------------------------------
-- Battle #1 Enemies
----------------------------------------------------------------------------------------------------
	
		--- Wave #0
		if battle_ready and not b1_w0_launched and not SAVE.island_battle1_complete then
			foreach_moby_in_pod( b1_w0_pirates_pod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER )
			wait(2.0)
			activate( undead_FX_controller )
			foreach_moby_in_pod( b1_w0_pirates_pod, smoky_reveal )
			foreach_moby_in_pod( b1_w0_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
			foreach_moby_in_pod( b1_w0_pirates_pod, awareness_add_targettype, TRG.TT_ALLY )
			wait(2.0)
			play_NI_BATTLE_EYE_vo = true
			prt("b1_w0_launched")
			b1_w0_launched = true
		end
		
		--- Wave #1
		if get_num_alive( b1_w0_pirates_pod ) == 0 and not is_activated( battle_darkwater_ship ) and not b1_w1_launched and not SAVE.island_battle1_complete then
			foreach_moby_in_pod( b1_w1_pirates_pod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER )
			foreach_moby_in_pod( b1_w1_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
			foreach_moby_in_pod( b1_w1_pirates_pod, awareness_add_targettype, TRG.TT_ALLY )
			prt("b1_w1_launched")
			b1_w1_launched = true
		end
		
		--- Wave #2
		if b1_w1_launched and get_num_alive( b1_w1_pirates_pod ) == 0 and not b1_w2_launched and not SAVE.island_battle1_complete then
			foreach_moby_in_pod( b1_w2_pirates_pod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER )
			foreach_moby_in_pod( b1_w2_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
			foreach_moby_in_pod( b1_w2_pirates_pod, awareness_add_targettype, TRG.TT_ALLY )
			prt("b1_w2_launched")
			b1_w2_launched = true
		end
		
		--- Wave #3
		if b1_w2_launched and get_num_alive( b1_w2_pirates_pod ) == 0 and not b1_w3_launched and not SAVE.island_battle1_complete then
			play_BATTLE_CANNON_vo = true
			foreach_moby_in_pod( battleship_cannons_left_pod, cannon_open )	
			dwbs_set_cannons( battle_darkwater_ship, battleship_cannons_left_pod )
			foreach_moby_in_pod( b1_w3_pirates_pod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER )
			foreach_moby_in_pod( b1_w3_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
			foreach_moby_in_pod( b1_w3_pirates_pod, awareness_add_targettype, TRG.TT_ALLY )
			prt("b1_w3_launched")
			b1_w3_launched = true
		end
		
		--- Wave #4
		if b1_w3_launched and get_num_alive( b1_w3_pirates_pod ) == 0 and not b1_w4_launched and not SAVE.island_battle1_complete then
			play_BATTLE_WEAPONS_vo = true
			foreach_moby_in_pod( b1_w4_pirates_pod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER )
			foreach_moby_in_pod( b1_w4_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
			foreach_moby_in_pod( b1_w4_pirates_pod, awareness_add_targettype, TRG.TT_ALLY )
			prt("b1_w4_launched")
			b1_w4_launched = true
		end
		
		--- Wave #5
		if b1_w4_launched and get_num_alive( b1_w4_pirates_pod ) == 0 and not b1_w5_launched and not SAVE.island_battle1_complete then
			foreach_moby_in_pod( b1_w5_pirates_pod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER )
			foreach_moby_in_pod( b1_w5_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
			foreach_moby_in_pod( b1_w5_pirates_pod, awareness_add_targettype, TRG.TT_ALLY )
			play_BATTLE_TURRET_vo = true
			prt("b1_w5_launched")
			b1_w5_launched = true
		end

	
----------------------------------------------------------------------------------------------------
-- Turret vs Battleship part 1
----------------------------------------------------------------------------------------------------	

		  --- Fight the Battleship with the turret
		if  get_num_alive( b1_w5_pirates_pod ) == 0 and not battleship_stage1 and not SAVE.island_battle1_complete then		
			prt("Part 1 of turret fight")		
			queue_scene("scene_battle_turret")
			wait()
			wait(0.25)
			play_BATTLE_TAKE_OUT_TURRETS_vo = true
			battleship_stage1 = true
		end

		--- Move away as left cannons are destroyed
		if get_num_alive( battleship_cannons_left_pod ) == 0 and not battle1_complete and not SAVE.island_battle1_complete then
			prt("Battle 1 complete")
			battle1_complete  = true
		end
	
		-- Kick player from the turret.
		if battle1_complete and not exit_turret and not SAVE.island_battle1_complete then
			hero_exit_turret( get_hero() )	
			turret_pirate_fall( battle_turret )
			wait(0.5)
			set_follow_cam( get_hero(), 8.52, 10, 0, 1.85 )
			exit_turret = true
			SAVE.island_battle1_complete = true
			request_auto_save()
		end
		
		--MOVE THE SHIP HERE AFTER YOU BEAT THE TURRET
		if SAVE.island_battle1_complete and not battleship_move_after_turret then
			battleship_move_after_turret = true
			activate( battle_darkwater_ship )
			prt("MOVING DARKWATER'S SHIP UP AFTER BEATING THE TURRET")
		end

----------------------------------------------------------------------------------------------------
-- Battle #2 Enemies
----------------------------------------------------------------------------------------------------

	if SAVE.island_battle1_complete and not b2_w0x_launched then
		prt("Battle 2 starting")
		play_BATTLE_AT_DOOR_vo = true
		foreach_moby_in_pod( b2_w0x_pirates_pod, smoky_reveal )
		foreach_moby_in_pod( b2_w0x_pirates_pod, awareness_add_targettype, TRG.TT_DOOR )
		foreach_moby_in_pod( b2_w0x_pirates_pod, awareness_add_targettype, TRG.TT_ALLY	)
		foreach_moby_in_pod( b2_w0x_pirates_pod, awareness_add_targettype, TRG.TT_DOOR )
		foreach_moby_in_pod( b2_w0x_pirates_pod, awareness_add_targettype, TRG.TT_ALLY	)
		b2_w0x_launched = true
	end	

	if b2_w0x_launched and is_in_volume( get_hero(), b2_w0_trigger_vol ) and not b2_w0_launched then
		foreach_moby_in_pod( b2_w0_pirates_pod, awareness_add_targettype, TRG.TT_HERO)
		b2_w0_launched = true
	end

	--- Wave #1
	if b2_w0_launched and get_num_alive( b2_w0_pirates_pod ) == 0 and get_num_alive( b2_w0x_pirates_pod ) == 0 and not b2_w1x_launched then
		foreach_moby_in_pod( b2_w1x_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
		prt("b2_w1_launched")
		b2_w1x_launched = true
	end

	--- Wave #1 - Walker attacks the Ob Eye door.
	if b2_w1x_launched and get_num_alive( b2_w1x_pirates_pod ) == 0 and not b2_w1_launched then
		unobviate_pod( b2_w1_pirates_pod )
		foreach_moby_in_pod( b2_w1_pirates_pod, awareness_add_targettype, TRG.TT_DOOR )
		prt("b2_w1x_launched")
		b2_w1_launched = true
	end
	
	--- Wave #2
	if b2_w1x_launched and get_num_alive( b2_w1_pirates_pod ) == 0 and get_num_alive( b2_w1x_pirates_pod ) == 0  and not b2_w2_launched then
		foreach_moby_in_pod( b2_w2_pirates_pod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER )
		unobviate_pod( b2_w2_pirates_pod )
		foreach_moby_in_pod( b2_w2_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
		foreach_moby_in_pod( b2_w2_pirates_pod, awareness_add_targettype, TRG.TT_ALLY )
		foreach_moby_in_pod( b2_w2_pirates_pod, awareness_add_targettype, TRG.TT_DOOR )
		prt("b2_w2_launched")
		b2_w2_launched = true
	end
	
	--- Wave #3
	if b2_w2_launched and get_num_alive( b2_w2_pirates_pod ) == 0 and not b2_w3_launched then
		foreach_moby_in_pod( b2_w3_pirates_pod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER )
		foreach_moby_in_pod( b2_w3_pirates_pod, smoky_reveal )
		foreach_moby_in_pod( b2_w3_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
		foreach_moby_in_pod( b2_w3_pirates_pod, awareness_add_targettype, TRG.TT_ALLY )
		foreach_moby_in_pod( b2_w3_pirates_pod, awareness_add_targettype, TRG.TT_DOOR )
		unobviate_pod( b2_w3_pirates_pod )
		prt("b2_w3_launched")
		b2_w3_launched = true
	end

	--- Wave #4
	if b2_w3_launched and get_num_alive( b2_w3_pirates_pod ) == 0 and not b2_w4_launched then
		foreach_moby_in_pod( b2_w4_pirates_pod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER )
		unobviate_pod( b2_w4_pirates_pod )
		foreach_moby_in_pod( b2_w4_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
		foreach_moby_in_pod( b2_w4_pirates_pod, awareness_add_targettype, TRG.TT_ALLY )
		foreach_moby_in_pod( b2_w4_pirates_pod, awareness_add_targettype, TRG.TT_DOOR )
		play_BATTLE_SHIP_COMES_ABOUT_vo = true
		flip_director_slag( captain_darkwater_slaghead )
		
		--Move the ship down for the second turret
		activate( battle_darkwater_ship )
		prt("SHIP MOVING")
		prt("b2_w4_launched")
		b2_w4_launched = true
	end
	
	--- Wave #5 and move Darkwater's ship into position.
	if b2_w4_launched and get_num_alive( b2_w4_pirates_pod ) == 0 and not b2_w5_launched then
		foreach_moby_in_pod( b2_w5_pirates_pod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER )
		foreach_moby_in_pod( b1_w5_pirates_pod, smoky_reveal )
		foreach_moby_in_pod( b2_w5_pirates_pod, awareness_add_targettype, TRG.TT_HERO )
		foreach_moby_in_pod( b2_w5_pirates_pod, awareness_add_targettype, TRG.TT_ALLY )
		foreach_moby_in_pod( b2_w5_pirates_pod, awareness_add_targettype, TRG.TT_DOOR )
		unobviate_pod( b2_w5_pirates_pod )
		foreach_moby_in_pod( battleship_cannons_right_pod, cannon_open )	
		dwbs_set_cannons( battle_darkwater_ship, battleship_cannons_right_pod )
		set_wisp_params( controller_wisp_bullets, 3, 4, 7, 6, 7, 2, 3)
		prt("b2_w5_launched")
		b2_w5_launched = true
	end
	
	
	if get_num_alive( b2_w5_pirates_pod ) == 0 and not battleship_move_stage2 then
		queue_scene("scene_battle_turret2")
		wait()
		battleship_move_stage2  = true
	end

----------------------------------------------------------------------------------------------------
-- Turret vs Battleship part 2
----------------------------------------------------------------------------------------------------	

	--- Move into position to fire cannons on right side.
	if b2_w5_launched and not is_activated( battle_darkwater_ship ) and not battleship_stage2 then
		battleship_stage2 = true
	end

----------------------------------------------------------------------------------------------------
-- End of Battle
----------------------------------------------------------------------------------------------------

	
	--- Flee if all cannons are destroyed.
	if get_num_alive( battleship_cannons_right_pod ) == 0 and not SAVE.completed_island_battle then
		deactivate( controller_wisp_bullets )
		hero_exit_turret( get_hero() )	
		wait(1.0)
		run_script( "island_postbattle" )
		SAVE.completed_island_battle = true   
	end
	
  wait()

end

