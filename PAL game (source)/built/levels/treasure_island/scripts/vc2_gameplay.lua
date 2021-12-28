------------------------------------------------------------------------
-- Init-----------------------------------------------------------------
------------------------------------------------------------------------

local shingle_boss_cam = false
local hotheads_revealed_rock_concert = false
local hotheads_revealed_island = false
local hotheads_revealed_boss = false

SAVE.vc2_entered = true

--shows the location text when you enter hoolefar island
show_location(L02_PLACE_GPLAY_LYTHOINCAVES, 4)

--Hide the rock concert hotheads
--obviate(vc2_boltplatform1_hothead_pirate1)
--obviate(vc2_boltplatform1_hothead_pirate2)
--TEST
smoky_reveal(vc2_boltplatform1_hothead_pirate1)
smoky_reveal(vc2_boltplatform1_hothead_pirate2)

--Hide the hothead pirates near the end on that platform
obviate(vc2_boltplatform2_hothead_pirate1)
obviate(vc2_boltplatform2_hothead_pirate2)

--Hide the shooter pirates in the secret room
obviate(vc2_boltplatform2_shooter_pirate1)
obviate(vc2_boltplatform2_shooter_pirate2)
obviate(vc2_boltplatform2_shooter_pirate3)

--Hide the hotheads next to the shingle pirate
obviate(vc2_exit_hothead1)
obviate(vc2_exit_hothead2)

--close the doors behind the shingle pirate
--local doors_open = false
--door_close(vc2_exit_elevator_door1, false)
--door_close(vc2_exit_elevator_door2, false)

--temp remove tentacles until they're coded
--obviate(vc2_boltplatform2_creaturearm1)
--obviate(vc2_boltplatform2_creaturearm2)
--obviate(vc2_boltplatform2_creaturearm3)

--test to see if I need to make this only happen once
--if is_in_volume(get_hero(), vc2_entrance_vol) and not SAVE.vc2_open_cam then
--	SAVE.vc2_open_cam = true
--	activate_cam(get_hero(), vc2_entrance_openingview_cam)
--end

--keep the first boltcrank open if you've done it already and respawned
if not crank_is_complete(vc2_boltplatform1_boltcrank) and SAVE.vc2_boltcrank1_complete then
	crank_set_complete(vc2_boltplatform1_boltcrank)
end

--Warp to checkpoints
if not has_valid_checkpoint() then
	if SAVE.vc2_checkpoint == 0 then
		hero_warp(get_hero(), vc2_checkpoint_spawn)
	elseif SAVE.vc2_checkpoint == 1 then
		hero_warp(get_hero(), vc2_checkpoint1_spawn)
	elseif SAVE.vc2_checkpoint == 2 then
		hero_warp(get_hero(), vc2_checkpoint2_spawn)
	elseif SAVE.vc2_checkpoint == 3 then
		hero_warp(get_hero(), vc2_checkpoint3_spawn)
	end
end

obviate_pod(darkwater_fleet_pod)
------------------------------------------------------------------------
-- Main Loop -----------------------------------------------------------
------------------------------------------------------------------------
    
while true do

------------------------------------------------------------------------
-- Cameras -------------------------------------------------------------
------------------------------------------------------------------------

	--wall climbing cam here
	if is_in_area(get_hero(), vc2_ledgegrab_cam_vol_area) and not lg1_cam then
		prt("vc2 ledge grab cam activated")
		activate_cam(get_hero(), vc2_ledgegrab_cam_controller)
		lg1_cam = true
	end
	
	if not is_in_area(get_hero(), vc2_ledgegrab_cam_vol_area) and lg1_cam then
		prt("vc2 ledge grab cam deactivated")
		deactivate_cam(get_hero(), vc2_ledgegrab_cam_controller)
		lg1_cam = false
	end
	
	--First bolt cam activated
	if is_in_volume(get_hero(), vc2_boltplatform1_boltcrank_vol) and is_cranking(get_hero(), vc2_boltplatform1_boltcrank) and not bp1_cam then
		prt("vc2 bolt crank 1 cam activated")
		activate_cam(get_hero(), vc2_boltplatform1_boltcam)
		bp1_cam = true
	end
	
	--First bolt cam deactivated
	if not is_cranking(get_hero(), vc2_boltplatform1_boltcrank) and bp1_cam then
		prt("vc2 bolt crank 1 cam deactivated")
		deactivate_cam(get_hero(), vc2_boltplatform1_boltcam)
		bp1_cam = false
	end
	
	--Second bolt cam activated
	if is_in_volume(get_hero(), vc2_boltplatform2_boltcrank_vol) and is_cranking(get_hero(), vc2_boltplatform2_boltcrank) and not bp2_cam then
		prt("vc2 bolt crank 2 cam activated")
		activate_cam(get_hero(), vc2_boltplatform2_boltcam)
		bp2_cam = true
	end
	
	--Second bolt cam deactivated
	if not is_cranking(get_hero(), vc2_boltplatform2_boltcrank) and bp2_cam then
		prt("vc2 bolt crank 2 cam deactivated")
		deactivate_cam(get_hero(), vc2_boltplatform2_boltcam)
		bp2_cam = false
	end

	--Sets the follow cam for the wooden planks segment & wrench platform for glowslugs
	if ( is_in_volume(get_hero(), vc2_boltplatform2_planks_followcam_vol) or is_in_volume(get_hero(), vc2_planks_wrenchplatforms_vol) ) and not vc2_follow_cam_on then
		vc2_follow_cam_on = true
		--set_follow_cam(get_hero(), 5.5, 15, 0, 2.65)
		set_follow_cam(get_hero(), 7.5, 25, 0, 2.65)
	end

	--deactivates the follow cam for the wooden planks segment
	if not is_in_volume(get_hero(), vc2_boltplatform2_planks_followcam_vol) and not is_in_volume(get_hero(), vc2_planks_wrenchplatforms_vol) and vc2_follow_cam_on then
		vc2_follow_cam_on = false
		reset_follow_cam(get_hero())
	end
	
	if is_in_volume(get_hero(), vc2_exit_shingle_outer_vol) and not shingle_boss_cam then
		set_follow_cam(get_hero(), 7, 8.5, 0, 1.65)
		shingle_boss_cam = true
	end
	
	if not is_in_volume(get_hero(), vc2_exit_shingle_outer_vol) and shingle_boss_cam then
		shingle_boss_cam = false
		reset_follow_cam(get_hero())
	end
	
------------------------------------------------------------------------
-- Gameplay-------------------------------------------------------------
------------------------------------------------------------------------
	
	--make 'em invincible to falling!
	foreach_moby_in_pod(vc2_vipers, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_FALL_TO_DEATH)
		
	--Viper shit
	--1st cave viper intro
	if not vc2_viper1_intro and is_in_volume(get_hero(), vc2_entrance_viper1_innervol) then
		caveviper_intro(vc2_entrance_viper1)
		vc2_viper1_intro = true
		vc2_viper1_outro = false
	end

	--1st cave viper outro
	if not vc2_viper1_outro and not is_in_volume(get_hero(), vc2_entrance_viper1_outervol) then
		caveviper_outro(vc2_entrance_viper1)
		vc2_viper1_outro = true
		vc2_viper1_intro = false
	end

	--2nd cave viper intro
	if not vc2_viper2_intro and is_in_volume(get_hero(), vc2_boltplatform1_viper2_inner_vol) then
		caveviper_intro(vc2_boltplatform1_viper2)
		vc2_viper2_intro = true
		vc2_viper2_outro = false
	end

	--2nd cave viper outro
	if not vc2_viper2_outro and not is_in_volume(get_hero(), vc2_boltplatform1_viper2_outer_vol) then
		caveviper_outro(vc2_boltplatform1_viper2)
		vc2_viper2_outro = true
		vc2_viper2_intro = false
	end

	--[[TEST
	--bring out the rock concert hotheads when ratchet gets close enough
	if is_in_volume(get_hero(), vc2_boltplatform1_cavebatsA_outer_vol) and not hotheads_revealed_rock_concert then
		hotheads_revealed_rock_concert = true
		smoky_reveal(vc2_boltplatform1_hothead_pirate1)
		smoky_reveal(vc2_boltplatform1_hothead_pirate2)
	end
	]]--

	if crank_is_complete(vc2_boltplatform1_boltcrank) and not SAVE.vc2_boltcrank1_complete then
		prt("crank is cranked")
		SAVE.vc2_boltcrank1_complete = true
		hero_warp(get_hero(), vc2_checkpoint1_spawn)  --temp test to see if I can get the player to face the right direction
	end

	--unobviate shooters
	if is_in_volume(get_hero(), vc2_hotheaddoor_open_trigger) then
		unobviate(vc2_boltplatform2_shooter_pirate1)
		enemy_wakeup(vc2_boltplatform2_shooter_pirate1)
		
		--Temp take some out cause "it's too hard"
		--unobviate(vc2_boltplatform2_shooter_pirate2)
		--enemy_wakeup(vc2_boltplatform2_shooter_pirate2)
		
		--unobviate(vc2_boltplatform2_shooter_pirate3)
		--enemy_wakeup(vc2_boltplatform2_shooter_pirate3)
	end

	--obviate hothead pirates later in the level
	if is_in_volume(get_hero(), vc2_boltplatform2_hothead_obviate_vol) and hotheads_revealed_island then
		hotheads_revealed_island = false
		obviate(vc2_boltplatform2_hothead_pirate1)
		obviate(vc2_boltplatform2_hothead_pirate2)
	end

	--unobviate hotheads
	if is_in_volume(get_hero(), vc2_boltplatform2_hothead_unobviate_vol) and not hotheads_revealed_island then
		hotheads_revealed_island = true
		unobviate(vc2_boltplatform2_hothead_pirate1)
		unobviate(vc2_boltplatform2_hothead_pirate2)
		enemy_set_volume_target(vc2_boltplatform2_hothead_pirate1, vc2_bp2_hothead1_target_vol)
		enemy_set_volume_target(vc2_boltplatform2_hothead_pirate2, vc2_bp2_hothead2_target_vol)
	end

	--Start the shingle pirate scene
	if is_in_volume(get_hero(), vc2_shingle_scene_vol) and not SAVE.vc2_scene_shingle_trigger then
		fade_to_black(0.5)
		SAVE.vc2_scene_shingle_trigger = true
		request_auto_save()
		wait(0.5)
		queue_scene("vc2_scene_shingle")
		hero_warp(get_hero(), vc2_shingle_ratchet_warp_after_vol, true)
		fade_from_black(0.5)
		wait(0.5)
		
		boss_register_cam(get_hero(), vc2_shinglepirate, 1.3)
	end

	--unobviate the hotheads after a lil bit in the shingle pirate battle (50% health)
	if SAVE.vc2_scene_shingle_trigger and (enemy_get_health(vc2_shinglepirate) < 50) and not hotheads_revealed_boss then
		hotheads_revealed_boss = true
		--unobviate(vc2_exit_hothead1)
		--unobviate(vc2_exit_hothead2)	
		smoky_reveal(vc2_exit_hothead1)
		smoky_reveal(vc2_exit_hothead2)
	end

	--Spawn some ammo
	spawner_spawn(vc2_exit_ammo_spawner1, ART_CLASS_AMMO_CRATE)
	spawner_spawn(vc2_exit_ammo_spawner, ART_CLASS_AMMO_CRATE)

	--Open doors if he's dead
	if not is_alive(vc2_shinglepirate) then 
		
		boss_unregister_cam(get_hero(), vc2_shinglepirate)
		
		--clean up the stragglers
		if is_alive(vc2_exit_hothead1) then
			damage(vc2_exit_hothead1, 1000)
		end

		if is_alive(vc2_exit_hothead2) then
			damage(vc2_exit_hothead2, 1000)
		end
				
		--delay the door opening but only the first time		
		if not SAVE.vc2_shingle_defeated then
			SAVE.vc2_shingle_defeated = true
			wait(4.0) 
		end
		
		door_open(vc2_exit_elevator_door1, false)
		door_open(vc2_exit_elevator_door2, false)

		--Doesn't work anymore :(
		--hero_lockout_control(get_hero(), true)
		--damage_sphere(get_pos(get_hero()), 30, 1)
		--hero_lockout_control(get_hero(), false)
	end
	
	--if is_in_volume(get_hero(), vc2_exit_elevator_start_vol) then
		--prt("lockout control here")
	--	hero_lockout_control(get_hero(), true, true, false)
	--end
	
	--Start the exit scene
	if is_in_volume(get_hero(), vc2_elevator_exit_vol) then
		SAVE.vc2_scene_exit_trigger = true
		SAVE.completed_treasure_island = true
		SAVE.treasure_island_scene_smuggler_state = 3
		SAVE.treasure_island_hero_location = nil
		request_auto_save()
		--queue_scene("vc2_scene_exit")
		fade_to_black(0.5)
		wait(2.0)
		--hero_warp(get_hero(), vc2_exit_vol, true)
		hero_warp(get_hero(), vc2_exit_elevator_vol1, true)
	end

------------------------------------------------------------------------
-- Checkpoints ---------------------------------------------------------
------------------------------------------------------------------------
	--checkpoint0
	if is_in_volume(get_hero(), vc2_checkpoint) then
		SAVE.vc2_checkpoint = 0
		checkpoint_volume(vc2_checkpoint_spawn)
	end

	--checkpoint 1
	if is_in_volume(get_hero(), vc2_checkpoint1) then
		SAVE.vc2_checkpoint = 1
		checkpoint_volume(vc2_checkpoint1_spawn)
	end

	--checkpoint 2
	if is_in_volume(get_hero(), vc2_checkpoint2) then
		SAVE.vc2_checkpoint = 2
		checkpoint_volume(vc2_checkpoint2_spawn)
	end
	
	--checkpoint 3 actually occurs before checkpoint 1
	if is_in_volume(get_hero(), vc2_checkpoint3) then
		SAVE.vc2_checkpoint = 3
		checkpoint_volume(vc2_checkpoint3_spawn)
	end
	
------------------------------------------------------------------------
-- End Main Loop--------------------------------------------------------
------------------------------------------------------------------------

wait()

end
--End
