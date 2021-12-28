----------------------------------------------------------------------------------------------------
-- Taxi Intro Scene
----------------------------------------------------------------------------------------------------
--Duck music & sfx
group_fade_vol(2, 0.7, 1.0)
group_fade_vol(13, 0.7, 1.0)

bargeCO = true
bargeride = play_sound(SoundSpecs.AMB_Pirate_Barge_Flying_2D, get_hero()) --barge moving sound 2D for this scene only.

hero_warp( get_hero(), taxi_entrance_warp_vol_1 )
ally_warp( tal, taxi_entrance_warp_vol_2 )
ally_warp( rustypete, taxi_entrance_warp_vol_3 )
hero_lockout_control(get_hero(), true)
activate_cam(get_hero(), cam_follow_taxi)
	if not SAVE.first_ally_conversation == true then
	
	make_actor(rustypete)
	make_actor(tal)

	actor_speak_and_wait(rustypete, {dialog = DialogueSpecs.VC_PETE_BARGE_OPENER, req = true} )
	actor_speak_and_wait(tal, {dialog = DialogueSpecs.VC_RAT_BARGE_RESPONSE, req = true} )	--couldn't get scene_speak to work here for some reason, but you can't tell who's actually sayin the line so this works
	actor_speak_and_wait(rustypete, {dialog = DialogueSpecs.VC_PETE_BARGE_RESPONSE, req = true} )
	actor_speak_and_wait(tal, {dialog = DialogueSpecs.VC_TAL_BARGE2_OPENER, req = true} )
	actor_speak_and_wait(rustypete, {dialog = DialogueSpecs.VC_PETE_BARGE2_RESPONSE, req = true} )
	
	revert_actor(rustypete)
	revert_actor(tal)

	-- wait for the taxi to arrive
	while not is_in_volume( get_hero(), vc_trig_camera_vcentrance ) do wait(1) end
	
	ally_followpath(rustypete,Pete_walkpath_1,false,false)
	wait(1)
	ally_followpath(tal,Tal_walkpath_1,false,false)
	wait(2)
	hero_lockout_control(get_hero(), false)
	SAVE.first_ally_conversation = true
	request_auto_save()
	stop_sound(bargeride)  --stoping barge moving sound and resuming ingame 3D
	end
