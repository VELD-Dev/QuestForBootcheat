--Missions here

while true do

--MEET RUSTY PETE(added in npc island)-------------------------------------
	if has_scene_played("scene_taxi_intro") and SAVE.missions_meetpete then
		--wait(1.0)
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_MEETPETE)
		npc_icon_off(rustypete)
		SAVE.missions_meetpete = false
		prt("Mission Complete: Mete Pete")
	end		
	
--GO TO MORROW CAVERNS(potentially added in NPC Island)--------------------------------
	if has_scene_played("scene_taxi_intro") and SAVE.missions_morrow == nil then
		add_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_TRAVELTOMORROW, L02_DESC_MISSION_TRAVELTOMORROW, true)
		--npc_icon_on(rustypete, MAPICON_QUESTION_MARK)
		SAVE.missions_morrow = true
		prt("Mission Added: Go to Morrow Caverns")
	end
	
	if has_scene_played("scene_taxi_intro") and SAVE.missions_morrow then
		--wait(1.0)
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_TRAVELTOMORROW)
		SAVE.missions_morrow = false
		prt("Mission Completed: Go to Morrow Caverns")
	end

--FIND DARKWATER----------------------------------------------------------	
	if has_scene_played("scene_taxi_intro") and SAVE.missions_finddarkwater == nil then
		--wait(1.0)
		add_mission(LEVEL_VIPER_CAVERNS, L02_LABEL_MISSION_FINDDARKWATER, L02_DESC_MISSION_FINDDARKWATER, true)
		SAVE.missions_finddarkwater = true
		prt("Mission Added: Find the body of Darkwater")
	end

	if has_cinematic_played("l02_s08_dtomb_rt") and SAVE.missions_finddarkwater then
		complete_mission(LEVEL_VIPER_CAVERNS, L02_LABEL_MISSION_FINDDARKWATER)
		SAVE.missions_finddarkwater = false
		prt("Mission Completed: Find the body of Darkwater")
	end
	
--ESCAPE MORROW CAVERNS----------------------------------------------------------	
	if has_cinematic_played("l02_s08_dtomb_rt") and SAVE.missions_escape == nil then
		add_mission(LEVEL_VIPER_CAVERNS, L02_LABEL_MISSION_ESCAPEMORROW, L02_DESC_MISSION_ESCAPEMORROW, true)
		--activate(ReturnTaxiMapIconController)
		SAVE.missions_escape = true
		prt("Mission Added: Escape Morrow Caverns")
	end
	
	--Completes in NPC Island

--TALYWN RESCUED----------------------------------------------------------	
	if SAVE.talwynfree and SAVE.missions_rescuetal == nil then
		add_mission(LEVEL_VIPER_CAVERNS, L02_LABEL_MISSION_TALWYNRESCUED, L02_DESC_MISSION_TALWYNRESCUED, true)
		SAVE.missions_rescuetal = true
		prt("Mission Added: Rescue Talwyn")
	end

	if SAVE.talwynfree and SAVE.missions_rescuetal then
		complete_mission(LEVEL_VIPER_CAVERNS, L02_LABEL_MISSION_TALWYNRESCUED)
		SAVE.missions_rescuetal = false
		prt("Mission Completed: Rescue Talwyn")
	end

wait()
	
end

