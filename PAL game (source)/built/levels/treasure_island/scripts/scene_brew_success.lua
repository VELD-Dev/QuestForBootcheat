--------------------------------
-- ACTIVATING CAMERA
--------------------------------------------------------------------------------


allformegrog = true --cue for brew completed music fly over
prt("drunk")
function wait_for_cam( hero )
  wait(0.0)
  while not is_cam_done(hero) do wait(0.0) end
end
fade_to_black(0)
fade_from_black(1)

activate(GiantPirate_Eye_Left)
activate(GiantPirate_Eye_Left1)
activate(soul_spawner_brew_success)
activate_cam(get_hero(), cam_brew_success_sequence)
wait_for_cam(get_hero())

if SAVE.puzzle_stage  ==  1 then
SAVE.puzzle_stage  = 2
fade_to_black(0)
fade_from_black(1)
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
fade_to_black(0)
fade_from_black(1)
request_auto_save()
activate_cam(get_hero(), cam_darkwater_platforms_last3)
camera_shake(volume_camerashake_platform_rise_sequence, 8, 10, 8, 2, 10)
trigger(darkwater_rising_platform5)
trigger(darkwater_rising_platform6)
trigger(darkwater_rising_platform1)
wait(5)
deactivate_cam(get_hero(), cam_darkwater_platforms_last3)
end

--deactivate(soul_spawner_brew_success)
SAVE.drink_puzzle_complete_cam = true
requested_brewstinger_music = true
request_auto_save()

