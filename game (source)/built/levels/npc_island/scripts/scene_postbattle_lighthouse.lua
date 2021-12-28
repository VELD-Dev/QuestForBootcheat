--postbattle lighthouse scene
--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

---------------------------------------------------------------------
--Lighthouse Dialogs-------------------------------------------------
---------------------------------------------------------------------
LighthouseDlgDecadroid = {
	dialog = DialogueSpecs.NI_BATTLE_BOP_NO_SPEAK,
	--text    = "Deca-who now? Sorry kid, I only speak one language: the language of solidarity.",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_DISAGREE,    
		3.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

LighthouseDlgSaved = {
	dialog = DialogueSpecs.NI_BATTLE_BOP_THANKS,
	--text    = "Atta boy, atta boy! Ya did it!",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = { 
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

LighthouseDlgOpen = {
	dialog = DialogueSpecs.NI_BOP_NOWIND_ALT2,
	--text    = "Atta boy, atta boy! Ya did it!",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = { 
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

function f_LighthouseResponse_Open()
	activate_cam(get_hero(), postbattle_lighthouse_cam_closeup, true)
	actor_speak_and_wait(npc_lighthouse, LighthouseDlgOpen)
	return true
end

function f_LighthouseResponse_Decadroid()
	activate_cam(get_hero(), postbattle_lighthouse_cam_closeup, true)
	SAVE.scene_postbattle_lighthouse_state = 1
	actor_speak_and_wait(npc_lighthouse, LighthouseDlgDecadroid)
	return true
end

function f_LighthouseResponse_Saved()
	activate_cam(get_hero(), postbattle_lighthouse_cam_closeup, true)
	actor_speak_and_wait(npc_lighthouse, LighthouseDlgSaved)
	return false
end

function f_LighthouseResponse_Exit()

end

---------------------------------------------------------------------
--Ratchet Dialogs----------------------------------------------------
---------------------------------------------------------------------
RatchetDlgDecadroid = { 
	dialog = DialogueSpecs.NI_SMUG_RIDE_TRANSLATE,
	--text = "Can you translate this pirate map?", 
	func = f_LighthouseResponse_Decadroid,
}

RatchetDlgExit = {
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_LighthouseResponse_Exit,
	exit = true,
}

RatchetDialogTable = {
	RatchetDlgDecadroid,
	RatchetDlgExit
}

function f_RatchetResponse_Decadroid()
	activate_cam(get_hero(), postbattle_lighthouse_cam_medium, true)
	return scene_show_menu_and_wait(RatchetDialogTable)
end

---------------------------------------------------------------------
--Main Loop ---------------------------------------------------------
---------------------------------------------------------------------
hero_warp(get_hero(), postbattle_lighthouse_ratchet_warp_vol, true)
npc_warp(npc_lighthouse, postbattle_lighthouse_warp_vol)
make_actor(npc_lighthouse)
foreach_moby_in_pod(NPC_POD, obviate)

if not SAVE.scene_postbattle_lighthouse_state then
	f_LighthouseResponse_Open()
else
	f_LighthouseResponse_Saved()
	SAVE.scene_postbattle_lighthouse_ratchet_state = 1
end

local continue = true
while continue do
	
	if not SAVE.scene_postbattle_lighthouse_ratchet_state then
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
