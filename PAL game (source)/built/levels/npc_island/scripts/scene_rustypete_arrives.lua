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

foreach_moby_in_pod(NPC_POD, obviate)

--Temp to test
ally_unequipitem(tal, ALLY_ITEM_GUN)

-----------------------------------------------------------------------
-- PETE RESPONSES -----------------------------------------------------
-----------------------------------------------------------------------

-- Pete's initial greeting text
PeteDlgOpen = {
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_OPEN,
	--text    = "Well, its about time, mate! I been radioing you all (hic!) night! So, have you found the Obsidian Eye yet?",
	stance  = AnimRoles.ANIM_ROLE_IDLE_PASSIVE,
	target  = get_hero(),
	gesture = {
		--0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		1.0,	AnimRoles.ANIM_ROLE_BLINK,
		3.2,	AnimRoles.ANIM_ROLE_TWITCH,
		4.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
  }
}

PeteDlgTrust = {
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_OPEN_RESPONSE2,
	--text = "Not surprising. Cheap ol beanrake never did trust anyone. O Course, we were tryin to kill him at the time...Good news is, every pirate worth their salt keeps a map to their buried treasure.",
	stance = AnimRoles.ANIM_ROLE_IDLE_PASSIVE,
	target  = tal,
	gesture = {
		  0.0,	AnimRoles.ANIM_ROLE_BLINK,
		  3.0,	AnimRoles.ANIM_ROLE_BLINK,
		  6.0,  AnimRoles.ANIM_ROLE_IDLE_COLOR,
		  8.0,	AnimRoles.ANIM_ROLE_FIST_LEFT,
		  9.0,	AnimRoles.ANIM_ROLE_BLINK,
	}
}

PeteDlgFind = {
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_OPEN_RESPONSE4,
	--text = "Well, thats the bad news. Its probably still with his body over in Morrow Caverns. Tell you what, mate -- why dont you let me help you find it?! Hic!",
	stance = AnimRoles.ANIM_ROLE_IDLE_AGGRESSIVE,
	target  = tal,
	gesture = {
		2.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,
		3.0,	AnimRoles.ANIM_ROLE_BLINK,
		4.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
		8.0,	AnimRoles.ANIM_ROLE_TWITCH,
	}
}

PeteDlgSlag = {
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_IN_RESPONSE,
	--text = "Great! And I have just the pirate to help us. Ta-daaaa(hic!)aaa! I call it Slag on a Stick. Rerouted his memry banks to his vocal processor, so hell remember anything hes lookin at! Now climb aboard, mateys -- and put yer faith in good ol Captain Slag!",
	stance = AnimRoles.ANIM_ROLE_IDLE_AGGRESSIVE,
	req = true,
	target  = get_hero(),
	gesture = {
		--6.0,	AnimRoles.ANIM_ROLE_REMOVE_OBJECT,
	}
}

PeteDlgTruth = {
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_HELP_RESPONSE,
	--text = "What, cant a pirate whos never told the truth in his life go blatantly out of his way to help the Lombax who killed his best friend and Capn? Hic!",
	stance = AnimRoles.ANIM_ROLE_IDLE_AGGRESSIVE,
	target  = get_hero(),
	gesture = {
		   0.0,    AnimRoles.ANIM_ROLE_IDLE_COLOR,
		   3.0,	   AnimRoles.ANIM_ROLE_REACH_LEFT,
		   5.0,    AnimRoles.ANIM_ROLE_BLINK,
		   7.0,    AnimRoles.ANIM_ROLE_TWITCH,
	}
}

PeteDlgMap = {
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_TRUST_RESPONSE,
	--text = "Suit yerself, mate. But if you want that map, yer gonna need a guide through the caverns.",
	stance = AnimRoles.ANIM_ROLE_IDLE_AGGRESSIVE,
	target  = get_hero(),
	gesture = {
		--   0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
			0.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
			1.5,	AnimRoles.ANIM_ROLE_BLINK,
			4.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

PeteDlgMind = {
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_OFFER,
	--text = "Heya, mate! Change yer mind about that offer?",
	stance = AnimRoles.ANIM_ROLE_IDLE_PASSIVE,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

function f_PeteResponse_Open()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_pete)
	actor_speak_and_wait( rustypete, PeteDlgOpen )
	wait(0.2)
	return true
end

function f_PeteResponse_Trust()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_medium)
	actor_speak_and_wait( rustypete, PeteDlgTrust )
	wait(0.2)
	return true
end

function f_PeteResponse_Find()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_pete)
	actor_speak_and_wait( rustypete, PeteDlgFind )
	wait(0.2)
	return true
end

function f_PeteResponse_Slag()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_pete)
	actor_speak( rustypete, PeteDlgSlag )
	wait(2.7)
	
	--give rusty pete (slag's)head
	revert_actor(rustypete)
	ally_equipitem(rustypete, ALLY_ITEM_SLAGSHEAD)
	make_actor(rustypete)
	wait()
	
	--then he whips it out
	actor_set_gesture(rustypete, AnimRoles.ANIM_ROLE_REMOVE_OBJECT)
	
	wait(4.0)	--wait out the rest of the line, need to check the timing on this
	actor_set_gesture(rustypete, AnimRoles.ANIM_ROLE_REACH_LEFT)
	wait(2.0)
	actor_set_gesture(rustypete, AnimRoles.ANIM_ROLE_FIST_LEFT)
	wait(6.0)
	actor_set_gesture(rustypete, AnimRoles.ANIM_ROLE_REACH_LEFT)
	wait(4.0)
	SAVE.scene_rustypete_arrives_ratchet_state = 2
	return true
end

function f_PeteResponse_Truth()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_pete)
	actor_speak_and_wait( rustypete, PeteDlgTruth )
	wait(0.2)
	SAVE.scene_rustypete_arrives_ratchet_state = 3
	return true
end

function f_PeteResponse_Map()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_pete)
	actor_speak_and_wait( rustypete, PeteDlgMap )
	wait(0.2)
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_tal)
	actor_speak_and_wait(tal, TalDlgHelp)
	wait(0.2)
	SAVE.scene_rustypete_arrives_ratchet_state = 3
	return true
end

function f_PeteResponse_Mind()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_pete)
	actor_speak_and_wait( rustypete, PeteDlgMind )
	wait(0.2)
	return true
end

function f_PeteResponse_GoodBye()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_pete)
	--Set it for something
	--prt("GOOBYE")
	SAVE.scene_rustypete_arrives_state = 1
	wait(0.2)
	return false
end

function f_PeteResponse_NotYet()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_pete)
	--Set it for something
	--prt("NOTYET")
	SAVE.scene_rustypete_arrives_state = 1
	wait(0.2)
	return false
	
end

function f_PeteResponse_Exit()
	queue_scene("scene_postbattle_leveltrans")
end

-----------------------------------------------------------------------
-- Tal Responses-------------------------------------------------------
-----------------------------------------------------------------------
TalDlgFulcrum = {
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_OPEN_RESPONSE,
	--text = "Yeah, but it doesnt work. Darkwater hid the fulcrum star.",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	target  = rustypete,
	gesture = {
		   0.2,    AnimRoles.ANIM_ROLE_BLINK,
		   1.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

TalDlgMap = {
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_OPEN_RESPONSE3,
	--text = "A map? Well, where is it??",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	target  = rustypete,
	gesture = {
		   0.2,    AnimRoles.ANIM_ROLE_QUESTION,
	}
}

TalDlgHelp = {
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_TRUST_RESPONSE2,
	--text = "Hes right, Ratchet. I hate to admit it, but we need his help.",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	target  = get_hero(),
	gesture = {
		   0.4,    AnimRoles.ANIM_ROLE_BLINK,
		   2.4,    AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

function f_TalResponse_Fulcrum()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_tal)
	actor_speak_and_wait( tal, TalDlgFulcrum )
	wait(0.2)
	return true
end

function f_TalResponse_Map()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_tal)
	actor_speak_and_wait( tal, TalDlgMap )
	wait(0.2)
	return true
end

function f_TalResponse_Help()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_closeup_tal)
	actor_speak_and_wait( tal, TalDlgHelp )
	wait(0.2)
	--return true
end

-----------------------------------------------------------------------
-- Ratchet Responses---------------------------------------------------
-----------------------------------------------------------------------
RatchetDlgIn = { 
	--text = "Were in!",
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_IN,
	func = f_PeteResponse_Slag
}

RatchetDlgHelp = { 
	--text = "Wait a minute...why are you helping us??",
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_HELP,
	func = f_PeteResponse_Truth
}

RatchetDlgTrust = { 
	--text = "Sorry, Pete. I just dont trust you.",
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_TRUST, 
	func = f_PeteResponse_Map
}

RatchetDlgMind = { 
	--text = "Alright, Ive changed my mind.",
	dialog = DialogueSpecs.NI_RUSTY_ARRIVAL_CHANGE,
	func = f_PeteResponse_Slag
}

RatchetDlgSure = { 
	--text = "Yeah, let's go!",
	dialog = DialogueSpecs.NI_SMUG_RIDE_GO,
	func = f_PeteResponse_Exit
}

RatchetDlgNotYet = { 
	--text = "Not just yet.",
	dialog = DialogueSpecs.NI_SMUG_RIDE_NOTYET,
	func = f_PeteResponse_NotYet
}

RatchetDlgGoodbye = { 
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_PeteResponse_GoodBye,
	exit = true,
}

RatchetDialogTable1 = {
	RatchetDlgIn,
	RatchetDlgHelp,
	RatchetDlgTrust
}

RatchetDialogTable2 = {
  RatchetDlgMind,
  RatchetDlgGoodbye
}

RatchetDialogTable3 = {
	RatchetDlgSure,
	RatchetDlgNotYet
}

RatchetDialogTable4 = {
	RatchetDlgIn,
	RatchetDlgGoodbye
}

function f_RatchetResponse_In()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_medium)
	return scene_show_menu_and_wait( RatchetDialogTable1 )
end

function f_RatchetResponse_Mind()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_medium)
	return scene_show_menu_and_wait( RatchetDialogTable2 )
end

function f_RatchetResponse_Go()
	scene_set_title(DialogueSpecs.NI_SMUG_RIDE_PARROT)
	activate_cam(get_hero(), scene_rustypete_arrives_cam_medium)
	return scene_show_menu_and_wait( RatchetDialogTable3 )
end

function f_RatchetResponse_InAgain()
	activate_cam(get_hero(), scene_rustypete_arrives_cam_medium)
	return scene_show_menu_and_wait( RatchetDialogTable4 )
end

-----------------------------------------------------------------------
-- ABORT --------------------------------------------------------------
-----------------------------------------------------------------------

--function abort()
--	ally_warp( tal, taxi_tal_warp_vol )
--	ally_warp( rustypete, taxi_rustypete_warp_vol )
--end
 
-----------------------------------------------------------------------
-- MAIN LOOP ----------------------------------------------------------
-----------------------------------------------------------------------
active_hero = get_hero();
hero_warp( active_hero, dock_ratchet_warp_vol, true )
ally_warp( tal, dock_tal_warp_vol )
ally_warp( rustypete, dock_rusty_pete_warp_vol )

make_actor( rustypete )
make_actor( tal)
actor_set_stance(tal, AnimRoles.ANIM_ROLE_IDLE)
actor_set_stance(rustypete, AnimRoles.ANIM_ROLE_IDLE)
--activate_cam( active_hero, dock_rustypete_arrives_cam, true )

--Opening
if not SAVE.scene_rustypete_arrives_state then
	f_PeteResponse_Open()
	f_TalResponse_Fulcrum()
	f_PeteResponse_Trust()
	f_TalResponse_Map()
	f_PeteResponse_Find()
	
--Change your mind (Ratchet says no and comes back)
elseif SAVE.scene_rustypete_arrives_state == 1 then
	f_PeteResponse_Mind()

end

local continue = true;
while continue do
	
	--Are you in? or do you not trust pete?  or do you wanna know why he's helping you?
	if not SAVE.scene_rustypete_arrives_ratchet_state then
		selection = f_RatchetResponse_In()
			
	--If you said no and came back
	elseif SAVE.scene_rustypete_arrives_ratchet_state == 1 then
		selection = f_RatchetResponse_Mind()
		
	--Ratchet changes his mind
	elseif SAVE.scene_rustypete_arrives_ratchet_state == 2 then
		selection = f_RatchetResponse_Go()
			
	--After Ratchet doesn't trust pete or wants to know why he's helping
	elseif SAVE.scene_rustypete_arrives_ratchet_state == 3 then
		selection = f_RatchetResponse_InAgain()
		
	end
	
	-- this calls the 'func' and returns the return value
	if (selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end

wait()

end

foreach_moby_in_pod(NPC_POD, unobviate)

-- end

-- and we're done

-- fade out/back in, letterbox status, etc, all handled automatically

