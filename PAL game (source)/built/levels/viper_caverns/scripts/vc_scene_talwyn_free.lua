
--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

TalDlg1 =
{
	text =  "Thanks, Ratchet. I knew you'd keep your promise!",
	dialog = DialogueSpecs.VC_TAL_THANKSPROMISE,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
 {
    1.0,    AnimRoles.ANIM_ROLE_THANKS
	}
}



TalDlg2 =
{
	text =  "Thanks, Ratchet! I knew you'd come back",
	dialog = DialogueSpecs.VC_TAL_THANKSNOPROMISE,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
 {
    1.0,    AnimRoles.ANIM_ROLE_THANKS
	}
}

















----------------------------------------------------------------------------------------------------
-- Free tal Scene
----------------------------------------------------------------------------------------------------

SAVE.talwyn_rescued = true
ally_unequipitem(tal, ALLY_ITEM_GUN);
checkpoint_volume(checkpoint_vol_tal_free)
talfreed = true -- replacing old music que with new one cro 5/6 request_music_track("NoMusic")
ally_warp(tal, vc_allywarpvol_talwyn_escapescene)
hero_warp(ratchet, vc_herowarpvol_talwyn_escapescene)
activate_cam(ratchet, vc_cam_talwynfreescene)
wait(1)
ally_followpathhover(tal,talpath_viper_dead,  5.0,  5.0,  25.0, true)
play_sound(SoundSpecs.AMB_Q4B_Tal_Jetpack_2D, tal)
--ally_gotopointhover(tal, tal_fightviper_land_vol1, 10, 10, 15, true)
wait(5)

if SAVE.ratchet_choose_rescue == true then
scene_speak_and_wait(tal, TalDlg1, true)
end

if not SAVE.ratchet_choose_rescue == true then
scene_speak_and_wait(tal, TalDlg2, true) --added 2D true case for Ratchet cro 5/8
end

 
wait(1)
talwynreturntoship = true