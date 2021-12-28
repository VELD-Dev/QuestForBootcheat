-- smuggler anim roles
-- ANIM_ROLE_STAND - relaxed stance
-- ANIM_ROLE_INCH_FORWARD - lean forward 
-- ANIM_ROLE_INCH_BACKWARD - lean backwards
-- ANIM_ROLE_INCH_LEFT 
-- ANIM_ROLE_INCH_RIGHT
-- ANIM_ROLE_REACH_RIGHT - right arm gesture
-- ANIM_ROLE_REACH_LEFT - left arm gesture
-- ANIM_ROLE_FIST_LEFT - left arm fist gesture
-- ANIM_ROLE_DISAGREE - "no" head shake gesture
-- ANIM_ROLE_BLINK
-- ANIM_ROLE_HEAD_DOWN

--Set the cost of the bolt
bolt_cost = 10000

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

----------------------------------------------------------------------------------
--Smuggler Lines------------------------------------------------------------------
----------------------------------------------------------------------------------

--First line of conv after pressing Triangle to start
SmugDlgOpen1 = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_OPENER,
	--text = "Well, look who it is. Small galaxy, aint it?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--Continues from  OPENER2(which the parrot says)
SmugDlgOpen2 = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_OPENER3,
	--text = "So what brings you to Merdegraw, friend?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Response to VACATION
SmugDlgVacation = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_VACATION_RESPONSE,
	--text = "Well, what are the odds? Im here for a little relatxation myself!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_INCH_FORWARD,
	}
}

--Response to REPAIR
SmugDlgRepairs = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_REPAIRS_RESPONSE,
	--text = "Well, how fortuitious. I myself am quite the resourceful entrepreneur, if you know what Im sayin.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_ACTIVATE,
		2.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Response to NONE OF YOUR BUSINESS
SmugDlgBusiness = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_NONE_RESPONSE,
	--text = "Say no more, friend. A man in my business understands the need for a little privacy.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
		2.5,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--Continues from  HEREMENU_NONE_RESPONSE2(a parrot line)
SmugDlgAnything = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_ANYTHING,
	--text = "Well, if you need anything, you give me a holler. I may have something useful for you. Know what I mean?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		1.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
		4.7,	AnimRoles.ANIM_ROLE_FIST_LEFT,
	}
}

--Response to request for a versa-bolt.
SmugDlgMarket = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_ANYTHING_RESPONSE,
	--text = "Well, if you find yourself in the market for a slightly-used versa-bolt, you come find your old pal --",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.2,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
		2.5,	AnimRoles.ANIM_ROLE_INCH_LEFT,
	}
}

--Response to request for a versa-bolt.
SmugDlgBolt = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_NEEDBOLT_RESPONSE,
	--text = "Well, what are the odds? I happen to have one right here. Procured by perfectly legal means, o'course.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		1.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Continues from NEEDBOLT_RESPONSE3(parrot line)
SmugDlgDeal = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_NEEDBOLT_RESPONSE3,
	--text = "How 'bout we make a deal?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_FIST_LEFT,
	}
}

--Plays if Ratchet selects BUYMENU_BUY and has enough bolts for the bolt.
SmugDlgBuy = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_BUYMENU_BUY_SUCCESSFUL,
	--text = "Here you go. I'll see you around, partner.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--RANDOM - Plays if Ratchet selects BUYMENU_BUY and does NOT enough bolts for the bolt.
SmugDlgBuyFail1 = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_BUYMENU_BUY_NEEDBOLTS_ALT1,
	--text = "Whoa there, son. I wasn't born yesterday.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
	}
}

--RANDOM - Plays if Ratchet selects BUYMENU_BUY and does NOT enough bolts for the bolt.
SmugDlgBuyFail2 = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_BUYMENU_BUY_NEEDBOLTS_ALT2,
	--text = "Im afraid you're a bit short.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_FIST_LEFT,
	}
}

--RANDOM - Plays if Ratchet selects BUYMENU_BUY and does NOT enough bolts for the bolt.
SmugDlgBuyFail3 = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_BUYMENU_BUY_NEEDBOLTS_ALT3,
	--text = "You're a few bolts shy, partner.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Response to "no deal."
SmugDlgNoBuy = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_BUYMENU_NOBUY_RESPONSE,
	--text = "Suit yourself. But somethin' tells me this is the only one in town.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		2.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--First line of conv after pressing Triangle to start(second chance to buy bolt)
SmugDlgSecondOpen = {
	dialog = DialogueSpecs.NI_SMUG_SECOND_CHANCE_OPENER,
	--text = "Well, howdy friend. What can I do for ya?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew1 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW,
	--text = "Im afraid Ive got nothin for ya right now, friend. Best try again later.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DISAGREE,
		0.5,	AnimRoles.ANIM_ROLE_FIST_LEFT,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew2 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW_ALT2,
	--text = "Sorry, partner. I'm all tapped out.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_HEAD_DOWN,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew3 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW_ALT3,
	--text = "Son, can't you see I'm off the clock?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_REACH_LEFT,
	}
}
----------------------------------------------------------------------------------
--Parrot Lines--------------------------------------------------------------------
----------------------------------------------------------------------------------

--Response to OPENER.
ParrotDlgOpen = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_OPENER2,
	--text = "AWK! Too small! AWK!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_JUMP,
		1.0,	AnimRoles.ANIM_ROLE_SPEAKING,
	}
}

--Response to HEREMENU_VACATION
ParrotDlgVacation = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_VACATION_RESPONSE2,
	--text = "AWK! Layin' low! AWK!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_JUMP,
		1.0,	AnimRoles.ANIM_ROLE_SPEAKING,
	}
}

--Continues from  HEREMENU_NONE_RESPONSE
ParrotDlgBusiness = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_NONE_RESPONSE2,
	--text = "AWK! He's a criminal! AWK!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_JUMP,
		1.0,	AnimRoles.ANIM_ROLE_SPEAKING,
	}
}

--Continues from NEEDBOLT_RESPONSE
ParrotDlgBolt = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_NEEDBOLT_RESPONSE2,
	--text = "AWK! With a crowbar!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_SPEAKING,
		1.0,	AnimRoles.ANIM_ROLE_JUMP,
	}
}

--Continues from NOTHING_NEW
ParrotDlgNothingNew = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW_RESPONSE,
	--text = "AWK! Take a walk, pal! AWK!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_JUMP,
		1.0,	AnimRoles.ANIM_ROLE_SPEAKING,
	}
}

ParrotDlgMarket = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_ANYTHING_RESPONSE2,
	--text = "AWK! No names! AWK!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_JUMP,
		1.0,	AnimRoles.ANIM_ROLE_SPEAKING,
	}
}

----------------------------------------------------------------------------------
--Smuggler/Parrot Functions-------------------------------------------------------
----------------------------------------------------------------------------------

--Play these when Ratchet initially encounters the Smuggler
function f_SmugglerResponse_Open()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgOpen1)
	wait(0.2)
	activate_cam(get_hero(), scene_smuggler_cam_parrot)
	actor_speak_and_wait(smuggler_parrot, ParrotDlgOpen)
	wait(0.2)
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgOpen2)
	wait(0.2)
	return true
end

--Play this when Ratchet says he's here on vacation
function f_SmugglerResponse_Vacation()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgVacation)
	wait(0.2)
	activate_cam(get_hero(), scene_smuggler_cam_parrot)
	actor_speak_and_wait(smuggler_parrot, ParrotDlgVacation)
	wait(0.2)
	
	if not SAVE.scene_smuggler_get_bolt then
		f_SmugglerResponse_Anything()
	else
		f_SmugglerResponse_Market()
	end
	
	return true
end

--Play this when Ratchet says he's doing repairs
function f_SmugglerResponse_Repairs()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgRepairs)
	wait(0.2)
	
	if not SAVE.scene_smuggler_get_bolt then
		f_SmugglerResponse_Anything()
	else
		f_SmugglerResponse_Market()
	end
	
	return true
end

--Play this when Ratchet says it's none of your business
function f_SmugglerResponse_Business()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgBusiness)
	wait(0.2)
	activate_cam(get_hero(), scene_smuggler_cam_parrot)
	actor_speak_and_wait(smuggler_parrot, ParrotDlgBusiness)
	wait(0.2)
	
	if not SAVE.scene_smuggler_get_bolt then
		f_SmugglerResponse_Anything()
	else
		f_SmugglerResponse_Market()
	end
	
	return true
end

--Play this after any of the first initial responses
function f_SmugglerResponse_Anything()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgAnything)
	wait(0.2)
	
	--Now he has nothing left to say
	SAVE.scene_smuggler_state = 1
	SAVE.scene_smuggler_ratchet_state = 3
	
	--and take a note we've already spoken to him
	SAVE.scene_smuggler_initial_contact = true
end

--Play this when Ratchet asks to buy a versa bolt
function f_SmugglerResponse_Bolt()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgBolt)
	wait(0.2)
	activate_cam(get_hero(), scene_smuggler_cam_parrot)
	actor_speak_and_wait(smuggler_parrot, ParrotDlgBolt)
	wait(0.2)
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgDeal)
	wait(0.2)
	SAVE.scene_smuggler_buy_bolt = true
	SAVE.scene_smuggler_ratchet_state = 2
	return true
end

--Play this when Ratchet buys the bolt
function f_SmugglerResponse_Buy()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	--check to see if he's got the cash and if not send him to the buy fail dialogue
	if hero_get_bolts(get_hero()) < bolt_cost then
		f_SmugglerResponse_BuyFail()
	else
		actor_speak_and_wait(smuggler, SmugDlgBuy)
		wait(0.2)
		--Set the variable that remembers if Ratchet purchased the bolt
		--SAVE.scene_smuggler_bolt = true
		SAVE.scene_smuggler_state = 1
		--update the lighthouse scene
		SAVE.scene_lighthouse_state = 2
		hero_add_bolts(get_hero(), -bolt_cost)
		hero_set_num_objects(get_hero(), OBJ_BEACON_PART, 1)
		request_auto_save()
		play_explicit_sound_spec(SoundSpecs.AMB_NPC_VersaBolt_Purchase)
	end
	--return true
end

--Play this when Ratchet tries to buy the bolt but doesn't have enough money
function f_SmugglerResponse_BuyFail()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	--Make it play one of the three lines randomly
	MyRandomLine = math.random(0, 2)
	if MyRandomLine == 0 then
		actor_speak_and_wait(smuggler, SmugDlgBuyFail1)
		wait(0.2)
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(smuggler, SmugDlgBuyFail2)
		wait(0.2)
	elseif MyRandomLine == 2 then
		actor_speak_and_wait(smuggler, SmugDlgBuyFail3)
		wait(0.2)
	end
	SAVE.scene_smuggler_state = 2
	--return true
end

--Play this when Ratchet doesn't want to buy the bolt
function f_SmugglerResponse_NoBuy()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	SAVE.scene_smuggler_state = 2
	actor_speak_and_wait(smuggler, SmugDlgNoBuy)
	wait(0.2)
	
	--return true
end

--Play this if Ratchet returns before buying the bolt
function f_SmugglerResponse_SecondOpen()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgSecondOpen)
	
	if SAVE.scene_smuggler_buy_bolt then
		SAVE.scene_smuggler_ratchet_state = 2
	else
		SAVE.scene_smuggler_ratchet_state = 1
	end
	
	return true
end

------------------------------
-- OTHER THINGS FOR DIALOGS --
------------------------------

--Play this when Ratchet returns after already buying the bolt
function f_SmugglerResponse_NothingNew()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	--Make it play one of the responses randomly
	MyRandomLine = math.random(0, 2)
	
	--No more ratchet responses
	SAVE.scene_smuggler_ratchet_state = 3
	
	if MyRandomLine == 0 then
		actor_speak_and_wait(smuggler, SmugDlgNothingNew1)
		wait(0.2)
		activate_cam(get_hero(), scene_smuggler_cam_parrot)
		actor_speak_and_wait(smuggler_parrot, ParrotDlgNothingNew)
		wait(0.2)
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(smuggler, SmugDlgNothingNew2)
		wait(0.2)
	elseif MyRandomLine == 2 then
		actor_speak_and_wait(smuggler, SmugDlgNothingNew3)
		wait(0.2)
	end
end


function f_SmugglerResponse_Market()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgMarket)
	wait(0.2)
	activate_cam(get_hero(), scene_smuggler_cam_parrot)
	actor_speak_and_wait(smuggler_parrot, ParrotDlgMarket)
	wait(0.2)
	SAVE.scene_smuggler_ratchet_state = 1
	return true
end

function f_SmugglerResponse_Exit()
	--exit out
end

----------------------------------------------------------------------------------
--Ratchet Lines(er, text)---------------------------------------------------------
----------------------------------------------------------------------------------

--Available after OPENER3
RatchetDlgVacation = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_VACATION,
	--text = "Im here on vacation.",
	func = f_SmugglerResponse_Vacation
}

--Available after OPENER3	
RatchetDlgRepairs = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_REPAIRS,
	--text = "Im doing repairs on the island.",
	func = f_SmugglerResponse_Repairs
}

--Available after OPENER3	
RatchetDlgBusiness = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_HEREMENU_NONE,
	--text = "None of your business, pal.",
	func = f_SmugglerResponse_Business
}

--Available after INITIAL_HEREMENU_ANYTHING
RatchetDlgNeedBolt = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_NEEDBOLT,
	--text = "I'm in the market for a versa-bolt. Got one?",
	func = f_SmugglerResponse_Bolt
}

--Available after Smuggler offers to make a deal.
RatchetDlgBuy = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_BUYMENU_BUY,
	--text = "Buy machine part for XXXXXX bolts.",
	func = f_SmugglerResponse_Buy
}

--Available after Smuggler offers to make a deal.
RatchetDlgNoBuy = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_BUYMENU_NOBUY,
	--text = "No deal, pal.",
	func = f_SmugglerResponse_NoBuy
}

RatchetDlgExit = {
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_SmugglerResponse_Exit,
	exit = true,
}

RatchetDlgBolts = {
	dialog = DialogueSpecs.GEN_RATCH_TEXT_CURRENT_BOLTS,
	--text = "You currently have " .. tostring(hero_get_bolts(get_hero())) .. " bolts",
	label = true,
	numreplace = hero_get_bolts(get_hero()),
}



--Group 'em so the responses show up together correctly
RatchetDialogTable1 = {
	RatchetDlgVacation,
	RatchetDlgRepairs,
	RatchetDlgBusiness,
	RatchetDlgExit
}

RatchetDialogTable2 = {
	RatchetDlgNeedBolt,
	RatchetDlgExit
}

RatchetDialogTable3 = {
	RatchetDlgBolts,
	RatchetDlgBuy,
	RatchetDlgNoBuy,
}

----------------------------------------------------------------------------------
--Ratchet Functions---------------------------------------------------------------
----------------------------------------------------------------------------------

--Play this first thing after initial meeting
function f_RatchetMenu_Open()
	activate_cam(get_hero(), scene_smuggler_cam_medium, true)
	scene_set_title(DialogueSpecs.NI_SMUG_INITIAL_HEREMENU)
	return scene_show_menu_and_wait(RatchetDialogTable1)
	--scene_clear_title()
end

--Play this when Ratchet says he's in the market for the bolt
function f_RatchetMenu_Bolt()
	activate_cam(get_hero(), scene_smuggler_cam_medium, true)
	return scene_show_menu_and_wait(RatchetDialogTable2)
end

--Play this when Ratchet can try to buy the bolt
function f_RatchetMenu_Buy()
	activate_cam(get_hero(), scene_smuggler_cam_medium, true)
	scene_set_title(DialogueSpecs.NI_SMUG_INITIAL_BUYMENU)
	return scene_show_menu_and_wait(RatchetDialogTable3)

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

active_hero = get_hero();
smuggler = npc_smuggler;

hero_warp(active_hero, scene_smuggler_vol1, true);
npc_warp(smuggler, smuggler_postbattle_vol)

make_actor(smuggler);
make_actor(smuggler_parrot)
actor_set_stance(smuggler_parrot, AnimRoles.ANIM_ROLE_STAND)

--activate_cam(active_hero, scene_smuggler_cam_medium, true);

















































-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
---------- T H E   C H E A T   C O D E   P A R T ----------
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------


-- The dialogue of Ratchet, what he says in the dialogue purposes
RatchetDlgCheatFunc1 = {
	dialog = DialogueSpecs.None, -- Set ID=0 to the dialog (unkown ID) | This is mandatory to put custom text in here
	text = "Enable Ininite Bolts", -- Text button shown at screen
	func = f_SmugglerResponse_InfiniteBolts -- What the text executes
}

-- Hum... It's the label button to enable cheat.
RatchetDlgEnableCheat = {
	dialog = DialogueSpecs.None, -- Set ID=0 to the dialog (unkown ID) | This is mandatory to put custom text in here
	text = "Enable cheat *MENU*", -- text button shown at screen
	func = f_SmugglerResponse_EnableCheat -- Execution script
}

-- Well same but to disable the MENU PART only.
RatchetDlgEnableCheat = {
	dialog = DialogueSpecs.None, -- Set ID=0 to the dialog (unkown ID) | This is mandatory to put custom text in here.
	text = "Disable cheat *MENU*", -- Text button shown at screen
	func = f_SmugglerResponse_DisableCheat -- Execution script
}



----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- VARIABLES ---------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

local areInfiniteBoltsEnabled = false
local areInfiniteAmmoEnabled = false


----------------------------------------------------------------------------------
-- DIALOGS TABLES ----------------------------------------------------------------
----------------------------------------------------------------------------------

-- The dialog table which list every dialogs
RatchetDialogTable5 = {
	RatchetDlgCheatFunc1,
	RatchetDlgDisableCheat,
	RatchetDlgExit
}

-- Basically, it's the "When Smug has nothing to say" box purposes
RatchetDialogTable4 = {
	RatchetDlgNeedBolt,
	RatchetDlgNoBuy,
	RatchetDlgEnableCheat,
	RatchetDlgExit
}



----------------------------------------------------------------------------------
-- SMUG RESPONSES FUNCTIONS ------------------------------------------------------
----------------------------------------------------------------------------------

function f_SmugglerResponse_Deal()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_medium)
	actor_speak_and_wait(smuggler, SmugDlgDeal)
end

function f_SmugglerResponse_BuisnessOnly()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_medium)
	actor_speak_and_wait(smuggler, SmugDlgOpen1)
	wait(0.2)
	actor_speak_and_wait(smuggler, SmugDlgBusiness)
end

-- The function executed when clicked on "Enable Infinite "
function f_SmugglerResponse_InfiniteBolts()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	-- Play a random Smuggler's voice-line
	MyRandomLine = math.random(0, 2)
	if MyRandomLine == 0 then
		actor_speak_and_wait(smuggler, SmugDlgBusiness)
		wait(0.2)
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(smuggler, SmugDlgBuy)
		wait(0.2)
	elseif MyRandomLine == 2 then
		actor_speak_and_wait(smuggler, SmugDlgBolt)
		wait(0.2)
	end

	if areInfiniteBoltsEnabled == true then
		areInfiniteBoltsEnabled = false
		hero_add_bolts(get_hero(), -hero_get_bolts(get_hero))
	else
		areInfiniteBoltsEnabled = true
		hero_add_bolts(get_hero(), 9999999)
	end

	SAVE.scene_smuggler_ratchet_state = 4
end

-- Set the scene to "Cheat Menu"
function f_SmugglerResponse_EnableCheat()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_closeup)
	actor_speak_and_wait(smuggler, SmugDlgBusiness)
	SAVE.scene_smuggler_ratchet_state = 4
	SAVE.scene_smuggler_state = 4
end

-- Set the scene to "Nothing New"
function f_SmugglerResponse_DisableCheat()
	scene_clear_title()
	activate_cam(get_hero(), scene_smuggler_cam_parrot)
	actor_speak_and_wait(parrot, ParrotDlgCheater)
	SAVE.scene_smuggler_ratchet_state = 3
	SAVE.scene_smuggler_state = 3
end

----------------------------------------------------------------------------------
-- MENU OPEN FUNCTIONS -----------------------------------------------------------
----------------------------------------------------------------------------------

function f_RatchetMenu_NothingNew()
	activate_cam(get_hero(), scene_smuggler_cam_medium, true)
	return scene_show_menu_and_wait(RatchetDialogTable4)
end

function f_RatchetMenu_CheatMenu()
	activate_cam(get_hero(), scene_smuggler_cam_closeup, true)
	return scene_show_menu_and_wait(RatchetDialogTable5)
end


--Set up the continous while loop to go through the dialog trees <== ORIGINAL DEV COMMENT
-- Basically, it's the list of every menus. To add a menu add a new smuggler_ratchet_state == <number of table of responses> ==> 
-- And in the scope, set the table (responses) that you want to it show
local continue = true
while continue do
	
	--Initial greeting | Table list
	if not SAVE.scene_smuggler_ratchet_state then
		selection = f_RatchetMenu_Open()
	
	elseif SAVE.scene_smuggler_ratchet_state == 1 then
		selection = f_RatchetMenu_Bolt()
	
	elseif SAVE.scene_smuggler_ratchet_state == 2 then
		selection = f_RatchetMenu_Buy()

	elseif SAVE.scene_smuggler_ratchet_state == 3 then
		selection = f_RatchetMenu_NothingNew()

	elseif SAVE.scene_smuggler_ratchet_state == 4 then
		selection = f_RatchetMenu_CheatMenu()

	end
	
	if(selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end
	
wait()	
	
end

--initial contact, check to see if it's been made <=== original dev comment
-- First thing said when you come talk with Smug (initial dialog)
if SAVE.scene_smuggler_state == nil then
	f_SmugglerResponse_Open()

	--Comes back before the lighthouse dude asks for the bolt		
elseif SAVE.scene_smuggler_state == 1 then
	f_SmugglerResponse_NothingNew()

	--Comes back after the lighthouse dude asks for the bolt
elseif SAVE.scene_smuggler_state == 2 then
	f_SmugglerResponse_SecondOpen()

	--Comes in the last phase to open the cheat too
elseif SAVE.scene_smuggler_state == 3 then
	f_SmugglerResponse_Deal()
elseif SAVE.scene_smuggler_state == 4 then
	f_SmugglerResponse_BuisnessOnly()
end