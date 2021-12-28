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
-- ANIM_ROLE_BLINK
-- ANIM_ROLE_HEAD_UP
-- ANIM_ROLE_HEAD_DOWN
-- ANIM_ROLE_REMOVE_OBJECT
-- ANIM_ROLE_RH_HEAD_SIDE - RH = Right Hand
-- ANIM_ROLE_RH_HEAD_NOD
-- ANIM_ROLE_LH_HEAD_SIDE - Left Hand
-- ANIM_ROLE_LH_HEAD_NOD
-- ANIM_ROLE_RF_HEAD_SIDE - Right Fist
-- ANIM_ROLE_RF_HEAD_NOD
-- ANIM_ROLE_LF_HEAD_NOD - Left Fist
-- ANIM_ROLE_LF_HEAD_SIDE



--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)
-----------------------------------------------------------------------
-- MAYOR  RESPONSES ---------------------------------------------------
-----------------------------------------------------------------------

--First line of conv after pressing Triangle to start.
WindmillDlgOpen = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_OPENER,
	--text    = "Dang-nab-it! This is the third time this year these old wind turbines have stopped workin. Its sabotage, I tell you! Someones been messin with my quipment!",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_LF_HEAD_SIDE,
		2.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		7.0,	AnimRoles.ANIM_ROLE_DISAGREE,
		10.1,	AnimRoles.ANIM_ROLE_FIST_RIGHT,
	}
}

--First line of conv after pressing Triangle to start (when Ratchet has answered "Sorry, pal. I got better things to do!"
WindmillDlgSecondOpen = {
	dialog = DialogueSpecs.NI_WMO_FIXING_OPENER,
	--text    = "Hey, youre back! What can I do for ya?",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_HEAD_UP,
		1.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--Automatic response to PROBLEM
WindmillDlgProblem = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_WINDMENU_PROBLEM_RESPONSE,
	--text = "Problem is these here wind turbines are bout the only thing keeping the juice flowin through the island. No juice, no beacon. No beacon, no supplies. You follow?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_HEAD_UP,
		0.5,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Automatic response to SABOTAGE
WindmillDlgSabotage = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_WINDMENU_SABOTAGE_RESPONSE,
	--text = "Some shady character who's been hanging around the beach. Tall feller, annoying parrot. Always seem him pallin' around with them pirates!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		--0.0,    AnimRoles.ANIM_ROLE_DISAGREE, -- AY - this one was causing a weird animation pop
		2.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		5.5,	AnimRoles.ANIM_ROLE_FIST_RIGHT,
	}
}

--Automatic response to asking about DARKWATER
WindmillDlgDarkwater = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_WINDMENU_DARKWATER_RESPONSE,
	--text = "Darkwater? Sorry, stranger - we don't talk about him 'round these parts, on account of the curse.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_DISAGREE,
		2.0,    AnimRoles.ANIM_ROLE_LOOK_AROUND,
	}
}

--Continues after ANY of the WINDMENU questions have been answered
WindmillDlgHeights = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_HEIGHTS,
	--text = "Anyways, my brother-in-law was sposed to come back and help repair these turbines, but he probably went fishin instead. Think you could help a feller out? Id do it myself, but I... Im afraid of heights!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_LH_HEAD_NOD,
		2.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
		--5.0,	AnimRoles.ANIM_ROLE_INCH_FORWARD,
		--5.2,	AnimRoles.ANIM_ROLE_HEAD_UP,
		--7.5,	AnimRoles.ANIM_ROLE_INCH_BACKWARD,
		8.0,	AnimRoles.ANIM_ROLE_RH_HEAD_SIDE,
	}
}

--Automatic response to REPAIRMENU_YES
WindmillDlgYes = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_REPAIRMENU_YES_RESPONSE,
	--text = "Id sure appreciate it, stranger! Coupla good turns on that bolt crank up there oughta get her goin again. Good luck!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_INCH_BACKWARD,
		0.2,	AnimRoles.ANIM_ROLE_HEAD_UP,
		4.0,	AnimRoles.ANIM_ROLE_LH_HEAD_NOD,
	}
}

--Automatic response to REPAIRMENU_NO
WindmillDlgNo = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_REPAIRMENU_NO_RESPONSE,
	--text = "Well, then I spose Ill just have to sit here and wait fer them to repair themselves! (hums)",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_DISAGREE,
		1.5,	AnimRoles.ANIM_ROLE_LH_HEAD_NOD,
		4.0,	AnimRoles.ANIM_ROLE_HEAD_DOWN,
	}
}

--Automatic response to CURSE
WindmillDlgCurse = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_CURSE_RESPONSE,
	--text = "Well yeah! The curse of the undead! Although Im not exactly sure how you can be un-dead. Spose it just means alive. Aww, now I’ve gone and confused mself.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_LOOK_AROUND,
		4.0,	AnimRoles.ANIM_ROLE_LH_HEAD_NOD,
		8.0,	AnimRoles.ANIM_ROLE_DISAGREE,
	}
}

--Automatic response if Ratchet says yes
WindmillDlgChange =
{
	dialog = DialogueSpecs.NI_WMO_FIXING_CHANGE_RESPONSE,
	--text = "Id sure appreciate it, stranger! Just climb on up there and give the ol bolt crank a turn.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_INCH_BACKWARD,
		0.2,	AnimRoles.ANIM_ROLE_HEAD_UP,
		3.5,	AnimRoles.ANIM_ROLE_LH_HEAD_NOD,
	}
}

--Says if Ratchet goes back to him after agreeing to help
WindmillDlgFix = {
	dialog = DialogueSpecs.NI_WMO_FIXING_FIXED_YET,
	--text = "Heya stranger - you fix them wind turbines yet?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_HEAD_UP,
		2.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Play when Ratchet talks to him initially
function f_WindmillResponse_Open()
	activate_cam(active_hero, scene_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgOpen)
	wait(0.2)
	return true
end


--Play if Ratchet asks what's the problem
function f_WindmillResponse_Problem()
	activate_cam(active_hero, scene_windmill_cam_scrollup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgProblem)
	wait(0.2)
	
	if not SAVE.scene_windmill_ratchet_state then
		f_WindmillResponse_Heights()
	end
	
	return true
end

--Play if Ratchet asks about sabotage
function f_WindmillResponse_Sabotage()
	activate_cam(active_hero, scene_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgSabotage)
	wait(0.2)
	
	if not SAVE.scene_windmill_ratchet_state then
		f_WindmillResponse_Heights()
	end
	
	return true
end

--Play if Ratchet asks about Darkwater
function f_WindmillResponse_Darkwater()
	activate_cam(active_hero, scene_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgDarkwater)
	wait(0.2)
	
	SAVE.scene_Windmill_curse = true
	
	if not SAVE.scene_windmill_ratchet_state then
		f_WindmillResponse_Heights()
	end
	
	return true
end

--Play after any of the first responses
function f_WindmillResponse_Heights()
	activate_cam(active_hero, scene_windmill_cam_mediumshot, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgHeights)
	wait(0.2)
	SAVE.scene_windmill_ratchet_state = 1
    return true
end

--Play if Ratchet says yes
function f_WindmillResponse_Yes()
	activate_cam(active_hero, scene_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgYes)
	wait(0.2)
	SAVE.scene_windmill_state = 2
	SAVE.scene_windmill_ratchet_state = 2
	return true
end

--Play if Ratchet says no
function f_WindmillResponse_No()
	activate_cam(active_hero, scene_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgNo)
	wait(0.2)
	SAVE.scene_windmill_state = 1
	SAVE.scene_windmill_ratchet_state = 3
	return true
end

--Play if Ratchet axes about the curse
function f_WindmillResponse_Curse()
	activate_cam(active_hero, scene_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgCurse)
	wait(0.2)
	return true
end

--Play if Ratchet comes back after saying no
function f_WindmillResponse_SecondOpen()
	activate_cam(active_hero, scene_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgSecondOpen)
	wait(0.2)
	return true
end

--Play if Ratchet changes his mind
function f_WindmillResponse_Change()
	activate_cam(active_hero, scene_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgChange)
	wait(0.2)
	SAVE.scene_windmill_state = 2
	SAVE.scene_windmill_ratchet_state = 2
	return true
end

--Play if Ratchet comes back after saying yes
function f_WindmillResponse_Fix()
	activate_cam(active_hero, scene_windmill_cam_closeup, true)
	actor_speak_and_wait(npc_windmill, WindmillDlgFix)
	wait(0.2)
end

function f_WindmillResponse_Exit()
	--exit
end

-----------------------------------------------------------------------
-- RATCHET DIALOGUE DATA ----------------------------------------------
-----------------------------------------------------------------------

--Available after initial meeting
RatchetDlgProblem =	{
	dialog = DialogueSpecs.NI_WMO_INITIAL_WINDMENU_PROBLEM,
	--text = "What seems to be the problem?",          
	func = f_WindmillResponse_Problem
}
				
--Available after initial meeting
RatchetDlgSabotage = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_WINDMENU_SABOTAGE,
	--text = "Sabotage?? Do you know who did it?", 
	func = f_WindmillResponse_Sabotage
}

--Available after initial meeting
RatchetDlgDarkwater = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_WINDMENU_DARKWATER,
	--text = "Do you know anything about Angstrom Darkwater?",
	func = f_WindmillResponse_Darkwater
}

--Available after he asks for help
RatchetDlgYes = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_REPAIRMENU_YES,
	--text = "Sure, I'll help!",
	func = f_WindmillResponse_Yes
}

--Available after he asks for help				
RatchetDlgNo = {
	dialog = DialogueSpecs.NI_WMO_INITIAL_REPAIRMENU_NO, 
	--text = "Sorry, pal. I got better things to do.", 
	func = f_WindmillResponse_No
}

--Available after he asks for help
RatchetDlgCurse = { 
	dialog = DialogueSpecs.NI_WMO_INITIAL_CURSE,
	--text = "Did you say something about a curse?",
	func = f_WindmillResponse_Curse
}

--Available after he says no
RatchetDlgChange = 	{ 
	dialog = DialogueSpecs.NI_WMO_FIXING_CHANGE,
	--text = "I changed my mind. I'll do it!",
	func = f_WindmillResponse_Change
}

RatchetDlgExit = 	{ 
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_WindmillResponse_Exit,
	exit = true,
}


--Group the tables together correctly				
RatchetDialogTable1 = {
	RatchetDlgProblem,
	RatchetDlgSabotage,
	RatchetDlgDarkwater
}

RatchetDialogTable2 = {
	RatchetDlgYes,
	RatchetDlgNo
}

RatchetDialogTable3 = {
	RatchetDlgProblem,
	RatchetDlgSabotage,
	RatchetDlgDarkwater,
	RatchetDlgExit
}

RatchetDialogTable4 = {
	RatchetDlgChange,
	RatchetDlgExit
}

RatchetDialogTable5 = {
	RatchetDlgProblem,
	RatchetDlgSabotage,
	RatchetDlgCurse,
	RatchetDlgExit
}

-----------------------------------------------------------------------
-- Ratchet Functions --------------------------------------------------
-----------------------------------------------------------------------
function f_RatchetMenu_Open()
	activate_cam(active_hero, scene_windmill_cam_mediumshot, true)
	return scene_show_menu_and_wait(RatchetDialogTable1)
end

function f_RatchetMenu_Help()
	activate_cam(active_hero, scene_windmill_cam_mediumshot, true)
	return scene_show_menu_and_wait(RatchetDialogTable2)
end

function f_RatchetMenu_ReturnYes()
	activate_cam(active_hero, scene_windmill_cam_mediumshot, true)
	return scene_show_menu_and_wait(RatchetDialogTable3)
end

function f_RatchetMenu_ReturnNo()
	activate_cam(active_hero, scene_windmill_cam_mediumshot, true)
	return scene_show_menu_and_wait(RatchetDialogTable4)
end

function f_RatchetMenu_ReturnCurse()
	activate_cam(active_hero, scene_windmill_cam_mediumshot, true)
	return scene_show_menu_and_wait(RatchetDialogTable5)
end

-----------------------------------------------------------------------
-- ABORT --------------------------------------------------------------
-----------------------------------------------------------------------
--function abort()
--end

-----------------------------------------------------------------------
-- MAIN LOOP ----------------------------------------------------------
-----------------------------------------------------------------------

--Get the hero and NPCs
active_hero = get_hero()
npc_warp( npc_windmill, scene_windmill_npc_pos)
make_actor(npc_windmill)

-- while screen is black, warp the hero and camera
hero_warp( active_hero, scene_windmill_hero_pos, true )

--if the player completed the first windmill, brush him off
if SAVE.windmill1_complete then
	SAVE.scene_windmill_state = 2
	SAVE.scene_windmill_ratchet_state = 5
end

if not SAVE.scene_windmill_state then
	f_WindmillResponse_Open()

elseif SAVE.scene_windmill_state == 1 then
	f_WindmillResponse_SecondOpen()

elseif SAVE.scene_windmill_state == 2 then
	f_WindmillResponse_Fix()
end

local continue = true;
while continue do
  
	if not SAVE.scene_windmill_ratchet_state then
		selection = f_RatchetMenu_Open()
	
	elseif SAVE.scene_windmill_ratchet_state == 1 then
		selection = f_RatchetMenu_Help()
	
	elseif SAVE.scene_windmill_ratchet_state == 2 then
		
		if not SAVE.scene_Windmill_curse then
			selection = f_RatchetMenu_ReturnYes()
		else
			selection = f_RatchetMenu_ReturnCurse()
		end
	
	elseif SAVE.scene_windmill_ratchet_state == 3 then
		selection = f_RatchetMenu_ReturnNo()
	
	elseif SAVE.scene_windmill_ratchet_state == 4 then
		selection = f_RatchetMenu_ReturnNo()
	
	elseif SAVE.scene_windmill_ratchet_state == 5 then
		break
	end
 
	--lets the player make a selection
	if (selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end

wait()
end
