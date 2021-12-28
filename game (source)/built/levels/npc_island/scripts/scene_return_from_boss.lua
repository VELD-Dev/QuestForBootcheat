--scene return from boss here
npc_warp(npc_smuggler, taxi_entrance_warp_vol_1)
ally_warp(tal, taxi_entrance_warp_vol_2)
hero_warp(get_hero(), taxi_entrance_warp_vol_3)

--stuff here
active_hero = get_hero()
make_actor(npc_smuggler)
make_actor(tal)

activate_cam(get_hero(), entrance_cam, true)
unobviate(taxi_to_vc)

wait(5.0)
--And we're done, rejoice