-- Controls cine's for turret coming out.

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)
----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------


activate_cam( get_hero(), battle_turret_cam2 )
-- wait(10.0)
wait(2.0)
turret_pirate_rise( battle_turret )
play_explicit_sound_spec( SoundSpecs.AMB_NPC_Bay_Defense_Turret ) --recalling the defense turret raise sound
--door_open( battle_turret_cover )
--unobviate( battle_turret )	
--Playing sound effect for the mighty defense cannon
--toastergun = play_sound( SoundSpecs.AMB_NPC_Bay_Defense_Turret ) 
--stoping mighty defense turret after 1.5 seconds.
--stop_sound( toastergun )
--dwbs_set_cannons( battle_darkwater_ship, battleship_cannons_right_pod )
wait(4.0)



