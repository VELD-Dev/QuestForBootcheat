----------------------------------------------------------------------------------------------------
-- Gameplay Script 
----------------------------------------------------------------------------------------------------

-- This script is loaded for VIPER CAVERS when the player enters that area.
-- This script is responsible for handling the progression and combat logic
-- for viper caverns.  It should set the SAVE.completed_viper_cavern variable 
-- to true when the segment is successfully completed.

cinematic_tal_trapped = false
peteatviperpassdoor = false
vc_cursestarted = false

--hiding arena pirates
obviate_pod(vc_arenapirates_group2)
obviate_pod(vc_arenapirates_group3)
obviate_pod(vc_arenapirates_group4)
obviate_pod(vc_arenapirates_group5)
obviate_pod(vc_escape_pirates_group2)
obviate_pod(dead_pirates_combatgroup)
--obviate(vc_enemy_viper2b)
obviate(cave_viper)
obviate_pod(cavein_rockpod)
obviate(vc_escapepirate_ledgepirate1)
unobviate_pod(vc_talpetebarge_pod)
obviate(vc_finalpirate)
obviate(vc_glowslug_flyawaybats)
obviate(vc_glowslug_throwsetup)

activate(taxi_to_vc)


run_script("vc_dialogue");
run_script("vc_cameras");
run_script("viper_platforms_logic");
run_script("vc_help")
run_script("viper_caverns_sound")
run_script("vc_checkpoints")
run_script("vc_help")
run_script("vc_camerashake")
run_script("vc_talwyn_helpmessage")


deactivate(vc_cavernelevator)
 
escapestarted = false
door_set_boltcrank(vc_gratedoor_todarkwatership, vc_boltcrank4);
door_set_boltcrank(vc_gratedoor_caveindoor, vc_boltcrank1);
foreach_moby_in_pod(dead_pirates_combatgroup, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_WATER)
foreach_moby_in_pod(enemy_pod_ignoredeathvolume, enemy_disable_transition, ENEMY_TRANSITION_VOLUME_FALL_TO_DEATH)
enemy_disable_transition(cave_viper_shadow1, ENEMY_TRANSITION_VOLUME_FALL_TO_DEATH)

if SAVE.completed_viper_cavern == false then
	
	if  SAVE.vc_escape_start == true then
		activate(vc_undeadeffect)
		obviate(vc_boltcrank3)
		obviate(vc_boltcrank4)
	end
	
end

--if not SAVE.cavein == true then
	--request_music_track("NoMusic")
--end

deactivate(vc_undeadeffect)

camera_shake_sequence_active = true

if not SAVE.completed_viper_cavern == true then
	if SAVE.vc_escape_start == true then
		request_music_track("VCFightOut")
		activate(vc_undeadeffect)
	end
end

if SAVE.vc_escape_start == true then
	activate(vc_cavernelevator)
end




if not SAVE.vc_escape_start == true then
	obviate(vc_cavernelevator1)
	unobviate(vc_cavernelevator)
end

if SAVE.vc_escape_start == true then
	obviate(vc_cavernelevator)
	unobviate(vc_cavernelevator1)
	delete(vc_enemy_viper2)
	delete(vc_enemy_viper2b)
	delete(vc_enemy_viper2d)
	obviate(iris_kh_pirate_bridge1)
	obviate_pod(vc_hidebats_pod)
	obviate_pod(vc_moveableplatforms_pod)
	startspawningammo3 = true
	startspawningammo2 = true
	startspawningammo = true
	unobviate_pod(dead_pirates_combatgroup)
	obviate_pod(dead_pirates_setpeicegroup)
end

if is_current_checkpoint(vc_checkpoint_2vipers_respawn) then
	--obviate(vc_cavernelevator1)
	--unobviate(vc_cavernelevator)
	obviate(iris_kh_pirate_bridge1)
	unobviate(cave_viper)
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
----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------
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

while is_in_volume( get_hero(), VIPER_CAVERNS_VOLUME ) do

--setting close camera for cave

if cavecameraset == nil then
	if is_in_volume(ratchet, vc_trig_camera_caveadjust) then
		set_follow_cam(get_hero(), 4, 2, 75, 2)
		cavecameraset = true
	end
end


--warping taxi to start of viper cavern

if SAVE.viper_cavern_started ==
true then

	if not SAVE.completed_viper_cavern == true then

	-- warp taxi to start of viper cavern

	end
	
end
	
	--[[-- TODO -  change this conditional to be true when the caverns are complete
	if not SAVE.completed_viper_cavern and is_in_volume( get_hero(), viper_caverns_entrance ) then
	  prt( "Viper Caverns completed.  (That was fast, huh?)" )
    SAVE.completed_viper_cavern = true
    activate(taxi2)
	end--]]

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
		ally_followpath(rustypete,Pete_walkpath_1,false,false)

		ally_followpath(tal,Tal_walkpath_1,false,false)
		wait(4)
		debug_message("Pete: I'll lead the way... we must stick with the light", 4)
		wait(5)
		debug_message("Tal: This place gives me the creeps", 2)
		talpeteentercave = true
		end
	end
	
end
--trigger pete and tal to walk toward door
if talpeteattrapdoor == nil then
	if is_cranking(get_hero(), vc_boltcrank1) then
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
			ally_followpath(rustypete,pete_walkpath_3,false,false)
			ally_followpath(tal,tal_walkpath_3,true,false)
			wait(1)
			camera_shake(get_hero(), 10, 20, 4)
			play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Cave_In, vc_gratedoor_caveindoor)
			door_remove_boltcrank (vc_gratedoor_caveindoor)
			wait(.5)
			door_close(vc_gratedoor_caveindoor)
			wait(1)
			unobviate_pod(cavein_rockpod)
			wait(2.5)
			ally_followpath(tal,tal_walkpath_4,true,false)
			caveintriggered = true
			SAVE.cavein = true
		end
	end
end



----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------------
-- slot for tal trapped npc scene
----------------------------------------------------------------------------------------------------------------------------------------------



if cinematic_tal_trapped == false then
	if caveintriggered == true then
		if is_in_volume(get_hero(), vc_trig_npcscene_taltrapped) then
			queue_scene( "vc_scene_talwyn_trapped")
			cinematic_tal_trapped = true
		end
	end
end

--hiding tal once get_hero() and pete progress into viper cavern

if talwynbehindrocks == nil then
	if is_in_volume(get_hero(), vc_trig_ally_peteheadtoledgegrab) then
	ally_warp(tal, vc_allywarpvol_talwyn_escapescene)
	talwynbehindrocks = true
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------------------------------------------	
	--opening door to viper pass
-----------------------------------------------------------------------------------------------------------------------------------------------
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


if shadowviperintro == nil then
	if is_in_volume(get_hero(), vc_trig_sequence_shadowviper) then
		caveviper_shadow_intro(cave_viper_shadow1)
		shadowviperintro = true
	end
end

if ledgegrab_camera_shake == nil then
	if is_in_volume(get_hero(), vc_trig_rockfall) then
	camera_shake(get_hero(), 10, 3, 2)
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Metal_Groans_OneShot, get_hero())
	obviate_pod(vc_batgroup_petescare)
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
if glowslug2revealed == nil then
	if is_in_volume(get_hero(), vc_trig_help_throwfireslug) then
		unobviate(vc_glowslug_throwsetup)
		glowslug2revealed = true
	end
end
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
if not SAVE.vc_escape_start == true then

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
		ally_followpath(rustypete,pete_walkpath_8,false,false)
		peteatelevator = true
		end
	end
	
	if elevatoractive == nil then
		if is_in_volume(rustypete, vc_cavernelevatortrigger) then
			activate(vc_cavernelevator)
			elevatoractive = true
		end
	end
	
	if firstviperintro == nil then
		if is_in_volume(get_hero(), vc_trig_sequence_firstviperintro) then
		wait(1)
		--activate_cam(get_hero(), vc_camera_firstviperintro)
		queue_scene("vc_scene_viperintro")
		firstviperintro = true
		end
	end

end--------------------------------------------------------------------------------------------------
--viper 1 intro
-----------------------------------------------------------------------------------------------------


if not SAVE.vc_escape_start == true then

	if viper1cam == true then
	activate_cam(get_hero(), vc_camera_viperintro_indexcam)
		if rustypetecowering == nil then
		ally_followpath(rustypete,pete_walkpath_10,true,false)
		rustypetecowering = true
		end
	end
	
	--killing index camera if boltcrank is done
	if darkwaterlairunlocked == nil then
		if crank_is_complete(vc_boltcrank4) then
		deactivate_cam(get_hero(),vc_camera_viperintro_indexcam)
		door_remove_boltcrank(vc_gratedoor_todarkwatership)
		queue_scene( "vc_scene_darkwatership")
		darkwaterlairunlocked = true
		viper1cam = false
		end
	end
	
end

--------------------------------------------------------------------------------------------------------
--viper 2 intro
--------------------------------------------------------------------------------------------------------
--see viper_platforms_logic script



--------------------------------------------------------------------------------------------------------
--flyaway bats
--------------------------------------------------------------------------------------------------------

if flyawaybatstriggered == nil then
	if is_in_volume(ratchet, vc_trig_flyawaybats) then
	play_explicit_sound_spec(SoundSpecs.AMB_VC_Viper_Roar_OS, vc_flyawaybat1)
	unobviate(vc_glowslug_flyawaybats)
	enemy_wakeup(flyawaybats_pod)
	flyawaybatstriggered = true
	end
end

if is_in_volume(vc_flyawaybat1,vc_trig_flyawaybats_obviate ) then
	obviate_pod(flyawaybats_pod)
	
end

if flyawaybatstriggered == nil then
	if get_num_alive(flyawaybats_explosives_pod) == 0 then
		play_explicit_sound_spec(SoundSpecs.AMB_VC_Viper_Roar_OS, vc_flyawaybat1)
		unobviate(vc_glowslug_flyawaybats)
		enemy_wakeup(flyawaybats_pod)
		flyawaybatstriggered = true
	end
end

--------------------------------------------------------------------------------------------------------
--darkwater grindrail area
---------------------------------------------------------------------------------------------------------

--camera shake for balance rail segment
if balancerailshake == nil then
	if is_in_volume(get_hero(), vc_trig_camerashake_narrowcatwalk) then
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Metal_Groans_OneShot, get_hero())
	wait(2)
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Rock_Fall, get_hero())
	camera_shake(get_hero(), 10, 20, 3)
	balancerailshake = true
	end
end

--activating grindrail camera

if is_grinding(get_hero()) then
	if endgrindrailon == nil then
		if is_in_volume(get_hero(),vc_trig_camera_endgrindrail_start ) then
		activate_cam(get_hero(),vc_camera_endgrindrail)
		ally_followpath(rustypete,pete_walkpath_12,true,false)
		endgrindrailon = true
		end
	end
end

--if not is_grinding(get_hero()) then
	if endgrindrailoff == nil then
		if is_in_volume(get_hero(),vc_trig_camera_endgrindrail_end) then
		deactivate_cam(get_hero(),vc_camera_endgrindrail)
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

--[[ triggering viperonshipdeck to intro
	if (not cave_viperondeck_intro and is_in_volume(get_hero(), vc_innervolume_shipwreckviper)) then
    caveviper_intro(vc_enemy_viper3);
    cave_viperondeck_intro = true;
	end]]
	
	
--removing dual vipers
if twovipersgone == nil then
	if is_in_volume(get_hero(), vc_trig_2vipers_outro) then
	caveviper_outro(vc_enemy_viper3)
	play_explicit_sound_spec(SoundSpecs.AMB_VC_Viper_Roar_OS, vc_enemy_viper3)
	wait(.5)
	caveviper_outro(vc_enemy_viper4)
	play_explicit_sound_spec(SoundSpecs.AMB_VC_Viper_Roar_OS, vc_enemy_viper4)
	wait(3)
	obviate(vc_enemy_viper3)
	obviate(vc_enemy_viper4)
	delete(vc_enemy_viper3)
	delete(vc_enemy_viper4)
	twovipersgone = true
	end
end

if explosivebarrelsdead == nil then
	if get_num_alive(explosive_barrel_pod) == 0 then
	caveviper_outro(vc_enemy_viper3)
	caveviper_outro(vc_enemy_viper4)
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Cave_In, vc_gratedoor_caveindoor)
	wait(1)
	play_explicit_sound_spec(SoundSpecs.AMB_Viper_Caverns_Cave_In, vc_gratedoor_caveindoor)
	camera_shake(get_hero(), 10, 20, 8)
	wait(5)
	obviate(vc_enemy_viper3)
	obviate(vc_enemy_viper4)
	explosivebarrelsdead = true
	end
end
---------------------------------------------------------------------------------------------------------
--grindrail area sounds
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
---------------------------------------------------------------------------------------------------------
--darkwatership deck
---------------------------------------------------------------------------------------------------------

--warping hero and hiding darkwater ship

if darkwatershiphidden == nil then
if crank_is_complete(tempboltcrank_5) then
	ally_followpath(rustypete,pete_walkpath_13,true,false)
	wait(2)
	queue_movie("s08_dtomb_rt")

	obviate(sf_slags_flag_ship1)
	obviate_pod(darkwater_cinematic_objects_hidden)
	obviate(rustypete)
	obviate_pod(dead_pirates_setpeicegroup)
	obviate_pod(vc_moveableplatforms_pod)
	obviate_pod(vc_hidebats_pod)
	obviate_pod(vc_hidebridge_pod)
	unobviate_pod(dead_pirates_combatgroup)
	unobviate(cave_viper)
	hero_heal(get_hero())
	hero_warp(get_hero(), vc_checkpoint_escape_respawn)
	obviate(vc_boltcrank3)
	obviate(vc_boltcrank4)
	obviate(vc_cavernelevator)
	unobviate(vc_cavernelevator1)

	request_music_track("VCFightOut") --adding temp music track
 	hero_give_weapon( get_hero(), WPN_COMBUSTER, 0 )
	hero_give_weapon( get_hero(), WPN_GRENADE, 0 )
	hero_equip(get_hero(), WPN_COMBUSTER)

	startspawningammo = true
	escapestarted = true
	darkwatershiphidden = true
	vc_cursestarted = true
    startspawningammo2 = true
	activate(vc_undeadeffect)
	SAVE.vc_escape_start = true
	checkpoint_volume(vc_checkpoint_escape_respawn)	
end
end



----------------------------------------------------------------------------------------------------------
--combat segment start
----------------------------------------------------------------------------------------------------------

--arena pirates

if arenapiratesgroup2awake == nil then
	if get_num_alive(vc_arenapirates_group1) < 1 then
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
		unobviate(vc_arenapirates_group4_pirate10)
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
	if is_in_volume(get_hero(), vc_innervol_escapepirate_ledgepirate1) then
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
	end
	
end

-------------------------------------------------
-- making viper retreat when damaged

if caveviperdamaged == nil then
	if enemy_get_health(cave_viper) <= 45 then
		caveviper_outro(cave_viper)
		wait(2)
		obviate(cave_viper)
		caveviperdamaged = true
	end
end

--spawning ammo for player at viper 2 fight
if startspawningammo == true then
	if is_in_volume(get_hero(), vc_outervolume_brokenbridgeviper) then
		if hero_get_ammo(get_hero(), WPN_GRENADE) <= 0 then
			spawn_ammo(WPN_GRENADE, vc_grenadespawnvol)
			startspawningammo = false
		end
	end
end

if startspawningammo == false then
	if hero_get_ammo(get_hero(), WPN_GRENADE) >= 1 then
	startspawningammo = true
	end
end

--ammo spawner for door to pirate camp
if startspawningammo2 == true then
	if is_in_volume(get_hero(), vc_outervolume_pirategroup3) then
		if hero_get_ammo(get_hero(), WPN_GRENADE) <= 0 then
			spawn_ammo(WPN_GRENADE, vc_ammospawn2)
			startspawningammo2 = false
		end
	end
end

if startspawningammo2 == false then
	if hero_get_ammo(get_hero(), WPN_GRENADE) >= 1 then
	startspawningammo2 = true
	end
end


if startspawningammo3 == true then
	if is_in_volume(get_hero(), vc_checkpoint_cavein_volume) then
		if hero_get_ammo(get_hero(), WPN_GRENADE) <= 0 then
			spawn_ammo(WPN_GRENADE, vc_checkpoint_cavein)
			startspawningammo3 = false
		end
	end
end

if startspawningammo3 == false then
	if hero_get_ammo(get_hero(), WPN_GRENADE) >= 1 then
	startspawningammo3 = true
	end
end
--final pirate in tal area

if vc_cursestarted == true then
	if finalpiratespawned == nil then
		unobviate(vc_finalpirate)
		finalpiratespawned = true
	end
end



-----------------------------------------------------------------------------------------------------------------------------
--tal escape trigger
-----------------------------------------------------------------------------------------------------------------------------

if talwynescapescenetriggered == nil then
	if is_in_volume(get_hero(), vc_trig_scene_talwynescape) then
	queue_scene( "vc_scene_talwyn_free")
	SAVE.talwynfree = true
	talwynescapescenetriggered = true
	checkpoint_volume(vc_checkpoint_freetalwyn_respawn) 
	end
end

if talwynreturntoship == true then
  ally_followpath(tal,vc_talwynpath_returntoship,true,false)
  talwynreturntoship = false
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- triggering end cinematic

if cursertplayed == nil then
	if  SAVE.vc_escape_start == true then
		if is_in_volume(get_hero(), vc_trig_exit_cinematic) then
		update_off(taxi_to_vc)
		update_off(tal)
		update_off(get_hero())
		queue_cinematic("s13_curse_rt" )
		wait(39.0)
		SAVE.completed_viper_cavern = true
		cursertplayed = true
		end
	end
end

-- [moiz] remove this and fix it properly!!!! only temp fix for focus
if test_test_test == nil and has_cinematic_played( "s13_curse_rt" ) then
    update_on(taxi_to_vc);
    update_on(tal);
    update_on(get_hero());
    test_test_test = true;
  end


--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
  wait()

end

-- end gameplay, this occurs when the user gets to viper caverns