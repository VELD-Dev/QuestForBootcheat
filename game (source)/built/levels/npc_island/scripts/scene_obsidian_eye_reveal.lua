-- Controls everything connected to the revealing of the Obsidian Eye.

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

-----------------------------------------------------------------------
-- MAYOR  RESPONSES ---------------------------------------------------
-----------------------------------------------------------------------
MayorDlgOpen = {	
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_OPEN,
	--text = "Young Lombax, I give you... The Obsidian Eye. The most powerful lorentzian telescope in the universe, with a reach of 4.8 trillion kilocubits. It was created with lenses carved from obsidian glass, and powered by a single fulcrum star. Darkwater built it himself so as to keep in contact with his little friends.",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		1.0,    AnimRoles.ANIM_ROLE_TH_EMPHASIS,
		10.0,   AnimRoles.ANIM_ROLE_RH_EMPHASIS,
		18.0,	AnimRoles.ANIM_ROLE_TH_EMPHASIS,   
	}
}

MayorDlgAnswer = {	
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_WHERE_RESPONSE,
	--text = "Well sure, if you have enough energy to power it up. Here -- I took the liberty of borrowing this from our archives. Theyre pages from Darkwaters personal journal.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_AGREE,
		1.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
		4.0,    AnimRoles.ANIM_ROLE_GET_OBJECT,
	}
}

function f_MayorResponse_Open()
	actor_speak_and_wait(npc_mayor, MayorDlgOpen)
	wait(0.2)
end

function f_MayorResponse_Answer()
	actor_speak_and_wait(npc_mayor, MayorDlgAnswer)
	wait(0.2)
end

-----------------------------------------------------------------------
-- Ratchet RESPONSES --------------------------------------------------
-----------------------------------------------------------------------
RatchetDlgWhere = { 
	--text = "Can it tell me where they are?",
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_WHERE,
	--func = f_MayorResponse_Answer
	--stance = AnimRoles.ANIM_ROLE_STAND,
	--target  = get_hero(),
	--gesture = {
	--	0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	--}
}

RatchetDialogTable={
	RatchetDlgWhere
}

function f_RatchetResponse_Where()
	scene_speak_and_wait(get_hero(), RatchetDlgWhere)
end

-----------------------------------------------------------------------
-- MAIN ---------------------------------------------------------------
-----------------------------------------------------------------------

--set up hero and actors
mayortheme1 = true --adding variable to start mayor theme cro 5/7

active_hero = get_hero();
hero_warp(active_hero, obsidian_eye_ratchet_warp_vol, true)
npc_warp(npc_mayor, obsidian_eye_mayor_warp_vol)
ally_warp(tal, obsidian_eye_tal_warp_vol )
make_actor( npc_mayor );
make_actor(tal)

prt("Cam: Opening")
activate_cam( get_hero(), obsidian_eye_reveal_cam2 )
f_MayorResponse_Open()

f_RatchetResponse_Where()

prt("Cam: Closeup")
activate_cam(get_hero(), scene_obsidianeye_mayor_closeup_cam)
f_MayorResponse_Answer()

revert_actor(tal)

mayortheme1 = false

fade_to_black(1.0)
wait(1.0)
	

