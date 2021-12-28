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

--shrug
alpha_disruptor_cost = 50000
ride_cost = 12500

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

foreach_moby_in_pod(NPC_POD, obviate)

----------------------------------------------------------------------------------
--Smuggler Lines------------------------------------------------------------------
----------------------------------------------------------------------------------

--First line of conv after pressing Triangle to start
SmugDlgHurry = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_OPENER,
	--text = "Whoa there, friend. What's your hurry?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Response to RIDE_TRANSLATE
SmugDlgGuide = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_TRANSLATE_RESPONSE,
	--text = "This is your lucky day! This heres a map to Darkwater Cove! Its written in decadroid, but Id be happy to act as your guide. Ocourse, I couldnt offer my services without, say...",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_ACTIVATE,
		2.5,	AnimRoles.ANIM_ROLE_INCH_LEFT,
		10.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Response to VACATION
SmugDlgParrot = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_PARROT_RESPONSE,
	--text = "I'm afraid he's not for sale, friend. I won him fair and square.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

SmugDlgDarkwater = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_DARKWATER_RESPONSE,
	--text = "Well if I were ol' Angstrom, I spose Id head over to Darkwater Cove. Legend says thats where he hid all his riches, you see.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_INCH_LEFT,
		5.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Players opts to hire the Smuggler AND has enough bolts.
SmugDlgReady = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_BUYMENU_BUY_SUCCESSFUL,
	--text = "Thank you kindly, friend. Ready to go?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_FIST_LEFT,
	}
}

--Response to Let's go!
SmugDlgBorrow = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_GO_RESPONSE,
	--text = "Cmon, partner. What do you say we... borrow... that skiff?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DISAGREE,
	}
}

--Response to Not Just Yet
SmugDlgHoller = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_NOTYET_RESPONSE,
	--text = "Well Im a man of my word. When youre ready to go, just give me a holler.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_INCH_RIGHT,
	}
}

--Random - Players opts to hire the Smuggler and DOES NOT HAVE enough bolts.
SmugDlgYesterday = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_BUYMENU_BUY_NEEDBOLTS,
	--text = "Whoa there, son. I wasnt born yesterday.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
	}
}

--Random - Players opts to hire the Smuggler and DOES NOT HAVE enough bolts.
SmugDlgShort = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_BUYMENU_BUY_NEEDBOLTS2,
	--text = "Im afraid youre a bit short.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}
--RANDOM - Plays if Ratchet selects BUYMENU_BUY and does NOT enough bolts for the bolt.
SmugDlgShy = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_BUYMENU_BUY_NEEDBOLTS3,
	--text = "Youre a few bolts shy, partner.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Player selects No Thanks.
SmugDlgMind = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_BUYMENU_NOBUY_RESPONSE,
	--text = "Sorry to hear that, partner. Let me know if you change your mind.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
	}
}

--Ratchet returns to Smuggler after hiring him and responding "Not Just Yet".
SmugDlgGo = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_READY,
	--text = "Ready to go, friend?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_FIST_LEFT,
	}
}

--First line of conv after pressing Triangle to start(second chance to buy bolt)
SmugDlgOffer = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_OPENER_ALT,
	--text = "Hey friend. Have you thought about my offer?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.5,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew1 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW,
	--text = "Im afraid Ive got nothin for ya right now, friend. Best try again later.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
		3.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew2 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW_ALT2,
	--text = "Sorry, partner. I'm all tapped out.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew3 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW_ALT3,
	--text = "Son, can't you see I'm off the clock?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

SmugDlgWeapons = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_SALE_RESPONSE,
	--text = "Matter of fact, I recently acquired this here Alpha Disruptor. Wouldn't mind lettin' it go for a reasonable price. Interested?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		2.0,	AnimRoles.ANIM_ROLE_FIST_LEFT,
		5.5,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

SmugDlgAlphaDisruptorBuy = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_PURCHASE_RESPONSE,
	--text = "Careful with this thing. It's ranked number three on the Polaris Compendium of Ridiculously Overpowered Weapons.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		--0.0,	AnimRoles.ANIM_ROLE_HEAD_DOWN,
		0.2,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		4.5,	AnimRoles.ANIM_ROLE_FIST_LEFT,
	}
}

SmugDlgAlphaDisruptorNoBuy = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_DECLINE_RESPONSE,
	--text = "(laughs)  Too much firepower for ya, huh?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_ACTIVATE,
		2.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

----------------------------------------------------------------------------------
--Parrot Lines--------------------------------------------------------------------
----------------------------------------------------------------------------------

--Continues from  TRANSLATE_RESPONSE
ParrotDlgCash = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_TRANSLATE_RESPONSE2,
	--text = "Cold hard cash! AWK!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.2,	AnimRoles.ANIM_ROLE_SPEAKING,
	}
}

ParrotDlgCheater = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_PARROT_RESPONSE2,
	--text = "AWK! He's a cheater! AWK!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_SPEAKING,
		0.4,	AnimRoles.ANIM_ROLE_JUMP,
	}
}

ParrotDlgNothingNew = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW_RESPONSE,
	--text = "AWK! Take a walk, pal! AWK!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_JUMP,
		0.5,	AnimRoles.ANIM_ROLE_SPEAKING,
	}
}

----------------------------------------------------------------------------------
--Smuggler/Parrot Functions-------------------------------------------------------
----------------------------------------------------------------------------------
function f_SmugglerResponse_Hurry()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_medium, true);
	actor_speak_and_wait(smuggler, SmugDlgHurry)
	wait(0.2)
	return true
end

function f_SmugglerResponse_Guide()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	actor_speak_and_wait(smuggler, SmugDlgGuide)
	wait(0.2)
	activate_cam(active_hero, scene_postbattle_smuggler_cam_parrot, true)
	actor_speak_and_wait(smuggler_parrot, ParrotDlgCash)
	wait(0.2)
	SAVE.scene_postbattle_smuggler_ratchet_state = 1
	SAVE.scene_postbattle_smuggler_translate = true
	--SAVE.scene_postbattle_smuggler_guide = 1
	return true
end

function f_SmugglerResponse_Parrot()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	actor_speak_and_wait(smuggler, SmugDlgParrot)
	wait(0.2)
	activate_cam(active_hero, scene_postbattle_smuggler_cam_parrot, true)
	actor_speak_and_wait(smuggler_parrot, ParrotDlgCheater)
	wait(0.2)
	return true
end

function f_SmugglerResponse_Darkwater()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	actor_speak_and_wait(smuggler, SmugDlgDarkwater)
	wait(0.2)
	SAVE.scene_postbattle_smuggler_ratchet_state = nil
	return true
end

function f_SmugglerResponse_Ready()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	if hero_get_bolts(get_hero()) < ride_cost then
		f_SmugglerResponse_BuyFail()
	else
		hero_add_bolts(get_hero(), -ride_cost)
		RatchetDlgBolts.numreplace = hero_get_bolts(get_hero())
		SAVE.scene_postbattle_smuggler_decoded = true
		actor_speak_and_wait(smuggler, SmugDlgReady)
		wait(0.2)

		SAVE.scene_postbattle_smuggler_ratchet_state = 2
		SAVE.scene_postbattle_smuggler_state = 1
		SAVE.scene_postbattle_smuggler_guide = 2
		request_auto_save()
	end

	return true
end

function f_SmugglerResponse_Borrow()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_taxi, true);
	actor_speak_and_wait(smuggler, SmugDlgBorrow)
	wait(0.2)
	queue_scene("scene_postbattle_leveltrans")
end

--Play this when Ratchet tries to buy the bolt but doesn't have enough money
function f_SmugglerResponse_BuyFail()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	--Make it play one of the three lines randomly
	MyRandomLine = math.random(0, 2)
	if MyRandomLine == 0 then
		actor_speak_and_wait(smuggler, SmugDlgYesterday)
		wait(0.2)
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(smuggler, SmugDlgShort)
		wait(0.2)
	elseif MyRandomLine == 2 then
		actor_speak_and_wait(smuggler, SmugDlgShy)
		wait(0.2)
	end
	SAVE.scene_postbattle_smuggler_ratchet_state = nil
	return true
end

function f_SmugglerResponse_Holler()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	actor_speak_and_wait(smuggler, SmugDlgHoller)
	--wait(0.2)
	SAVE.scene_postbattle_smuggler_ratchet_state = nil
	return true
end

function f_SmugglerResponse_Mind()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	actor_speak_and_wait(smuggler, SmugDlgMind)
	wait(0.2)
	SAVE.scene_postbattle_smuggler_ratchet_state = nil
	SAVE.scene_postbattle_smuggler_state = 2
	return true
end

function f_SmugglerResponse_Go()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	actor_speak_and_wait(smuggler, SmugDlgGo)
	--wait(0.2)
	return true
end

function f_SmugglerResponse_Offer()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	actor_speak_and_wait(smuggler, SmugDlgOffer)
	wait(0.2)
	return true
end

--Play this when Ratchet returns after already buying the bolt
function f_SmugglerResponse_NothingNew()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	--Make it play one of the responses randomly
	MyRandomLine = math.random(0, 2)
	if MyRandomLine == 0 then
		actor_speak_and_wait(smuggler, SmugDlgNothingNew1)
		wait(0.2)
		activate_cam(active_hero, scene_postbattle_smuggler_cam_parrot, true)
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

function f_SmugglerResponse_Weapons()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	actor_speak_and_wait(smuggler, SmugDlgWeapons)
	wait(0.2)
	temp_previous_state = SAVE.scene_postbattle_smuggler_state
	SAVE.scene_postbattle_smuggler_ratchet_state = 3
	return true
end

function f_SmugglerResponse_AlphaDisruptorBuy()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	
	if hero_get_bolts(get_hero()) < alpha_disruptor_cost then
		f_SmugglerResponse_BuyFail()
	else
		actor_speak_and_wait(smuggler, SmugDlgAlphaDisruptorBuy)
		wait(0.2)
		
		--Mad guns
		hero_give_weapon(get_hero(), WPN_ALPHA_NOVA)
		show_weapon_screen(WPN_ALPHA_NOVA, 4, 4, 0.2)
		wait(0.2)
				
		hero_add_bolts(get_hero(), -alpha_disruptor_cost)
		
		RatchetDlgBolts.numreplace = hero_get_bolts(get_hero())
		--update the table so there's no weapons option anymore
		--RatchetDialogTable1[2] = RatchetDlgDarkwater
		--RatchetDialogTable1[3] = RatchetDlgExit
		--RatchetDialogTable1[4] = nil
	end
	
	SAVE.scene_postbattle_smuggler_ratchet_state = nil
	return true
end

function f_SmugglerResponse_AlphaDisruptorNoBuy()
	scene_clear_title()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_closeup, true);
	actor_speak_and_wait(smuggler, SmugDlgAlphaDisruptorNoBuy)
	wait(0.2)

	SAVE.scene_postbattle_smuggler_ratchet_state = nil
	return true
end

function f_SmugglerResponse_Exit()

end

----------------------------------------------------------------------------------
--Ratchet Lines(er, text)---------------------------------------------------------
----------------------------------------------------------------------------------
RatchetDlgTranslate = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_TRANSLATE,
	--text = "Can you translate this pirate map?",
	func = f_SmugglerResponse_Guide
}

--[[
RatchetDlgParrot = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_PARROT,
	--text = "Can I buy your parrot?",
	func = f_SmugglerResponse_Parrot
}
]]--

RatchetDlgDarkwater = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_DARKWATER,
	--text = "Do you know where Darkwater might have gone?",
	func = f_SmugglerResponse_Darkwater
}

RatchetDlgGuide = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_BUYMENU_BUY,
	--text = "Hire Smuggler to guide you to Darkwater Cove for XXX bolts.",
	func = f_SmugglerResponse_Ready
}

RatchetDlgGo = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_GO,
	--text = "Let's go!",
	func = f_SmugglerResponse_Borrow
}

RatchetDlgNotYet = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_NOTYET,
	--text = "Not just yet.",
	func = f_SmugglerResponse_Holler
}

RatchetDlgNoThanks = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_BUYMENU_NOBUY,
	--text = "No Thanks.",
	func = f_SmugglerResponse_Mind
}

RatchetDlgBolts = {
	dialog = DialogueSpecs.GEN_RATCH_TEXT_CURRENT_BOLTS,
	--text = "You currently have " .. tostring(hero_get_bolts(get_hero())) .. " bolts",
	label = true,
	numreplace = hero_get_bolts(get_hero()),
}

RatchetDlgWeapons = {
	--text = "Do you have any weapons for sale?",
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_SALE,
	func = f_SmugglerResponse_Weapons,
}

RatchetDlgAlphaDisruptorBuy = {
	--text = "Purchase Alpha Disruptor for " .. tostring(alpha_disruptor_cost) .. " bolts.",
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_PURCHASE,
	func = f_SmugglerResponse_AlphaDisruptorBuy
}

RatchetDlgAlphaDisruptorNoBuy = {
	--text = "No thanks, I will pass",
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_DECLINE,
	func = f_SmugglerResponse_AlphaDisruptorNoBuy
}

RatchetDlgExit = {
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_SmugglerResponse_Exit,
	exit = true,
}

--[[
--If ratchet has the alpha disruptor he doesn't get the option to buy it
if hero_has_weapon(get_hero(), WPN_ALPHA_NOVA) then
	RatchetDialogTable1 = {
		RatchetDlgTranslate,
		RatchetDlgDarkwater,
		RatchetDlgExit
	}
	
	RatchetDialogTable3 = {
		RatchetDlgGo,
		RatchetDlgNotYet
	}
else
	RatchetDialogTable1 = {
		RatchetDlgTranslate,
		RatchetDlgWeapons,
		RatchetDlgDarkwater,
		RatchetDlgExit
	}
	
	RatchetDialogTable3 = {
		RatchetDlgGo,
		RatchetDlgWeapons,
		RatchetDlgNotYet
	}
end

if 	SAVE.scene_postbattle_smuggler_decoded == true then
	RatchetDialogTable1[1] = RatchetDlgGo
end

RatchetDialogTable2 = {
	RatchetDlgBolts,
	RatchetDlgGuide,
	RatchetDlgNoThanks
}

RatchetDialogTableAlphaDisruptor = {
	RatchetDlgBolts,
	RatchetDlgAlphaDisruptorBuy,
	RatchetDlgAlphaDisruptorNoBuy
}
]]--

RatchetDialogTableOpen = {
	RatchetDlgTranslate,
	RatchetDlgWeapons,
	RatchetDlgDarkwater,
	RatchetDlgExit,
}

RatchetDialogTableHire = {
	RatchetDlgBolts,
	RatchetDlgGuide,
	RatchetDlgNoThanks,
}

RatchetDialogTableLeave = {
	RatchetDlgGo,
	RatchetDlgNotYet
}

RatchetDialogTableAlpha = {
	RatchetDlgBolts,
	RatchetDlgAlphaDisruptorBuy,
	RatchetDlgAlphaDisruptorNoBuy
}

----------------------------------------------------------------------------------
--Ratchet Functions---------------------------------------------------------------
----------------------------------------------------------------------------------

--Play this first thing after initial meeting
function f_RatchetMenu_Open()
	if hero_has_weapon(get_hero(), WPN_ALPHA_NOVA) then
		
		if SAVE.scene_postbattle_smuggler_guide == 1 then
			RatchetDialogTableOpen[1] = RatchetDlgBolts
			RatchetDialogTableOpen[2] = RatchetDlgGuide
			RatchetDialogTableOpen[3] = RatchetDlgDarkwater
			RatchetDialogTableOpen[4] = RatchetDlgExit
		elseif	SAVE.scene_postbattle_smuggler_guide == 2 then
			RatchetDialogTableOpen[1] = RatchetDlgGo
			RatchetDialogTableOpen[2] = RatchetDlgDarkwater
			RatchetDialogTableOpen[3] = RatchetDlgExit
			RatchetDialogTableOpen[4] = nil
		else
			RatchetDialogTableOpen[1] = RatchetDlgTranslate
			RatchetDialogTableOpen[2] = RatchetDlgDarkwater
			RatchetDialogTableOpen[3] = RatchetDlgExit
			RatchetDialogTableOpen[4] = nil
		end

	else
		
		if SAVE.scene_postbattle_smuggler_guide == 1 then
			RatchetDialogTableOpen[1] = RatchetDlgBolts
			RatchetDialogTableOpen[2] = RatchetDlgGuide
			RatchetDialogTableOpen[3] = RatchetDlgWeapons
			RatchetDialogTableOpen[4] = RatchetDlgDarkwater
			RatchetDialogTableOpen[5] = RatchetDlgExit
		elseif	SAVE.scene_postbattle_smuggler_guide == 2 then
			RatchetDialogTableOpen[1] = RatchetDlgGo
			RatchetDialogTableOpen[2] = RatchetDlgWeapons
			RatchetDialogTableOpen[3] = RatchetDlgDarkwater
			RatchetDialogTableOpen[4] = RatchetDlgExit
			RatchetDialogTableOpen[5] = nil
		else
			RatchetDialogTableOpen[1] = RatchetDlgTranslate
			--RatchetDialogTableOpen[2] = RatchetDlgWeapons
			--RatchetDialogTableOpen[3] = RatchetDlgDarkwater
			--RatchetDialogTableOpen[4] = RatchetDlgExit
			--RatchetDialogTableOpen[5] = nil
			RatchetDialogTableOpen[2] = RatchetDlgDarkwater
			RatchetDialogTableOpen[3] = RatchetDlgExit
			RatchetDialogTableOpen[4] = nil
			RatchetDialogTableOpen[5] = nil
		end

	end

	activate_cam(active_hero, scene_postbattle_smuggler_cam_medium, true);
	scene_set_title(DialogueSpecs.NI_RETURN_MAYOR_QUESTMENU)
	return scene_show_menu_and_wait(RatchetDialogTableOpen)
end

--Play this when Smuggler offers his services
function f_RatchetMenu_Hire()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_medium, true);
	scene_set_title(DialogueSpecs.NI_SMUG_INITIAL_HEREMENU)
	return scene_show_menu_and_wait(RatchetDialogTableHire)
end

--Play this when Ratchet has accepted
function f_RatchetMenu_Go()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_medium, true);
	scene_set_title(DialogueSpecs.NI_SMUG_RIDE_READY)
	return scene_show_menu_and_wait(RatchetDialogTableLeave)
end

function f_RatchetMenu_AlphaDisruptor()
	activate_cam(active_hero, scene_postbattle_smuggler_cam_medium, true);
	scene_set_title(DialogueSpecs.NI_SMUG_INITIAL_BUYMENU)
	return scene_show_menu_and_wait(RatchetDialogTableAlpha)
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

hero_warp(active_hero, scene_postbattle_smuggler_ratchet_vol, true);
npc_warp(smuggler, scene_postbattle_smuggler_vol)

make_actor(smuggler);
make_actor(smuggler_parrot)

--initial contact, check to see if it's been made
if SAVE.scene_postbattle_smuggler_state == nil then
	f_SmugglerResponse_Hurry()
	
elseif SAVE.scene_postbattle_smuggler_state == 1 then
	f_SmugglerResponse_Go()
	--SAVE.scene_postbattle_smuggler_ratchet_state = 2

elseif SAVE.scene_postbattle_smuggler_state == 2 then
	f_SmugglerResponse_Offer()
	--SAVE.scene_postbattle_smuggler_ratchet_state = 1
end

local continue = true
while continue do

	if not SAVE.scene_postbattle_smuggler_ratchet_state then
		selection = f_RatchetMenu_Open()
	
	elseif SAVE.scene_postbattle_smuggler_ratchet_state == 1 then
		selection = f_RatchetMenu_Hire()
		
	elseif SAVE.scene_postbattle_smuggler_ratchet_state == 2 then
		selection = f_RatchetMenu_Go()
		
	elseif SAVE.scene_postbattle_smuggler_ratchet_state == 3 then
		selection = f_RatchetMenu_AlphaDisruptor()
	
	else
		break
	end
		
	
	if(selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end
	
wait()	
	
end

foreach_moby_in_pod(NPC_POD, unobviate)

