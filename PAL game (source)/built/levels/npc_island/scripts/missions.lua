--mission logic here

--list of enums
--//q4b/code/devel/project/gameps3/packages/core_loc.h

while true do

	if SAVE.missions_fightpirates == true then
		complete_mission(LEVEL_PROLOGUE, L01_LABEL_MISSION_FIGHTPIRATES)
		SAVE.missions_fightpirates = false
		prt("Mission Complete: Fight the Pirates")
	end

--EXPLORE HOOLEFAR ISLAND----------------------------------------------------------	
	if has_cinematic_played("l01_s04_clank_rt") and SAVE.missions_explorehoolefar == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_EXPLOREHOOLEFAR, L02_DESC_MISSION_EXPLOREHOOLEFAR, true)
		SAVE.missions_explorehoolefar = true
		prt("Mission Added: Explore Hoolefar Island")
	end

	if SAVE.scene_mayor_intro and SAVE.missions_explorehoolefar then
		--wait(1.0)
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_EXPLOREHOOLEFAR)
		SAVE.missions_explorehoolefar = false
		prt("Mission Completed: Explore Hoolefar Island")
	end

--REPAIR WINDMILLS ----------------------------------------------------------------
	if SAVE.scene_mayor_intro and SAVE.missions_repairwind == nil then
		--wait(1.0)
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_REPAIRWIND, L02_DESC_MISSION_REPAIRWIND, true)
		SAVE.missions_repairwind = true
		prt("Mission Added: Repair Windmills")
	end

	if SAVE.windmill1_complete == true and SAVE.windmill2_complete == true and SAVE.windmill3_complete == true and SAVE.windmill4_complete == true and SAVE.windmill5_complete and SAVE.missions_repairwind then
		--wait(1.0)
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_REPAIRWIND)
		SAVE.missions_repairwind = false
		prt("Mission Completed: Repair Windmills")
	end

--FIND BEACON --------------------------------------------------------------------
	if SAVE.windmill1_complete == true and SAVE.windmill2_complete == true and SAVE.windmill3_complete == true and SAVE.windmill4_complete == true and SAVE.windmill5_complete and SAVE.missions_findbeacon == nil then
		--wait(1.0)
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_FINDBEACON, L02_DESC_MISSION_FINDBEACON, true)
		SAVE.missions_findbeacon = true
		prt("Mission Added: Find Beacon")
	end

	--This is triggered in the "scene_lighthouse" script in f_LighthouseResponse_ActiveFindBolt()
	if SAVE.scene_smuggler_get_bolt and SAVE.missions_findbeacon then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_FINDBEACON)
		SAVE.missions_findbeacon = false
		prt("Mission Complete: Find Beacon")
	end

--FIND THE GUY WITH THE BEACON PART----------------------------------------------------------------
	if SAVE.scene_smuggler_get_bolt and SAVE.missions_findsmuggler == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_FINDSMUGGLER, L02_DESC_MISSION_FINDSMUGGLER, true)
		npc_icon_on(npc_smuggler, MAPICON_QUESTION_MARK)
		SAVE.missions_findsmuggler = true
		prt("Mission Added: Find Smuggler")
	end
	
	if SAVE.scene_smuggler_ratchet_state == 2 and SAVE.missions_findsmuggler then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_FINDSMUGGLER)
		npc_icon_off(npc_smuggler)
		SAVE.missions_findsmuggler = false
		prt("Mission Complete: Find Smuggler")
	end		
	
--BUY THE BEACON BOLT----------------------------------------------------------------------------
	if SAVE.scene_smuggler_ratchet_state == 2 and SAVE.missions_buybolt == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_BUYBEACONPART, L02_DESC_MISSION_BUYBEACONPART, true)
		npc_icon_on(npc_smuggler, MAPICON_QUESTION_MARK)
		SAVE.missions_buybolt = true
		prt("Mission Added: Buy Bolt")
	end
	
	if hero_has_object(get_hero(), OBJ_BEACON_PART) and SAVE.missions_buybolt then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_BUYBEACONPART)
		npc_icon_off(npc_smuggler)
		SAVE.missions_buybolt = false
		prt("Mission Complete: Buy Bolt")
	end			
	
--RETURN BEACON BOLT----------------------------------------------------------------------------
	if hero_has_object(get_hero(), OBJ_BEACON_PART) and SAVE.missions_returnbolt == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_RETURNBEACONPART, L02_DESC_MISSION_RETURNBEACONPART, true)
		npc_icon_on(npc_lighthouse, MAPICON_QUESTION_MARK)
		SAVE.missions_returnbolt = true
		prt("Mission Added: Return Bolt")
	end
	
	--Triggered in scene_lighthouse in f_lighthouseresponse_boltheadopen()
	if SAVE.lighthouse_bottom_bolt_replaced and SAVE.missions_returnbolt then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_RETURNBEACONPART)
		npc_icon_off(npc_lighthouse)
		SAVE.missions_returnbolt = false
		prt("Mission Complete: Return Bolt")
	end	

--REPARE TEH BEECON----------------------------------------------------------------------------
	if SAVE.lighthouse_bottom_bolt_replaced and SAVE.missions_repairbeacon == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_REPAIRBEACON, L02_DESC_MISSION_REPAIRBEACON, true)
		SAVE.missions_repairbeacon = true
		prt("Mission Added: REEPARE BEECONZ")
	end
	
	--Triggered in scene_lighthouse_view
	if SAVE.scene_lighthouse_state == 4 and SAVE.missions_repairbeacon then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_REPAIRBEACON)
		SAVE.missions_repairbeacon = false
		prt("Mission Complete: REPARE BEEKON")
	end		

--FIND THE MAYOR------------------------------------------------------------------------------
	--Triggers in scene_lighthouse_view
	if SAVE.scene_lighthouse_state == 4 and SAVE.missions_findmayor == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_FINDMAYOR, L02_DESC_MISSION_FINDMAYOR, true)
		npc_icon_on(npc_mayor, MAPICON_QUESTION_MARK)
		SAVE.missions_findmayor = true
		prt("Mission Added: Find Mayor")
	end

	if SAVE.obsidian_eye_revealed and SAVE.missions_findmayor then
		--wait(1.0)
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_FINDMAYOR)
		npc_icon_off(npc_mayor)
		SAVE.missions_findmayor = false
		prt("Mission Complete: Find Mayor")
	end		
	
--MEET RUSTY PETE-----------------------------------------------------------------------------
	if SAVE.obsidian_eye_revealed and SAVE.missions_meetpete == nil then
		--wait(1.0)
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_MEETPETE, L02_DESC_MISSION_MEETPETE, true)
		npc_icon_on(rustypete, MAPICON_QUESTION_MARK)
		SAVE.missions_meetpete = true
		prt("Mission Added: Mete Pete")
	end

	if SAVE.island_prebatte_meet_pete and SAVE.missions_meetpete then
		--wait(1.0)
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_MEETPETE)
		npc_icon_off(rustypete)
		SAVE.missions_meetpete = false
		prt("Mission Complete: Mete Pete")
	end		

--GO TO MORROW CAVERNS------------------------------------------------------------------------
	if SAVE.island_prebatte_meet_pete and SAVE.missions_morrow == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_TRAVELTOMORROW, L02_DESC_MISSION_TRAVELTOMORROW, true)
		npc_icon_on(rustypete, MAPICON_QUESTION_MARK)
		SAVE.missions_morrow = true
		prt("Mission Added: Go to Morrow Caverns")
	end

	--Completes in Viper Caverns
	
--ESCAPE MORROW CAVERNS(Added in Viper Caverns)----------------------------------------------
	if SAVE.completed_viper_cavern and SAVE.missions_escape then
		complete_mission(LEVEL_VIPER_CAVERNS, L02_LABEL_MISSION_ESCAPEMORROW)
		npc_icon_off(rustypete)
		SAVE.missions_escape = false
		prt("Mission Completed: Escape Morrow Caverns")
	end	
	
--WARN THE MAYOR
	if SAVE.completed_viper_cavern and SAVE.missions_warn_mayor == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_WARNTHEMAYOR, L02_DESC_MISSION_WARNTHEMAYOR, true)
		SAVE.missions_warn_mayor = true
		prt("Mission Added: Warn the Mayor")
	end
	
	if has_scene_played("scene_battle_mayor") and SAVE.missions_warn_mayor then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_WARNTHEMAYOR)
		SAVE.missions_warn_mayor = false
		prt("Mission Completed: Warn the Mayor")
	end

--BATTLE UNDEAD PIRATES-----------------------------------------------------------------------------
	if has_scene_played("scene_battle_mayor") and SAVE.missions_battleundead == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_BATTLEUNDEAD, L02_DESC_MISSION_BATTLEUNDEAD, true)
		SAVE.missions_battleundead = true
		prt("Mission Added: Battle the Undead Pirates!")
	end

	if SAVE.completed_island_battle and SAVE.missions_battleundead then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_BATTLEUNDEAD)
		SAVE.missions_battleundead = false
		prt("Mission Complete: Battle the Undead Pirates!")
	end	

--MEET TALWYN AT THE DOCK-----------------------------------------------------------------------------
	if SAVE.completed_island_battle and SAVE.missions_meettal == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_FINDTRANSLATOR, L02_DESC_MISSION_FINDTALWYN, true)
		npc_icon_on(tal, MAPICON_QUESTION_MARK)
		SAVE.missions_meettal = true
		prt("Mission Added: Find a translator")
	end

	--HERE BAD CHECK
	if SAVE.scene_postbattle_smuggler_translate and SAVE.missions_meettal then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_FINDTRANSLATOR)
		npc_icon_off(tal)
		SAVE.missions_meettal = false
		prt("Mission Complete: Find a translator")
	end
	
--PAY SMUGGLER TO DECODE MAP-----------------------------------------------------------------------------
	if SAVE.scene_postbattle_smuggler_translate and SAVE.missions_decode == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_DECODE, L02_DESC_MISSION_DECODE, true)
		npc_icon_on(npc_smuggler, MAPICON_QUESTION_MARK)
		SAVE.missions_decode = true
		prt("Mission Added: Pay Smuggler to Decode the Map")
	end

	if SAVE.scene_postbattle_smuggler_decoded and SAVE.missions_decode then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_DECODE)
		npc_icon_off(npc_smuggler)
		SAVE.missions_decode = false
		prt("Mission Complete: Pay Smuggler to Decode the Map")
	end	

--TRAVEL TO DARKWATER COVE-----------------------------------------------------------------------------
	if SAVE.scene_postbattle_smuggler_decoded and SAVE.missions_darkwatercove == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_TRAVELDARKWATER, L02_DESC_MISSION_TRAVELDARKWATER, true)		
		npc_icon_on(npc_smuggler, MAPICON_QUESTION_MARK)
		SAVE.missions_darkwatercove = true
		prt("Mission Added: Travel to Darkwater Cove")
	end

	--Completes in Treasure Island

wait()

end

--woot