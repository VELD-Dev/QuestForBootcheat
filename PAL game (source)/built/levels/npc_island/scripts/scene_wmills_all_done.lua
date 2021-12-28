--Scene after all the windmills have been complete
--put this in one file for better organization
unobviate(tal)

prt("Show Beacon Coupling as all Windmills are complete")
activate_cam( get_hero(), wmills_all_done_view_cam )	
wait(3.0)

ally_warp(tal, tal_wmills_done_warp_vol)
ally_followpathhover( tal, tal_fly_to_beacon_bolt_path, 12, 12, 7 )

scene_speak(get_hero(), {dialog = DialogueSpecs.NI_TAL_WIND_TOWER_MEET})

SAVE.island_prebattle_tal_location = 4
request_auto_save()

activate_cam( get_hero(), wmills_show_coupling_powerup_cam )

wait(3.0)  --play the cam and stop on the coupling
bangle_on(ni_lighthouse_light_1, 0, false)
wait(2.0)
activate( lighthouse )
wait(1.0)
		
activate_cam( get_hero(), wmills_show_coupling_dome_cam )

wait(9)
COcomplete = true  --variable for music trigger cro 5/21
