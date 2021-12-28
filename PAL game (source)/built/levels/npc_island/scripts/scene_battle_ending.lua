-- Controls script for after the NPC Island battlefield



----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

local post_battle_setup = false

----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

----------------------------------------------------------------------------------------------------
-- Gameplay Script 
----------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------


activate_cam( get_hero(), battle_slag_retreats_cam )
activate( battle_darkwater_ship )
announce( DialogueSpecs.NI_BATTLE_SHIP_DESTROYED )
--debug_message("TEMP: Slag: Argh! Next time, Ratchet! Next time!!!.", 5)
prt("Battleship running away")
wait(4.0)
victoriousmuisc = true  --variable for music trigger cro 5/13
deactivate( undead_FX_controller )
wait(6.0)
activate_cam( get_hero(), battle_obeye_door_cam )
announce( DialogueSpecs.NI_BATTLE_WMO_THANKS )
wait(1.0)
--door_open( beach_door_to_village )
--door_open( beach_door_to_beacon )
door_open( obsidian_eye_door )
--unobviate( beach_wrench_catapult  )
--unobviate( beach_wrench_springpad  )	
unobviate(taxi_to_vc)
wait(3.0)
prt( "Battlefield Complete." )
post_battle_setup = true
	
  
wait()




		

