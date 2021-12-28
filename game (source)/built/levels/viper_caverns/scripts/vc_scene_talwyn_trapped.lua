----------------------------------------------------------------------------------------------------
-- talwyn trapped npc scene
----------------------------------------------------------------------------------------------------

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)
ratchethelpingtalwyn = true


--------------------------------------------------------------------------------
--tal Responses
--------------------------------------------------------------------------------
TalDlg1 =
{
	text =  "Ratchet!  I'll try to find a way out of here.  Just promise we'll leave this place together, okay?",
	dialog = DialogueSpecs.VC_TAL_PROMISE_OPENER, --VC_TAL_PROMISE_OPENER
	stance  = AnimRoles.ANIM_ROLE_SPECIAL_IDLE,
	target  = get_hero(),
	gesture = 
	{

    --1.0,    AnimRoles.ANIM_ROLE_DESPERATE,
    --3.0, 		AnimRoles.ANIM_ROLE_CONFUSED,
    --2.0, 		AnimRoles.ANIM_ROLE_QUESTION
	}
}

TalDlg2 =
{
	text =  "Thanks, Ratchet",
	dialog = DialogueSpecs.VC_TAL_PROMISE_RESPONSE_YES,
	stance  = AnimRoles.ANIM_ROLE_SPECIAL_IDLE,
	target  = get_hero(),
	gesture = 
	{
    0.0,    AnimRoles.ANIM_ROLE_THANKS
	}
}


TalDlg3 =
{
	text =  "I understand",
	dialog = DialogueSpecs.VC_TAL_PROMISE_RESPONSE_NO,
	stance  = AnimRoles.ANIM_ROLE_SPECIAL_IDLE,
	target  = get_hero(),
	gesture = 
	{
	
	 --1.0,    AnimRoles.ANIM_ROLE_CONFUSED,
   2.0,    AnimRoles.ANIM_ROLE_SAD
	}
}

--------------------------------------------------------------------------------
--Rusty Pete Responses
--------------------------------------------------------------------------------
PeteDlg1 =
{
	text =  "Come on, mate.  Make up yer mind.  We've got places to go!",
	dialog = DialogueSpecs.VC_PETE_PROMISE_PROMPT,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}

PeteDlg2 =
{
	text =  "Lombax and Markazian, sittin' in a tree! K-I-(hic!)-S-S-I-N-G.(laughs drunkenly)",
	dialog = DialogueSpecs.VC_PETE_PROMISE_RESPONSE_YES,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}

PeteDlg3 =
{
	text =  "Spoken like a true pirate!",
	dialog = DialogueSpecs.VC_PETE_PROMISE_RESPONSE_NO,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}




--------------------------------------------------------------------------------
--functions
--------------------------------------------------------------------------------


--inital tal line when trapped
function f_TalTrapped_Open()

	actor_speak_and_wait(tal, TalDlg1)
	wait(0.2)
	return true
	
end


--actions that occur if player chooses 'yes'
function f_RatchetYes_Response()

	scene_clear_title()
	--scene_speak_and_wait(get_hero(), RatchetDlg1)
	--wait(0.2)
	ratchet_saves_talwyn = true
	wait(0.2)
	revert_actor(rustypete)
 	--ally_followpath(rustypete,pete_walkpath_4,false,false)
	--wait(1)
	actor_speak_and_wait(tal, TalDlg2, true)
	revert_actor(tal)
	ally_followpathhover(tal, vc_talwynpath_flyaftercavein,  10.0,  10.0,  5.0)
	save_tal_decision = true
	deactivate_cam(get_hero(), vc_camera_caveincinematic)
	ratchethelpingtalwyn = true
	SAVE.ratchet_choose_rescue = true

	return true
	
end

--actions that occur if player chooses 'no'
function f_RatchetNo_Response()
	scene_clear_title()
	--scene_speak_and_wait(get_hero(), RatchetDlg2)
	--wait(0.2)
	ratchet_saves_talwyn = false
	wait(0.2)
	revert_actor(rustypete)
 	--ally_followpath(rustypete,pete_walkpath_4,false,false)
	--wait(1)
	actor_speak_and_wait(tal, TalDlg3, true)
	revert_actor(tal)
	ally_followpathhover(tal, vc_talwynpath_flyaftercavein,  10.0,  10.0,  5.0)
	save_tal_decision = true
	deactivate_cam(get_hero(), vc_camera_caveincinematic)
	ratchethelpingtalwyn = true
	SAVE.ratchet_choose_rescue = false
	return true

end

--------------------------------------------------------------------------------
--get_hero() Responses
--------------------------------------------------------------------------------

 RatchetDlg1 =
{
	text =  "Yes, I promise",
	dialog = DialogueSpecs.VC_RAT_PROMISE_YES_RESPONSE,
	func = f_RatchetYes_Response

}

 RatchetDlg2 =
{
	text =  "I can't make any promises",
	dialog = DialogueSpecs.VC_RAT_PROMISE_NO_RESPONSE,
	func = f_RatchetNo_Response

}

----------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------
-- Main Loop
----------------------------------------------------------------------------------------------------


-- wait for talwyn to shut it (see vc_talwyn_helpmessage.lua)
if tal_help_handle ~= nil then      
  wait_for_vo( tal_help_handle )
  wait(0.26)
end

--turning get_hero(), pete, and tal into actors
if save_tal_decision == nil then
  ratchethelpingtalwyn = true
	ally_warp(tal,vc_warpspot_talwyn_caveincinematic)
	ally_warp(rustypete,vc_warpspot_pete_caveincinematic)
	hero_warp(get_hero(),vc_warpspot_ratchet_caveincinematic)
	activate_cam(get_hero(),vc_camera_caveincinematic , true)
	active_hero = get_hero()
	make_actor(tal)
	make_actor(rustypete)
  


	

	f_TalTrapped_Open()
	
	scene_set_title(DialogueSpecs.VC_RAT_PROMISE_QUESTION)
	
	local choice = scene_show_menu_and_wait( { RatchetDlg1, RatchetDlg2}, false )

	choice.func()

end

stoptaltrapped = true  --this is my variable for stopping the tal trapped theme cro 5/6
request_auto_save()
-- end gameplay, this occurs when the user gets to viper caverns