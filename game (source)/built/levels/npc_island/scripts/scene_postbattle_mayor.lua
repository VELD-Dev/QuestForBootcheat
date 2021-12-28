--Postbattle mayor scene
--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

-------------------------------------------------
--Mayor Speek stuff -----------------------------
-------------------------------------------------
MayorDlgDecadroid = {
	dialog = DialogueSpecs.NI_BATTLE_MAYOR_NO_SPEAK,
	--text    = "Sorry, friend. I’m afraid I don’t speak decadroid.",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_DISAGREE,    
		1.5,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

MayorDlgOpenCannon = {
	dialog = DialogueSpecs.NI_RETURN_MAYOR_CANNON_OPENER,
	--text = "Well hey, there, young feller. Run into any more pirates?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

MayorDlgOpenTourist = {
	dialog = DialogueSpecs.NI_RETURN_MAYOR_TOURIST_OPENER,
	--text = "Well if it isnt Hoolefar’s only tourist. What can I do for you, young feller?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

MayorDlgOpenSalesman = {
	dialog = DialogueSpecs.NI_RETURN_MAYOR_SALESMAN_OPENER,
	--text = "Hey, young feller.  Found any buyers for that crotchetizer thing-a-majig?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		1.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

MayorDlgOpenBusiness = {
	dialog = DialogueSpecs.NI_RETURN_MAYOR_BUSINESS_OPENER,
	--text = "Hey, Stranger. What can I do for ya?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_RH_WAVE,
		2.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

function f_MayorResponse_Decadroid()
	activate_cam(get_hero(), postbattle_mayor_cam_closeup, true)
	actor_speak_and_wait(npc_mayor, MayorDlgDecadroid)
	return true
end

function f_MayorResponse_Open()
	activate_cam(get_hero(), postbattle_mayor_cam_closeup, true)
	
	if (SAVE.scene_mayor_ratchet_answer == 1) then
		actor_speak_and_wait(npc_mayor, MayorDlgOpenCannon)
	elseif (SAVE.scene_mayor_ratchet_answer == 2) then
		actor_speak_and_wait(npc_mayor, MayorDlgOpenTourist)
	elseif (SAVE.scene_mayor_ratchet_answer == 3) then
		actor_speak_and_wait(npc_mayor, MayorDlgOpenSalesman)
	elseif (SAVE.scene_mayor_ratchet_answer == 4) then
		actor_speak_and_wait(npc_mayor, MayorDlgBusiness)
	else
		prt("ERROR: RATCHET NEVER ANSWERED! Set SAVE.scene_mayor_ratchet_answer to 1 to 4")
		actor_speak_and_wait(npc_mayor, MayorDlgOpenCannon)
	end
	
	return true
end

function f_MayorResponse_Exit()
	--This should crap out of the scene
end

-------------------------------------------------
--Ratchet Speeching Stuff -----------------------
-------------------------------------------------
RatchetDlgDecadroid = { 
	dialog = DialogueSpecs.NI_SMUG_RIDE_TRANSLATE,
	--text = "Can you translate this pirate map?", 
	func = f_MayorResponse_Decadroid,
}

RatchetDlgExit = {
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_MayorResponse_Exit,
	exit = true,
}

RatchetDialogTable = {
	RatchetDlgDecadroid,
	RatchetDlgExit
}

function f_RatchetResponse_Decadroid()
	activate_cam(get_hero(), postbattle_mayor_cam_medium, true)
	return scene_show_menu_and_wait(RatchetDialogTable)
end

-------------------------------------------------
--Maine Loop ------------------------------------
-------------------------------------------------
hero_warp(get_hero(), postbattle_mayor_ratchet_warp_vol, true)
npc_warp(npc_mayor, postbattle_mayor_warp_vol)
make_actor(npc_mayor)
foreach_moby_in_pod(NPC_POD, obviate)

f_MayorResponse_Open()

local continue = true
while continue do
	
	selection = f_RatchetResponse_Decadroid()
	
	if (selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end

	wait()

end

foreach_moby_in_pod(NPC_POD, unobviate)


