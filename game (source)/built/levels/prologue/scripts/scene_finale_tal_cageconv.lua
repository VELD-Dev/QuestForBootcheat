-- Controls cine's for Slag's intro on the West ship.

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)
-- turn the lightning off
deactivate( darkwater_ship_lightning_controller )
deactivate( slag_west_ship_lightning_controller )
deactivate( slag_east_ship_lightning_controller )

ally_unequipitem(talwyn, ALLY_ITEM_GUN)

----------------------------------------------------------------------------------------------------
-- Tal Dialogue
----------------------------------------------------------------------------------------------------
TalDlgOkay = {	
	dialog = DialogueSpecs.FI_TAL_OKAY_RESPONSE,
	--text = "Yes, I am fine. We need to find something that can breach the field. Something marked by death.",
	--stance  = AnimRoles.ANIM_ROLE_HOVER_FORWARD_NO_GUN,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,--RHW
		1.0,	AnimRoles.ANIM_ROLE_BLINK,
		3.0,    AnimRoles.ANIM_ROLE_CONFUSED,--BHE
	}
}

TalDlgMarked = {	
	dialog = DialogueSpecs.FI_TAL_MARKED_RESPONSE,
	--text = "Try one of those pirate skulls! Hurry!",
	--stance  = AnimRoles.ANIM_ROLE_HOVER_FORWARD_NO_GUN,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,--RHW
		1.5,	AnimRoles.ANIM_ROLE_FIST_RIGHT
	}
}

TalDlgFulcrum = {	
	dialog = DialogueSpecs.FI_TAL_FULCRUM_RESPONSE,
	--text = "I saw Slag give it to Rusty Pete. We have to stop them, Ratchet. They will use it to find the Zoni home world!",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,--RHW
		0.8,	AnimRoles.ANIM_ROLE_BLINK,
		2.0,    AnimRoles.ANIM_ROLE_QUESTION,--BHE
		5.0,	AnimRoles.ANIM_ROLE_BLINK,
	}
}

TalDlgNoFulcrum = {	
	dialog = DialogueSpecs.FI_TAL_FULCRUM_RELEASED,
	--text = "Thanks, Ratchet! Come on- I saw Slag give the star to Rusty Pete. They are going to pillage the zoni home world!",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	target  = get_hero(),
	gesture = {
		0.5,    AnimRoles.ANIM_ROLE_REACH_LEFT,--RHW
		3.0,    AnimRoles.ANIM_ROLE_REACH_CONFUSED,--BHE
		9.0,	AnimRoles.ANIM_ROLE_FIST_LEFT--BHE
	}
}

TalDlgMarkedReleased = {	
	dialog = DialogueSpecs.FI_TAL_SAVE_FULCRUM_RELEASED,
	--text = "Thanks, Ratchet! That is two I owe you!",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_QUESTION,--RHW
	}
}

TalDlgFulcrumReleased = {	
	dialog = DialogueSpecs.FI_TAL_NOSAVE_FULCRUM_RELEASED,
	--text = "Thanks Ratchet! Come on, we don’t have a lot of time!",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_QUESTION,--RHW
	}
}

function f_TalResponse_Okay()
	activate_cam(get_hero(), tal_cage_cam_closeup, true )
	actor_speak_and_wait( talwyn, TalDlgOkay)
	wait(0.2)
	SAVE.scene_ftc_state = 1
	return true
end

function f_TalResponse_Marked()
	activate_cam( get_hero(), tal_cage_cam_closeup, true )
	actor_speak_and_wait( talwyn, TalDlgMarked)
	wait(0.2)
end

function f_TalResponse_Fulcrum()
	activate_cam( get_hero(), tal_cage_cam_closeup, true )
	actor_speak_and_wait( talwyn, TalDlgFulcrum)
	wait(0.2)
	SAVE.scene_finale_tal_cageconv_fulcrum = true
	return true
end

function f_TalResponse_NoFulcrum()
	activate_cam( get_hero(), tal_cage_cam_closeup, true )
	actor_speak_and_wait( talwyn, TalDlgNoFulcrum)
	wait(0.2)
end

function f_TalResponse_MarkedReleased()
	activate_cam( get_hero(), tal_cage_cam_closeup, true )
	actor_speak_and_wait( talwyn, TalDlgMarkedReleased)
	wait(0.2)
end

function f_TalResponse_FulcrumReleased()
	activate_cam( get_hero(), tal_cage_cam_closeup, true )
	actor_speak_and_wait( talwyn, TalDlgFulcrumReleased)
	wait(0.2)
end

function f_TalResponse_Exit()

end

----------------------------------------------------------------------------------------------------
-- Ratchet Dialogue
----------------------------------------------------------------------------------------------------
RatchetDlgOkay = { 
	dialog = DialogueSpecs.FI_TAL_OKAY,
	--text = "Are you okay?",
	func = f_TalResponse_Okay
}

RatchetDlgMarked = { 
	dialog = DialogueSpecs.FI_TAL_MARKED,
	--text = "What is something marked by death?",
	func = f_TalResponse_Marked
}

RatchetDlgFulcrum = { 
	dialog = DialogueSpecs.FI_TAL_FULCRUM,
	--text = "Where is the fulcrum star?",
	func = f_TalResponse_Fulcrum
}

--exit is in for debug purposes
RatchetDlgExit = { 
	dialog = DialogueSpecs.FI_TAL_FULCRUM,
	--text = "Goodbye.",
	func = f_TalResponse_Exit
}

RatchetDialogTable = {
	RatchetDlgOkay,
	RatchetDlgFulcrum
}

RatchetDialogTable2 = {
	RatchetDlgMarked
}

function f_RatchetResponse_Open()
	activate_cam( get_hero(), tal_cage_cam )
	return scene_show_menu_and_wait(RatchetDialogTable)
end

function f_RatchetResponse_Marked()
	activate_cam( get_hero(), tal_cage_cam )
	return scene_show_menu_and_wait(RatchetDialogTable2)
end

----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------
hero_warp( get_hero(), tal_cageconv_ratchet_warp )
ally_warp( talwyn, tal_cage_warp_vol)
make_actor(talwyn)
SAVE.Tal_finale_cageconv = true
request_auto_save()
prt("setting SAVE.Tal_finale_cageconv to true")
--wait(5.0)
wait(0.2)

--changes to true if he asks about the fulcrum star
--SAVE.scene_finale_tal_cageconv_fulcrum


----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

local continue = true
while continue do
	
	if not SAVE.scene_ftc_state then
		selection = f_RatchetResponse_Open()
	else
		selection = f_RatchetResponse_Marked()
	end
	
	if (selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end

wait()

end

--prt("Ratchet asked about the fulcrum star: " .. tostring(SAVE.scene_finale_tal_cageconv_fulcrum))
revert_actor(talwyn)
ally_equipitem(talwyn, ALLY_ITEM_GUN)

-- Get the Lightning working
activate( darkwater_ship_lightning_controller )
activate( slag_west_ship_lightning_controller )
activate( slag_east_ship_lightning_controller )
