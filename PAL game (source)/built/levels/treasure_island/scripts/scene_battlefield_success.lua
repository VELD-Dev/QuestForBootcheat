--------------------------------
-- ACTIVATING CAMERA
--------------------------------------------------------------------------------
--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)  --ducking music so we can hear the dialogue

deactivate(Eye_Flashes)
deactivate(Eye_Flashes1)
deactivate(SmallPirateEye_Left)
deactivate(SmallPirateEye_Right)

function wait_for_cam( hero )
  wait(0.0)
  while not is_cam_done(hero) do wait(0.0) end
end
fade_to_black(0)
fade_from_black(3)
hero_warp(get_hero(), hero_warp_ratchet_skulldoor)
ally_warp(talwyn, ally_warp_talwyn_skulldoor)
obviate(shadow_puzzle_eyes2)
obviate(shadow_puzzle_eyes3)
deactivate(battlefield_ghost_effect)
camera_shake(get_hero(), 8, 10, 8, 0.1, 6)

activate_cam(get_hero(), cam_light_puzzle_success)
announce(DialogueSpecs.TI_SHADOW_COMPLETE)
door_open(ti_light_puzzle_skull_2)
play_explicit_sound_spec(SoundSpecs.AMB_TI_Big_Skull_Open, get_hero())
wait(7)
fade_to_black(1)
wait(1)
SAVE.cinematic_ghost_effect_active = true



