-- Controls Tal arriving back from Viper Caverns if not rescued.


	
ally_warp( tal, tal_from_vc_warp_vol )
activate_cam( get_hero(), post_battle_tal_arrives_cam )
ally_followpathhover( tal, tal_from_vc_path, 5, 5, 12 )
--speak(tal, DialogueSpecs.NI_BATTLE_TAL_RETURNS, true)

scene_speak(tal, {dialog = DialogueSpecs.NI_BATTLE_TAL_RETURNS} )

wait(12)

wait()