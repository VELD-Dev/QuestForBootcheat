--scene_lighthouse_view
--plays the cameras along some paths to look at the lighthouse after you finish the top bolt crank

activate_cam( get_hero(), lighthouse_flyover_cam )
beaconinfo = play_sound(SoundSpecs.AMB_NPC_Lighthouse_Info, INV_Beacon_Info)
wait(3.0)
activate(beacon1)
wait_for_cam(get_hero())
npc_warp( npc_mayor, outside_obsidian_eye_mayor_warp_vol )
activate_cam( get_hero(), lighthouse_to_eye_cam, true, 1 )

make_actor(npc_mayor)
actor_speak_and_wait(npc_mayor, {dialog = DialogueSpecs.NI_MAYOR_BEACON_ACTIVE, req = true})

wait_for_cam( get_hero() )

revert_actor(npc_mayor)

door_open( obsidian_eye_door )
--ally_followpath(npc_mayor, mayor_walk_into_eye_room_path, false, false)

npc_set_mode(npc_mayor, NPC_MODE_ACTIVE)
npc_set_path(npc_mayor, mayor_walk_into_eye_room_path, NPC_PATROL_ONCE)
wait( 3.0 )

obviate(lighthouse_extension_bridge)
hero_warp( get_hero(), lighthouse_warp_vol)
npc_warp( npc_mayor, obsidian_eye_mayor_warp_vol )

--Set up lighthouse scene for final
SAVE.scene_lighthouse_state = 4
SAVE.scene_lighthouse_ratchet_state = 2
SAVE.scene_lighthouse_view_played = true

request_auto_save()
wait()
--End