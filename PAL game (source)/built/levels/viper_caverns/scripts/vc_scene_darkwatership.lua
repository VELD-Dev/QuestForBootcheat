----------------------------------------------------------------------------------------------------
-- darkwater ship flythrough
----------------------------------------------------------------------------------------------------
darkwaterflyCO = true
  if rusty_vs_viper then
  	stop_vo(rusty_vs_viper)
  end
	viper_intro_dialogue = false
  
  obviate(cave_viper1)
  delete(cave_viper1)
  SAVE.dialogue_darkwater_ship_intro = true
	activate_cam(get_hero(), vc_camera_darkwatershipflythrough)
	
	wait(2)
	announce_and_wait(DialogueSpecs.VC2_RAT_LAIRINTRO_WHOA)
	announce_and_wait(DialogueSpecs.VC_PETE_LAIRINTRO_OPENER)
	announce_and_wait(DialogueSpecs.VC_RAT_LAIRINTRO_RESPONSE)
	announce_and_wait(DialogueSpecs.VC_PETE_LAIRINTRO_CLOSER)
	SAVE.dialogue_darkwater_ship_intro = false
	
	
	door_remove_boltcrank(vc_gratedoor_todarkwatership)
	door_close(vc_gratedoor_todarkwatership)
	ally_warp(rustypete, vc_checkpoint_darkwatercave_respawn)
	--hero_warp(get_hero(), vc_herowarpvol_darkwatershipentrance)
  SAVE.darkwater_cinematic_done = 1
  wait_for_cam(get_hero())
  request_auto_save()
	