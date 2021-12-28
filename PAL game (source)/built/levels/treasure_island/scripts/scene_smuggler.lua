
alpha_disruptor_cost = 50000

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

----------------------------------------------------
--Smuggler Lines------------------------------------
----------------------------------------------------

--arrival at darkwater island
SmugDlgOpen = {
	dialog = DialogueSpecs.NI_SMUG_SECOND_CHANCE_OPENER,
	--text    = "Well, howdy friend. What can I do for ya?", 
	target = get_hero(),
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		1.5,    AnimRoles.ANIM_ROLE_REACH_LEFT,    
	}
}

--If player selects BUY Launcher AND has enough bolts.
SmugDlgWise = {
	dialog = DialogueSpecs.TI_SMUG_ISLANDARRIVE_PURCHASE_COMPLETE,
	--text    = "A wise choice. Go get em, friend.", 
	target = get_hero(),
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_LOOK_AROUND,    
	}
}

--If player selects "Weapons are for sissies"
SmugDlgOrgan = {
	dialog = DialogueSpecs.TI_SMUG_ISLANDARRIVE_NO_PURCHASE_RESPONSE,
	--text    = "Well, hope you filled out those organ donor cards. If you change your mind, come on back.", 
	target = get_hero(),
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		4.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,    
	}
}

--If player tries to purchase weapons without enough bolts (random)
SmugDlgYesterday = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_BUYMENU_BUY_NEEDBOLTS_ALT1,
	target = get_hero(),
	--text    = "Whoa there, son. I wasnt born yesterday.", 
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE, 
	}
}

--If player tries to purchase weapons without enough bolts (random)
SmugDlgShort = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_BUYMENU_BUY_NEEDBOLTS_ALT2,
	target = get_hero(),
	--text    = "Im afraid youre a bit short.", 
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--If player tries to purchase weapons without enough bolts (random)
SmugDlgShy = {
	dialog = DialogueSpecs.NI_SMUG_INITIAL_BUYMENU_BUY_NEEDBOLTS_ALT3,
	target = get_hero(),
	--text    = "Youre a few bolts shy, partner.", 
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,   
	}
}

--Player returns to Smuggler without having purchased weapons.
SmugDlgOffer = {
	dialog = DialogueSpecs.TI_SMUG_ISLANDARRIVE_OFFER,
	target = get_hero(),
	--text    = "Hey friend. Have you thought about my offer?", 
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.5,    AnimRoles.ANIM_ROLE_REACH_RIGHT,    
	}
}

--Ratchet returns to Smuggler after completing all missions and presses TRIANGLE.
SmugDlgDarkwater = {
	dialog = DialogueSpecs.TI_SMUG_FLEET,
	target = get_hero(),
	--text    = "Hey there, friend. I just saw Darkwaters fleet set sail for Hoolefar Island. You mustve rattled his cage pretty good.", 
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.2,    AnimRoles.ANIM_ROLE_REACH_LEFT,    
		3.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,    
	}
}

--Response to Ratchet telling him to follow the fleet.
SmugDlgAboard = {
	dialog = DialogueSpecs.TI_SMUG_FOLLOW_RESPONSE,
	target = get_hero(),
	--text    = "Climb aboard, partner. Ill have you there in no time.", 
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.5,    AnimRoles.ANIM_ROLE_FIST_LEFT,    
	}
}

--If player leaves and comes back to Smuggler without having purchased weapons.
SmugDlgWeapons = {
	dialog = DialogueSpecs.TI_SMUG_SENSES,
	target = get_hero(),
	--text    = "Come to your senses bout those weapons I offered you?", 
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,    
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew1 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW,
	target = get_hero(),
	--text = "Im afraid Ive got nothin for ya right now, friend. Best try again later.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
		3.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew2 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW_ALT2,
	target = get_hero(),
	--text = "Sorry, partner. I'm all tapped out.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew3 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW_ALT3,
	target = get_hero(),
	--text = "Son, can't you see I'm off the clock?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

SmugDlgAlphaDisruptor = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_SALE_RESPONSE,
	target = get_hero(),
	--text = "Matter of fact, I recently acquired this here Alpha Disruptor. Wouldn't mind lettin' it go for a reasonable price. Interested?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		2.0,	AnimRoles.ANIM_ROLE_FIST_RIGHT,
		5.5,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

SmugDlgAlphaDisruptorBuy = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_PURCHASE_RESPONSE,
	target = get_hero(),
	--text = "Careful with this thing. It's ranked number three on the Polaris Compendium of Ridiculously Overpowered Weapons.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.2,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
		4.5,	AnimRoles.ANIM_ROLE_FIST_RIGHT,
	}
}

SmugDlgAlphaDisruptorNoBuy = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_DECLINE_RESPONSE,
	target = get_hero(),
	--text = "(laughs)  Too much firepower for ya, huh?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_ACTIVATE,
		2.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

----------------------------------------------------
--Parrot Lines--------------------------------------
----------------------------------------------------

--none!

----------------------------------------------------
--Smuggler & Parrot functions-----------------------
----------------------------------------------------
function f_SmugResponse_Open()
scene_clear_title()
	--activate_cam(get_hero(), scene_smuggler_cam_closeup1, true)
	activate_cam(get_hero(), scene_smuggler_cam_new_closeup1, true)
	actor_speak_and_wait(smug, SmugDlgOpen);
	wait(0.2)
	return true
end

function f_SmugResponse_No()
scene_clear_title()
	--activate_cam(get_hero(), scene_smuggler_cam_closeup1, true)
	--Play one line randomly
	activate_cam(get_hero(), scene_smuggler_cam_new_closeup1, true)
	MyRandomLine = math.random(0, 2)
	if MyRandomLine == 0 then
		actor_speak_and_wait(smug, SmugDlgYesterday);
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(smug, SmugDlgShort);
	elseif MyRandomLine == 2 then
		actor_speak_and_wait(smug, SmugDlgShy);
	end
	wait(0.2)
	
	if SAVE.completed_treasure_island then
		SAVE.treasure_island_scene_smuggler_state = 3
		SAVE.treasure_island_scene_smuggler_ratchet_state = 1
		return true
	else
		SAVE.treasure_island_scene_smuggler_state = nil
		SAVE.treasure_island_scene_smuggler_ratchet_state = nil
		return false
	end
end

function f_SmugResponse_Offer()
scene_clear_title()
	--activate_cam(get_hero(), scene_smuggler_cam_closeup1, true)
	activate_cam(get_hero(), scene_smuggler_cam_new_closeup1, true)
	MyRandomLine = math.random(0, 1)
	if MyRandomLine == 0 then
		actor_speak_and_wait(smug, SmugDlgOffer);
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(smug, SmugDlgWeapons);
	end
	wait(0.2)
	return true
end

function f_SmugResponse_Darkwater()
scene_clear_title()
	--activate_cam(get_hero(), scene_smuggler_cam_closeup1, true)
	activate_cam(get_hero(), scene_smuggler_cam_new_closeup1, true)
	actor_speak_and_wait(smug, SmugDlgDarkwater);
	wait(0.2)
	return true
end

function f_SmugResponse_Aboard()
	scene_clear_title()
	--activate_cam(get_hero(), scene_smuggler_cam_closeup1, true)
	--actor_speak_and_wait(smug, SmugDlgAboard);
	--wait(0.2)
	queue_scene("scene_exit_to_boss")
	--return true
end

--Play this when Ratchet returns after already buying the bolt
function f_SmugResponse_NothingNew()
	scene_clear_title()
	--activate_cam(get_hero(), scene_smuggler_cam_closeup1, true)
	--Make it play one of the responses randomly
	activate_cam(get_hero(), scene_smuggler_cam_new_closeup1, true)
	MyRandomLine = math.random(0, 2)
	if MyRandomLine == 0 then
		actor_speak_and_wait(smug, SmugDlgNothingNew1)
		wait(0.2)
		--actor_speak_and_wait(parrot, ParrotDlgNothingNew)
		--wait(0.2)
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(smug, SmugDlgNothingNew2)
		wait(0.2)
	elseif MyRandomLine == 2 then
		actor_speak_and_wait(smug, SmugDlgNothingNew3)
		wait(0.2)
	end
	
	return false
end

function f_SmugglerResponse_AlphaDisruptor()
scene_clear_title()
	--activate_cam(get_hero(), scene_smuggler_cam_closeup1, true)
	activate_cam(get_hero(), scene_smuggler_cam_new_closeup1, true)
	actor_speak_and_wait(smug, SmugDlgAlphaDisruptor)
	wait(0.2)
	SAVE.treasure_island_scene_smuggler_ratchet_state = 2
	return true
end

function f_SmugglerResponse_AlphaDisruptorBuy()
scene_clear_title()
	--activate_cam(get_hero(), scene_smuggler_cam_closeup1, true)
	activate_cam(get_hero(), scene_smuggler_cam_new_closeup1, true)
	
	if hero_get_bolts(get_hero()) < alpha_disruptor_cost then
		f_SmugResponse_No()
	else
		actor_speak_and_wait(smug, SmugDlgAlphaDisruptorBuy)
		wait(0.2)
		
		hero_give_weapon(get_hero(), WPN_ALPHA_NOVA)
		play_sound(SoundSpecs.MUS_Q4B_Win_Weapons1) --adding music for receiving weapons. cro 5/21
		show_weapon_screen(WPN_ALPHA_NOVA, 4, 4, 0.2)
		wait(0.2)
		
		hero_add_bolts(get_hero(), -alpha_disruptor_cost)
		SAVE.scene_smuggler_alpha_disruptor_purchased = true
		request_auto_save()
		--update the table so there's no weapons option anymore
		--RatchetDialogTable1[1] = nil
		--RatchetDialogTable1[3] = RatchetDlgExit
		--RatchetDialogTable1[4] = nil
	end
		
	if SAVE.completed_treasure_island then
		SAVE.treasure_island_scene_smuggler_state = 3
		SAVE.treasure_island_scene_smuggler_ratchet_state = 1
		return true
		
	elseif SAVE.scene_smuggler_alpha_disruptor_purchased then
		SAVE.treasure_island_scene_smuggler_state = 2
		SAVE.treasure_island_scene_smuggler_ratchet_state = 3
		
	else
		SAVE.treasure_island_scene_smuggler_state = nil
		SAVE.treasure_island_scene_smuggler_ratchet_state = nil
		return false
	end
		
end

function f_SmugglerResponse_AlphaDisruptorNoBuy()
scene_clear_title()
	--activate_cam(get_hero(), scene_smuggler_cam_closeup1, true)
	activate_cam(get_hero(), scene_smuggler_cam_new_closeup1, true)
	actor_speak_and_wait(smug, SmugDlgAlphaDisruptorNoBuy)
	wait(0.2)
	
	if SAVE.completed_treasure_island then
		SAVE.treasure_island_scene_smuggler_state = 3
		SAVE.treasure_island_scene_smuggler_ratchet_state = 1
		return true
	else
		SAVE.treasure_island_scene_smuggler_state = nil
		SAVE.treasure_island_scene_smuggler_ratchet_state = nil
		return false
	end
	
end

function f_SmugglerResponse_Exit()
	scene_clear_title()
	if SAVE.completed_treasure_island then
		SAVE.treasure_island_scene_smuggler_state = 3
		SAVE.treasure_island_scene_smuggler_ratchet_state = 1
		return false
	else
		SAVE.treasure_island_scene_smuggler_state = nil
		SAVE.treasure_island_scene_smuggler_ratchet_state = nil
		return false
	end
end

----------------------------------------------------
--Ratchet Lines--------------------------------------
----------------------------------------------------
--Available after OPENER(after Ratchet returns AND the windmills are fixed)
RatchetDlgFollow= {
	dialog = DialogueSpecs.TI_SMUG_FOLLOW,
	--text = "Quick! Follow that fleet!",
	func = f_SmugResponse_Aboard
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
	func = f_SmugglerResponse_AlphaDisruptor,
}

RatchetDlgAlphaDisruptorBuy = {
	--text = "Purchase Alpha Disruptor for " .. tostring(alpha_disruptor_cost) .. " bolts.",
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_PURCHASE,
	func = f_SmugglerResponse_AlphaDisruptorBuy,
}

RatchetDlgAlphaDisruptorNoBuy = {
	--text = "No thanks, I will pass",
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_DECLINE,
	func = f_SmugglerResponse_AlphaDisruptorNoBuy,
}

RatchetDlgExit = {
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_SmugglerResponse_Exit,
	exit = true,
}

RatchetDialogTable1 = {
	RatchetDlgWeapons,
	RatchetDlgExit,
}

RatchetDialogTable2 = {
	RatchetDlgFollow,
	RatchetDlgExit
}

RatchetDialogTable3 = {
	RatchetDlgFollow,
	RatchetDlgWeapons,
	RatchetDlgExit
}

RatchetDialogTable4 = {
	RatchetDlgBolts,
	RatchetDlgAlphaDisruptorBuy,
	RatchetDlgAlphaDisruptorNoBuy,
}

function f_RatchetMenu_Open()
	activate_cam(get_hero(), scene_smuggler_cam_new_medium, true)
	scene_set_title(DialogueSpecs.NI_RETURN_MAYOR_QUESTMENU)
	return scene_show_menu_and_wait(RatchetDialogTable1)
end

function f_RatchetMenu_Follow()
	activate_cam(get_hero(), scene_smuggler_cam_new_medium, true)
	scene_set_title(DialogueSpecs.NI_SMUG_RIDE_READY)
	return scene_show_menu_and_wait(RatchetDialogTable2)
end

function f_RatchetMenu_FollowAlt()
	activate_cam(get_hero(), scene_smuggler_cam_new_medium, true)
	scene_set_title(DialogueSpecs.NI_SMUG_RIDE_READY)
	return scene_show_menu_and_wait(RatchetDialogTable3)
end

function f_RatchetMenu_AlphaDisruptor()
	activate_cam(get_hero(), scene_smuggler_cam_new_medium, true)
	--scene_set_title(RatchetDlgBolts)
	return scene_show_menu_and_wait(RatchetDialogTable4)
end

----------------------------------------------------
--Main----------------------------------------------
----------------------------------------------------
active_hero = get_hero()
hero_warp(active_hero, ti_scene_smuggler_ratchet_warp_vol, true)

smug = biggamehunterer
npc_warp(smug, ti_scene_smuggler_warp_vol)

make_actor(smug)

if not SAVE.treasure_island_scene_smuggler_state then
	if not hero_has_weapon(get_hero(), WPN_ALPHA_NOVA) then
		f_SmugResponse_Open()
	else
		f_SmugResponse_NothingNew()
	end
elseif SAVE.treasure_island_scene_smuggler_state == 1 then
	f_SmugResponse_Offer()
elseif SAVE.treasure_island_scene_smuggler_state == 2 then
	f_SmugResponse_NothingNew()
elseif SAVE.treasure_island_scene_smuggler_state == 3 then
	f_SmugResponse_Darkwater()
	SAVE.treasure_island_scene_smuggler_ratchet_state = 1
end

local continue = true;
while continue do
 
	if not SAVE.treasure_island_scene_smuggler_ratchet_state then
		if not hero_has_weapon(get_hero(), WPN_ALPHA_NOVA) then
			selection = f_RatchetMenu_Open()
		else
			break
		end
	elseif SAVE.treasure_island_scene_smuggler_ratchet_state == 1 then
		if not hero_has_weapon(get_hero(), WPN_ALPHA_NOVA) then
			selection = f_RatchetMenu_FollowAlt()
		else
			selection = f_RatchetMenu_Follow()
		end
	elseif SAVE.treasure_island_scene_smuggler_ratchet_state == 2 then
		selection = f_RatchetMenu_AlphaDisruptor()
	else
		break
	end

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
