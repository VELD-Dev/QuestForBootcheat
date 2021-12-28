-- Controls cine's for turret coming out.

force_track_fx( turretSteam, true ) 

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


activate_cam( get_hero(), battle_turret_cam )
announce_and_wait( DialogueSpecs.NI_BATTLE_TURRET_RESPONSE )	
turret_pirate_rise( battle_turret )
activate( turretSteam )
--Playing sound effect for the mighty defense cannon
play_explicit_sound_spec( SoundSpecs.AMB_NPC_Bay_Defense_Turret ) 
wait(3.0)
--deactivate( turretSteam )
announce_and_wait( DialogueSpecs.NI_BATTLE_BS )
--stoping mighty defense turret after 1.5 seconds.
--stop_sound( toastergun )


