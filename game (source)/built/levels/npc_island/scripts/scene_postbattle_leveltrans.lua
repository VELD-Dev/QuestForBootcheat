--Move everyone and make the taxi visible
unobviate(taxi_to_vc)

--Use Pete or the Smuggler depending on where we are
if SAVE.completed_island_battle then
	npc_warp(npc_smuggler, exit_smuggler_vol)
else
	ally_warp(rustypete, exit_smuggler_vol)
end

ally_warp(tal, exit_tal_vol)
hero_warp(get_hero(), exit_ratchet_vol)

--Setup actors and stuff
active_hero = get_hero()
make_actor(npc_smuggler)
make_actor(tal)

--Activate camera and move taxi
taxi_start_move(taxi_to_vc)
BargeFlyAwayNPC = play_sound(SoundSpecs.AMB_Pirate_Barge_Flying_2D_Fade)
activate_cam(get_hero(), exit_cam, true)
wait(3.0)
stop_sound(BargeFlyAwayNPC)
wait(1.0)
fade_to_black(0.5)
wait(1)

--setting the level here cause if I wait it won't detect the transition in the main script for some reason
SAVE.ti_start_on_taxi = true

--Set the level based on if you've completed the battle yet or not
if SAVE.completed_island_battle then
	set_level(LEVEL_TREASURE_ISLAND)
else
	set_level(LEVEL_VIPER_CAVERNS)
end
