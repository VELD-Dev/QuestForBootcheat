----------------------------------------------------------------------------------------------------
-- DIALOGUE SCRIPT
----------------------------------------------------------------------------------------------------

while true do
--------------------------------------------------------------------------------
--Talwyn line 1:
if talwyn_line1 == nil then
	if is_in_volume(get_hero(), innervolume_first2pirates) then
	wait(1)
	speak_and_wait(talwyn, DialogueSpecs.PL_TAL_BATTLE_START, true)
	talwyn_line1 = true
	end
end
--------------------------------------------------------------------------------
--Talwyn line 13: 
if talwyn_line13 == nil then
	if is_in_volume(get_hero(), innervolume_first2pirates1) or was_damaged ( enemy_pod_first2_pirates, 2,  get_hero()) then
	wait(1)
	speak_and_wait(talwyn, DialogueSpecs.PL_TAL_WARNING_2, true)
	talwyn_line13 = true
	end
end
--------------------------------------------------------------------------------
--Talwyn line 14:
if talwyn_line14 == nil then
	if get_num_alive(enemy_wave1) < 1 then
	wait(2)
	speak_and_wait(talwyn, DialogueSpecs.PL_TAL_THANKS, true)
	talwyn_line14 = true
	end
end
--------------------------------------------------------------------------------
--Talwyn line 5:
if talwyn_line5 == nil then
	if get_num_alive(pirate_pod_all_before_boltcrank) < 1 then
		if not crank_is_in_use(boltcrank1) then
			if not crank_is_complete(boltcrank1) then
			speak_and_wait(talwyn, DialogueSpecs.PL_TAL_OPEN_DOOR, true)
			prt("saying line 5")
			talwyn_line5 = true
			end
		end
	end
end
--------------------------------------------------------------------------------
--Talwyn line 2:
if talwyn_line2 == nil then
	if talwyn_line5 == true then
		wait(4)
		if not crank_is_in_use(boltcrank1) then
			if not crank_is_complete(boltcrank1) then
			speak_and_wait(talwyn, DialogueSpecs.PL_TAL_BOLTCRANK, true)
			prt("saying line 2")
			talwyn_line2 = true
			end
		end
	end
end 

--killing talwyn line 2 if boltcrank has been touched
if crank_is_in_use(boltcrank1) then
talwyn_line2 = true
end	
--------------------------------------------------------------------------------
-- Talwyn line 7
if talwny_line7 == nil then
		if roofjumppirates2awake == true then	
    speak_and_wait(talwyn, DialogueSpecs.PL_TAL_DROPPING, true)
    talwny_line7 = true
		end
end

--------------------------------------------------------------------------------
--Talwyn line 17:
if talwyn_line17 == nil then
		if crank_is_complete(boltcrank1) then
		wait(1)
		speak_and_wait(talwyn, DialogueSpecs.PL_TAL_MINE, true)
		prt("saying line 17")
		talwyn_line17 = true
		end
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--Talwyn line 4:
if talwyn_line4 == nil then
		if not is_alive(hunchback_pirate) then
		wait(4)
			if is_in_volume(get_hero(), outervolume_hunchbackpirate) then
			speak_and_wait(talwyn, DialogueSpecs.PL_TAL_CATAPULT_2, true)
			prt("saying line 4")
			talwyn_line4 = true
			end
		end
end
--------------------------------------------------------------------------------
--Talwyn line 8:
if talwyn_line8 == nil then
if is_in_volume(get_hero(), outervol_ship2_turret1) then
wait(2)
speak(talwyn, DialogueSpecs.PL_TAL_TURRET_OFF, true)
talwyn_line8 = true
end
end

--------------------------------------------------------------------------------
--Talwyn line 11
if not is_update_on( boltcrank_door4 ) then
	if is_alive(enemy_ship2_turret2) then 
		if talwyn_line11 == nil then
			if is_in_volume(get_hero(), vol_ship2_addheroaware_turret2) then
			speak_and_wait(talwyn, DialogueSpecs.PL_TAL_FANCY_WEAPONS, true)
			talwyn_line11 = true
			end
		end
	end
end
--------------------------------------------------------------------------------
--Talwyn line 12

if talwyn_line12 == nil then
	if is_in_volume(get_hero(), trig_dialogue_aphelion) then
	speak_and_wait(talwyn, DialogueSpecs.PL_TAL_APHELION, true)
	ally_followpathhover(talwyn, tal_hoverpath_to_aphelion, 10, 10, 30)
	talwyn_line12 = true
	end
end

--------------------------------------------------------------------------------
--Talwyn line 9 and 10
if talwyn_line9 == nil then
	if not is_alive(enemy_ship2_turret1) then
	wait(2)
	speak_and_wait(talwyn, DialogueSpecs.PL_TAL_TURRET_ON, true)
	wait(2)
	--speak_and_wait(talwyn, DialogueSpecs.PL_TAL_ALERT_1, true)
	--wait(4)
	--announce_and_wait(DialogueSpecs.PL_TAL_BLAST_DOOR)
	talwyn_line9 = true
	end
end

--------------------------------------------------------------------------------
--Talwyn line 6

--------------------------------------------------------------------------------
--Talwyn line 15

	if talwyn_line15 == nil then
			if is_in_volume(get_hero(), trig_wakeup_ship2_rearshooter) then
			speak(talwyn, DialogueSpecs.PL_TAL_HATE_PIRATES, true)
			talwyn_line15 = true
			end
	end



wait()
end