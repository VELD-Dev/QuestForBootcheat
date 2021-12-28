
--hero_give_weapon(get_hero(), WPN_COMBUSTER, 0)
--hero_give_weapon(get_hero(), WPN_GRENADE, 0)
--hero_give_weapon(get_hero(), WPN_TORNADO, 0)
--hero_give_weapon(get_hero(), WPN_RAVAGER, 0)
hero_heal(get_hero())


obviate(darkwater_rising_platform1)
obviate(darkwater_rising_platform2)
obviate(darkwater_rising_platform3)
obviate(darkwater_rising_platform4)
obviate(darkwater_rising_platform5)
obviate(darkwater_rising_platform6)
obviate(darkwater_rising_platform7)

obviate(light_piece_1)
obviate(light_piece_2)
obviate(light_piece_3)
obviate(light_piece_0)
obviate(light_pirate)
obviate_pod(shadow_puzzle_pod2)


unobviate_pod(battlefield_health)

hero_warp(get_hero(), hero_warp_vol_battlefield_start)

--talwyn battlefield start
ally_warp(talwyn, tal_warp_vol_battlefield_start)
ally_cleartargets(talwyn)
ally_setattitude(talwyn, 1)
ally_addtarget(talwyn, enemypod_battlefield_all)
ally_setfirepoints(talwyn, fp_talwyn_battlefield)

request_auto_save()
prt("request_auto_save, ti_battlefield script line 37")
checkpoint_volume(hero_warp_vol_battlefield_start)
prt("battlefield_checkpoint_active")

unobviate_pod(battlefield_ammo_spawners)

deactivate(soul_spawner_brew_success)
deactivate(soul_spawner_organ_success)
deactivate(Eye_Flashes)
deactivate(Eye_Flashes1)
deactivate(SmallPirateEye_Left)
deactivate(SmallPirateEye_Right)
obviate(shadow_puzzle_eyes2)
obviate(shadow_puzzle_eyes3)
deactivate(Eye_Flashes)
deactivate(Eye_Flashes1)
deactivate(SmallPirateEye_Left)
deactivate(SmallPirateEye_Right)


run_script("jump_platform_2")
--------------------------------------------------------------------------------
--MAIN LOOP
--------------------------------------------------------------------------------



while not SAVE.battlefield_finished == true do

	if not is_in_volume(hothead_pirate, battlefield_hothead_check_vol) then
	damage(hothead_pirate, 200)
	end
	
	if not is_in_volume(hothead_pirate1, battlefield_hothead_check_vol) then
	damage(hothead_pirate1, 200)
	end
	
	if not is_in_volume(hothead_pirate2, battlefield_hothead_check_vol) then
	damage(hothead_pirate2, 200)
	end
	
	if not is_in_volume(hothead_pirate3, battlefield_hothead_check_vol) then
	damage(hothead_pirate3, 200)
	end




	if SAVE.its_a_trap == nil then
	speak(talwyn, DialogueSpecs.TI_SHADOW_TRAP)
	SAVE.its_a_trap = true
	end

	spawner_spawn( battlefield_ammo_spawner1, ART_CLASS_AMMO_CRATE )
	spawner_spawn( battlefield_ammo_spawner2, ART_CLASS_AMMO_CRATE )
	spawner_spawn( battlefield_ammo_spawner3, ART_CLASS_AMMO_CRATE )

	if battlefieldstarted == nil then
	activate(battlefield_ghost_effect)
	wait(.5)
	update_on(enemy_battlefield_pirate2)
	update_on(enemy_battlefield_pirate1)
	enemy_wakeup(enemy_battlefield_pirate2)
	enemy_wakeup(enemy_battlefield_pirate1)
	foreach_moby_in_pod(battlefield_first_two_pirates, enemy_sendmsg_command,ENEMY_COMMAND_INTRO)
	foreach_moby_in_pod(battlefield_first_two_pirates, awareness_add_targettype, TRG.TT_HERO)
	
	wait(1)
		if get_num_alive(battlefield_first_two_pirates) < 1 then
		foreach_moby_in_pod(enemypod_battlefield_wave1, enemy_sendmsg_command,ENEMY_COMMAND_INTRO)
		foreach_moby_in_pod(enemypod_battlefield_wave1, awareness_add_targettype, TRG.TT_HERO)
		battlefieldstarted = true
		end

	end

--melee pirates wave 2
		if battlefieldwave3_spawned == nil then
		
			if get_num_alive(enemypod_battlefield_wave1) < 4 then
			
			foreach_moby_in_pod(enemypod_battlefield_wave2, enemy_sendmsg_command,ENEMY_COMMAND_INTRO)
			foreach_moby_in_pod(enemypod_battlefield_wave2, awareness_add_targettype, TRG.TT_HERO)
			
			battlefieldwave3_spawned = true
			
			end
		
		end

--hothead wave
		if battlefield_hothead_wave1_spawned == nil then
		
			if get_num_alive(enemypod_battlefield_wave2) < 4 then
			unobviate_pod(enemypod_battlefield_hothead_wave1)
			battlefield_hothead_wave1_spawned = true
			end
		
		end

--melee wave 3
	if battlefield_melee_wave3_spawned == nil then
	
		if get_num_alive(enemypod_battlefield_hothead_wave1) < 2 then
		foreach_moby_in_pod(enemypod_battlefield_wave3, enemy_sendmsg_command,ENEMY_COMMAND_INTRO)
		foreach_moby_in_pod(enemypod_battlefield_wave3, awareness_add_targettype, TRG.TT_HERO)
		
		wait(3)
		
		--hothead wave 2
			if get_num_alive(enemypod_battlefield_hothead_wave1) < 1 then
			unobviate_pod(enemypod_battlefield_hothead_wave2)
			battlefield_melee_wave3_spawned = true
			end
	
		end

	end
	
-- spawning walkers

if walker1_revealed == nil then
	if get_num_alive(enemypod_battlefield_hothead_wave2) < 1 then
		--if not is_alive(hothead_pirate2) then
		if not is_in_area(get_hero(), area_walker_no_spawn) then
		unobviate(ti_battlefield_skullwalker)
		walker1_revealed = true
		end
	end
end

--[[
if walker2_revealed == nil then
	if not is_alive(hothead_pirate3)then
	unobviate(ti_battlefield_skullwalker1)
	walker2_revealed = true
	end
end
--]]

if get_num_alive(enemypod_battlefield_all) < 1 then
  
  timed_uncurse(battlefield_ghost_effect, 2)
  wait(3)
  timed_curse(battlefield_ghost_effect, 25)
  queue_scene("scene_battlefield_success", __pod_handle_invalid, __pod_handle_invalid, __volume_handle_invalid, CINE_FADE_BLACK, CINE_FADE_BLACK, CINE_FADE_NONE, CINE_FADE_NONE )
  wait(0)
--  fade_to_black(0)
--  fade_from_black(1)
  queue_cinematic("l03_s09_dropp_rt_rt", cinematic_treasureroom_hide_objects)
  wait(0)
  deactivate(battlefield_ghost_effect)
  hero_heal(get_hero())
  hero_warp(get_hero(), vc2_teleport_vol)
  SAVE.battlefield_finished = true
  request_auto_save()
  prt("request_auto_save, ti_battlefield script line 129")

end


wait()
end
	
