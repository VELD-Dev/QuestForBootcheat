-- Controls cine's for Slag's intro on the West ship.


----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

-- hero_warp( get_hero(), slag_westship_intro_ratchet_warp_vol )
wait(0.1)
activate_cam( get_hero(), slag_west_ship_ambush_intro_cam )
door_close( slag_west_ship_north_cabin_door )
prt( "Pirate Intro scene" )
wait(1.0)
door_open( slag_west_ship_west_cabin_door )
mobyspawner_spawn( spawner_pirates_tal_escape_1, 1 ) 
mobyspawner_spawn( spawner_pirates_tal_escape_2, 1 )
wait(3.0) 
SAVE.Pirate_ambush_intro_scene = true
request_auto_save()
prt( "setting Pirate_ambush_intro_scene to true" )
wait(1.0)

