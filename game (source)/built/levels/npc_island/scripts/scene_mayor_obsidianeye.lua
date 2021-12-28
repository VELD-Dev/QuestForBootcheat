-- villager anim roles
-- ANIM_ROLE_STAND - relaxed stance
-- ANIM_ROLE_INCH_FORWARD - lean forward 
-- ANIM_ROLE_INCH_BACKWARD - lean backwards
-- ANIM_ROLE_LOOK_AROUND - look around
-- ANIM_ROLE_WALK - cowering walk
-- ANIM_ROLE_JOG - confident walk
-- ANIM_ROLE_RUN - nervous walk
-- ANIM_ROLE_REACH_RIGHT - right arm gesture
-- ANIM_ROLE_REACH_LEFT - left arm gesture
-- ANIM_ROLE_FIST_RIGHT - right arm fist gesture
-- ANIM_ROLE_FIST_LEFT - left arm fist gesture
-- ANIM_ROLE_AGREE - "yes" head nod gesture
-- ANIM_ROLE_DISAGREE - "no" head shake gesture

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

-----------------------------------------------------------------------
-- MAYOR  RESPONSES ---------------------------------------------------
-----------------------------------------------------------------------

MayorDlgFulcrum = {	
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_FULCRUM_RESPONSE,
	--text = "Ah yes, the fulcrum star. Its not actually a star, mind you. Its a stabilized, reusable black hole preserved in furian crystal. It allows astronomers to peer across distances never before thought imaginable. If the Zoni were the last thing Darkwater was lookin at, that star will show you.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_LH_HEAD_NOD,
		3.0,	AnimRoles.ANIM_ROLE_TH_EMPHASIS,
		12.0,	AnimRoles.ANIM_ROLE_RH_EMPHASIS,
		19.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
		21.0,	AnimRoles.ANIM_ROLE_RH_HEAD_NOD,
	}
}

MayorDlgDarkwater = {	
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_DARKWATER_RESPONSE,
	--text = "Darkwater was known for being vile, iron-fisted, and above all, cheap. It was said he pillaged a million bolts without ever spending a penny, instead hiding his loot in a place called Darkwater Cove. Of course, no ones ever seen the island, and its not on any map Ive ever encountered.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		2.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,
		3.0,	AnimRoles.ANIM_ROLE_FIST_LEFT,
		4.5,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		6.5,	AnimRoles.ANIM_ROLE_RH_EMPHASIS,
		12.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		15.5,	AnimRoles.ANIM_ROLE_TH_EMPHASIS,
	}
}

MayorDlgZoni = {	
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_ZONI_RESPONSE,
	--text = "Hmm, Im afraid I dont know much about the Zoni. Darkwater spoke of little creatures who once possessed the power to unmake existence. He referred to them as friends, but I suspect he was only biding his time. See according to legend, the Zoni lived in a world of untold riches- riches, I said. Thats the kind of word that makes even the most rusty of pirate mouths salivate.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_SCRATCH_HEAD,
		1.0,	AnimRoles.ANIM_ROLE_DISAGREE,
		4.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		8.0,	AnimRoles.ANIM_ROLE_FIST_LEFT,
		10.0,	AnimRoles.ANIM_ROLE_TH_EMPHASIS,
		18.0,	AnimRoles.ANIM_ROLE_RH_EMPHASIS,
		22.0,	AnimRoles.ANIM_ROLE_LH_HEAD_NOD,
		23.0,	AnimRoles.ANIM_ROLE_TH_EMPHASIS,
	}
}

MayorDlgCove = {	
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_COVE_RESPONSE,
	--text = "Darkwater Cove is as much a myth as this curse my constituents keep talking about. A dark place guarded by devious puzzles and booby traps -- a place where Darkwater felt safe leaving his treasure, away from prying eyes and greedy hands. According to the legend, only Darkwater himself can pass through safely. But thats if you believe the legend, mind you.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS,
		6.0,	AnimRoles.ANIM_ROLE_TH_EMPHASIS,
		10.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		12.0,	AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

MayorDlgFriend = {	
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_FRIEND,
	--text = "Hey there, fella. I thought you were meeting your friend by the pier?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

function f_MayorResponse_Fulcrum()
	activate_cam(get_hero(), scene_obsidianeye_mayor_closeup_cam)
	actor_speak_and_wait( npc_mayor, MayorDlgFulcrum )
	wait(0.2)
	return true
end

function f_MayorResponse_Darkwater()
	activate_cam(get_hero(), scene_obsidianeye_mayor_closeup_cam)
	actor_speak_and_wait( npc_mayor, MayorDlgDarkwater )
	
	RatchetDialogTable[4] = RatchetDlgCove
	RatchetDialogTable[5] =  RatchetDlgExit

	wait(0.2)
		
	return true
end

function f_MayorResponse_Zoni()
	activate_cam(get_hero(), scene_obsidianeye_mayor_closeup_cam)
	actor_speak_and_wait( npc_mayor, MayorDlgZoni )
	wait(0.2)
	return true
end

function f_MayorResponse_Cove()
	activate_cam(get_hero(), scene_obsidianeye_mayor_closeup_cam)
	actor_speak_and_wait( npc_mayor, MayorDlgCove )
	wait(0.2)
	return true
end

function f_MayorResponse_Friend()
	activate_cam(get_hero(), scene_obsidianeye_mediumshot_cam)
	actor_speak_and_wait(npc_mayor, MayorDlgFriend)
	wait(0.2)
end

function f_MayorResponse_Exit()
	--crap out
end

-----------------------------------------------------------------------
-- RATCHET DIALOGUE DATA ----------------------------------------------
-----------------------------------------------------------------------

RatchetDlgFulcrum = { 
	--text = "The Fulcrum Star?",
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_FULCRUM,   
	func = f_MayorResponse_Fulcrum
}

RatchetDlgDarkwater = { 
	--text = "Captain Darkwater?",
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_DARKWATER,   
	func = f_MayorResponse_Darkwater
}

RatchetDlgZoni = { 
	--text = "The Zoni?",
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_ZONI,   
	func = f_MayorResponse_Zoni
}

RatchetDlgCove = { 
	--text = "Darkwater Cove?",
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_COVE,   
	func = f_MayorResponse_Cove
}

RatchetDlgExit = { 
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_MayorResponse_Exit,
	exit = true,
}

RatchetDialogTable = {
  RatchetDlgFulcrum,
  RatchetDlgDarkwater,
  RatchetDlgZoni,
  --RatchetDlgCove,
  RatchetDlgExit
}

function f_RatchetResponse_Tell()
	activate_cam(get_hero(), scene_obsidianeye_mediumshot_cam)
	scene_set_title(DialogueSpecs.NI_OBSIDIAN_MAYOR_MORE)
	functionselection = scene_show_menu_and_wait(RatchetDialogTable)
	if(functionselection) then
		scene_clear_title()
		return functionselection
	end
end

-----------------------------------------------------------------------
-- ABORT --------------------------------------------------------------
-----------------------------------------------------------------------

--function abort()
--end
 
-----------------------------------------------------------------------
-- MAIN LOOP ----------------------------------------------------------
-----------------------------------------------------------------------

--set up hero and actors
active_hero = get_hero();
hero_warp(active_hero, obsidian_eye_ratchet_warp_vol, true)
npc_warp(npc_mayor, obsidian_eye_mayor_warp_vol)
make_actor( npc_mayor );

--initial greeting
f_MayorResponse_Friend()

local continue = true;
while continue do
	
	--questions
	selection = f_RatchetResponse_Tell()
	
	-- this calls the 'func' and returns the return value
	if (selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end

wait()

end

-- and we're done

-- fade out/back in, letterbox status, etc, all handled automatically

