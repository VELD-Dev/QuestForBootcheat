----- Controls everything that happens immediately after Windmill #5 is restored.

---------------------------------------------------------------------------------------------------
--- Local Variables
----------------------------------------------------------------------------------------------------

num_windmills_done = 0

----------------------------------------------------------------------------------------------------
--- Checks to see how many Windmills are complete - cinematic will change if all are complete.
----------------------------------------------------------------------------------------------------

if SAVE.windmill1_complete then 
	num_windmills_done = num_windmills_done +1 
	prt("A Windmill done")
end

if SAVE.windmill2_complete then 
	num_windmills_done = num_windmills_done +1 
	prt("A Windmill done")
end

if SAVE.windmill3_complete then 
	num_windmills_done = num_windmills_done +1 
	prt("A Windmill done")
end

if SAVE.windmill4_complete then 
	num_windmills_done = num_windmills_done +1 
	prt("A Windmill done")
end

if SAVE.windmill5_complete then 
	num_windmills_done = num_windmills_done +1 
	prt("A Windmill done")
end

----------------------------------------------------------------------------------------------------
--- Cinematic script
----------------------------------------------------------------------------------------------------

--This is the sound spec for the windmill start up sequence cro 2/26
towergrindstartup = play_sound( SoundSpecs.AMB_Q4B_NPC_TowerGrind_Startup )
-- removed for better timing play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Turbine5, INV_FAN_SOURCE5 )
activate_cam( get_hero(), wmill5_blades_cam )
open_windmill( windmill5_blades, false )
play_sound( SoundSpecs.AMB_NPC_Fan_Tower_Air_Crack) -- part of tower sfx cro 5/20
wait(3.0)
powersurge5 = play_sound( SoundSpecs.AMB_NPC_Fan_Tower_Power_Surge)
bangle_on( wmill5_powercables, 0, true )
wait(3.0)

-- If this is the last Windmill then show the Beacon
if num_windmills_done ==5 then
	stop_sound (towergrindstartup) --stoping startup sound for simple turbine to follow
	stop_sound (powersurge5) --stoping powersurge for simple electric to follow
	COstop5 = true
	queue_scene("scene_wmills_all_done")
end

	if not COstop5 then --checking to see if these two sounds are already stopped
		stop_sound (towergrindstartup)  --stoping startup sound for simple turbine to follow
		stop_sound (powersurge5) --stoping powersurge for simple electric to follow
	end

play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Turbine1, INV_FAN_SOURCE5 ) -- moving this up from later in the script. cr0 5/20
play_explicit_sound_spec( SoundSpecs.TRIG_NPC_Windmill_Electricity, INV_ELEC_SOURCE5 ) -- moving this up from later in the script. cr0 5/20
hero_warp( get_hero(), wmill5_ready_teleport_vol )
activate_cam( get_hero(), wmill5_pre_teleport_cam )
wait(1.0)
activate( windmill5_teleporter )
play_sound(SoundSpecs.AMB_Q4B_Teleporter_Zap) --teleporter zap sounds
wait(2.0)
door_close( wmill5_fan_housing )
wait(1.5)
activate_cam( get_hero(), wmill5_post_teleport_cam )
wait(4.0)

wait(2.0)



