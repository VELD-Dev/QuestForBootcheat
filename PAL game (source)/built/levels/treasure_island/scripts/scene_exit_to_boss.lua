--actor stuff
active_hero = get_hero();
active_npc = biggamehunterer;
npc_warp(active_npc, ti_scene_smuggler_warp_vol);
hero_warp(active_hero, ti_scene_smuggler_ratchet_warp_vol);
make_actor(active_npc);

--activate cam and move taxi
activate_cam(active_hero, scene_exit_cam, true);
taxi_start_move(piratebargee);
BargeFlyAwayTI = play_sound(SoundSpecs.AMB_Pirate_Barge_Flying_2D_Fade)

wait(4)  --i split this into two calls so i can kill music as the level fades. still 5 sec total. cro 6/4
turnmusicoff = true
stop_sound(BargeFlyAwayTI)
wait(1)

fade_to_black(0.5)
wait(1)

--do the level trans here; won't work otherwise
set_level(LEVEL_PROLOGUE)