-- All Help messages used on NPC Island

----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

local darkwater_opening_vo = false
local melee_weapons_vo = false
local two_cannons_vo = false
local one_cannon_vo = false
local first_barrage_vo = false
local second_barrage_vo = false
local at_door_vo = false
local come_about_vo = false

----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------


while true do

--------------------------
-- Battle #1
--------------------------

	-- slag and Darkwater talk about share of spoils
	if play_NI_BATTLE_EYE_vo and not darkwater_opening_vo then
		wait(5.0)
		speak_and_wait( darkwater_Trhone, DialogueSpecs.NI_BATTLE_SLAG_DARKWATER1)  --changed to speak cro 5/7
		speak_and_wait( darkwater_Trhone, DialogueSpecs.NI_BATTLE_SLAG_DARKWATER2)   --changed to speak cro 5/7
		darkwater_opening_vo = true		
	end

	-- When possible use melee weapons
	if play_BATTLE_WEAPONS_vo and not melee_weapons_vo then
		wait (3.0)
		speak( darkwater_Trhone, DialogueSpecs.NI_BATTLE_WEAPONS ) --changed to speak cro 5/12
		melee_weapons_vo = true
	end

	-- Starting to fire cannons
	if play_BATTLE_CANNON_vo and not first_barrage_vo then
		speak_and_wait( darkwater_Trhone, DialogueSpecs.NI_BATTLE_CANNON ) --changed to speak cro 5/12
		speak( darkwater_Trhone, DialogueSpecs.NI_BATTLE_FIRE ) --changed to speak cro 5/12
		first_barrage_vo = true
	end

	-- Mayor's mesage to take out the turrets.
	if play_BATTLE_TAKE_OUT_TURRETS_vo and not takeout_turrets then
		announce_and_wait( DialogueSpecs.NI_BATTLE_TAKE_OUT_TURRETS )
		takeout_turrets = true
	end
	
	-- Villages discuss the BS cannon
	if play_BATTLE_TURRET_vo and not TURRET_VO_FINISHED then
		announce_and_wait( DialogueSpecs.NI_BATTLE_TURRET)
		TURRET_VO_FINISHED = true
	end

	-- Ratchet destroying Cannons
	if get_num_alive( battleship_cannons_left_pod ) == 2 and not two_cannons_vo then
		announce( DialogueSpecs.NI_BATTLE_TURRET_DESTROYED )
		two_cannons_vo = true
	end
	
	-- Ratchet destroys two Cannons
	if get_num_alive( battleship_cannons_left_pod ) == 1 and not one_cannon_vo then
		announce( DialogueSpecs.NI_BATTLE_SECOND_TURRET_DESTROYED )
		one_cannon_vo = true
	end
	
	--Mayor says they're at the door
	if play_BATTLE_AT_DOOR_vo and not at_door_vo then
		announce( DialogueSpecs.NI_BATTLE_MAYOR_AT_DOOR_ALT )
		at_door_vo = true
	end
	
	-- Bring about Darkwater's ship
	if play_BATTLE_SHIP_COMES_ABOUT_vo and not come_about_vo then
		speak_and_wait( darkwater_Trhone, DialogueSpecs.NI_BATTLE_SHIP_COMES_ABOUT ) --changed to speak cro 5/12
		if SAVE.talwynfree then	--this line should only play if you've freed talwyn
			announce( DialogueSpecs.NI_TAL_BATTLEFIELD_WALKER )
		end
		come_about_vo = true
	end
		
	-- Ratchet destroying Cannons
	if get_num_alive( battleship_cannons_right_pod ) == 2 and not four_cannons_vo then
		announce_and_wait( DialogueSpecs.NI_BATTLE_THIRD_TURRET_DESTROYED )
		announce_and_wait( DialogueSpecs.NI_BATTLE_THIRD_TURRET_DESTROYED_RESPONSE )
		announce_and_wait( DialogueSpecs.NI_BATTLE_THIRD_TURRET_DESTROYED_RESPONSE2 )
		four_cannons_vo = true
	end	
	
wait()
	
end

