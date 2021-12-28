----------------------------------------------------------------------------------------------------
-- Pete opens door to viper pass
----------------------------------------------------------------------------------------------------

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

--------------------------------------------------------------------------------
PeteDlg1 =
{
	text =  "This path is so dangerous -- so forbidden -- that only a recitation of the fabled SONG OF THE DEAD shall open the way!",
	dialog = DialogueSpecs.VC_PETE_SLAGOPEN1,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}

PeteDlg2 =
{
	text =  "Im a little tea-pot, short and stout! Here is me handle, here is me spout!",
	dialog = DialogueSpecs.VC_SLAG_SLAGOPEN1_RESPONSE,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}


----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------



--while true do
		hero_warp(get_hero(), hero_warp_vol_viper_pass_door)
    ally_warp(rustypete, ally_warp_vol_viper_pass_door)
		local slagshead = ally_get_slagshead(rustypete)
		active_hero = get_hero()
		make_actor(slagshead)
		make_actor(rustypete)
		
		
    activate_cam(get_hero(), vc_camera_door_to_viper_pass)
    wait(.5)
    actor_speak_and_wait(rustypete, PeteDlg1, true)
		activate_cam(get_hero(), vc_camera_door_to_viper_pass_cam2)
		wait(.5)
    actor_speak_and_wait( slagshead, PeteDlg2, true)
    wait(1)
    activate_cam(get_hero(), vc_camera_door_to_viper_pass)
		camera_shake(get_hero(), 10, 20, 4)   
		door_open(ja_vc_gratedoor1)
		wait(.5)
		--revert_actor(slagshead)
		revert_actor(rustypete)
		
		ally_followpath(rustypete,pete_walkpath_4b,false,false)
		wait(4)
		deactivate_cam(get_hero(), vc_camera_door_to_viper_pass);
		viperpassdooropen = true
		
	
-----------------------------------------------------------------------------------------------------

	
  --wait()

--end

-- end gameplay, this occurs when the user gets to viper caverns
