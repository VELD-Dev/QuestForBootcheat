----------------------------------------------------------------------------------------------------
-- Help Script
----------------------------------------------------------------------------------------------------




--second elevator, hidden at first
obviate(boltcrank_elevator_checkpoint_elevator)

--conditionals for revealing cave-in rocks once cave in is triggered

if SAVE.cavein == true then
	unobviate_pod(cavein_rockpod)
	door_remove_boltcrank (vc_gratedoor_caveindoor)
	crank_set_complete(vc_boltcrank1)
	    -- warping talwyn to her trapped position once cave-in happens... but not if she is freed
		if not SAVE.talwynfree == true then
			ally_warp(tal, vc_allywarpvol_talwyn_escapescene)
		end
end

if SAVE.talwynfree == true then

	if is_current_checkpoint(vc_checkpoint_freetalwyn_respawn) then
		ally_warp(tal, vc_trig_petetalk_1)
	end
	
end

---CHECKPOINT CONDITIONALS




--------------------------------------------------------------------------------
-- cavein checkpoint conditionals

if is_current_checkpoint(vc_checkpoint_cavein) then

	if checkpointconditional_cavein == nil then
		ally_warp(rustypete, vc_warpspot_pete_caveincinematic)
		ally_warp(tal, vc_warpspot_talwyn_caveincinematic)
		door_remove_boltcrank (vc_gratedoor_caveindoor)
		door_close(vc_gratedoor_caveindoor)
		unobviate_pod(cavein_rockpod)
		checkpointconditional_cavein = true
		caveintriggered  = true
	end

end
--------------------------------------------------------------------------------
--ledgegrab checkpoint conditionals

if is_current_checkpoint(vc_checkpoint_ledgegrab_respawn) then
	if ledgegrabcheckpointconditions == nil then
	obviate_pod(vc_batgroup_petescare)
	ally_warp(rustypete, vc_ally_warp_vol_pete_ledgegrabcheckpoint)
	ally_equipitem(rustypete, ALLY_ITEM_SLAGSHEAD)
	--ally_warp(tal, vc_allywarpvol_tal_escapescene)
	ledgegrabcheckpointconditions = true
	end
end

--------------------------------------------------------------------------------
--dark area checkpoint conditionals
if is_current_checkpoint(vc_checkpoint_darkarea_respawn) then
	if ledgegrabcheckpointconditions == nil then
	petetalk5 = true
	shadowviperintro = false
	ViperScare2 = true
	obviate_pod(vc_batgroup_petescare)
	ally_warp(rustypete, vc_ally_warp_vol_pete_ledgegrabcheckpoint)
	ally_equipitem(rustypete, ALLY_ITEM_SLAGSHEAD)
	--ally_warp(tal, vc_allywarpvol_tal_escapescene)
	ledgegrabcheckpointconditions = true
	end
end

--------------------------------------------------------------------------------
if not SAVE.vc_escape_start == true then
--elevator checkpoint conditionals
	if is_current_checkpoint(vc_checkpoint_elevator) then
		if elevavatorcheckpointconditions == nil then
		obviate_pod(vc_batgroup_petescare)
		crank_set_complete(vc_boltcrank2)
		ally_warp(rustypete, vc_ally_warp_vol_pete_elevatorcheckpoint)
		ally_equipitem(rustypete, ALLY_ITEM_SLAGSHEAD)
		--ally_warp(tal, vc_allywarpvol_tal_escapescene)
		elevavatorcheckpointconditions = true
		playeratbridge = true
		flybyviper = true
		shadowviperintro = true
		end
	end
end

--------------------------------------------------------------------------------
--darkwater cave checkpoint conditionals

if is_current_checkpoint(vc_checkpoint_darkwatercave_respawn) then
	ally_warp(rustypete, vc_herowarpvol_darkwatershipentrance)
	ally_equipitem(rustypete, ALLY_ITEM_SLAGSHEAD)
	SAVE.darkwater_cinematic_done = 1
	if not SAVE.vc_escape_start == true then
		activate_cam(get_hero(), cam_view_darkwatership)
	end
	--ally_warp(tal, vc_allywarpvol_tal_escapescene)
end
	


--------------------------------------------------------------------------------

-- balancebeams checkpoint conditionals

if is_current_checkpoint(vc_checkpoint_balancebeams_respawn) then
	pete_rail_dialogue = true
	ally_warp(rustypete, vc_herowarpvol_darkwatershipentrance)
	ally_equipitem(rustypete, ALLY_ITEM_SLAGSHEAD)
	ally_warp(tal, tal_fightviper_land_vol1)
	--ally_warp(tal, vc_allywarpvol_tal_escapescene)
	flyawaybatstriggered = true

end

--------------------------------------------------------------------------------
-- 2 vipers checkpoint conditionals


if is_current_checkpoint(vc_checkpoint_2vipers_respawn) then
	pete_rail_dialogue = true
	ally_warp(rustypete, vc_herowarpvol_darkwatershipentrance)
	ally_equipitem(rustypete, ALLY_ITEM_SLAGSHEAD)
	obviate_pod(vc_batpod_boltcrankelevator)
	--ally_warp(tal, vc_allywarpvol_tal_escapescene)
	unobviate(boltcrank_elevator_checkpoint_elevator)
end


--------------------------------------------------------------------------------

-- escape checkpoint conditionals
if is_current_checkpoint(vc_checkpoint_escape_respawn) then
	pete_rail_dialogue = true
	obviate(rustypete)
	obviate_pod(darkwater_cinematic_objects_hidden)
	--ally_warp(tal, vc_allywarpvol_tal_escapescene)
	unobviate(cave_viper)
end
--------------------------------------------------------------------------------

-- jumppad checkpoint conditionals

if is_current_checkpoint(vc_checkpoint_jumppad_respawn) then
	obviate(rustypete)
	obviate_pod(vc_arenapirates_group1)
	obviate_pod(vc_arenapirates_group2)
	obviate_pod(vc_arenapirates_group3)
	obviate_pod(vc_arenapirates_group4)
	obviate_pod(darkwater_cinematic_objects_hidden)
	--ally_warp(tal, vc_allywarpvol_tal_escapescene)
	unobviate(cave_viper)
end

--------------------------------------------------------------------------------

-- viper elevator checkpoint conditionals

if SAVE.vc_escape_start == true then
	if is_current_checkpoint(vc_checkpoint_elevator_viper_respawn) then
		obviate(rustypete)
		obviate_pod(vc_arenapirates_group1)
		obviate_pod(vc_arenapirates_group2)
		obviate_pod(vc_arenapirates_group3)
		obviate_pod(vc_arenapirates_group4)
		obviate_pod(vc_batgroup_petescare)
		obviate_pod(darkwater_cinematic_objects_hidden)
		--ally_warp(tal, vc_allywarpvol_tal_escapescene)
		--obviate(vc_cavernelevator1)
		--unobviate(vc_cavernelevator)
		obviate(iris_kh_pirate_bridge1)
		unobviate(cave_viper)
		delete(vc_escape_pirates_group2)
		door_remove_boltcrank(vc_gratedoor_todarkwatership)
		damage(vc_gratedoor_todarkwatership, 200)
	end
end
--------------------------------------------------------------------------------

-- free tal checkpoint conditionals


if is_current_checkpoint(vc_checkpoint_freetalwyn_respawn) then
	obviate(rustypete)
	damage(ja_vc_gratedoor1, 200)
	obviate_pod(darkwater_cinematic_objects_hidden)
	--ally_warp(tal, vc_allywarpvol_tal_escapescene)
end
--------------------------------------------------------------------------------

-- talywn has been rescued checkpoint conditionals

if is_current_checkpoint(checkpoint_vol_tal_free) then
	ally_warp(tal, tal_fightviper_land_vol1)
 	ally_followpath(tal,vc_talwynpath_returntoship,true,false)
 	damage(vc_gratedoor_caveindoor, 300)
 	damage(ja_vc_gratedoor1, 300)
 	unobviate(vc_cavernelevator)
 	deactivate(vc_cavernelevator)
 	obviate(vc_cavernelevator1)
 	obviate_pod(dead_pirates_combatgroup)
 	obviate_pod(vc_batgroup_petescare)
 	damage(ja_vc_gratedoor2, 300)
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--MAIN LOOP
--------------------------------------------------------------------------------



while true do




if not (SAVE.vc_escape_start) == true then

	--start dock checkpoint
	
	if not (SAVE.cavein) == true then
	
		if is_in_volume(get_hero(),vc_checkpoint_start )then
			
		    SAVE.viper_cavern_started = true
			checkpoint_volume(vc_checkpoint_start_respawn)
			prt(" start checkpoint activated")
			 
		end
		
	end
	
	--============================================================================--
	--------------------------------------------------------------------------------
	-- cavein checkpoint
	
	if (SAVE.cavein) == true then
		if caveincheckpoint == nil then
			if is_in_volume(get_hero(), vc_checkpoint_cavein_volume) then
			door_remove_boltcrank (vc_gratedoor_caveindoor)
				crank_set_complete(vc_boltcrank1)
				checkpoint_volume(vc_checkpoint_cavein)
				prt(" start checkpoint cavein")
				caveincheckpoint = true
				request_auto_save() 
			end
		end
	end
	
	
	if is_current_checkpoint(vc_checkpoint_cavein) then
	
		if ratchethelpingtalwyn == nil then
			
			--debug_message("Tal: Ratchet... come help!!", 3)
			--wait(3.5)
			
		end
	end
	
	if is_current_checkpoint(vc_checkpoint_cavein) then
	
	if SAVE.cave_in_dialogue_finished == true then
		if caveincinematictriggered == nil then
			if is_in_volume(get_hero(), vc_trig_npcscene_taltrapped) then
				queue_scene( "vc_scene_talwyn_trapped")
				caveincinematictriggered = true
			end
		end
	end	
	end
	--------------------------------------------------------------------------------
	--============================================================================--
	
	
	--============================================================================--
	--------------------------------------------------------------------------------
	
	
	
		
	--============================================================================--
	--------------------------------------------------------------------------------
	--ledgegrab checkpoint
	if ledgegrab_checkpoint == nil then
	if is_in_volume(rustypete,vc_checkpoint_ledgegrab)then
		checkpoint_volume(vc_checkpoint_ledgegrab_respawn)
		prt(" ledgegrab checkpoint activated")
		ledgegrab_checkpoint = true
	end
	end
	
 if ledgegrab_checkpoint == true then
	if not is_in_volume(rustypete,vc_checkpoint_ledgegrab)then
		ledgegrab_checkpoint = nil
		prt("ledgegrab checkpoint deactivated")
	end
	end
	
	
	
	
	--------------------------------------------------------------------------------
	--============================================================================--
	
	
	
	--============================================================================--
	--------------------------------------------------------------------------------
	--dark area checkpoint
	if dark_area_checkpoint == nil then
	if is_in_volume(get_hero(),vc_checkpoint_darkarea)then
		checkpoint_volume(vc_checkpoint_darkarea_respawn)
		prt(" dark area checkpoint activated")
		dark_area_checkpoint = true
	end
	end
	
	if dark_area_checkpoint == true then
	if not is_in_volume(get_hero(),vc_checkpoint_darkarea)then
		prt(" dark area checkpoint deactivated")
		dark_area_checkpoint = nil
	end
	end
	
	
	
	--------------------------------------------------------------------------------
	--============================================================================--
	
	
	
	
	--============================================================================--
	--------------------------------------------------------------------------------
	--elevator checkpoint
	if elevator_checkpoint == nil then
	if is_in_volume(get_hero(),vc_checkpoint_elevator)then
		checkpoint_volume(vc_checkpoint_elevator_respawn)
		prt(" elevator checkpoint activated")
		elevator_checkpoint = true
	end
	end
	
	if elevator_checkpoint == true then
	if not is_in_volume(get_hero(),vc_checkpoint_elevator)then
		prt(" elevator checkpoint deactivated")
		elevator_checkpoint = nil
	end
	end
	
	
	
	--------------------------------------------------------------------------------
	--============================================================================--
	
	
	--darkwatercave checkpoint
	if darkwater_checkpoint == nil then
	if is_in_volume(get_hero(),vc_checkpoint_darkwatercave)then
		checkpoint_volume(vc_checkpoint_darkwatercave_respawn)
		prt(" darkwatercave checkpoint activated")
		darkwater_checkpoint = true
	end
	end
	
	if darkwater_checkpoint == true then
	if not is_in_volume(get_hero(),vc_checkpoint_darkwatercave)then
		prt(" darkwatercave checkpoint deactivated")
		darkwater_checkpoint = nil
	end
	end
	
	
	
	
--------------------------------------------------------------------------------
--============================================================================--	
	--balancebeams checkpoint
	if balacebeam_checkpoint == nil then
	if is_in_volume(get_hero(),vc_checkpoint_balancebeams)then
		checkpoint_volume(vc_checkpoint_balancebeams_respawn)
		prt(" balancebeams checkpoint activated")
		balacebeam_checkpoint = true
	end
	end
	
	if balacebeam_checkpoint == true then
	if not is_in_volume(get_hero(),vc_checkpoint_balancebeams)then
		prt(" balancebeams checkpoint deactivated")
		balacebeam_checkpoint = nil
	end
	end
	
	
--------------------------------------------------------------------------------
--============================================================================--	
	--2vipers checkpoint
	if twovipers_checkpoint == nil then
	if is_in_volume(get_hero(),vc_checkpoint_2vipers)then
		checkpoint_volume(vc_checkpoint_2vipers_respawn)
		prt(" 2vipers checkpoint activated")
		twovipers_checkpoint = true
	end
	end
	
	if twovipers_checkpoint == true then
	if not is_in_volume(get_hero(),vc_checkpoint_2vipers)then
		prt(" 2vipers checkpoint deactivated")
		twovipers_checkpoint = nil
	end
	end


--------------------------------------------------------------------------------
--============================================================================--	
	--escape checkpoint
	if escape_checkpont == nil then
	if is_in_volume(get_hero(),vc_checkpoint_escape)then
		checkpoint_volume(vc_checkpoint_escape_respawn)
		prt(" escape checkpoint activated")
		escape_checkpont = true
	end
	end
	
	if escape_checkpont == true then
	if not is_in_volume(get_hero(),vc_checkpoint_escape)then
		prt(" escape checkpoint deactivated")
		escape_checkpont = nil
	end
	end


--------------------------------------------------------------------------------
--============================================================================--	
	--jumppad checkpoint
	if jumppad_checkpoint == nil then
	if is_in_volume(get_hero(),vc_checkpoint_jumppad)then
		checkpoint_volume(vc_checkpoint_jumppad_respawn)
		prt(" jumppad checkpoint activated")
		jumppad_checkpoint = true
	end
	end
	
	if jumppad_checkpoint == true then
	if not is_in_volume(get_hero(),vc_checkpoint_jumppad)then
		prt(" jumppad checkpoint deactivated")
		jumppad_checkpoint = nil
	end
	end


--------------------------------------------------------------------------------
--============================================================================--	

end

if SAVE.vc_escape_start == true then
	if not SAVE.talwyn_rescued == true then
		--elevator viper checkpoint
		if elevator_viper_checkpoint == nil then
			if is_in_volume(get_hero(),vc_checkpoint_elevator_viper)then
				checkpoint_volume(vc_checkpoint_elevator_viper_respawn)
				prt(" elevator viper checkpoint activated")
				elevator_viper_checkpoint = true
			end
		end
		
		if elevator_viper_checkpoint == true then
			if not is_in_volume(get_hero(),vc_checkpoint_elevator_viper)then
				prt(" elevator viper checkpoint deactivated")
				elevator_viper_checkpoint = nil
			end
		end
		
		
		
	--------------------------------------------------------------------------------
	--============================================================================--
			
		--free tal checkpoint
		--[[
		if not SAVE.talwyn_rescued == true then
			if free_tal_checkpoint == nil then
				if is_in_volume(get_hero(),vc_checkpoint_freetalwyn)then
					checkpoint_volume(vc_checkpoint_freetalwyn_respawn)
					prt(" freetal checkpoint activated")
					free_tal_checkpoint = true
				end
			end
	
		  if free_tal_checkpoint == true then
				if not is_in_volume(get_hero(),vc_checkpoint_freetalwyn)then
					prt(" freetal checkpoint deactivated")
					free_tal_checkpoint = nil
				end
			end
		end
		--]]	
	end
end


  wait()

end

-- end gameplay, this occurs when the user gets to viper caverns