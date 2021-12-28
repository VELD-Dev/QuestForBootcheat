----------------------------------------------------------------------------------------------------
-- Ship2 Combat Script
----------------------------------------------------------------------------------------------------
obviate_pod(enemypod_turretfodder_barge2_pirates)
obviate(enemy_ship2_turret2)





--------------------------------------------------------------------------------
-- MAIN LOOP
--------------------------------------------------------------------------------


while true do
--checkpoint on ship 2
if checkpointactive == nil then
if is_in_volume(get_hero(), innervol_ship2_shooter_g1) then
checkpoint_volume(catapult_landvolume)
SAVE.gamestart = true
checkpointactive = true
end
end

--talywn flies in circles
if talwyn_followpath_circle_turret1 == true then
ally_followpathhover(talwyn, path_circle_turret1, 10, 10, 12, false)
end

if talwyn_followpath_circle_turret2 == true then
ally_followpathhover(talwyn, path_circle_turret2, 10, 10, 10, false)
end


--making talwyn fight turret1
if talwyn_ship2_fightturret1 == nil then
if is_in_volume(get_hero(), innervol_ship2_shooter_g1) then
ally_warp(talwyn, hovervol_group1_vol2)
ally_clearfirepoints(talwyn)
ally_cleartargets(talwyn)
ally_setattitude(talwyn,1)
ally_addtarget(talwyn, enemypod_ship2_firstturret, true)
ally_hover_takeoff(talwyn)
--talwyn_followpath_circle_turret1 = true
ally_setfirepoints(talwyn, fp_tal_ship2_firstturret)
ally_setdamageamount(talwyn, 0)
awareness_remove_targettype (enemy_ship2_turret1, TRG.TT_HERO)
talwyn_ship2_fightturret1 = true
end
end

--making turret guy target ratchet if he gets close
if turret1_aware_hero == nil then
if is_in_volume(get_hero(), innervol_ship2_turret1) then
awareness_add_targettype (enemy_ship2_turret1, TRG.TT_HERO)
turret1_aware_hero = true
end
end

--waking up first 2 shooter pirates

if ship2_shooter_g1_awake == nil then
	if get_num_alive(enemypod_ship2_meleepirate1) < 1 then
	wait(2)
	enemy_wakeup(enemypod_ship2_shooter_g1)
	ship2_shooter_g1_awake = true
	end
end

if ship2_shooter_g1_awake == nil then
if is_in_volume(get_hero(), outervol_ship2_turret1) then
enemy_wakeup(enemypod_ship2_shooter_g1)
ship2_shooter_g1_awake = true
end
end

-- moving talwyn to breakable door if turret 1 dies
if talwyn_at_explodey_door == nil then
if not is_alive(enemy_ship2_turret1) then
talwyn_followpath_circle_turret1 = false
ally_clearfirepoints(talwyn)
ally_followpathhover(talwyn, tal_hoverpath_ship2_to_turret2, 10, 10, 30, false)
ally_setfirepoints(talwyn, fp_tal_ship2_secondturret)
talwyn_at_explodey_door = true
end
end


--waking up turret 2
if turret2_awake == nil then
if not is_update_on( boltcrank_door4 ) then
turret_door_help_played = true
awareness_remove_targettype (enemy_ship2_turret2, TRG.TT_HERO)
awareness_add_targettype (enemy_ship2_turret1, TRG.TT_ALLY)
awareness_remove_targettype (pirate_ship2_shootersafterturretdoor_shooter1, TRG.TT_ALLY)
awareness_remove_targettype (pirate_ship2_shootersafterturretdoor_shooter2, TRG.TT_ALLY)
ally_clearfirepoints(talwyn)
ally_cleartargets(talwyn)
ally_setattitude(talwyn,1)
ally_addtarget(talwyn, enemypod_ship2_interior, true)
--talwyn_followpath_circle_turret2 = true
ally_setfirepoints(talwyn, fp_tal_ship2_secondturret)
enemy_wakeup(enemypod_cannonfodderpirates)
awareness_remove_targettype (enemy_ship2_turret2, TRG.TT_HERO)
announce(DialogueSpecs.PL_TAL_ALERT_3)
unobviate(enemy_ship2_turret2)
enemy_wakeup(enemy_ship2_turret2)
awareness_add_targettype (pirate_ship2_shootersafterturretdoor_shooter1, TRG.TT_ALLY)
awareness_add_targettype (pirate_ship2_shootersafterturretdoor_shooter2, TRG.TT_ALLY)
turret2_awake = true
end
end

if turret_door_help_played == true then
	if turret2_aware_hero == nil then
	awareness_remove_targettype (enemy_ship2_turret2, TRG.TT_HERO)
	end
end

-- adding ratchet as target to turret 2
if turret2_aware_hero == nil then
if is_in_volume(get_hero(), trig_turret2_hero_aware) then
awareness_add_targettype (enemy_ship2_turret2, TRG.TT_HERO)
turret2_aware_hero = true
end
end

--talwyn lands and moves inside room with turret

if talwyn_inside_ship2 == nil then
	if not is_alive(enemy_ship2_turret2) then
	talwyn_followpath_circle_turret2 = false
	wait(2)
		--if is_in_volume(get_hero(), innervol_ship2_shooter) then
		ally_followpathhover(talwyn, path_ship2_interior, 10, 10, 12, true)
		--end
		talwyn_inside_ship2 = true
	end
end

if is_in_volume(talwyn, innervol_ship2_shooter3) then
   talwyn_inside_ship2 = true
end

--spawnging turret fodder barge 1
if turretfodderbarge1active == nil then
	if not is_alive(enemy_ship2_turret1) then
	activate(barge_ship2_turretfodder_shooters)
	enemy_wakeup(enemypod_turretfodder_barge_pirates)
	ally_setdamageamount(talwyn, 1)
	ally_addtarget(talwyn,enemypod_turretfodder_barge_pirates)
	turretfodderbarge1active = true
	end
end


--making barge with shooters leave when dead 

if turretfodderbargeleft == nil then
if get_num_alive(enemypod_turretfodder_barge_pirates) < 1 then
activate(barge_ship2_turretfodder_shooters)
wait(1.5)
	if is_update_on( boltcrank_door4 ) then
	announce_and_wait(DialogueSpecs.PL_TAL_BLAST_DOOR)
	end
turretfodderbargeleft = true
talwyn_hover_group1 = false
end
end

--making turret fodder barge 2 leave
if turretfodder_barge8_active == nil then
	if not is_alive(pirate_robot3) and not is_alive(pirate_robot4) and not is_alive(pirate_robot5) then
		if not is_in_volume(get_hero(), barge8_hero_check_vol) then
		activate(barge8)
		turretfodder_barge8_active = true
		end
	end
end

--talwyn moves to back deck
	if is_in_volume(get_hero(), trig_wakeup_ship2_rearshooter) then
	
		if talwyn_at_backdeck_ship2 == nil then
			if not is_update_on(boltcrank_door7) then
			ally_followpath(talwyn, talpath_backdeck_door7, true, false)
			prt("boltcrank_door7_open")
			talwyn_at_backdeck_ship2 = true
			end
		end
		
		if talwyn_at_backdeck_ship2 == nil then
			if not is_update_on(boltcrank_door5) then
			ally_followpath(talwyn, talpath_backdeck_door5, true, false)
			prt("boltcrank_door5_open")
			talwyn_at_backdeck_ship2 = true
			end
		end
		
		if talwyn_at_backdeck_ship2 == nil then
			if not is_update_on(boltcrank_door6) then
			ally_followpath(talwyn, talpath_backdeck_door6, true, false)
			prt("boltcrank_door6_open")
			talwyn_at_backdeck_ship2 = true
			end
		end
		
	ally_addtarget(talwyn, enemy_ship2_shooter3)
	ally_clearfirepoints(talwyn)
	end

	
--waking up fodder pirates at turret 2
if turretfodderbarge2awake == nil then
if not is_update_on(boltcrank_door5) then
unobviate_pod(enemypod_turretfodder_barge2_pirates)
turretfodderbarge2awake = true
end
end

--waking up shooter at rear deck if door is broken
if ship2_rear_shooter_awake == nil then
if not is_update_on( boltcrank_door7 ) then
enemy_wakeup(enemy_ship2_shooter3)
ship2_rear_shooter_awake = true
end
end

--waking up shooter at rear deck if player enters volume
if ship2_rear_shooter_awake == nil then
if is_in_volume(get_hero(), trig_wakeup_ship2_rearshooter) then
enemy_wakeup(enemy_ship2_shooter3)
ship2_rear_shooter_awake = true
end
end

--talwyn flies to catapult 2
if tal_hover_to_final_catapult == nil then
	if is_in_volume(get_hero(), innervol_ship2_roofshooters) then
	ally_followpathhover(talwyn, tal_hoverpath_to_catapult2, 10, 10, 35, true)
  ally_addtarget(talwyn, enemypod_roofpirates_ship2)
	tal_hover_to_final_catapult = true
	end
end

--killing roof pirates that fall off roof
if not is_in_volume(enemy_ship2_roofshooters_p1,trig_kill_roof_pirates) then
damage(enemy_ship2_roofshooters_p1,300)
end

if not is_in_volume(enemy_ship2_roofshooters_p2,trig_kill_roof_pirates) then
damage(enemy_ship2_roofshooters_p2,300)
end

wait()
end
