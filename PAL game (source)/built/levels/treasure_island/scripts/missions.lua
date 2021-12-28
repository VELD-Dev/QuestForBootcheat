local run_once_drink = 1
local run_once_organ = 1

while true do
--drink puzzle complete = SAVE.completed_drink_puzzle = true
--music puzzle complete = if SAVE.completed_organ_puzzle == true then

--HERE BAD CHECK--------------------------------------------------------------
	if SAVE.scene_postbattle_smuggler_translate and SAVE.missions_meettal then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_FINDTRANSLATOR)
		npc_icon_off(talwyn)
		SAVE.missions_meettal = false
		prt("Mission Complete: Find a translator")
	end

--find someone to translate the map--------------------------------------------------------------
	if SAVE.scene_postbattle_smuggler_decoded and SAVE.missions_decode then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_DECODE)
		npc_icon_off(npc_smuggler)
		SAVE.missions_decode = false
		prt("Mission Complete: Pay Smuggler to Decode the Map")
	end

--TRAVEL TO DARKWATER COVE-----------------------------------------------------------------------------
	if SAVE.missions_darkwatercove then
		complete_mission(LEVEL_NPC_ISLAND, L02_LABEL_MISSION_TRAVELDARKWATER)
		SAVE.missions_darkwatercove = false
		prt("Mission Completed: Travel to Darkwater Cove")
	end
	
--SEARCH FOR CLUES-----------------------------------------------------------------------
	if --[[SAVE.missions_darkwatercove == false and]] SAVE.missions_search_clues == nil then
		add_mission(LEVEL_TREASURE_ISLAND, L03_LABEL_MISSION_SEARCHFORCLUES, L03_DESC_MISSION_SEARCHFORCLUES, true)
		npc_icon_on(talking_skull_beach_door, MAPICON_PIRATE_PUZZLE)
		SAVE.missions_search_clues = true
		prt("Mission Added: Search for Cloos")
	end

	if SAVE.missions_search_clues and SAVE.beach_cam then
		complete_mission(LEVEL_TREASURE_ISLAND, L03_LABEL_MISSION_SEARCHFORCLUES)
		npc_icon_off(talking_skull_beach_door)
		SAVE.missions_search_clues = false
		prt("Mission Completed: Clues have been searched.")
	end


--SOLVE THE RIDDLES OF DARKWATER-----------------------------------------------------------------------
	if SAVE.beach_cam and SAVE.missions_riddles == nil then
		add_mission(LEVEL_TREASURE_ISLAND, L03_LABEL_MISSION_SOLVERIDDLES, L03_DESC_MISSION_SOLVERIDDLES, true)
		npc_icon_on(drink_pirate, MAPICON_PIRATE_PUZZLE)
		npc_icon_on(light_pirate, MAPICON_PIRATE_PUZZLE)
		npc_icon_on(organ_pirate, MAPICON_PIRATE_PUZZLE)
		SAVE.missions_riddles = true
		prt("Mission Added: Solve the Riddles of Darkwater")
	end
	
	if SAVE.drink_puzzle_complete_cam and run_once_drink == 1 then
		npc_icon_off(drink_pirate)
		run_once_drink = 0
	end

	if SAVE.completed_organ_puzzle and run_once_organ == 1 then
		npc_icon_off(organ_pirate)
		run_once_organ = 0
	end

	if SAVE.completed_light_puzzle and SAVE.missions_riddles then
		complete_mission(LEVEL_TREASURE_ISLAND, L03_LABEL_MISSION_SOLVERIDDLES)
		npc_icon_off(light_pirate)
		SAVE.missions_riddles = false
		prt("Mission Completed: Solve the Riddles of Darkwater")
	end

--FIGHT LIKE A PIRATE----------------------------------------------------------	
	if SAVE.completed_light_puzzle and SAVE.missions_fight == nil then
		add_mission(LEVEL_TREASURE_ISLAND, L03_LABEL_MISSION_FIGHTLIKEPIRATE, L03_DESC_MISSION_FIGHTLIKEPIRATE, true)
		SAVE.missions_fight = true
		prt("Mission Added: Fight like a Pirate!")
	end

	if has_scene_played("scene_battlefield_success") and SAVE.missions_fight then
		complete_mission(LEVEL_TREASURE_ISLAND, L03_LABEL_MISSION_FIGHTLIKEPIRATE)
		SAVE.missions_fight = false
		prt("Mission Completed: Fight like a Pirate!")
	end
	

--ENTER THE TREASURE ROOM----------------------------------------------------------	
	if has_scene_played("scene_battlefield_success") and SAVE.missions_treasure == nil then
		add_mission(LEVEL_TREASURE_ISLAND, L03_LABEL_MISSION_ENTERTREASUREROOM, L03_DESC_MISSION_ENTERTREASUREROOM, true)
		activate(treasure_room_map_icon_controller)
		SAVE.missions_treasure = true
		prt("Mission Added: Enter the Treasure Room")
	end

	if has_cinematic_played("l03_s09_dropp_rt_rt") and SAVE.missions_treasure then
		complete_mission(LEVEL_TREASURE_ISLAND, L03_LABEL_MISSION_ENTERTREASUREROOM)
		deactivate(treasure_room_map_icon_controller)
		SAVE.missions_treasure = false
		prt("Mission Completed: Enter the Treasure Room")
	end


--ESCAPE DEADLY CAVES----------------------------------------------------------	
	if SAVE.vc2_entered and SAVE.missions_deadlycaves == nil then
		add_mission(LEVEL_TREASURE_ISLAND, L03_LABEL_MISSION_ESCAPEDEADLYCAVES,L03_DESC_MISSION_ESCAPEDEADLYCAVES, true)
		SAVE.missions_deadlycaves = true
		prt("Mission Added: oh noes! Escape teh deadly caves!")
	end

	if SAVE.completed_treasure_island and SAVE.missions_deadlycaves then
		complete_mission(LEVEL_TREASURE_ISLAND,L03_LABEL_MISSION_ESCAPEDEADLYCAVES)
		SAVE.missions_deadlycaves = false
		prt("Mission Completed: oh noes! Escape teh deadly caves!")
	end

--TRACK DOWN CAPTAIN SLAG----------------------------------------------------------	
	if SAVE.completed_treasure_island and SAVE.missions_trackslag == nil then
		add_mission(LEVEL_TREASURE_ISLAND,L03_LABEL_MISSION_TRACKDOWNFULCRUMSTAR,L03_DESC_MISSION_TRACKDOWNFULCRUMSTAR, true)
		npc_icon_on(biggamehunterer, MAPICON_QUESTION_MARK)
		SAVE.missions_trackslag = true
		prt("Mission Added: Track Down Captain Slag")
	end

	--Completes at boss fight

	
wait()
	
end
	