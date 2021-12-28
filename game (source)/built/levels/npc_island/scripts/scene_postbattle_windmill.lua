--Postbattle windmill scene
--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

---------------------------------------------------------------------
--Windmill Dialogs---------------------------------------------------
---------------------------------------------------------------------
WindmillDlgDecadroid = {
	dialog = DialogueSpecs.NI_BATTLE_WMO_NO_SPEAK,
	--text    = "Decadroid? I don’t speak no decadroid. Thems be more words to learn.",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.5,    AnimRoles.ANIM_ROLE_DISAGREE,
		3.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

WindmillDlgSaved = {
	dialog = DialogueSpecs.NI_BATTLE_WMO_THANKS,
	--text    = "Ya saved us all, stranger!",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

WindmillDlgOpen = {
	dialog = DialogueSpecs.NI_WMO_FIXING_OPENER,
	--text = "Hey, you're back! What can I do for ya?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		1.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

function f_WindmillResponse_Open()
	activate_cam(get_hero(), postbattle_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgOpen)
	return true
end

function f_WindmillResponse_Decadroid()
	activate_cam(get_hero(), postbattle_windmill_cam_closeup, true)
	SAVE.scene_postbattle_windmill_state = 1
	actor_speak_and_wait(npc_windmill, WindmillDlgDecadroid)
	return true
end

function f_WindmillResponse_Saved()
	activate_cam(get_hero(), postbattle_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgSaved)
	return true
end

function f_WindmillResponse_Exit()

end

---------------------------------------------------------------------
--Ratchet Dialogs---------------------------------------------------
---------------------------------------------------------------------
RatchetDlgDecadroid = { 
	dialog = DialogueSpecs.NI_SMUG_RIDE_TRANSLATE,
	--text = "Can you translate this pirate map?", 
	func = f_WindmillResponse_Decadroid,
}

RatchetDlgExit = {
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_WindmillResponse_Exit,
	exit = true,
}

RatchetDialogTable = {
	RatchetDlgDecadroid,
	RatchetDlgExit
}

function f_RatchetResponse_Decadroid()
	activate_cam(get_hero(), postbattle_windmill_cam_medium, true)
	return scene_show_menu_and_wait(RatchetDialogTable)
end

-------------------------------------------------------------------------
--Main Loop--------------------------------------------------------------
-------------------------------------------------------------------------
hero_warp(get_hero(), postbattle_windmill_ratchet_warp_vol, true)
npc_warp(npc_windmill, postbattle_windmill_warp_vol)
make_actor(npc_windmill)
foreach_moby_in_pod(NPC_POD, obviate)

if not SAVE.scene_postbattle_windmill_state then
	f_WindmillResponse_Open()
else
	f_WindmillResponse_Saved()
	SAVE.scene_postbattle_windmill_ratchet_state = 1
end

local continue = true
while continue do
	
	if not SAVE.scene_postbattle_windmill_ratchet_state then
		selection = f_RatchetResponse_Decadroid()
	else
		break
	end
	
	if (selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end

	wait()

end

foreach_moby_in_pod(NPC_POD, unobviate)




