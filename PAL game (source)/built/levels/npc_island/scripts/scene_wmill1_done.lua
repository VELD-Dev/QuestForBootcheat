----- Controls everything that happens immediately after Windmill #1 is restored.

--This is the sound spec for the windmill start up sequence cro2/26
tower1startup = play_sound( SoundSpecs.AMB_Q4B_NPC_Tower1_Startup ) 
-- testing out a better way to do this cro 4/24 play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Turbine1, INV_FAN_SOURCE ) 

activate_cam( get_hero(), wmill1_power_cam ) --- Blends into pan down Wmill
open_windmill( windmill1_blades, false )
play_sound( SoundSpecs.AMB_NPC_Fan_Tower_Air_Crack) -- part of tower sfx cro 5/20
wait(4.0)
powersurge = play_sound( SoundSpecs.AMB_NPC_Fan_Tower_Power_Surge) -- part of tower sfx cro 5/20
bangle_on( wmill1_powercables, 0, true )
wait(4.5)-- i split this in threeto call a sfx, total time still 6.0 cro 5/20
stop_sound( powersurge)
wait(1.0)  
play_sound( SoundSpecs.AMB_NPC_Fan_tower_grnd_pwr_strike)
wait(0.5)
door_open( beach_door_to_village )
wait(1.0)
door_open( beach_door_to_beacon )

wait(3.0)
hero_warp( get_hero(), wmill1_ready_teleport_vol )
activate_cam( get_hero(), underwater_tunnel_cam )
hero_force_underwater_fx(get_hero(), true ) 
door_open( water_tunnel_door )
wait(3.0)
hero_force_underwater_fx(get_hero(), false ) 
play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Electricity, INV_ELEC_SOURCE ) -- moving this up from later in the script. cr0 5/20
activate_cam( get_hero(), wmill1_pre_teleport_cam )

wait(2.0)
activate( windmill1_teleporter )
play_sound(SoundSpecs.AMB_Q4B_Teleporter_Zap) --teleporter zap sounds
wait(2.0) -- teleport occurs 0.5 seconds after activation (time for arms to go up, etc)
door_close( wmill1_fan_housing )
wait(2.0) 
activate_cam( get_hero(), wmill1_post_teleport_cam )
wait(4.0)

-- Need to obviate and/or deactivate way back up Wmill
obviate(ni_windmill_platform_2)

stop_sound( tower1startup ) 
play_sound( SoundSpecs.TRIG_NPC_Windmill_Turbine1, INV_FAN_SOURCE ) 



