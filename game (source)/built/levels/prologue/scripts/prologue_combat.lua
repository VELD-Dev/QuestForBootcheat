----------------------------------------------------------------------------------------------------
-- prologue combat script
----------------------------------------------------------------------------------------------------

run_script("prologue_combat_ship2");
run_script("prologue_dialogue");
--run_script("prologue_talwyn_hover");

obviate_pod(explosiveBarrels)
--obviate_pod(roofjumppirates_group1)
--obviate_pod(roofjumppirates_group2)
--obviate_pod(roofjumppirates_group3)
obviate(hunchback_pirate)
--obviate_pod(barge7_tempshooters)
obviate(TurretPirate2)
obviate(barge7)
obviate_pod(roof_pirates_shielded)
obviate_pod(barge7_explosivebarrels)
obviate_pod(barge7_movepod)
obviate_pod(dropship1_pod)

--turning interior shooter pirates invulnerable, so player can't nuke them through the wall.  reversed on boltcrank, line 295
health_set_invulnerability  (pirate_shooter_1, true);
health_set_invulnerability  (pirate_shooter_2, true);
health_set_invulnerability  (pirate_shooter_3, true);
--obviate(TurretPirate)

activate( sway_ctrl ) 
activate( lightning_flash_control1 )
activate( lightning_flash_control2 )

activate( moving_rocks_controller_small_right)
activate( moving_rocks_controller_medium_right)
activate( moving_rocks_controller_large_right)

if SAVE.gamestart == nil then
--fade_from_black(2.5)
end

foreach_moby_in_pod(pirates_all, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_FALL_TO_DEATH)
foreach_moby_in_pod(barge7_movepod, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_FALL_TO_DEATH)

ally_setcollisionignore(talwyn, get_hero());

--------------------------------------------------------------------------------
--------------------------------- MAIN LOOP ------------------------------------
--------------------------------------------------------------------------------

while true do


-- turning on ladder fx for ladder 1
if ladder1_fx_on == nil then
	if is_in_volume(get_hero(), trig_turret_wake) then
	activate(LadderFlash8)
	wait(.25)
	activate(LadderFlash7)
	wait(.25)
	activate(LadderFlash6)
	ladder1_fx_on = true
	end
end


-- turning on ladder fx for ladder 2
if ladder2_fx_on == nil then
	if is_in_volume(get_hero(), trig_wakeup_ship2_rearshooter) then
	activate(LadderFlash2)
	wait(.25)
	activate(LadderFlash1)
	wait(.25)
	activate(LadderFlash)
	ladder2_fx_on = true
	end
end


if weather_active == nil then
	if has_cinematic_played("l00_s02_caught_rt") then
	prt("player skipped cinematic...starting weather")
  resume_weather()
 	weather_active = true
	end
end

--talwyn follows ratchet to ship2

if talwynonship2 == nil then
  if is_in_volume(get_hero(),trig_talwyn_flytoship2) then
    if SAVE.prologue_location_shown == nil then
	   show_location(L02_PLACE_GPLAY_AZOREANSEA, 6)
	   SAVE.prologue_location_shown = true
	   request_auto_save()
    end 
		
    ratchet_fling(get_hero(), flingpadJumppath, piratejumpvolume_1, 20.0, 10.0, 5.0, 5.0, 6.0)
    activate_cam(get_hero(), introcam)
    ally_followpathhover(talwyn, talwynpath_hovertoship2, 10, 10, 30)

    --ally_setattitude(talwyn,1)
    --ally_addtarget(talwyn, pirates_on_poopdeck)
    --ally_setfirepoints(talwyn, fp_talwyn_stage1)
    talwynonship2 = true;
  end
end

--talwyn attacks pirates when ratchet wakes them up
if talwyn_attack_first_pirates == nil then
	if is_in_volume(get_hero(), innervolume_first2pirates1) or was_damaged ( enemy_pod_first2_pirates, 2,  get_hero()) then
	ally_setattitude(talwyn,1)
	ally_addtarget(talwyn, pirates_on_poopdeck)
	ally_setfirepoints(talwyn, fp_talwyn_stage1)
	talwyn_attack_first_pirates = true
	end
end

--removing targets from talwyn once first set of pirates is dead
if first_pirate_group_dead == nil then
	if get_num_alive(enemy_wave1) < 1 then
	first_pirate_group_dead = true
	end
end

set_follow_cam(get_hero(), 5, 4, 75, 1.5)


--turning off intro cam
if introcamoff == nil then
	if is_in_volume(get_hero(), innervolume_first2pirates) then
	wait(1)

	deactivate_cam(get_hero(), introcam)
	introcamoff = true
	end
end

--------------------------------------------------------------------------------
-- combat start
--------------------------------------------------------------------------------

--waking up pirate 3 of wave1

if pirate3_wave1_awake == nil then
if is_in_volume(get_hero(), innervolume_wave1b) then
	enemy_wakeup(meleepirate_wave1_enemy3)
	pirate3_wave1_awake = true
end

end

if pirate3_wave1_awake == nil then
	if get_num_alive(enemy_wave1) < 3 then
	enemy_wakeup(meleepirate_wave1_enemy3)
	pirate3_wave1_alwake = true
	end
end


--------------------------------------------------------------------------------
--triggering volume wakes up group 2 also

if enemywave2awake == nil then
	if is_in_volume(get_hero(), wakeupvolume_wave2) then
	enemy_wakeup(enemy_wave2)
	enemywave2awake = true
	end
end
-- talwyn moves to midship
if talwyn_at_midship == nil then
if is_in_volume(get_hero(), trig_tal_move_to_middledeck) then
	ally_followpathhover(talwyn, tal_followpath_to_shipcenter, 10, 10, 20)
	ally_setattitude(talwyn,1)
	ally_addtarget(talwyn, pirates_middeck_ship1)
	ally_clearfirepoints(talwyn)
	talwyn_at_midship = true
end
end

--triggering volume wakes up group 3 also

if enemywave3awake == nil then
	if is_in_volume(get_hero(), wakeupvolume_wave3) then
	enemy_wakeup(enemy_wave3)
	enemywave3awake = true
	end
end

--------------------------------------------------------------------------------

--waking up roof jump pirates, wave 1

if roofjumppirates1awake == nil then
	if get_num_alive(enemy_wave3) < 2 then
		--enemy_sendmsg_jump(roofjumppirates_group1)
		enemy_sendmsg_jump(roofjumppirate_wave1_enemy3)
		wait(.5)
		enemy_wakeup(roofjumppirate_wave1_enemy3)
		enemy_sendmsg_jump(roofjumppirate_wave1_enemy1)
		wait(.5)
		enemy_wakeup(roofjumppirate_wave1_enemy1)
		--enemy_wakeup(roofjumppirates_group1)
		ally_addtarget(talwyn, roofjumppirates_group1)
		roofjumppirate1sawake = true
	end
end




--waking up roof jump pirates, wave 2 and 3

if roofjumppirates2awake == nil then
	if get_num_alive(roofjumppirates_group1) < 2 then
		--enemy_sendmsg_jump(roofjumppirates_group2)
		enemy_sendmsg_jump(roofjumppirate_wave1_enemy4)
		wait(.5)
		enemy_wakeup(roofjumppirate_wave1_enemy4)
		enemy_sendmsg_jump(roofjumppirate_wave1_enemy5)
		wait(.5)
		enemy_wakeup(roofjumppirate_wave1_enemy5)
		--enemy_wakeup(roofjumppirates_group2)
			ally_addtarget(talwyn, roofjumppirates_group2)
		roofjumppirates2awake = true
	end
end

--waking up roof jump pirates, wave 3

if roofjumppirates3awake == nil then
	if get_num_alive(roofjumppirates_group2) < 2 then
	  --enemy_sendmsg_jump(roofjumppirates_group3)
	  enemy_sendmsg_jump(roofjumppirate_wave1_enemy7)
	  wait(.5)
	  enemy_wakeup(roofjumppirate_wave1_enemy7)
	  enemy_sendmsg_jump(roofjumppirate_wave1_enemy9)
	  wait(.5)
	  enemy_wakeup(roofjumppirate_wave1_enemy9)
	  enemy_sendmsg_jump(roofjumppirate_wave1_enemy6)
	  wait(.5)
	  enemy_wakeup(roofjumppirate_wave1_enemy6)
	  enemy_sendmsg_jump(roofjumppirate_wave1_enemy2)
	  wait(.5)
	  enemy_wakeup(roofjumppirate_wave1_enemy2)
		--enemy_wakeup(roofjumppirates_group3)
		ally_addtarget(talwyn, roofjumppirates_group3)
		roofjumppirates3awake = true
	end
end

--------------------------------------------------------------------------------

--talwyn moves towards boltcrank part of ship deck
if talwyn_to_middledeck == nil then
	if is_in_volume(get_hero(), wakeupvolume_wave3) then
		ally_followpathhover(talwyn, talwyn_flypath_middledeck, 10, 10, 20)
		ally_setattitude(talwyn,1)
		ally_addtarget(talwyn, pirates_on_poopdeck)
		ally_clearfirepoints(talwyn)
		ally_setfirepoints(talwyn, fp_talwyn_stage1b)
		talwyn_to_middledeck = true
	end
end

--talwyn stops shooting group 1 pirates when they are dead
if talwynkilledgroup1 == nil then
	if get_num_alive(pirates_on_poopdeck) < 1 then
		ally_cleartargets(talwyn)
		talwynkilledgroup1 = true
	end
end

--talwyn stops shooting interior pirates when they are dead

if talwynkilledgroup2 == nil then
	if get_num_alive(pirates_interior) < 1 then
	ally_cleartargets(talwyn)
	talwynkilledgroup2 = true
	end
end
--------------------------------------------------------------------------------

--boltcrank door triggered

if boltcrankdoorstarted == nil then
	if crank_is_in_use(boltcrank1) then
		ally_followpathhover(talwyn, talwyn_flypath2, 10, 10, 5)
		ally_clearfirepoints(talwyn)
		ally_setfirepoints(talwyn, fp_talwyn_stage2)
		boltcrankdoorstarted = true
	end
end

--boltcrank opens door

if boltcrankdooropen == nil then
	if crank_is_complete(boltcrank1) then
		ally_cleartargets(talwyn)
		ally_addtarget(talwyn, pirates_interior)
		ally_clearfirepoints(talwyn)
		ally_setfirepoints(talwyn, fp_talwyn_stage2)
		health_set_invulnerability  (pirate_shooter_1, false)
		health_set_invulnerability  (pirate_shooter_2, false)
		health_set_invulnerability  (pirate_shooter_3, false)
		enemy_wakeup(pirate_shooter_1)
		boltcrankdooropen = true
	end
end



--waking up second and third pirate shooter
if shooter2and3awake == nil then
	if crank_is_complete(boltcrank1) then
		if is_in_volume(get_hero(), trig_intro_shooter2and3) then
			door_open(boltcrank_door2)
			door_open(boltcrank_door3)
			enemy_wakeup(pirate_shooter_2)
			enemy_wakeup(pirate_shooter_3)
			shooter2and3awake = true
		end
	end
end


--closing doors when pirates enter room
if boltcrankdoor2_obviated == nil then
	if is_in_volume(pirate_shooter_2, trig_door2close) then
		door_close(boltcrank_door2)
		boltcrankdoor2_obviated = true
	end
end

if boltcrankdoor3_obviated == nil then
	if is_in_volume(pirate_shooter_3, trig_door3close) then
		door_close(boltcrank_door3)
		boltcrankdoor3_obviated = true
	end
end


--backup script opens door after a certain amount of time
if crank_is_complete(boltcrank1) and boltcrank1_timer == nil then
	boltcrank1_timer = get_current_time();
end

--opening rear door when enemies are dead
if ship1_rear_door_open == nil then

	if (boltcrank1_timer ~= nil) and ((get_current_time() - boltcrank1_timer) > 25) then
		door_open(boltcrank_door1)
		ship1_rear_door_open = true
	end

	if get_num_alive(pirates_interior) < 1 then
		door_open(boltcrank_door1)
		ship1_rear_door_open = true
	end
	
end

--talwyn moves to interior of ship

if talwynmoveinside == nil then
	if is_in_volume(get_hero(), trig_door2and3_closetrigger) then
	ally_followpath(talwyn, talwyn_followpath_interior, true, true)
	ally_setattitude(talwyn,1)
	--ally_cleartargets(talwyn)
	
	ally_clearfirepoints(talwyn)
	ally_setfirepoints(talwyn, fp_talwyn_interior)
	talwynmoveinside = true
	end
end

--hiding lanterns on the interior ship

if lanternshid == nil then
	if is_in_area(get_hero(), area_hide_interiorlanterns) then
		obviate_pod(pirate_lanterns_indoor)
		lanternshid = true
	end
end

if lanternshid == true then
	if not is_in_area(get_hero(), area_hide_interiorlanterns) then
		unobviate_pod(pirate_lanterns_indoor)
		lanternshid = nil
	end
end



--------------------------------------------------------------------------------
--triggering talwyn onto back deck

if talwynatladder == nil then
	if is_in_area(get_hero(), trig_barge7_area) then
	ally_clearfirepoints(talwyn)
	ally_cleartargets(talwyn)
	ally_clearfirepoints(talwyn)
	ally_followpathhover(talwyn, talwyn_flypath_toladder, 10, 10, 10)
	ally_addtarget(talwyn, barge7_movepod)
	talwynatladder = true
	end
end


--removing talwyn targets when barge is out of range

if barge7_out_of_range == nil then
	if is_in_volume(barge7, trig_tal_stopshooting_barge7) then
	ally_cleartargets(talwyn)
	barge7_out_of_range = true
	end
end
--triggering talwyn to fly to catapult

if talwynatship1 == nil then
	if is_in_volume(talwyn, trig_talwyn_speak_ladder) then
		if is_in_volume(get_hero(), trig_talwyn_fly_to_cataplut1) then
			--if not is_in_volume(barge7, trig_check_barge7) then
			ally_clearfirepoints(talwyn)
			ally_cleartargets(talwyn)
			ally_addtarget(talwyn, hunchback_pirate)
			ally_followpathhover(talwyn, tal_hoverpath_tofirstcatapult, 10, 10, 15)
			wait(2)
			speak(talwyn, DialogueSpecs.PL_TAL_CATAPULT_1)
			talwyn_waiting_to_fly_to_ship2 = true
		  talwynatship1 = true
			--end
		end
	end
end

if talwyn_waiting_to_fly_to_ship2 == true then
if not is_in_volume(talwyn, trig_talwyn_speak_ladder) then
talwynatship1 = true
end
end

--triggering talwyn to fly to ship 2

if is_in_volume(get_hero(), trig_catapult1_camera) then
wait(1)
ally_clearfirepoints(talwyn)
ally_cleartargets(talwyn)
ally_followpathhover(talwyn, talwyn_flypath_toship1, 10, 10, 15)
end
	
--triggering barge7

if barge7active == nil then
	if is_in_area(get_hero(), trig_barge7_area) then
		unobviate(barge7)
		unobviate_pod(barge7_explosivebarrels)
		unobviate_pod(barge7_movepod)
		obviate(barge14)
		activate(barge7)
		barge7active = true
	end
end

if is_in_volume(get_hero(), trig_shooters_fly_away) then
activate(barge7)
end

--waking up barge pirates

if is_in_volume(barge7, trig_barge7_tempshooters) then
	wait(1)
	enemy_wakeup(barge7_movepod)
end


--removing barge when enemies are dead

if barge7active == true then
	if get_num_alive(barge7_movepod) < 1 then
	activate(barge7)
	end
end


--lightning flash when hunchback pirate is woken up
if designer_lighning_1 == nil then
if is_in_volume(get_hero(), innervolume_hunchbackpirate) then
lightning( lightning_flash_control2, lightning_flashvolume1 )
designer_lighning_1 = true
end
end

wait()
end

