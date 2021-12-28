--------------------------------
-- ACTIVATING CAMERA
--------------------------------------------------------------------------------


musictomyears = true -- cue for completed music after organ puzzle.
prt("chopin")
function wait_for_cam( hero )
  wait(0.0)
  while not is_cam_done(hero) do wait(0.0) end
end

fade_to_black(0)
fade_from_black(1)
activate(GiantPirate_Eye_Right)
activate(GiantPirate_Eye_Right1)
activate(soul_spawner_organ_success)
--unobviate(fly_ghost_organ_sequence)
--wait(.7)
activate_cam(get_hero(), cam_organ_success_sequence)
wait(11)
fade_to_black(0)
fade_from_black(1)
--wait_for_cam(get_hero())
if SAVE.puzzle_stage  ==  1 then
SAVE.puzzle_stage = 2
request_auto_save()
activate_cam(get_hero(), cam_darkwater_platforms_last3)
camera_shake(volume_camerashake_platform_rise_sequence, 8, 10, 8, 2, 10)
trigger(darkwater_rising_platform2)
trigger(darkwater_rising_platform3)
trigger(darkwater_rising_platform4)
wait(5)
deactivate_cam(get_hero(), cam_darkwater_platforms_last3)
end

if SAVE.puzzle_stage  ==  nil then
SAVE.puzzle_stage = 1
request_auto_save()
activate_cam(get_hero(), cam_darkwater_platforms_last3)
camera_shake(volume_camerashake_platform_rise_sequence, 8, 10, 8, 2, 10)
trigger(darkwater_rising_platform5)
trigger(darkwater_rising_platform6)
trigger(darkwater_rising_platform1)
wait(5)
deactivate_cam(get_hero(), cam_darkwater_platforms_last3)
end

wait(0)

--deactivate(soul_spawner_organ_success)
hero_warp(get_hero(), hero_warp_vol_organ_complete)
SAVE.bonus_round_active = true
SAVE.organ_puzzle_success_flythrough = true
organflyaudiodone = true --cue for flythrough music
request_auto_save()
fade_to_black(0)
