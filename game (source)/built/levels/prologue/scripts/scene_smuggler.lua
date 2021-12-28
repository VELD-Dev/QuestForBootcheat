
alpha_disruptor_cost = 50000

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)
-- turn the lightning off
deactivate( darkwater_ship_lightning_controller )
deactivate( slag_west_ship_lightning_controller )
deactivate( slag_east_ship_lightning_controller )
----------------------------------------------------------------------------------
--Smuggler Lines------------------------------------------------------------------
----------------------------------------------------------------------------------
SmugDlgOpen = {
	dialog = DialogueSpecs.FI_SMUG_OPEN,
	--text = "Be careful, partner. Pirates arent known for fightin fair, if you know what Im sayin.",
	target = get_hero(),
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
		2.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--Random - Players opts to hire the Smuggler and DOES NOT HAVE enough bolts.
SmugDlgYesterday = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_BUYMENU_BUY_NEEDBOLTS,
	--text = "Whoa there, son. I wasnt born yesterday.",
	target = get_hero(),
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
	}
}

--Random - Players opts to hire the Smuggler and DOES NOT HAVE enough bolts.
SmugDlgShort = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_BUYMENU_BUY_NEEDBOLTS2,
	--text = "Im afraid youre a bit short.",
	target = get_hero(),
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}
--RANDOM - Plays if Ratchet selects BUYMENU_BUY and does NOT enough bolts for the bolt.
SmugDlgShy = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_BUYMENU_BUY_NEEDBOLTS3,
	--text = "Youre a few bolts shy, partner.",
	target = get_hero(),
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew1 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW,
	--text = "Im afraid Ive got nothin for ya right now, friend. Best try again later.",
	target = get_hero(),
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
		3.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew2 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW_ALT2,
	--text = "Sorry, partner. I'm all tapped out.",
	target = get_hero(),
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_DEACTIVATE,
	}
}

--Random -- Automatic response if player returns to smuggler and has already purchased bolt.
SmugDlgNothingNew3 = {
	dialog = DialogueSpecs.NI_SMUG_NOTHING_NEW_ALT3,
	--text = "Son, can't you see I'm off the clock?",
	target = get_hero(),
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

SmugDlgAlphaDisruptor = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_SALE_RESPONSE,
	--text = "Matter of fact, I recently acquired this here Alpha Disruptor. Wouldn't mind lettin' it go for a reasonable price. Interested?",
	target = get_hero(),
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		2.0,	AnimRoles.ANIM_ROLE_FIST_RIGHT,
		5.5,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

SmugDlgAlphaDisruptorBuy = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_PURCHASE_RESPONSE,
	--text = "Careful with this thing. It's ranked number three on the Polaris Compendium of Ridiculously Overpowered Weapons.",
	target = get_hero(),
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.2,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		4.5,	AnimRoles.ANIM_ROLE_FIST_RIGHT,
	}
}

SmugDlgAlphaDisruptorNoBuy = {
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_DECLINE_RESPONSE,
	--text = "(laughs)  Too much firepower for ya, huh?",
	target = get_hero(),
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_ACTIVATE,
		2.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--Opening line
function f_SmugglerResponse_Open()
	activate_cam(get_hero(), smuggler_scene_cam_closeup, true) 
	actor_speak_and_wait(smuggler, SmugDlgOpen)
	wait(0.2)
end

--When Ratchet asks if he has any weapons
function f_SmugglerResponse_Weapons()
	activate_cam(get_hero(), smuggler_scene_cam_closeup, true)
	actor_speak_and_wait(smuggler, SmugDlgAlphaDisruptor)
	wait(0.2)
	SAVE.prologue_scene_smuggler_state = 1
	return true
end

--Ratchet tries to buy the Alpha nova disruptor cannon of mass doom
function f_SmugglerResponse_AlphaDisruptorBuy()
	activate_cam(get_hero(), smuggler_scene_cam_closeup, true)
	if hero_get_bolts(get_hero()) < alpha_disruptor_cost then
		f_SmugglerResponse_BuyFail()
	else
		actor_speak_and_wait(smuggler, SmugDlgAlphaDisruptorBuy)
		wait(0.2)
		fade_to_black(0)
		
		--Mad guns
		hero_give_weapon(get_hero(), WPN_ALPHA_NOVA)
		play_sound(SoundSpecs.MUS_Q4B_Win_Weapons1) --adding music for receiving weapons. cro 5/29
		show_weapon_screen(WPN_ALPHA_NOVA, 4, 4, 0.2)
		wait(0.2)
		
		hero_add_bolts(get_hero(), -alpha_disruptor_cost)
		SAVE.prologue_scene_smuggler_state = 2
	end
	--return false
end

--Ratchet doesn't want the best gun in the game
function f_SmugglerResponse_AlphaDisruptorNoBuy()
	activate_cam(get_hero(), smuggler_scene_cam_closeup, true)
	actor_speak_and_wait(smuggler, SmugDlgAlphaDisruptorNoBuy)
	wait(0.2)
	SAVE.prologue_scene_smuggler_state = nil
	--return true
end

--Ratchet tries to buy the Alpha Disruptor and horribly fails
function f_SmugglerResponse_BuyFail()
	activate_cam(get_hero(), smuggler_scene_cam_closeup, true)
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
	SAVE.prologue_scene_smuggler_state = nil
	--return true
end

--Smuggler is all out of stuff to say
function f_SmugglerResponse_NothingNew()
	activate_cam(get_hero(), smuggler_scene_cam_closeup, true)
	MyRandomLine = math.random(0, 2)
	if MyRandomLine == 0 then
		actor_speak_and_wait(smuggler, SmugDlgNothingNew1)
		wait(0.2)
		actor_speak_and_wait(smuggler, ParrotDlgNothingNew)
		wait(0.2)
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(smuggler, SmugDlgNothingNew2)
		wait(0.2)
	elseif MyRandomLine == 2 then
		actor_speak_and_wait(smuggler, SmugDlgNothingNew3)
		wait(0.2)
	end
end

--Not sure what this does
function f_SmugglerResponse_Exit()

end

----------------------------------------------------------------------------------
--Ratchet Lines-------------------------------------------------------------------
----------------------------------------------------------------------------------
RatchetDlgBolts = {
	dialog = DialogueSpecs.GEN_RATCH_TEXT_CURRENT_BOLTS,
	--text = "You currently have " .. tostring(hero_get_bolts(get_hero())) .. " bolts",
	label = true,
	numreplace = hero_get_bolts(get_hero()),
}

RatchetDlgWeapons = {
	--text = "Do you have any weapons for sale?",
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_SALE,
	func = f_SmugglerResponse_Weapons
}

RatchetDlgAlphaDisruptorBuy = {
	--text = "Purchase Alpha Disruptor for " .. tostring(alpha_disruptor_cost) .. " bolts.",
	dialog = DialogueSpecs.NI_SMUG_RIDE_WEAPONS_PURCHASE,
	numreplace = alpha_disruptor_cost,
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

RatchetDialogTableOpen = {
		RatchetDlgWeapons,
		RatchetDlgExit
}

RatchetDialogTableAlphaDisruptor = {
		RatchetDlgBolts,
		RatchetDlgAlphaDisruptorBuy,
		RatchetDlgAlphaDisruptorNoBuy
}

function f_RatchetMenu_Open()
	activate_cam(get_hero(), smuggler_scene_cam_medium, true)
	if not hero_has_weapon(get_hero(), WPN_ALPHA_NOVA) then
		return scene_show_menu_and_wait(RatchetDialogTableOpen)
	else
		return nil
	end
end

function f_RatchetMenu_AlphaDisruptor()
	activate_cam(get_hero(), smuggler_scene_cam_medium, true)
	return scene_show_menu_and_wait(RatchetDialogTableAlphaDisruptor)
end

----------------------------------------------------------------------------------
--Main Loop-----------------------------------------------------------------------
----------------------------------------------------------------------------------
--set up the scene here
unobviate(smugglers_barge)
taxi_warp( smugglers_barge, smugglers_barge_vol)
npc_warp( smuggler, smuggler_scene_warp_vol)
hero_warp(get_hero(), smuggler_scene_ratchet_warp_vol)
make_actor(smuggler)

--He always says this line?
f_SmugglerResponse_Open()

selection = nil
local continue = true
while continue do

	if not hero_has_weapon(get_hero(), WPN_ALPHA_NOVA) then
		if not SAVE.prologue_scene_smuggler_state then
			selection = f_RatchetMenu_Open()
		elseif SAVE.prologue_scene_smuggler_state == 1 then
			selection = f_RatchetMenu_AlphaDisruptor()
		else
			break
		end
	end
	
	if SAVE.prologue_scene_smuggler_state == 2 then
		break
	end
	
	if(selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end
	
	--prt("STATE: " + tostring(SAVE.prologue_scene_smuggler_state))
	--prt("CONTINUE: " + tostring(continue))
	
wait()	
	
end



-- Get the Lightning working
activate( darkwater_ship_lightning_controller )
activate( slag_west_ship_lightning_controller )
activate( slag_east_ship_lightning_controller )
