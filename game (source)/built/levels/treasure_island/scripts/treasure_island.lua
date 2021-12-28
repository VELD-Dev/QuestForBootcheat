-------------------------------------------------------------------------------
-- INITIALIZATION -------------------------------------------------------------                                                                   
-------------------------------------------------------------------------------

-- AY - this is why the weapon XP kept getting reset.  Don't do this.
--	hero_give_weapon(get_hero(), WPN_COMBUSTER, 0)
--	hero_give_weapon(get_hero(), WPN_GRENADE, 0)
--	hero_give_weapon(get_hero(), WPN_TORNADO, 0)
--	hero_give_weapon(get_hero(), WPN_RAVAGER, 0)


deactivate(lightningController)
deactivate(lightningController1)
deactivate(biggamehunterer)
deactivate(piratebargee)

update_off(enemy_battlefield_pirate2)
update_off(enemy_battlefield_pirate1)
obviate_pod(enemypod_battlefield_hothead_wave1)
obviate_pod(enemypod_battlefield_hothead_wave2)
deactivate(battlefield_ghost_effect)
obviate_pod(battlefield_ammo_spawners)

obviate(ti_battlefield_skullwalker)


--obviate(light_piece_0)
obviate_pod(beetles_beach_wave1)
obviate_pod(beetles_beach_wave2)
obviate_pod(beetles_beach_wave3)

obviate_pod(beetle_pod_organ_puzzle)
obviate_pod(battlefield_health)
obviate_pod(shadow_puzzle_pod2)

obviate_pod(darkwater_fleet_pod)


--[[
--NOTE: This is redundant with some logic already in the main script
if not has_valid_checkpoint() then
if SAVE.arrived_at_treasureisland == true then
hero_warp(get_hero(), checkpoint_startdock_respawn)
end
end
]]--
run_script("ti_dialogue")
run_script("shadow_puzzle_help")
--[[
--NOTE: I moved this logic to the main script
--changed this check for bug 1548
if not SAVE.arrived_at_treasureisland then
  
  taxi_warp(piratebargee, pirate_taxi_start_vol)
  
  prt("HERE AGAIN")
  hero_warp(get_hero(), warp_vol_ratchet_bargestart)
  npc_warp(biggamehunterer,warp_vol_talwyn_bargestart)
  ally_warp(talwyn,warp_vol_smuggler_bargestart)
  taxi_start_move(piratebargee) 
  queue_scene("scene_treasureisland_arrive")
  wait(0)
  SAVE.arrived_at_treasureisland = true
  request_auto_save()
elseif SAVE.completed_treasure_island then
  elevator_warp_to_node(caverns_elevator, 0)
  taxi_warp(piratebargee, pirate_taxi_stop_vol)
  npc_warp(biggamehunterer,ti_scene_smuggler_warp_vol)
  hero_warp(get_hero(), checkpoint_exit_vc2_respawn_vol)
  obviate(talwyn)

else
  npc_warp(biggamehunterer,ti_scene_smuggler_warp_vol)
end
]]--
--per Brian's request
if not hero_has_weapon(get_hero(), WPN_PREDATOR) or not hero_has_weapon(get_hero(), WPN_ROBO_HIVE) then
	
	queue_scene("scene_smuggler_weapons")
	wait(0.2)

  fade_to_black(0)
 set_fog( 5.0, 60.0, 0.57, 0.0, 0.1378, 0.1653 )
 	hero_give_weapon(get_hero(), WPN_PREDATOR)
	play_sound(SoundSpecs.MUS_Q4B_Win_Weapons1) --adding music for receiving weapons. cro 5/21
	show_weapon_screen(WPN_PREDATOR, 2, 2, 0)
	wait(0)
	hero_give_weapon(get_hero(), WPN_ROBO_HIVE)
	play_sound(SoundSpecs.MUS_Q4B_Win_Weapons2) --adding music for receiving weapons. cro 5/21
	show_weapon_screen(WPN_ROBO_HIVE, 2, 2, 0)
	wait(0)
	
	hero_warp(get_hero(), scene_weapons_smuggler_after_warp_vol)
	activate_cam(get_hero(), opening_view_cam)
	fade_from_black(2)
	wait(1.0)
	SAVE.Andthebeatgoeson = true --cue start of leve music.
end

activate(biggamehunterer)

if is_in_volume( get_hero(), treasure_island_puzzle_vol ) then
  if not SAVE.drink_intro_complete == true then
		--run_script( "jump_platform_1");
		--run_script( "jump_platform_2");
		--run_script( "jump_platform_3");
		--run_script( "jump_platform_4");
	end
	run_script( "ti_checkpoints");
	run_script( "ti_talwyn");
	
end   

--only initiating battlefield script if light puzzle is finished and battlefield isnt started
if SAVE.completed_light_puzzle == true then
	if not SAVE.battlefield_finished == true then
	run_script( "ti_battlefield")
	end
end


if SAVE.beach_door_opened == true then
	door_open(darkwater_beach_door)
end



--battlefield enemies

foreach_moby_in_pod(enemypod_battlefield_wave1, awareness_clear_targettypes)
foreach_moby_in_pod(enemypod_battlefield_wave2, awareness_clear_targettypes)
foreach_moby_in_pod(enemypod_battlefield_wave3, awareness_clear_targettypes)




if SAVE.drink_intro_complete == true then
trigger(platforms_to_drink_puzzle_5)
trigger(platforms_to_drink_puzzle_6)
trigger(platforms_to_drink_puzzle_7)
obviate(platforms_to_drink_puzzle_1)
obviate(platforms_to_drink_puzzle_2)
obviate(platforms_to_drink_puzzle_3)
obviate(platforms_to_drink_puzzle_4)
delete(swingshottargetgreenen1)
end

--raising last 3 platforms to darkwater treasure room

if SAVE.puzzle_stage == 1 then
trigger(darkwater_rising_platform5)
trigger(darkwater_rising_platform6)
trigger(darkwater_rising_platform1)
end

if SAVE.puzzle_stage == 2 then
trigger(darkwater_rising_platform2)
trigger(darkwater_rising_platform3)
trigger(darkwater_rising_platform4)
trigger(darkwater_rising_platform5)
trigger(darkwater_rising_platform6)
trigger(darkwater_rising_platform1)
end



if SAVE.battlefield_finished == true then
obviate(talwyn)
end

obviate(platforms_to_drink_puzzle_4)
--[[
--after you die and respawn i'm switching to Duncan's fake elevator
if SAVE.completed_treasure_island then
	SAVE.vc2_complete_elevator = true
	unobviate(caverns_elevator_temp)
	unobviate(caverns_elevator)
end
--]]

--setting ambient souls for puzzles that are complete

if not SAVE.completed_light_puzzle == true then
	if SAVE.drink_puzzle_complete_cam == true then
	activate(soul_spawner_brew_success)
	end

	if SAVE.bonus_round_active == true then
	activate(soul_spawner_organ_success)
	end
end

if SAVE.drink_help == nil then
SAVE.drink_help = 0
end

if SAVE.organ_help == nil then
SAVE.organ_help = 0
end

--resetting organ puzzle incase player loads save between completing 

if not has_valid_checkpoint() then
	--organ puzzle
	if not SAVE.completed_organ_puzzle then
	SAVE.organ_puzzle_stage = nil
	SAVE.has_spoken_to_organ_pirate = nil
	end
	
	--drink puzzle
	if not SAVE.completed_drink_puzzle == true then
	SAVE.drink_puzzle_stage = nil
	end
	
end

if SAVE.completed_drink_puzzle == true then
deactivate(drink_pirate)
end



-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------  
while true do

-- tornado help message

if hero_get_equipped( get_hero() ) == WPN_TORNADO then
helptext(L00_HELP_GPLAY_TORNADOLAUNCHER, "tornado help", 15, false, 3, false)
end

--revealing darkwater fleet

if SAVE.darkwater_fleet_revealed == nil then
	if SAVE.vc2_scene_exit_trigger == true then
		if is_in_volume(get_hero(), trig_darwater_fleet) then
		unobviate_pod(darkwater_fleet_pod)
		SAVE.darkwater_fleet_revealed = true
		end
	end
end



--------------------------------------------------------------------------------
--DOCK AREA
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--BEACH AREA
--------------------------------------------------------------------------------


--showing location text
if SAVE.treasure_island_location_text == nil then
show_location( L02_PLACE_GPLAY_DARKWATERCOVE, 6 )
SAVE.treasure_island_location_text = true
request_auto_save()
prt("request_auto_save, treasure_island script line 180")
end


if is_triggered(biggamehunterer) then
	untrigger(biggamehunterer)
	queue_scene( "scene_smuggler" )
	wait(0)
end


 
if not SAVE.beach_door_opened == true then

	if is_in_volume(get_hero(), trig_beach_door_activate) then
		if is_triggered(talking_skull_beach_door) then
			untrigger(talking_skull_beach_door)
			queue_scene("ti_beach_door_scene")
			wait(0)
			fade_to_black(.5)
			fade_from_black(2)
		end
	end
	
	if SAVE.beach_cam then
		deactivate(talking_skull_beach_door)
	end

--spawning wave 2 of beach beetles

	if beach_beetles_wave1_spawned == nil then
	
		if get_num_alive(beetles_beach_wave1) < 3 then
			unobviate_pod(beetles_beach_wave2)
			beach_beetles_wave1_spawned = true
		end
	
	end

--spawning wave 3 of beach beetles

	if beach_beetles_wave2_spawned == nil then
	
		if get_num_alive(beetles_beach_wave2) < 4 then
			unobviate_pod(beetles_beach_wave3)
			beach_beetles_wave2_spawned = true
		end
	
	end
	if beachbeetlesdead == nil then
		if get_num_alive(beetles_beach_all) < 1 then
			wait(.5)
			speak_and_wait( talking_skull_beach_door, DialogueSpecs.TI_COVE_BEETLES_DEFEATED, true )
			--wait(3)
			camera_shake(get_hero(), 6, 9, 2, .1, 9)
			door_open(darkwater_beach_door)
			SAVE.beach_door_opened = true
			request_auto_save()
			prt("request_auto_save, treasure_island script line 237")
			beachbeetlesdead = true
			checkpoint_volume(checkpoint_startdock_respawn_dooropened)
			prt("checkpoint_beachdoor_active")
		end
	end
	
end

if SAVE.beach_cam == true then
fade_from_black(2)
hero_warp(get_hero(), hero_warpvol_beach_fight)
activate_cam(get_hero(), viewcam_beach_enemies)
SAVE.beach_cam = false
request_auto_save()
prt("request_auto_save, treasure_island script line 250")
end 
--------------------------------------------------------------------------------
--HUB AREA
--------------------------------------------------------------------------------
-- spawning beetles in hub area
if beetles_hub_spawned == nil then
if SAVE.line3_played == true then
--enemy_wakeup(beetlepod_hub)
beetles_hub_spawned = true
end
end
--------------------------------------------------------------------------------
--BATTLEFIELD
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--DRINK PUZZLE
--------------------------------------------------------------------------------
--if is_in_volume(get_hero(), trig_drink_intro_scene) then
--fireslug_delete_in_volume(fireslug_delete_vol_cave);
--end

-- catapult 2 camera

if SAVE.drink_puzzle_complete_cam == true then
deactivate(drink_pirate)
end

if catapult2_cam_ready == true then
if is_in_volume(get_hero(), trig_catapult2_cam) then
activate_cam(get_hero(), cam_catapult2)
catapult2_cam_ready = false
end
end

if is_in_volume(get_hero(), trig_catapult2_cam_deactivate) then
deactivate_cam(get_hero(), cam_catapult2)
catapult2_cam_ready = false
end

if is_in_volume(get_hero(), trig_catapult2_cam_active_switch) then
catapult2_cam_ready = true
end


-- brew puzzle location text
	if SAVE.location_brew == nil then
  	if SAVE.drink_intro_complete == true then
  	show_location(L02_PLACE_GPLAY_BREWPUZZLE, 5)
  	SAVE.location_brew = true
		end
	end

	--request_auto_save()
	--prt("request_auto_save, treasure_island script line 299")

if not SAVE.drink_intro_complete == true then
	if is_in_volume(get_hero(), trig_drink_intro_scene) then
		trigger(platforms_to_drink_puzzle_5)
		trigger(platforms_to_drink_puzzle_6)
		trigger(platforms_to_drink_puzzle_7)
		obviate(platforms_to_drink_puzzle_1)
		obviate(platforms_to_drink_puzzle_2)
		obviate(platforms_to_drink_puzzle_3)
		obviate(platforms_to_drink_puzzle_4)
		delete(swingshottargetgreenen1)
		queue_scene("scene_drink_intro")
		wait(0)
		fade_to_black(0)
		fade_from_black(2)
		hero_warp(get_hero(), checkpoint_volume_drink_puzzle)
		activate_cam(get_hero(), view_cam_brewpuzzle_intro)
	end
end


-- zipline cam
if zipline_cam_active == nil then
	if is_zipping(get_hero()) then
	activate_cam(get_hero(), cam_zipline)
	zipline_cam_active = true
	end
end

if zipline_cam_active == true then
	if not is_zipping(get_hero()) then
	deactivate_cam(get_hero(), cam_zipline)
	zipline_cam_active = nil
	end
end

-- exit grindrail cam

if exit_grindrail_cam_active == nil then
	if is_in_volume(get_hero(), trig_exit_grindcam) then
		if is_grinding(get_hero()) then
		activate_cam(get_hero(), exit_grindrail_cam)
		exit_grindrail_cam_active = true
		end
	end
end

if exit_grindrail_cam_active == true then
	if is_in_volume(get_hero(), trig_exit_grindcam_deactivate) then
	deactivate_cam(get_hero(), exit_grindrail_cam)
	exit_grindrail_cam_active = nil
	end
end


--drink puzzle help message

if SAVE.drink_help >= 3 then
wait(3)
helptext(L02_HELP_GPLAY_MIXBREW, "how to brew grog", 10, false, 20)
prt("helping player with drink puzzle")
SAVE.drink_help = 0
end

--------------------------------------------------------------------------------



if SAVE.drink_puzzle_complete_cam == true then
activate_cam(get_hero(), view_cam_drink_puzzle_complete)
hero_warp(get_hero(), hero_warp_vol_drink_puzzle_complete)
SAVE.drink_puzzle_complete_cam = false
request_auto_save()
prt("request_auto_save, treasure_island script line 335")
end

--------------------------------------------------------------------------------
--LIGHT PUZZLE
--------------------------------------------------------------------------------

--lightning flash as player heads to light puzzle
if lightning_flashes_1 == nil then
	if is_in_volume(get_hero(), trig_talwyn_fly_toshadow_fromhub) then
	lightning( lightningController, trig_talwyn_fly_toshadow_fromhub)
	lightning_flashes_1 = true
	end
end

if SAVE.location_light == nil then
  if SAVE.light_intro_complete == true then
  show_location(L02_PLACE_GPLAY_SHADOWPUZZLE, 5)
  SAVE.location_light = true
	end
end

if not SAVE.light_intro_complete == true then

	if is_in_volume(get_hero(), trig_light_intro_scene) then
	queue_scene("scene_light_intro")
	wait(.5)
	fade_to_black(0)
	fade_from_black(2)
	hero_warp(get_hero(), checkpoint_volume_light_puzzle)
	activate_cam(get_hero(), view_cam_lightpuzzle_intro)
	end

end

-- camera controls

if is_in_volume(get_hero(), inner_volume_battlefield) then
if is_grappling(get_hero()) then
--set_follow_cam(get_hero(), 10, 20, 75, 6)
activate_cam(get_hero(), cam_shadow_puzzle)
prt("setting follow cam")
else
deactivate_cam(get_hero(), cam_shadow_puzzle)
--set_follow_cam(get_hero(), 10, 20, 75, 6)
end
end

if is_in_volume(get_hero(), trig_shadowpuzzle_camera) then
--set_follow_cam(get_hero(), 10, 20, 75, 6)
end

if not SAVE.completed_light_puzzle == true then 

	-- turning on fx for eyes when piece is in the right spot.
	if is_in_volume(light_piece_2, light_puzzle_eye_1) then
	activate(SmallPirateEye_Left)
	end
	
	
	if not is_in_volume(light_piece_2, light_puzzle_eye_1) then
	deactivate(SmallPirateEye_Left)
	end
	
	
	if is_in_volume(light_piece_1, light_puzzle_eye_2) then
	activate(SmallPirateEye_Right)
	end
	
	if not is_in_volume(light_piece_1, light_puzzle_eye_2) then
	deactivate(SmallPirateEye_Right)
	end

end

-- turning off ghost effect after battlefield
if curse_effect_turned_off == nil then
	if get_num_alive(enemypod_battlefield_all) < 1 then
	hotheadswarmer_kill_in_volume(outer_vol_beach_swarmers)
	curse_effect_turned_off = true
	end
end

-- turning on curse effect before drop cinematic
if SAVE.cinematic_ghost_effect_active == true then

SAVE.cinematic_ghost_effect_active = false
end


--------------------------------------------------------------------------------
--ORGAN PUZZLE
--------------------------------------------------------------------------------
--catapult camera
if is_in_volume(get_hero(), trig_camera_catapult1) then
activate_cam(get_hero(), cam_catapult1) 
end

if is_in_volume(get_hero(), trig_camera_catapult1_deactivate) then
deactivate_cam(get_hero(), cam_catapult1) 
end
--------------------------------------------------------------------------------
--killing organ puzzle skull when done
if SAVE.completed_organ_puzzle == true then
deactivate(organ_pirate)
end

--Location text for organ puzzle area
if SAVE.location_organ == nil then
  if SAVE.organ_intro_complete == true then
  show_location(L02_PLACE_GPLAY_ORGANPUZZLE, 5)
  SAVE.location_organ = true
	end
end

--triggering intro scene for first time player reaches organ

if SAVE.has_spoken_to_organ_pirate == nil then
if is_triggered(organ_pirate)  then
SAVE.has_spoken_to_organ_pirate = true
request_auto_save()
prt("request_auto_save, treasure_island script line 423")
end
end

if SAVE.organ_puzzle_success_flythrough == true then
hero_warp(get_hero(), hero_warp_vol_organ_complete)
activate_cam(get_hero(), view_cam_organ_area)
SAVE.organ_puzzle_success_flythrough = false
end


-- triggering organ intro
if not SAVE.organ_intro_complete == true then

	if is_in_volume(get_hero(), trig_organ_intro_scene) then
	queue_scene("scene_organ_intro")
	wait(0)
	fade_to_black(0)
	fade_from_black(1)
	hero_warp(get_hero(), checkpoint_volume_organ_puzzle )
	activate_cam(get_hero(), view_cam_organ_area_intro)
	unobviate_pod(beetle_pod_organ_puzzle)
	end


end





-- organ puzzle help message
if SAVE.organ_help >= 3 then
wait(3)
prt("helping player with drink puzzle")
helptext(L02_HELP_GPLAY_PLAYORGAN, "how to play organ", 10, false, 10)
SAVE.organ_help = 0
end

-- removing glow slug from bat cave
if fireslug_deleted == nil then
	if is_in_volume(get_hero(), trig_drink_intro_scene) then
	fireslug_delete_in_volume(fireslug_delete_vol_cave)
	fireslug_deleted = true
	end
end

if fireslug_deleted == true then
	if not is_in_volume(get_hero(), trig_drink_intro_scene) then
	fireslug_delete_in_volume(fireslug_delete_vol_cave)
	fireslug_deleted = nil
	end
end

-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--special cameras
--platforming cam 1
if platforming_cam1 == nil then
if is_in_volume(get_hero(), trig_platforming_cam1) then
set_follow_cam(get_hero(),6.8, 16, 75, 1.85 )
prt("platforming cam 1 set")
platforming_cam1 = true
end
end

if platforming_cam1 == true then
if not is_in_volume(get_hero(), trig_platforming_cam1) then
prt("platforming cam 1 reset")
reset_follow_cam(get_hero())
platforming_cam1 = nil
end
end

--platforming cam 2
if platforming_cam2 == nil then
if is_in_volume(get_hero(), trig_platforming_cam2) then
set_follow_cam(get_hero(),6.8, 16, 75, 1.85 )
prt("platforming cam 1 set")
platforming_cam1 = true
end
end

if platforming_cam2 == true then
if is_in_volume(get_hero(), trig_talwyn_fly_tobrew_fromhub) then
prt("platforming cam 1 reset")
reset_follow_cam(get_hero())
platforming_cam2 = nil
end
end
--platforming cam 3
if platforming_cam3 == nil then
if is_in_volume(get_hero(), trig_platforming_cam3) then
set_follow_cam(get_hero(),6.8, 16, 75, 1.85 )
prt("platforming cam 1 set")
platforming_cam3 = true
end
end

if platforming_cam3 == true then
if not is_in_volume(get_hero(), trig_platforming_cam3) then
prt("platforming cam 1 reset")
reset_follow_cam(get_hero())
platforming_cam3 = nil
end
end

--platforming cam 4
if platforming_cam4 == nil then
if is_in_volume(get_hero(), trig_platforming_cam4) then
set_follow_cam(get_hero(),6.8, 16, 75, 1.85 )
prt("platforming cam 4 set")
platforming_cam4 = true
end
end

if platforming_cam4 == true then
if not is_in_volume(get_hero(), trig_platforming_cam4) then
prt("platforming cam 4 reset")
reset_follow_cam(get_hero())
platforming_cam4 = nil
end
end

--platforming cam 5
if platforming_cam3 == nil then
if is_in_volume(get_hero(), trig_platforming_cam5) then
set_follow_cam(get_hero(),6.8, 16, 75, 1.85 )
prt("platforming cam 5 set")
platforming_cam5 = true
end
end

if platforming_cam5 == true then
if not is_in_volume(get_hero(), trig_platforming_cam5) then
prt("platforming cam 5 reset")
reset_follow_cam(get_hero())
platforming_cam5 = nil
end
end

--platforming cam 6
if platforming_cam3 == nil then
if is_in_volume(get_hero(), trig_platforming_cam6) then
set_follow_cam(get_hero(),6.8, 16, 75, 1.85 )
prt("platforming cam 6 set")
platforming_cam6 = true
end
end

if platforming_cam6 == true then
if not is_in_volume(get_hero(), trig_platforming_cam6) then
prt("platforming cam 6 reset")
reset_follow_cam(get_hero())
platforming_cam6 = nil
end
end


--battlefield cam
if SAVE.its_a_trap == true then

	if battlefield_cam == nil then
	if is_in_volume(get_hero(), trig_battlefield_cam) then
	set_follow_cam( get_hero(), 8.52, 10, 0, 1.85 )
	prt("battlefield cam set")
	battlefield_cam = true
	end
	end
	
end

if SAVE.battlefield_finished == true then
if battlefield_cam_reset == nil then
reset_follow_cam(get_hero())
battlefield_cam_reset = true
end
end


wait()  
end


