--Missions

while true do

--PROLOGUE
--FIGHT THE PIRATES---------------------------------------------------------
	--if has_cinematic_played("S01_BOOK_RT") and SAVE.missions_fightpirates == nil then
	if SAVE.first_cinematic_played and SAVE.missions_fightpirates == nil then
		add_mission(LEVEL_PROLOGUE, L01_LABEL_MISSION_FIGHTPIRATES, L01_DESC_MISSION_FIGHTPIRATES, true)
		SAVE.missions_fightpirates = true
		prt("Mission Added: Fight the Pirates")
	end

--[[
	if is_in_volume(get_hero(), missions_fight_pirate_vol) and SAVE.missions_fightpirates == true then
		complete_mission(LEVEL_PROLOGUE, L01_LABEL_MISSION_FIGHTPIRATES)
		SAVE.missions_fightpirates = false
		prt("Mission Complete: Fight the Pirates")
	end
]]--	
--BOSS	
--TRACK DOWN CAPTAIN SLAG(added in Treasure Island)----------------------------------------------------------	
	if SAVE.completed_treasure_island and SAVE.missions_trackslag then
		complete_mission(LEVEL_TREASURE_ISLAND,L03_LABEL_MISSION_TRACKDOWNFULCRUMSTAR)
		SAVE.missions_trackslag = false
		prt("Mission Completed: Track Down Captain Slag")
	end

--DEFEAT SLAG AND DARKWATER's GHOST
	if SAVE.completed_treasure_island and SAVE.missions_fightboss == nil then
		add_mission(LEVEL_PROLOGUE, L03_LABEL_MISSION_RECOVERFULCRUMSTAR, L01_DESC_MISSION_DEFEATCAPTAINSLAG, true)
		SAVE.missions_fightboss = true
		prt("Mission Added: Viciously Murder Slagwater")
	end

	if not is_alive(boss_darkwater) and SAVE.missions_fightboss == true then
		complete_mission(LEVEL_PROLOGUE, L03_LABEL_MISSION_RECOVERFULCRUMSTAR)
		SAVE.missions_fightboss = false
		prt("Mission Complete: Viciously Murder Slagwater")
	end

wait()

end

--the end