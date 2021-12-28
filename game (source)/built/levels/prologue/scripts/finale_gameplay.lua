--- Controls everything in the Boss fight except Darkwater and Slag


skinny_pirate_set_scream_area( VOX_DEATH ) --call for pirates to scream if they are knocked overboard.
----------------------------------------------------------------------------------------------------
-- Local variables 
----------------------------------------------------------------------------------------------------

local reached_start = false
local slag_west_intro = false
local tal_freed  = false
local west_ship_north_door = false
local tal_annouce_darkwater_ship = false
local tal_to_darkwaters_ship = false
local tal_to_east_ship = false
local darkwater_battle1  = false
local goto_east_ship = false
local east_ship_cargo_door = false
local east_hunch_ambush = false
local slag_east_intro = false
local crank_cam_active = false
local east_ship_north_door = false
local east_ship_east_door = false
local east_ship_west_door = false
local east_hunch_cell = false
local hunchback_ambush_intro_scene = false
local east_ship_south_door = false
local east_shooter_intro = false
local swingshot_ride_cam_active  = false
local level_done = false
local skull_spawned_time =0

local spawned_x_pirate1 = nil
local spawned_x_pirate2 = nil

-- get the slagwater state manager
local bcs_sm = BossCaptainSlagwaterStateManager:GetInstance();
local bcd_sm = BossCaptainDarkwaterStateManager:GetInstance();


----------------------------------------------------------------------------------------------------
-- Initialization
----------------------------------------------------------------------------------------------------	

if not has_valid_checkpoint() then
	SAVE.slag_intro_west 					= nil
	SAVE.slag_fight1_completed 				= nil
	SAVE.tal_freed							= nil
	SAVE.Tal_finale_cageconv				= nil
	SAVE.Pirate_ambush_intro_scene			= nil
	SAVE.scene_finale_tal_cageconv_fulcrum	= nil
	SAVE.darkwater_fight1_complete			= nil
	SAVE.east_ship_cargo_door				= nil
	SAVE.slag_fight2_complete				= nil
	SAVE.finale_completed					= nil
	SAVE.stop_spamming_darkwater_checkpoint	= nil
	SAVE.current_power_level 				= 0
end
	
prt("has_valid_checkpoint()="..tostring(has_valid_checkpoint()).."\n")
prt("SAVE.current_power_level="..SAVE.current_power_level.."\n")

---- Temp turn off the rain
-- disable_weather()

-- Make the Smuggler not retarded
npc_setcollisionignore( smuggler, get_hero() )
deactivate(smuggler)

-- Keep Pete's barge still
obviate(petes_dingy1)
obviate( rustypete )
ally_specialidle(rustypete, true); 

--- Turn off all Pirate enemies awareness.
foreach_moby_in_pod( undead_west_ship_cabin_melee_pod, awareness_clear_targettypes )
--foreach_moby_in_pod( east_ship_hunchback_pod, awareness_clear_targettypes )
foreach_moby_in_pod( undead_east_ship_cabin_mixed_pod, awareness_clear_targettypes )
foreach_moby_in_pod( undead_east_ship_cabin_shooters_pod, awareness_clear_targettypes )
foreach_moby_in_pod( pirate_east_ship_cabin_hunchback_pod, awareness_clear_targettypes )


-- Move Tal to her start position.
ally_warp( talwyn, warp_tal_forcefield_vol ) 
ally_setattitude ( talwyn, ALLY_ATT_PASSIVE )
ally_cleartargets( talwyn ) 
ally_unequipitem(talwyn, ALLY_ITEM_GUN)
--ally_trap_in_forcefield ( talwyn )


-- Hide the barge from Darkwaters ship to Slag's East ship

--bangle_off(pirate_barge_to_eastship, 5, false);
--bangle_on(pirate_barge_to_eastship, 6, false);
--obviate( pirate_barge_to_eastship )

-- Put a fancy flag on the smugglers barge
--bangle_off(smugglers_barge, 5, false);
--bangle_on(smugglers_barge, 6, false);

-- Hide certain enemies until they are ready.
obviate_pod( undead_west_ship_roof_shooters_pod )
obviate_pod( undead_east_ship_cabin_shooters_pod )


-- Get the Lightning working
activate( darkwater_ship_lightning_controller )
activate( slag_west_ship_lightning_controller )
activate( slag_east_ship_lightning_controller )

show_location( L02_PLACE_GPLAY_AZOREANSEA, 10 )


--shows the correct version of the elevator on the east ship based on whether you've passed that part
if is_current_checkpoint(defeated_slag_east_ship_checkpoint_respawn_vol) then
	--elevator_warp_to_node(slag_east_ship_boltcrank_elevator, 1)
	crank_set_complete( slag_east_ship_boltcrank )
	prt("completing bolt crank")
end


--puts talwyn in the correct spot based on checkpoint
if is_current_checkpoint(darkwaters_ship_checkpoint_respawn_vol) 
or is_current_checkpoint(barge_traversal_checkpoint_respawn_vol) 
or is_current_checkpoint(defeated_slag_east_ship_checkpoint_respawn_vol) then
	ally_warp( talwyn, tal_darkwaters_ship_checkpoint_respawn_vol )
elseif is_current_checkpoint(slag_east_ship_checkpoint_respawn_vol) then
	ally_warp( talwyn, tal_east_ship_checkpoint_respawn_vol )
end

--fixes rustypete setup based on checkpoints

if is_current_checkpoint(barge_traversal_checkpoint_respawn_vol) 
or is_current_checkpoint(defeated_slag_east_ship_checkpoint_respawn_vol) 
or is_current_checkpoint(slag_east_ship_checkpoint_respawn_vol) then
	unobviate( rustypete )
	ally_warp( rustypete, pete_warp_to_vol )
	obviate( petes_dingy )
	obviate( petes_dingy1 )
elseif not is_current_checkpoint(ratchet_warp_finale_start_vol) then
	unobviate( rustypete )
	ally_warp( rustypete, darkwater_ship_pete_warp_to_vol )
	if is_in_volume( petes_dingy, darkwater_ship_pete_warp_to_vol )	then
		unobviate( petes_dingy )
		obviate( petes_dingy1 )
	else
		unobviate( petes_dingy1 )
		obviate( petes_dingy )
	end
end

-- Chooses the start pos based on whether the first ship has been reached

if not SAVE.finale_reached_start then 
	hero_warp( get_hero(), ratchet_warp_finale_start0_vol, true )
	prt("warping to start of taxi ride")
else
	if not has_valid_checkpoint() then
		hero_warp( get_hero(), ratchet_warp_finale_start_vol, true )
	end
	taxi_warp( smugglers_barge, smugglers_barge_warp_vol )
	npc_warp( smuggler, smuggler_warp_finale_start_vol )	
	wait(1.0)
end

run_script("finale_checkpoints")

----------------------------------------------------------------------------------------------------
-- Gameplay Script 
----------------------------------------------------------------------------------------------------

--skinny_pirate_set_scream_area( VOX_DEATH ) --call for pirates to scream if they are knocked overboard.

run_script("finale_boss_slag")
run_script("finale_boss_darkwater" )


function delete_moby_in_area_from_pod(pod, area) 
	local moby = pod:get_first()
	while is_valid(moby) do
		if is_in_area( moby, area ) then
			delete(moby)
		end
		moby = pod:get_next()
	end
end
	
wait()

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

while true do
	
	-- Spawning ammo on the West Ship
	if is_in_volume( get_hero(), slag_west_ship_slag_trigger_vol ) and SAVE.slag_intro_west then
		spawner_spawn( slag_west_ship_ammo_spawner1, ART_CLASS_AMMO_CRATE )
		spawner_spawn( slag_west_ship_ammo_spawner2, ART_CLASS_AMMO_CRATE )
	end
	
	
	-- Spawning ammo on Darkwater's ship
	if is_in_volume( get_hero(), darkwater_trigger_vol ) then
		spawner_spawn( darkwaters_ship_ammo_spawner1, ART_CLASS_AMMO_CRATE )
		spawner_spawn(darkwaters_ship_ammo_spawner2, ART_CLASS_AMMO_CRATE )
	end
	
	-- Spawning ammo on the East Ship
	if is_in_volume( get_hero(), slag_east_ship_slag_trigger_vol ) then
		spawner_spawn( slag_east_ship_ammo_spawner1, ART_CLASS_AMMO_CRATE )
		spawner_spawn( slag_east_ship_ammo_spawner2, ART_CLASS_AMMO_CRATE )
	end

----------------------------------------------------------------------------------------------------
-- Smuggler's Barge
----------------------------------------------------------------------------------------------------

	
	if is_in_volume( get_hero(), reached_start_position_vol ) and (not taxi_is_moving(smugglers_barge)) and not reached_start then
		SAVE.finale_reached_start = true
		request_auto_save()
		prt("setting SAVE.finale_reached_start true")
		reached_start = true
		activate(smuggler)
	end
	
	if reached_start and is_triggered( smuggler ) and not already_triggered_smuggler then
		prt("TRIGGERED SMUGGLER")
		already_triggered_smuggler = true
		queue_scene( "scene_smuggler" )
		wait(0)
		already_triggered_smuggler = false
	end


----------------------------------------------------------------------------------------------------
-- West Ship 
----------------------------------------------------------------------------------------------------
	
	
	-- Bring in Slag and go to cine if its the first time.
	if is_in_volume( get_hero(), slag_west_ship_slag_trigger_vol ) and not slag_west_intro and not SAVE.slag_fight1_completed then
			
		if not SAVE.slag_intro_west then
			queue_scene( "scene_finale_slag_intro" )	
			wait()
			fade_from_black(1)
		else
			captainslagwater_followpath( boss_darkwater, boss_slag_westship_intro_path, 100, 100, 50, true);
			bcs_intro()
			prt("TRIGGERED INTRO: GP203")
		end
		
		set_follow_cam( get_hero(), 10, 0, 0, 3 )
		slag_west_intro = true
		
	end
	
	
	--[[
	-- Slag appears and starts the fight
	if is_in_volume( get_hero(), slag_west_ship_slag_trigger_vol ) and not slag_west_intro then
		debug_message("TEMP: Slag: Ye shouldnee come here, Lombax.", 5)
		bcs_intro() --- Stupid function name for calling Slag
		wait(3.0) -- Need this pause so that somthing futher down doesn't test before Darkwater is inside a volume.
		prt("first Slag fight")
		slag_west_intro = true
	end
	--]]
	
	
	-- Pirates rush out once Slag runs off.
	if get_power_level(bcs_sm) == 1 and not west_ship_north_door and is_current_checkpoint(ratchet_warp_finale_start_vol) then --and not SAVE.tal_freed then
		reset_follow_cam( get_hero() )
		SAVE.slag_fight1_completed = true
		wait(1.0)
		--debug_message( "TEMP: Pirates: Don't worry Cap'n. We'll get 'im! ", 5)
		wait(1.0)
		door_open( slag_west_ship_north_cabin_door )
		foreach_moby_in_pod( undead_west_ship_cabin_melee_pod, awareness_add_targettype, TRG.TT_HERO )
		unobviate( rustypete )
		prt( "West cabin pirates help Slag")
		west_ship_north_door = true
		SAVE.tal_freed = false
	end
	
	--turns on ladder effects
	if is_in_volume( get_hero(), help_thowskulls_vol ) and not ladder_counter_started then
		ladder_counter_started = true
		ladder_counter=get_current_time()
		activate(LadderFlash11)
		prt( "fired first rung")
	end
	
	if ladder_counter_started and get_current_time() >= ( ladder_counter + .25 ) and not second_flash_fired then
		activate(LadderFlash10)
		second_flash_fired = true
		prt( "fired second rung")
	end
	
	if ladder_counter_started and get_current_time() >= ( ladder_counter + .5 ) and not third_flash_fired then
		activate(LadderFlash9)
		third_flash_fired = true
		prt( "fired third rung")
	end
	
	-- Tal calls out to ratchet
	if is_in_volume( get_hero(), help_thowskulls_vol ) and not SAVE.Tal_finale_cageconv and not SAVE.tal_freed and not tal_talk_time then
		tal_talk_time = get_current_time()
	end
	
	if is_in_volume( get_hero(), help_thowskulls_vol ) and not SAVE.Tal_finale_cageconv and not SAVE.tal_freed 
	and get_current_time() - tal_talk_time > 5 then
		tal_talk_time = get_current_time()
		local talk_seed = math.random( 1, 3)
		if talk_seed == 1 then
			speak_and_wait( talwyn, DialogueSpecs.FI_TAL_FORCE_FIELD1, true )
		elseif talk_seed == 2 then
			speak_and_wait( talwyn, DialogueSpecs.FI_TAL_FORCE_FIELD2, true )
		else
			speak_and_wait( talwyn, DialogueSpecs.FI_TAL_FORCE_FIELD3, true )
		end
	end		

	-- Trigger NPC Scene with Tal.
	if is_in_volume( get_hero(), scene_free_tal_vol ) and not SAVE.Tal_finale_cageconv and not SAVE.tal_freed then
		queue_scene("scene_finale_tal_cageconv")
		--queue_scene("scene_finale_pirate_ambush")
		wait()
	end
	
	
		-- Help message to throw Pirate Skulls at the Force Field.
	if is_in_volume( get_hero(), help_thowskulls_vol ) and SAVE.Pirate_ambush_intro_scene and is_update_on( slag_west_ship_forcefield_cage ) then
		helptext( L00_HELP_GPLAY_THROWSKULLATGHOSTFORCEFIELD, "Throw an undead skull at the ghostly forcefield to destroy it.", 10, true, 999 )
	end
	
	-- Spawning Pirates for Pirate Heads.
	if SAVE.Tal_finale_cageconv and not pod_has_heads( spawned_head_pod ) 
	and not SAVE.tal_freed and is_in_volume( get_hero(), help_thowskulls_vol ) then
		door_open( slag_west_ship_west_cabin_door )
		mobyspawner_spawn( spawner_pirates_tal_escape_1, 1 ) 
		mobyspawner_spawn( spawner_pirates_tal_escape_2, 1 )
	end
	
	-- Tal is freed and moves to the catapult on the roof
--	if is_in_volume( get_hero(), scene_free_tal_vol ) and SAVE.Tal_finale_cageconv and 
	
	if not is_update_on( slag_west_ship_forcefield_cage ) and not SAVE.tal_freed  then
		deactivate( spawner_pirates_tal_escape_1 )
		deactivate( spawner_pirates_tal_escape_2 )
		
		if SAVE.scene_finale_tal_cageconv_fulcrum then
			speak( talwyn, DialogueSpecs.FI_TAL_NOSAVE_FULCRUM_RELEASED, true) 
		else
			speak( talwyn, DialogueSpecs.FI_TAL_FULCRUM_RELEASED, true)
		end
		
		ally_equipitem(talwyn, ALLY_ITEM_GUN )
		door_open( slag_west_ship_south_cabin_door )
		door_open( slag_west_ship_north_cabin_door )
		door_open( slag_west_ship_west_cabin_door )
		ally_followpathhover( talwyn, tal_west_ship_path, 5, 5, 5 )
		unobviate_pod( undead_west_ship_roof_shooters_pod )
		wait(1.0)
		ally_setattitude( talwyn, ALLY_ATT_AGGRESSIVE  ) 
		--ally_setfirepoints( talwyn, )
		ally_addtarget( talwyn, undead_west_ship_roof_shooters_pod )
		--ally_addtarget( talwyn, undead_west_ship_roof_shooters_pod )
		prt("Tal is freed and heads to the roof to fight")
		SAVE.tal_freed = true
	end	
	
	--[[
	-- Announce move to Darkwater's ship
	if get_num_alive( undead_west_ship_roof_shooters_pod ) == 0 and not tal_annouce_darkwater_ship then
		ally_setattitude( talwyn, ALLY_ATT_PASSIVE  ) 
		wait(1.0)
		
		ally_cleartargets( talwyn )
		prt("Tal prompts to move ship")
		tal_annouce_darkwater_ship = true
	end
	]]--
	
	-- Finish fight and go to Darkwater's ship	
	if ( is_in_volume( get_hero(), tal_to_darkwaters_ship_vol ) or get_num_alive( undead_west_ship_roof_shooters_pod ) == 0 )
	and not tal_to_darkwaters_ship then
		tal_to_darkwaters_ship = true
		ally_followpathhover( talwyn, tal_west_ship_to_darkwater_ship_path, 15, 15, 25 )
		prt("Tal moves to Darkwaters ship")
	end
	
	
----------------------------------------------------------------------------------------------------
-- Darkwater Fight #1
----------------------------------------------------------------------------------------------------
	
	if not SAVE.darkwater_fight1_complete  then
	
		--[[
		
		get_skullbomb_count - will return the number of skulls spawned in the level (is incremented everytime a skull is spawed)
		
		BossCaptainDarkwaterStateManager lua function:
		
		GetSkullDamageCount() - returns the number of times darkwater has been damaged with the skullbomb. Reset function will rest the count back to 0.
		
		]]--
		if get_skullbomb_count() > 0 and bcd_sm:GetSkullDamageCount() < 1 
		and not SAVE.darkwater_fight1_complete and skull_spawned_time == 0
		and get_power_level(bcs_sm) == 1 and is_update_on( boss_darkwater ) then
			skull_spawned_time = get_current_time()
		end
		
		if get_skullbomb_count() > 0 and bcd_sm:GetSkullDamageCount() < 1 and not SAVE.darkwater_fight1_complete and skull_spawned_time > 0 and
		get_current_time() - skull_spawned_time > 120 then
			helptext( L00_HELP_GPLAY_THROWSKULLATDARKWATER, "Throw an undead skull at Darkwater to damage him.", 30, true, 999 )
			skull_spawned_time = 0
		end
		
		
		-- Darkwater Appears
		if is_in_volume( get_hero(), darkwater_trigger_vol ) and not darkwater_battle1 and not SAVE.darkwater_fight1_complete then
			queue_scene( "scene_finale_slag_intro2" )
			wait(0)
			set_follow_cam( get_hero(), 10, 0, 0, 3 )
			fade_from_black(1)
			darkwater_battle1 = true
			boss_cam = true
		end
		
		-- Adjusts the camera and cleans up ship after Boss fight
		if get_power_level(bcs_sm) > 1 then
			boss_unregister_cam( get_hero(), boss_darkwater )
			ally_setattitude( talwyn, ALLY_ATT_PASSIVE  ) 
			ally_clearfirepoints( talwyn )
			ally_cleartargets( talwyn )
			reset_follow_cam( get_hero() )
			SAVE.darkwater_fight1_complete = true
		end
		
	
	end
	
	if get_power_level(bcs_sm) > 1 and SAVE.darkwater_fight1_complete and not tal_to_east_ship and not SAVE.east_ship_cargo_door then
			deactivate( undead_fx_controller )
			unobviate( pirate_barge_to_eastship )
			wait(1.0)
			trigger( pirate_barge_to_eastship )
			activate( pirate_barge_to_eastship )
			speak( talwyn, DialogueSpecs.PL_TAL_THIS_WAY, true )
			activate( petes_dingy )
			ally_followpathhover( talwyn, tal_darkwaters_ship_to_east_ship_path, 10, 10, 12 )
			prt("Pirate barge moves in")
			tal_to_east_ship = true
			request_auto_save()
	end
	
	--despawn petes dingy and move pete to hookshot when dingy reaches end of line
	if is_in_volume( petes_dingy, pete_barge_end_vol ) and not moved_pete then
		ally_warp( rustypete, pete_warp_to_vol )
		obviate( petes_dingy )
		moved_pete = true
	end
	
	--take care of pirate heads not in volume
	if get_skullbomb_count() > 0 then
		delete_moby_in_area_from_pod( bcd_sm:GetSkullPod(), delete_skull_area )
	end
	
----------------------------------------------------------------------------------------------------
-- East Ship 
----------------------------------------------------------------------------------------------------
	
	-- Move Barge off to East ship
	if is_in_volume( pirate_barge_to_eastship, pirate_barge_to_eastship_stop1_vol ) and is_in_volume( get_hero(), pirate_barge_to_eastship_at_darkwater_vol ) and not goto_east_ship then
		 hero_lockout_control( get_hero(), true)
		 trigger( pirate_barge_to_eastship )
		 activate( pirate_barge_to_eastship )
		 wait(3.0)
		 hero_lockout_control( get_hero(), false)
		 goto_east_ship = true
	end
	
	-- Open the cargo door
	if is_in_volume( get_hero(), slag_east_ship_cargo_door_trig_vol ) then
			obviate( rustypete )
			--elevator_cranked_uncrank( slag_east_ship_boltcrank_elevator )
			crank_reset( slag_east_ship_boltcrank )
			prt("resetting crank")
			door_open( slag_east_ship_cargo_door )
			SAVE.east_ship_cargo_door = true
			request_auto_save()
	end
	
	--Hunchback ambush
	if is_in_volume( get_hero(), slag_east_ship_cargo_door_trig_vol ) and not east_hunch_ambush then
	--		foreach_moby_in_pod( east_ship_hunchback_pod, awareness_add_targettype, TRG.TT_HERO )
			east_hunch_ambush = true
	end

----------------------------------------------------------------------------------------------------
-- East Ship Bolt Crank Camera
----------------------------------------------------------------------------------------------------
	
	if is_in_volume( get_hero(), slag_east_ship_boltcrank_elevator_cam_vol ) and  is_cranking( get_hero(),  slag_east_ship_boltcrank ) and not crank_cam_active then
		activate_cam( get_hero(), slag_east_ship_boltcrank_elevator_cam )
		prt("Crank cam activated")
		crank_cam_active = true
	end
	
	if crank_cam_active and ( crank_is_complete( slag_east_ship_boltcrank ) or not is_in_volume( get_hero(), slag_east_ship_boltcrank_elevator_cam_vol ) ) then
		deactivate_cam( get_hero(), slag_east_ship_boltcrank_elevator_cam )
		crank_cam_active = false
		prt("Crank cam deactivated")
	end

----------------------------------------------------------------------------------------------------
-- Slag Fight 2
----------------------------------------------------------------------------------------------------

		

	-- Slag appears and starts the fight
	if is_in_volume( get_hero(), slag_east_ship_slag_trigger_vol ) and crank_is_complete( slag_east_ship_boltcrank )  and not slag_east_intro 
	and get_power_level(bcs_sm) < 3 then
		if not slag_east_intro then
			queue_scene( "scene_finale_slag_intro3" )
			wait()
		else
			captainslagwater_followpath( boss_darkwater, boss_slag_eastship_intro_path, 100, 100, 50, true);
			bcs_intro()
			prt("TRIGGERED INTRO: GP433")
		end
		
		set_follow_cam( get_hero(), 10, 0, 0, 3 )
		ally_hover_takeoff( talwyn )
		ally_setfirepoints( talwyn, tal_east_ship_firepoints )
		ally_addtarget( talwyn, boss_darkwater )
		ally_setattitude( talwyn, ALLY_ATT_AGGRESSIVE  ) 
		slag_east_intro = true		
	end
	
	-- talwyn bolts after fight
	if get_power_level(bcs_sm) == 3 and slag_east_intro and not talwyn_said_stuff_before_bolting then
		reset_follow_cam( get_hero() )
		talwyn_said_stuff_before_bolting = true
		SAVE.slag_fight2_complete = true
		wait(1.0)
		ally_setattitude( talwyn, ALLY_ATT_PASSIVE  ) 
		speak_and_wait( talwyn, DialogueSpecs.FI_TAL_SHIP_CANNOT_BLOW_UP, true )
		ally_clearfirepoints( talwyn )
		ally_followpathhover( talwyn, slag_east_ship_tal_outro_path, 12, 12, 15 )
	end
	
	--door opens are pirates come out
	if is_current_checkpoint(defeated_slag_east_ship_checkpoint_respawn_vol) 
	and is_in_volume( get_hero(), slag_east_ship_door_trig_vol )
	and not east_ship_north_door then
		door_open( slag_east_ship_north_cabin_door )
		foreach_moby_in_pod( undead_east_ship_cabin_mixed_pod, awareness_add_targettype, TRG.TT_HERO )
		prt("East cabin pirates come to help Slag")
		east_ship_north_door = true
		SAVE.stop_spamming_darkwater_checkpoint = true
		request_auto_save()
	end
	
	-- Bring in Pirates from the side doors
	if east_ship_north_door and is_in_volume( get_hero(), undead_east_ship_cabin_shooters_trig_vol ) and not east_shooter_intro  then	
		unobviate_pod( undead_east_ship_cabin_shooters_pod )
		door_open( slag_east_ship_east_cabin_door )
		door_open( slag_east_ship_west_cabin_door )
		foreach_moby_in_pod( undead_east_ship_cabin_shooters_pod, awareness_add_targettype, TRG.TT_HERO )
		health_set_invulnerability( pirate_east_ship_cabin_hunchback1, true )
		east_shooter_intro = true
	end
	
	--[[
	--lock player in room w/ hunchback
	if not hunchback_ambush_intro_scene and is_in_volume( get_hero(), slag_east_ship_hunchback_ambush_trigger_vol ) then
		door_close(slag_east_ship_north_cabin_door)
		hunchback_ambush_intro_scene = true
	end
	
	-- open door if player somehow escapes
	if hunchback_ambush_intro_scene and is_in_volume( get_hero(), slag_east_ship_slag_trigger_vol ) then
		door_open(slag_east_ship_north_cabin_door)
		hunchback_ambush_intro_scene = false
	end
	]]--
	
	-- Spawning Pirates for Pirate Heads.
	if east_shooter_intro and not pod_has_heads( spawned_head_pod2 ) and is_update_on( slag_east_ship_forcefield_cage ) then
		mobyspawner_spawn( spawner_pirates_hunchback_escape_1, 1 ) 
		mobyspawner_spawn( spawner_pirates_hunchback_escape_2, 1 )
	end
	
	--turn on the hunchback... ohh... kinky.
	if not is_update_on( slag_east_ship_forcefield_cage ) and not hunchback_been_released then
		deactivate( spawner_pirates_hunchback_escape_1 )
		deactivate( spawner_pirates_hunchback_escape_2 )
		health_set_invulnerability( pirate_east_ship_cabin_hunchback1, false )
		enemy_wakeup( pirate_east_ship_cabin_hunchback1 )
		hunchback_been_released = true
	end
	
	-- Open the door to the back of the cabin and intro enemies
	if get_num_alive( undead_east_ship_cabin_shooters_pod ) == 0 and not is_alive( pirate_east_ship_cabin_hunchback1 )  and  not east_ship_south_door then
		door_open( slag_east_ship_south_cabin_door )
		foreach_moby_in_pod( pirate_east_ship_cabin_hunchback_pod, awareness_add_targettype, TRG.TT_HERO )
		east_ship_south_door = true
		unobviate( rustypete )
	end
	

----------------------------------------------------------------------------------------------------
-- Swingshot Ride Camera
----------------------------------------------------------------------------------------------------
	
	if is_in_volume( get_hero(), swingshot_ride_cam_vol ) and not swingshot_ride_cam_active then
		activate_cam( get_hero(), car_ride_cam )
		prt("Swingshot Ride cam activated")
		obviate( pirate_barge_to_eastship )
		speak( rustypete, DialogueSpecs.PETE_L03_MISC086, true )
		swingshot_ride_cam_active = true
	end
	
	if swingshot_ride_cam_active  and is_in_volume( get_hero(), darkwater_trigger_vol ) then
		deactivate_cam( get_hero(), car_ride_cam )
		prt("Swingshot Ride cam deactivated")
		swingshot_ride_cam_active = false
	end



	
----------------------------------------------------------------------------------------------------
-- Darkwater Fight #2
----------------------------------------------------------------------------------------------------

	
	-- Darkwater Appears
	if is_in_volume( get_hero(), darkwater_trigger_vol ) and SAVE.slag_fight2_complete and not darkwater_battle2 then
--		activate( undead_fx_controller )
		if not darkwater_battle2 then
			queue_scene( "scene_finale_slag_intro4" )
			wait(0)
		else
			bcs_intro()
		end
		set_follow_cam( get_hero(), 10, 0, 0, 3 )
		darkwater_battle2 = true
		boss_cam = true
		ally_hover_takeoff( talwyn )
		ally_setfirepoints( talwyn, tal_darkwater_ship_firepoints )
		ally_addtarget( talwyn, captainslagwater_get_darkwater(boss_darkwater) )
		ally_addtarget( talwyn, boss_darkwater )
		ally_setattitude( talwyn, ALLY_ATT_AGGRESSIVE  ) 
	end
	
	-- Adjusts the camera after Boss fight
	if not is_in_volume( get_hero(), darkwater_trigger_vol ) and boss_cam then
		boss_unregister_cam( get_hero(), boss_darkwater )
		reset_follow_cam( get_hero() )
		deactivate( undead_fx_controller )
		boss_cam = false
	end
	
	
	if not is_alive( boss_darkwater ) and not level_done then
		obviate( rustypete)
		obviate( pirate_hookshot_dingy1)
		obviate( talwyn )
		obviate( petes_dingy )
		obviate( petes_dingy1 )
		queue_cinematic( "l00_s09_udead_rt")
		wait()
	--	queue_cinematic("l00_s10_works_rt")
		SAVE.finale_completed = true
		set_level( LEVEL_NPC_ISLAND );
		level_done = true
	end
--------------------------------------------------------------------------------
--CATAPULT CAMERA SCRIPTS
--------------------------------------------------------------------------------

--catapult west
if catapult_west_active == nil then
	if is_in_volume(get_hero(), trig_cam_catapult_west_activate) then
	activate_cam(get_hero(), catapult_west_cam)
	catapult_west_active = true
	end
end

if catapult_west_active == true then
	if is_in_volume(get_hero(), trig_cam_catapult_west_deactivate) then
	deactivate_cam(get_hero(), catapult_west_cam)
	catapult_west_active = nil
	end
end

--catapult east
if catapult_east_active == nil then
	if is_in_volume(get_hero(), trig_cam_catapult_east_activate) then
	activate_cam(get_hero(), catapult_east_cam)
	catapult_east_active = true
	end
end

if catapult_east_active == true then
	if is_in_volume(get_hero(), trig_cam_catapult_east_deactivate) then
	deactivate_cam(get_hero(), catapult_east_cam)
	catapult_east_active = nil
	end
end

wait()

end

