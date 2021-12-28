--------------------------------
-- ACTIVATING CAMERA
--------------------------------------------------------------------------------
--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

wait()


function wait_for_cam( hero )
  wait(0.0)
  while not is_cam_done(hero) do wait(0.0) end
end

SkullDlg1 =
{
	text =  "Light puzzle speaks",
	dialog = DialogueSpecs.TI_SHADOW_DARKWATER,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}



obviate(light_piece_1)
obviate(light_piece_2)
obviate(light_piece_3)
unobviate_pod(shadow_puzzle_pod2)



activate_cam(get_hero(), cam_shadow_puzzle_finished2)
lightning( lightningController, light_puzzle_success_look_volume)
activate(Eye_Flashes)
activate(Eye_Flashes1)
scene_speak_and_wait(get_hero(), SkullDlg1, true)
lightning( lightningController, light_puzzle_success_look_volume)
deactivate_cam(get_hero(), cam_shadow_puzzle_finished)
SAVE.completed_light_puzzle = true
deactivate(Eye_Flashes)
deactivate(Eye_Flashes1)
deactivate(SmallPirateEye_Left)
deactivate(SmallPirateEye_Right)
run_script("ti_battlefield")
