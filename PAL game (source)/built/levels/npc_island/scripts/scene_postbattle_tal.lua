-- Controls Scene with Tal after the Battlefield has been completed.

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

--obviate hoolefoids
foreach_moby_in_pod(NPC_POD, obviate)

----------------------------------------------------------------------------------
--Tal Lines------------------------------------------------------------------
----------------------------------------------------------------------------------

--First line of conv after pressing Triangle to start
TalDlgOpen = {
	dialog = DialogueSpecs.NI_BATTLE_TAL_LANDS,
	--text = "We have to catch up with Darkwater before he comes back for another raid. Do you have any idea where he went?",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		1.4,	AnimRoles.ANIM_ROLE_BLINK,
		3.5,	AnimRoles.ANIM_ROLE_QUESTION,
	}
}

--Response to RIDE_TRANSLATE
TalDlgMorrow = {
	dialog = DialogueSpecs.NI_BATTLE_TAL_LANDS_MORROW_RESPONSE,
	--text = "But the fulcrum star isnt in Morrow Caverns. We wouldve found it. Isnt there anyplace else theyd go?",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_CONFUSED,
		3.0,	AnimRoles.ANIM_ROLE_QUESTION,
	}
}

--Response to VACATION
TalDlgArdolis = {
	dialog = DialogueSpecs.NI_BATTLE_TAL_LANDS_ARDOLIS_RESPONSE,
	--text = "Ardolis? Thats on the other side of the galaxy! No way theyd hide the fulcrum star there.",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_CONFUSED,
		2.0,	AnimRoles.ANIM_ROLE_BLINK,
		3.0,	AnimRoles.ANIM_ROLE_FIST_RIGHT,
	}
}

--Response to VACATION
TalDlgProblem = {
	dialog = DialogueSpecs.NI_BATTLE_TAL_LANDS_PROBLEM_RESPONSE,
	--text = "Not your problem? If we dont get that star, youll never see Clank again! Who knows what kind of danger hes in!",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_CONFUSED,
		2.0,	AnimRoles.ANIM_ROLE_BLINK,
		5.0,	AnimRoles.ANIM_ROLE_QUESTION,
	}
}

--
TalDlgMap = {
	dialog = DialogueSpecs.NI_BATTLE_TAL_LANDS_MAP_RESPONSE,
	--text = "A map? Ratchet, that could be the location of Darkwaters treasure! See if you can find someone to translate it.",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_QUESTION,
		2.3,	AnimRoles.ANIM_ROLE_BLINK,
		4.5,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}


----------------------------------------------------------------------------------
--Tal Functions-------------------------------------------------------
----------------------------------------------------------------------------------

function f_TalResponse_Open()
	activate_cam(get_hero(), scene_postbattle_tal_cam_closeup)
	actor_speak_and_wait(tal, TalDlgOpen)
	wait(0.2)
	return true
end

function f_TalResponse_Morrow()
	activate_cam(get_hero(), scene_postbattle_tal_cam_closeup)
	actor_speak_and_wait(tal, TalDlgMorrow)
	wait(0.2)
	return true
end

function f_TalResponse_Ardolis()
	activate_cam(get_hero(), scene_postbattle_tal_cam_closeup)
	actor_speak_and_wait(tal, TalDlgArdolis)
	wait(0.2)
	return true
end

function f_TalResponse_Problem()
	activate_cam(get_hero(), scene_postbattle_tal_cam_closeup)
	actor_speak_and_wait(tal, TalDlgProblem)
	wait(0.2)
	return true
end

function f_TalResponse_Map()
	activate_cam(get_hero(), scene_postbattle_tal_cam_closeup)
	actor_speak_and_wait(tal, TalDlgMap)
	wait(0.2)
	--return true
end

----------------------------------------------------------------------------------
--Ratchet Lines(er, text)---------------------------------------------------------
----------------------------------------------------------------------------------


RatchetDlgMorrow = {
	dialog = DialogueSpecs.NI_BATTLE_TAL_LANDS_MORROW,
	--text = "To Morrow Caverns?",
	func = f_TalResponse_Morrow
}


RatchetDlgArdolis = {
	dialog = DialogueSpecs.NI_BATTLE_TAL_LANDS_ARDOLIS,
	--text = "To Ardolis?",
	func = f_TalResponse_Ardolis
}


RatchetDlgProblem = {
	dialog = DialogueSpecs.NI_BATTLE_TAL_LANDS_PROBLEM,
	--text = "To the magical land of Not My Problem?",
	func = f_TalResponse_Problem
}


RatchetDlgMap = {
	dialog = DialogueSpecs.NI_BATTLE_TAL_LANDS_MAP,
	--text = "I found this map. Maybe its a clue!",
	func = f_TalResponse_Map
}

RatchetDialogTable = {
	RatchetDlgMorrow,
	RatchetDlgProblem,
	RatchetDlgMap,
	RatchetDlgArdolis
}

----------------------------------------------------------------------------------
--Ratchet Functions---------------------------------------------------------------
----------------------------------------------------------------------------------

--Play this first thing after initial meeting
function f_RatchetMenu_Open()
	activate_cam(get_hero(), scene_postbattle_tal_cam_medium)
	--scene_set_title(DialogueSpecs.NI_SMUG_INITIAL_HEREMENU)
	return scene_show_menu_and_wait(RatchetDialogTable)
	--scene_clear_title()
end

----------------------------------------------------------------------------------
--ABORT---------------------------------------------------------------------------
----------------------------------------------------------------------------------
--function abort()
--end

----------------------------------------------------------------------------------
--Main Loop-----------------------------------------------------------------------
----------------------------------------------------------------------------------

--Get the hero, smuggler and parrot and make them actors

active_hero = get_hero()
hero_warp(active_hero, post_battle_ratchet_warp_vol, true)
ally_warp(tal, post_battle_tal_warp_vol)
make_actor(tal)
actor_set_stance(tal, AnimRoles.ANIM_ROLE_IDLE)
f_TalResponse_Open()

local continue = true
while continue do
	
	selection = f_RatchetMenu_Open()
	
	if(selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end
	
wait()	
	
end

revert_actor(tal)

foreach_moby_in_pod(NPC_POD, unobviate)
