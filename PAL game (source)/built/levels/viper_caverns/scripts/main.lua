----------------------------------------------------------------------------------------------------
-- Gameplay Script 
----------------------------------------------------------------------------------------------------

-- This script is loaded for VIPER CAVERS when the player enters that area.
-- This script is responsible for handling the progression and combat logic
-- for viper caverns.  It should set the SAVE.completed_viper_cavern variable 
-- to true when the segment is successfully completed.

fade_to_black(0)
--!!DEBUG!!TAKE THIS OUT BEFORE FINAL BUILD!!-------
if SAVE.vc_start_on_taxi == nil then
SAVE.vc_start_on_taxi = true
end 
----------------------------------------------------

if not SAVE.vc_escape_start == true then
ally_equipitem(rustypete, ALLY_ITEM_SLAGSHEAD)
deactivate(vc_undeadeffect)
end

ally_unequipitem(tal, ALLY_ITEM_GUN);
ally_setcollisionignore(tal, get_hero());
bangle_off(slag_on_throne, 1, false);
ally_setcollisionignore(rustypete, get_hero())
cinematic_tal_trapped = false
peteatviperpassdoor = false
vc_cursestarted = false

--hiding arena pirates
obviate_pod(vc_arenapirates_group1)
obviate_pod(vc_arenapirates_group2)
obviate_pod(vc_arenapirates_group3)
obviate_pod(vc_arenapirates_group4)
obviate_pod(vc_arenapirates_group5)
obviate_pod(vc_escape_pirates_group2)
obviate_pod(dead_pirates_combatgroup)
--obviate(vc_enemy_viper2b)
update_off(cave_viper)
obviate_pod(cavein_rockpod)
obviate(vc_escapepirate_ledgepirate1)
unobviate_pod(vc_talpetebarge_pod)
obviate(vc_finalpirate)
obviate(vc_glowslug_flyawaybats)
obviate(vc_ammo_pad_1)
obviate_pod(creature_arms)
obviate(lava_rock_spawner2)
activate(taxi_to_vc)
health_set_invulnerability(cave_viper1, true)

run_script("music");
run_script("vc_dialogue");
run_script("vc_cameras");
run_script("viper_platforms_logic");
run_script("vc_help")
run_script("viper_caverns_sound")
run_script("vc_checkpoints")
run_script("vc_help")
run_script("vc_camerashake")
run_script("vc_talwyn_helpmessage")
run_script("missions")

deactivate(vc_cavernelevator)
 
escapestarted = false
door_set_boltcrank(vc_gratedoor_todarkwatership, vc_boltcrank4);
door_set_boltcrank(vc_gratedoor_caveindoor, vc_boltcrank1);
foreach_moby_in_pod(dead_pirates_combatgroup, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER)
foreach_moby_in_pod(enemy_pod_ignoredeathvolume, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_FALL_TO_DEATH)
enemy_disable_transition(cave_viper_shadow1, ENEMY_TRANSITION_VOLUME_FALL_TO_DEATH)
foreach_moby_in_pod(vipers_all, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_FALL_TO_DEATH)

if SAVE.completed_viper_cavern == false then
	
	if  SAVE.vc_escape_start == true then
	
		--activate(vc_undeadeffect)
		obviate(vc_boltcrank3)
		obviate(vc_boltcrank4)
	end
	
end

--warping barge to startpoint when respawning after intro taxi
if SAVE.vc_start_on_taxi == false then
taxi_warp(taxi_to_vc, taxi_warp_vol)
end


-- intro sequence
if SAVE.vc_start_on_taxi then
deactivate(taxi_to_vc)
prt("taxi deactivated")
queue_scene("scene_taxi_intro", __pod_handle_invalid, __pod_handle_invalid, __volume_handle_invalid, CINE_FADE_BLACK, CINE_FADE_BLACK, CINE_FADE_NONE, CINE_FADE_NONE )
--queue_scene("scene_taxi_intro")
wait(0)
deactivate(taxi_to_vc)
prt("taxi deactivated")
activate_cam(get_hero(), viewcam_opening)
show_location( L01_PLACE_GPLAY_MORROWCAVERNS, 25 )
else
fade_from_black(2)
end

camera_shake_sequence_active = true

if not SAVE.completed_viper_cavern == true then
	if SAVE.vc_escape_start == true then
		request_music_track("VCFightOut")
		--activate(vc_undeadeffect)
	end
end

if SAVE.vc_escape_start == true then
	activate(vc_cavernelevator)
end




if not SAVE.vc_escape_start == true then
  --
	obviate(vc_cavernelevator1)
	unobviate(vc_cavernelevator)
	update_off(lava_rock_spawner)
	update_off(lava_rock_spawner1)
  deactivate(taxi_to_vc)
	prt("taxi deactivated")
	obviate_pod(ledge_grab_block_rocks_pod)
end

if SAVE.vc_escape_start == true then
  activate(vc_undeadeffect)
  crank_set_complete(vc_boltcrank2)
  unobviate_pod(vc_arenapirates_group1)
	obviate(vc_cavernelevator)
	unobviate(vc_cavernelevator1)
	delete(vc_enemy_viper2)
	delete(vc_enemy_viper2b)
	delete(vc_enemy_viper2d)
	obviate(iris_kh_pirate_bridge1)
	obviate_pod(vc_hidebats_pod)
	obviate_pod(vc_moveableplatforms_pod)
	--startspawningammo3 = true
	--startspawningammo2 = true
	startspawningammo = true
	unobviate_pod(dead_pirates_combatgroup)
	obviate_pod(dead_pirates_setpeicegroup)
	obviate(sf_slags_flag_ship1)
	unobviate(vc_ammo_pad_1)
	activate(taxi_to_vc)
	update_on(lava_rock_spawner)
	update_on(lava_rock_spawner1)
	unobviate(vc_finalpirate)
	ally_warp(tal, vc_allywarpvol_talwyn_escapescene)
	door_open(vc_elevator_door1)
	door_open(vc_elevator_door2)
	update_on(cave_viper)
	obviate(rustypete)
	deactivate(Ledge_grab_clue1)
	unobviate_pod(ledge_grab_block_rocks_pod)
	obviate(vc_boltcrank1)
end

if is_current_checkpoint(vc_checkpoint_2vipers_respawn) then
	--obviate(vc_cavernelevator1)
	--unobviate(vc_cavernelevator)
	obviate(iris_kh_pirate_bridge1)
  update_on(cave_viper)
	delete(vc_escape_pirates_group2)
	door_remove_boltcrank(vc_gratedoor_todarkwatership)
	damage(vc_gratedoor_todarkwatership, 200)
end

--[[if crank_is_complete() then
	crank_set_complete()
end

if crank_is_complete() then
	crank_set_complete()
end--]]

if SAVE.elevator_door_opened == true then
--door_open(vc_elevator_door1)
--door_open(vc_elevator_door2)
end

if SAVE.vc_escape_start == true then
	if not has_valid_checkpoint() then
	hero_warp(get_hero(), vc_checkpoint_escape_respawn)
	obviate_pod(darkwater_cinematic_objects_hidden)
	obviate_pod(vc_batgroup_petescare)
	SAVE.talwyn_rescued = nil
	end
end

if not SAVE.vc_escape_start == true then
	if not has_valid_checkpoint() then
	SAVE.ratchet_choose_rescue = nil
	SAVE.cavein = nil
	SAVE.cave_in_dialogue_finished = nil
	end
end

if has_valid_checkpoint() then
	if SAVE.cavein == true then
	obviate(vc_boltcrank1)
	end
end

if SAVE.cavein == true then
door_canted_close(vc_gratedoor_caveindoor)
end


if SAVE.talwyn_rescued == true then
obviate(viper_taltrapped)
end
--obviate(vc_ship_wreckouter17)


------------------------------------------------------------------------
-- Main Loop 
--------------------------------------------------------------------------------


local slagshead = ally_get_slagshead(rustypete)


--[[
 function enemy_disable_transition_pod(pod, transition) 
  local moby = pod:get_first()
  while moby:is_valid() do
    enemy_disable_transition(moby, transition);
    moby = pod:get_next()
  end
end
--]]

--enemy_disable_transition_pod(dead_pirates_combatgroup, vc_waterclue1)



SAVE.completed_viper_cavern = false
SAVE.vc_start_on_taxi = false
local hit_first_checkpoint = false
local last_time_check_barge_volume_executed = 30
local wait_between_volume_check = 30
local vc_exit_cam = false

while true do


--killing fireslug if he's in this volume
fireslug_delete_in_volume(kill_glowslug)



	--tell the player they need to go look for darkwater if they are milling about near the barge
	if (last_time_check_barge_volume_executed + wait_between_volume_check < get_current_time() and not SAVE.vc_escape_start == true and is_in_volume(get_hero(), vc_trig_camera_vcentrance)) then
		last_time_check_barge_volume_executed = get_current_time()
		popup_message( L02_PROMPT_GPLAY_NEEDDARKWATER , 5 )
	end

if not is_alive(viper_taltrapped) then
prt("VIPOR DEAD YO!!!")
end



if not hit_first_checkpoint and is_in_volume( get_hero(), vc_checkpoint_start ) then
  hit_first_checkpoint = true
  --hero_lockout_control(get_hero(), false)
end

if hit_first_checkpoint and is_in_volume( get_hero(), taxi_transition_vol ) then
  
  if SAVE.vc_escape_start then
    --queue_cinematic("s13_curse_rt" )
    wait(0.5)
    SAVE.completed_viper_cavern = true
  end
  
  SAVE.npc_start_on_taxi = true
  set_level( LEVEL_NPC_ISLAND )
  
  wait(10) -- will never resume, level transition will occur first
  
end

--setting close camera for cave



-----------------------------------------------------------------------------------------------------
--vc entrance
-----------------------------------------------------------------------------------------------------
	
	
--[[-- activate opening view camera
if is_in_volume(Ratchet1, vc_trig_camera_vcentrance) then
activate_camera()
end]]--

--trigger pete and tal to walk into cave

if not SAVE.vc_escape_start == true then

--warping pete to start of viper cavern temporarily

--[[if is_in_volume(get_hero(), vc_trig_exit_cinematic) then
ally_warp(rustypete, vc_allywarp_pete_cavernstart)
end--]]


	if talpeteentercave == nil then
		if is_in_volume(get_hero(), vc_trig_camera_vcentrance) then
		wait(1)
		if not SAVE.first_ally_intro == true then
		end	
		if SAVE.first_ally_intro == true then
		ally_followpath(rustypete,Pete_walkpath_1b,false,false)
		ally_followpath(tal,Tal_walkpath_1b,false,false)
		end
		SAVE.first_ally_intro = true
		request_auto_save()
		talpeteentercave = true
		end
	end
	
end
--trigger pete and tal to walk toward door
if talpeteattrapdoor == nil then
	if is_cranking(get_hero(), vc_boltcrank1) then
	wait(2)
	ally_warp(tal, ally_warp_vol_tal_before_cavein)
	ally_warp(rustypete, ally_warp_vol_pete_before_cavein)
	ally_followpath(rustypete,pete_walkpath_2,false,true)
	ally_followpath(tal,tal_walkpath_2,false,true)
	talpeteattrapdoor = true
	end
end


-------------------------------------------------------------------------------------------------------------------------------------------------
-- cave in sequence
-------------------------------------------------------------------------------------------------------------------------------------------------

	--triggering cavein sequence
if not (SAVE.cavein) == true then
	if caveintriggered == nil then
		if crank_is_complete(vc_boltcrank1) then
			cave_in_active = true
			ally_followpath(rustypete,pete_walkpath_3,false,false)
			ally_followpath(tal,tal_walkpath_3,true,false)
			activate(fx_cavein_rockfalls)
			door_remove_boltcrank (vc_gratedoor_caveindoor)
			wait(1)
			door_close(vc_gratedoor_caveindoor)
			play_explicit_sound_spec(SoundSpecs.VC_Grate_Crash_Cave_In) --sound for the door crashing cro 5/31
			prt("wtf")
			play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Cave_In) -- vc_gratedoor_caveindoor (i took this out because it's a 2D sound and to make it a little louder cro 4/29)
			wait(2.5)
			camera_shake(get_hero(), 10, 20, 4)
			activate(fx_cave_in)
			unobviate_pod(cavein_rockpod)
			deactivate(fx_cavein_rockfalls)
			caveintriggered = true
			SAVE.cavein = true
			wait(3)
			--if not (SAVE.cavein) == true then
			ally_followpath(tal,tal_walkpath_4,true,false)
			--end
		end
	end
end



----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------------
-- slot for tal trapped npc scene
----------------------------------------------------------------------------------------------------------------------------------------------


if SAVE.cave_in_dialogue_finished == true then
if cinematic_tal_trapped == false then
	if caveintriggered == true then
		if is_in_volume(get_hero(), vc_trig_npcscene_taltrapped) then
			queue_scene( "vc_scene_talwyn_trapped")
			cinematic_tal_trapped = true
		end
	end
end
end

if ratchet_saves_talwyn == false then
ally_followpath(rustypete,pete_walkpath_4,false,false)
speak_and_wait(rustypete,  DialogueSpecs.VC_PETE_PROMISE_RESPONSE_NO)
ratchet_saves_talwyn = nil
end

if ratchet_saves_talwyn == true then
ally_followpath(rustypete,pete_walkpath_4,false,false)
speak_and_wait(rustypete,  DialogueSpecs.VC_PETE_PROMISE_RESPONSE_YES)
ratchet_saves_talwyn = nil
end

--hiding tal once get_hero() and pete progress into viper cavern

if not SAVE.vc_escape_start == true then

	if talwynbehindrocks == nil then
		if is_in_volume(get_hero(), vc_trig_ally_peteheadtoledgegrab) then
		ally_warp(tal, vc_allywarpvol_talwyn_escapescene)
		prt("warping talwyn")
		talwynbehindrocks = true
		end
	end

end
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------------------------------------------	
	--opening door to viper pass
-----------------------------------------------------------------------------------------------------------------------------------------------

if not SAVE.vc_escape_start == true then
if peteatviperpassdoor == false then
	if is_in_volume(rustypete, vc_trig_ally_peteopendoor1) then
	peteatviperpassdoor = true
	prt("pete is at viper pass door")
	end
end

if viperpassdooropen == nil then
	if peteatviperpassdoor == true then
		if is_in_volume(get_hero(),  vc_trig_ally_peteopendoor1) then
		queue_scene( "vc_scene_peteopendoor")
		prt("loading pete opening door scene")
		end	
	end
end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
	--sending pete to ledgegrab
--[[if peteatledgegrab == nil then
	if is_in_volume(get_hero(), vc_trig_ally_peteheadtoledgegrab) then
	ally_followpath(rustypete,pete_walkpath_6,false,false)
	peteatledgegrab = true
	end
end--]]

--moved command do vc_dialogue script

-----------------------------------------------------------------------------------------------------
--shadow viper sequence
-----------------------------------------------------------------------------------------------------


--if SAVE.shadow_viper == nil then
	if shadowviperintro == nil then
		if is_in_volume(get_hero(), vc_trig_sequence_shadowviper) then
			caveviper_shadow_intro(cave_viper_shadow1)
			shadowviperintro = true
		end
	end
--end

if ledgegrab_camera_shake == nil then
	if is_in_volume(get_hero(), vc_trig_rockfall) then
	camera_shake(get_hero(), 10, 3, 2)
	activate(fx_shadowviper_rockfalls)
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Metal_Groans_OneShot, get_hero())
	obviate_pod(vc_batgroup_petescare)
	wait(1)
	deactivate(fx_shadowviper_rockfalls)
	ledgegrab_camera_shake = true
	end
end
--activate ledgegrab index cam

if ledgegrabcamactive == nil then
	if is_in_volume(get_hero(), vc_trig_camera_shadowviper) and is_ledge_grabbing(get_hero()) then
	--set_follow_cam(get_hero(), 10, 2, 75, 2)
	activate_cam(get_hero(), vc_camera_shadowviper)
	--unobviate(cave_viper_shadow1)
	ledgegrabcamactive = true
	end
end

--deactivate ledgegrab index cam


if ledgegrabcamactive == true then
	if not is_ledge_grabbing(get_hero()) then
		if not is_in_volume(get_hero(), vc_trig_camera_shadowviper) then
		--set_follow_cam(get_hero(), 4, 2, 75, 2)
		deactivate_cam(get_hero(), vc_camera_shadowviper)
		--obviate(cave_viper_shadow1)
		ledgegrabcamactive = nil
		end
	end
end

if rockfall == nil then
	if is_in_volume(get_hero(), vc_trig_rockfall) then
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Rock_Fall, cave_viper_shadow1)
	rockfall = true
	end
end

--revealing glow slug at setup 2 where player throws across gap


if not SAVE.vc_escape_start == true then

-----------------------------------------------------------------------------------------------------
--flyby viper sequence
-----------------------------------------------------------------------------------------------------

if flybyviper == nil then
	if is_in_volume(get_hero(), vc_trig_viper2flyby) then
	caveviper_followpath(cave_viper2, vc_path_viper2flyby, vc_trig_viper2flyby, 25.0);
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Viper_Flyby, cave_viper2)
	camera_shake(get_hero(), 10, 20, 4)
	flybyviper = true
	end
end



-----------------------------------------------------------------------------------------------------
--elevator sequence
-----------------------------------------------------------------------------------------------------


	--moving rusty pete back to bridge
	if playeratbridge == nil then
		if is_in_volume(get_hero(), vc_trig_ally_petewalktobridge) then
		ally_followpath(rustypete,pete_walkpath_7,true,false)
		playeratbridge = true
		end
	end
	
	--moving rustypete to elevator
	if peteatelevator == nil then
		if crank_is_complete(vc_boltcrank3) then
		ally_followpath(rustypete,pete_walkpath_8,false,true)
		peteatelevator = true
		end
	end
	
	--opening elevator
	if pete_open_elevator == nil then
	if is_in_volume(rustypete, trig_pete_open_elevator) then
 	--debug_message("Pete: Let me get this old elevator working.", 2)
 	speak_and_wait(rustypete, DialogueSpecs.VC_PETE_ELEV_OPENER)
 	speak_and_wait(ally_get_slagshead(rustypete), DialogueSpecs.VC_SLAG_ELEV_RESPONSE)
 	play_explicit_sound_spec(SoundSpecs.AMB_VC_Rumble, get_hero())
	camera_shake(get_hero(), 6, 9, 4, .1, 9)
	wait(1)
	door_open(vc_elevator_door1)
	door_open(vc_elevator_door2)
	wait(1)
	prt("about to walk into elevator")
	ally_followpath(rustypete, pete_walkpath_8b, false, false)
	prt("walked into elevator")
	pete_open_elevator = true
	
	end
	end
	
	--activating elevator once pete is inside
	if elevatoractive == nil then
		if is_in_volume(rustypete, vc_cavernelevatortrigger) then
		if is_in_volume(get_hero(), vc_cavernelevatortrigger) then
			door_close(vc_elevator_door1)
			door_close(vc_elevator_door2)
			activate(vc_cavernelevator)
			elevatoractive = true
		end
		end
	end

--------------------------------
--revising viper 1 intro setup (old script)
--[[
	if firstviperintro == nil then
		if is_in_volume(get_hero(), vc_trig_sequence_firstviperintro) then
		wait(2)
		--activate_cam(get_hero(), vc_camera_firstviperintro)
		
		queue_scene("vc_scene_viperintro")
		firstviperintro = true
		end
	end
--]]
--------------------------------
-- viper 1 intro (new script)

if firstviperintro == nil then
if is_in_volume(get_hero(),trig_viper1_can_intro) then
firstviperintro = true
end
end

 if firstviperintro == true then
		if is_in_area(get_hero(), trig_viper1_area) then
		--wait(2)
		--activate_cam(get_hero(), vc_camera_firstviperintro)

    --[[caveviper_intro(cave_viper1);
		awareness_add_targettype(cave_viper1, TRG.TT_ALLY)
		awareness_remove_targettype(cave_viper1, TRG.TT_HERO)
		
	
		cave_viper_intro = true
		viper1cam = true
		viper_intro_dialogue = true
	  --]]

		queue_scene("vc_scene_viperintro")
		firstviperintro = false
		end
	end


end--------------------------------------------------------------------------------------------------
--viper 1 intro
-----------------------------------------------------------------------------------------------------


if not SAVE.vc_escape_start == true then

	if viper1cam == true then
	--activate_cam(get_hero(), vc_camera_viperintro_indexcam)
	awareness_add_targettype(cave_viper1, TRG.TT_ALLY)
	awareness_remove_targettype(cave_viper1, TRG.TT_HERO)
		if not crank_is_complete(vc_boltcrank4) then
		--if rustypetecowering == nil then
		ally_followpath(rustypete,pete_run_path_viper_intro,true, false)
		--rustypetecowering = true
		
		end
	end
	
	--killing index camera if boltcrank is done
	if darkwaterlairunlocked == nil then
		if crank_is_complete(vc_boltcrank4) then
		ally_warp(rustypete, ally_warp_vol_pete_to_viper1_boltcrank)
		ally_followpath(rustypete,pete_runpath_to_viper1_boltcrank,true, false)
		deactivate_cam(get_hero(),vc_camera_viperintro_indexcam)
		wait(1)
		door_remove_boltcrank(vc_gratedoor_todarkwatership)
		queue_scene( "vc_scene_darkwatership",__pod_handle_invalid,__pod_handle_invalid,vc_herowarpvol_darkwatershipentrance)
		wait(0)
		fade_to_black(0)
		fade_from_black(1)
		activate_cam(get_hero(), cam_view_darkwatership)
		show_location( L01_PLACE_GPLAY_DARKWATERSTOMB , 10 )

		SAVE.elevator_door_opened = true
	  request_auto_save()
		darkwaterlairunlocked = true
		viper1cam = false
		end
	end
	
end


if SAVE.darkwater_cinematic_done == 1 then
--activate_cam(get_hero(), cam_view_darkwatership)
SAVE.darkwater_cinematic_done = 2
end


--------------------------------------------------------------------------------------------------------
--viper 2 intro
--------------------------------------------------------------------------------------------------------
--see viper_platforms_logic script




--------------------------------------------------------------------------------------------------------
--darkwater grindrail area
---------------------------------------------------------------------------------------------------------

--camera shake for balance rail segment
if balancerailshake == nil then
	if is_in_volume(get_hero(), vc_trig_camerashake_narrowcatwalk) then
	activate(fx_balancebeams_rockfalls)
	activate(fx_balancebeams_rockfalls1)
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Metal_Groans_OneShot, get_hero())
	wait(2)
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Rock_Fall, get_hero())
	camera_shake(get_hero(), 10, 20, 3)
	wait(2)
	deactivate(fx_balancebeams_rockfalls)
	deactivate(fx_balancebeams_rockfalls1)
	balancerailshake = true
	end
end

--activating grindrail camera

if is_grinding(get_hero()) then
	if endgrindrailon == nil then
		if is_in_volume(get_hero(),vc_trig_camera_endgrindrail_start ) then
		activate_cam(get_hero(),vc_camera_endgrindrail)
		prt("grindrail camera active")
		ally_followpath(rustypete,pete_walkpath_12,true,false)
		endgrindrailon = true
		end
	end
end

--if not is_grinding(get_hero()) then
	if endgrindrailoff == nil then
		if is_in_volume(get_hero(),vc_trig_camera_endgrindrail_end) then
		deactivate_cam(get_hero(),vc_camera_endgrindrail)
		prt("grindrail camera deactivated")
		endgrindrailoff = true
		endgrindrailon = nil
		end
	end
--end	

--grindrail viper flyby
if flybyviper2 == nil then
	if is_in_volume(get_hero(), vc_trig_grindrailviperflyby1) then
	caveviper_followpath(vc_enemy_viper_grindrailviper1, vc_path_viper2flyby1, vc_trig_grindrailviperflyby1, 25.0);
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Viper_Flyby, vc_enemy_viper_grindrailviper1)
	flybyviper2 = true
	end
end

if flybyviper3 == nil then
	if is_in_volume(get_hero(), vc_trig_grindrailviperflyby2) then
	caveviper_followpath(vc_enemy_viper_grindrailviper2, vc_path_viper2flyby2, vc_trig_grindrailviperflyby2, 25.0);
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Viper_Flyby, vc_enemy_viper_grindrailviper2)
	flybyviper3 = true
	end
end

if flybyviper4 == nil then
	if is_in_volume(get_hero(), vc_trig_grindrailviperflyby3) then
	caveviper_followpath(vc_enemy_viper_grindrailviper3, vc_path_viper2flyby3, vc_trig_grindrailviperflyby3, 25.0);
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Viper_Flyby, vc_enemy_viper_grindrailviper3)
	flybyviper4 = true
	end
end

--triggering viperonshipdeck to intro
if two_vipers_intro == nil then
	if is_in_volume(get_hero(), vc_innervolume_shipwreckviper) then
    caveviper_intro(vc_enemy_viper3)
		caveviper_intro(vc_enemy_viper4);
		two_vipers_intro = true
    cave_viperondeck_intro = true;
	end
end
	
	
--removing dual vipers
if twovipersgone == nil then
	if is_in_volume(get_hero(), vc_trig_2viperfight_retreat) then
	caveviper_outro(vc_enemy_viper3)
	play_explicit_sound_spec(SoundSpecs.AMB_VC_Viper_Roar_OS, vc_enemy_viper3)
	wait(.5)
	caveviper_outro(vc_enemy_viper4)
	play_explicit_sound_spec(SoundSpecs.AMB_VC_Viper_Roar_OS, vc_enemy_viper4)
	wait(3)
	delete(vc_enemy_viper3)
	delete(vc_enemy_viper4)
	twovipersgone = true
	end
end

if explosivebarrelsdead == nil then
	if get_num_alive(explosive_barrel_pod) == 0 then

	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Cave_In, vc_gratedoor_caveindoor)
	wait(1)
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Cave_In, vc_gratedoor_caveindoor)
	camera_shake(get_hero(), 10, 20, 8)
	wait(5)
	--obviate(vc_enemy_viper3)
	--obviate(vc_enemy_viper4)
	explosivebarrelsdead = true
	end
end
---------------------------------------------------------------------------------------------------------
--grindrail area stuff
---------------------------------------------------------------------------------------------------------

--woodcreaking
if woodcreakingsound1 == nil then
	if is_in_volume(get_hero(), vc_trig_sound_woodcreaking1) then
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Wood_Groans_Long_Oneshot, get_hero())
	woodcreakingsound1 = true
	end
end

if woodcreakingsound2 == nil then
	if is_in_volume(get_hero(), vc_trig_sound_woodcreaking2) then
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Wood_Groans_Long_Oneshot, get_hero())
	woodcreakingsound2 = true
	end
end

if woodcreakingsound2 == nil then
	if is_in_volume(get_hero(), vc_trig_sound_metalcreaking) then
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Metal_Groans_OneShot, get_hero())
	woodcreakingsound2 = true
	end
end
--metalcreaking
--changing grindrail speed

if grindrail_slower == nil then
if is_in_volume(get_hero(), vc_trig_grindrailviperflyby1) then
hero_set_grind_speed(get_hero(), 10)
grindrail_slower = true
end
end

---------------------------------------------------------------------------------------------------------
--WRECKED PIRATE SHIP
---------------------------------------------------------------------------------------------------------
--activating elevator



if boltcrank_elevator_complete == nil then
if crank_is_complete(boltcrank_boltcrank_elevator) then
crank_set_complete(boltcrank_boltcrank_elevator)
boltcrank_elevator_complete = true
end
end

---------------------------------------------------------------------------------------------------------
--darkwatership deck
---------------------------------------------------------------------------------------------------------

--warping hero and hiding darkwater ship

if darkwatershiphidden == nil then
if crank_is_complete(tempboltcrank_5) then
	ally_followpath(rustypete,pete_walkpath_13,true,false)
	timed_curse(vc_undeadeffect, 33)
	queue_cinematic("l02_s08_dtomb_rt", darkwater_cinematic_objects_hidden, __pod_handle_invalid, __volume_handle_invalid, CINE_FADE_BLACK, CINE_FADE_BLACK, CINE_FADE_NONE, CINE_FADE_NONE )
	wait(0)
  play_sound(SoundSpecs.MUS_Q4B_Win_Weapons1) --adding music for receiving weapons. cro 5/21
  fade_to_black(0)
  show_weapon_screen( WPN_COMBUSTER, 2, 2 ); 
  wait(0)
  play_sound(SoundSpecs.MUS_Q4B_Win_Weapons2) --adding music for receiving weapons. cro 5/20
  show_weapon_screen( WPN_GRENADE, 2, 2 );
  wait(0)
  fade_from_black(0)
  clear_flag(HERO_FIRED_WEAPON)
  clear_flag( HERO_STRAFED )
  hero_set_num_objects( get_hero(), OBJ_TREASURE_MAP, 1 )
	obviate(sf_slags_flag_ship1)
	obviate_pod(darkwater_cinematic_objects_hidden)
	obviate(rustypete)
	obviate(slagshead)
	obviate_pod(dead_pirates_setpeicegroup)
	obviate_pod(vc_moveableplatforms_pod)
	obviate_pod(vc_hidebats_pod)
	obviate_pod(vc_hidebridge_pod)
	unobviate_pod(dead_pirates_combatgroup)
	unobviate(cave_viper)
	hero_heal(get_hero())
	activate(taxi_to_vc)
	update_on(lava_rock_spawner)
	update_on(lava_rock_spawner1)
	door_open(vc_elevator_door1)
	door_open(vc_elevator_door2)
	deactivate(Ledge_grab_clue1)
	unobviate_pod(ledge_grab_block_rocks_pod)
  obviate(vc_boltcrank1)
	obviate(vc_boltcrank3)
	obviate(vc_boltcrank4)
	obviate(vc_cavernelevator)
	unobviate(vc_cavernelevator1)
	unobviate(vc_ammo_pad_1)
  unobviate_pod(vc_arenapirates_group1)
	request_music_track("VCFightOut") --adding temp music track
	wait(0)
 	hero_give_weapon( get_hero(), WPN_COMBUSTER)
 	wait(0)
	hero_give_weapon( get_hero(), WPN_GRENADE)
	hero_equip(get_hero(), WPN_COMBUSTER)
	--debug_message("To fire your weapon, press CIRCLE or R1", 7)
	--fade_to_black(0)
  --fade_from_black(2)
  hero_warp(get_hero(), vc_checkpoint_escape_respawn)
  ally_warp(tal, vc_allywarpvol_talwyn_escapescene)

	startspawningammo = true
	escapestarted = true
	darkwatershiphidden = true
	vc_cursestarted = true
  --startspawningammo2 = true
	activate(vc_undeadeffect)
	SAVE.vc_escape_start = true
	checkpoint_volume(vc_checkpoint_escape_respawn)	
	
	--helptext(L01_HELP_GPLAY_FIREWEAPONS, "press cirle to fire", 10)

end
end



----------------------------------------------------------------------------------------------------------
--combat segment start
----------------------------------------------------------------------------------------------------------

--arena pirates

if arenapiratesgroup2awake == nil then
	if get_num_alive(vc_arenapirates_group1) < 3 then
		unobviate_pod(vc_arenapirates_group2)
		arenapiratesgroup2awake = true
	end
end

if arenapiratesgroup3awake == nil then
	if get_num_alive(vc_arenapirates_group2) < 3 then
		unobviate_pod(vc_arenapirates_group3)
		arenapiratesgroup3awake = true
	end
end

if arenapiratesgroup4awake == nil then
	if get_num_alive(vc_arenapirates_group3) <= 1 then
		unobviate(vc_arenapirates_group4_pirate3)
		wait(1)
		unobviate(vc_arenapirates_group4_pirate2)
		wait(1)
		unobviate(vc_arenapirates_group4_pirate1)
		wait(3)
		unobviate(vc_arenapirates_group4_pirate10)
		arenapiratesgroup4awake = true
	end
end

if arenapiratesgroup5awake == nil then
	if get_num_alive(vc_arenapirates_group4) < 3 then
		unobviate(vc_arenapirates_group4_pirate4)
		wait(1)
		unobviate(vc_arenapirates_group4_pirate5)
		unobviate(vc_arenapirates_group4_pirate11)
		wait(1)
		unobviate(vc_arenapirates_group4_pirate6)
		wait(1)
		unobviate(vc_arenapirates_group4_pirate7)
		wait(1)
		unobviate(vc_arenapirates_group4_pirate8)
		wait(1)
		unobviate(vc_arenapirates_group4_pirate9)
		arenapiratesgroup5awake = true
	end
end

-- ending arena music, starting second combat theme
if arenamusicdone == nil then
	if get_num_alive(vc_arenapirates_group5) < 1 then
	request_music_track("VCFightOut")
	arenamusicdone = true
	end
end

--unhiding ledge pirate

if ledgepiraterevealed == nil then
	if is_in_volume(get_hero(), vc_outer_escapepirate_ledgepirate) then
	unobviate(vc_escapepirate_ledgepirate1)
	ledgepiraterevealed = true
	end
end


--------------------------------------------------
--return from arena: pirate group 2
--------------------------------------------------

--breaking door and unhiding pirate group 2

if SAVE.vc_escape_start == true then 

	if doorbacktoelevatorbroken == nil then
			if is_in_volume(get_hero(), vc_trigger_sequence_break_door_to_elevator) then
				damage(vc_gratedoor_todarkwatership, 200)
				unobviate_pod(vc_escape_pirates_group2)
				doorbacktoelevatorbroken = true
			end
	end


--viper roar when player takes elevator back


	if is_in_volume(ratchet, vc_trig_sound_escapeviper) then
		play_explicit_sound_spec(SoundSpecs.AMB_VC_Viper_Roar_OS, cave_viper)
		camera_shake(get_hero(), 10, 20, 3)
		update_on(cave_viper)
		caveviper_intro(cave_viper)
		door_open(vc_elevator_door1)
		door_open(vc_elevator_door2)
		wait(2)
		helptext(L01_HELP_GPLAY_PYTHORSTAKEDAMAGE, "shoot viper in face", 5)
			if not check_flag( HERO_STRAFED ) then
			helptext(GEN_HELP_GPLAY_HOWTOSTRAFE, "strafe message", 15, false,20, false)
			end
	end
	
end

--killing enemies that get stuck in the elevator

if is_in_volume(get_hero(), vc_trig_sequence_firstviperintro) then
damage(vc_pirategroup2_p5, 200)
damage(vc_pirategroup2_p4, 200)
end
-------------------------------------------------
--spawning ammo
if SAVE.vc_escape_start == true then
spawner_spawn( vc_ammo_pad_1, ART_CLASS_AMMO_CRATE )
end


-- making viper retreat when damaged

if caveviperdamaged == nil then
	if enemy_get_health(cave_viper) <= 45 then
		caveviper_outro(cave_viper)
		caveviperdamaged = true
	end
end


--final pirate in tal area

if SAVE.vc_escape_start == true then
	if finalpiratespawned == nil then
		unobviate(vc_finalpirate)
		finalpiratespawned = true
	end
end



-----------------------------------------------------------------------------------------------------------------------------
--tal escape trigger
-----------------------------------------------------------------------------------------------------------------------------

--making viper fight talwyn, then turn to fight player
if not SAVE.talwyn_rescued == true then
	awareness_add_targettype(cave_viper1, TRG.TT_ALLY)
	awareness_remove_targettype(cave_viper1, TRG.TT_HERO)

	if viper_fight_tal == nil then
		if is_in_volume(get_hero(), innervol_viper_taltrapped) then
		caveviper_intro(viper_taltrapped)
		--making tal fight viper
		ally_equipitem(tal, ALLY_ITEM_GUN);
		ally_setattitude(tal, 1)
		ally_cleartargets(tal)
		ally_addtarget(tal, ally_target_pod_viper_taltrapped)
		run_script("vc_talwyn_hover")
		wait(5)
		viper_fight_tal = true
		end
	end

	--triggering talwyn free scene when viper is dead.
	if talwynescapescenetriggered == nil then
		if is_in_volume(get_hero(), vc_trig_scene_talwynescape) then
			if get_num_alive(ally_target_pod_viper_taltrapped) < 1 then
			tal_fightviper_hover = false
			queue_scene( "vc_scene_talwyn_free")
			wait(0)
			speak(get_hero(), DialogueSpecs.VC_RAT_BACKTOISLAND, true)  -- 2D. cro 5/28
			wait(1)
			ally_followpath(tal,vc_talwynpath_returntoship,true,false)
			SAVE.talwynfree = true
			talwynescapescenetriggered = true
			request_auto_save()
			end
		end
	end

end



--------------------------------------------------------------------------------
-- Boat leaving camera
--------------------------------------------------------------------------------
if SAVE.vc_escape_start then
	if is_in_area(get_hero(), vc_exit_layer) and not vc_exit_cam then
		activate_cam(get_hero(), exit_camera)
		vc_exit_cam = true
	end

	if not is_in_area(get_hero(), vc_exit_layer) and vc_exit_cam then
		deactivate_cam(get_hero(), exit_camera)
		vc_exit_cam = false
	end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- triggering end cinematic

if cursertplayed == nil then
	if  SAVE.vc_escape_start == true then
		if is_in_volume(get_hero(), taxi_transition_vol) then
  SAVE.completed_viper_cavern = true
		end
	end
end




--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
  wait()

end

-- end gameplay, this occurs when the user gets to viper caverns
