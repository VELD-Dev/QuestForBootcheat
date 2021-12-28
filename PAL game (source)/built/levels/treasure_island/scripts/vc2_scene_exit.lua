--Hero, NPC, warp stuff
active_hero = get_hero()

fade_to_black(0.5)
wait(2.0)
letter_box_off(0)
unobviate(caverns_elevator)
obviate(talwyn)
hero_warp(active_hero, vc2_exit_vol, true)
SAVE.treasure_island_scene_smuggler_state = 3
SAVE.completed_treasure_island = true
SAVE.treasure_island_hero_location = nil
request_auto_save()
--wait(0.2)

--fade_from_black(1.0)
--wait(0.5)
--hero_lockout_control(get_hero(), false, false, false)
