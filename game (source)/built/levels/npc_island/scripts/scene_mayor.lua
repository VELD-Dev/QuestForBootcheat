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
-- ANIM_ROLE_RH_WAVE  - Right hand wave
-- ANIM_ROLE_RH_EMPHASIS - Right hand emphasis
-- ANIM_ROLE_SCRATCH_HEAD - Scratches head
-- ANIM_ROLE_TH_EMPHASIS - two-hand emphasis
-- ANIM_ROLE_LH_HEAD_NOD - new build
-- ANIM_ROLE_LH_HEAD_SIDE - new build
-- ANIM_ROLE_RH_HEAD_SIDE - new build
-- ANIM_ROLE_RH_HEAD_NOD - new build

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)
MyCamerasTable = {}
foreach_moby_in_pod(NPC_POD, obviate)
-----------------------------------------------------------------------
-- Cameras ------------------------------------------------------------
-----------------------------------------------------------------------
function f_SetCams_Initial()
	return {
		scene_mayor_cam_all_mediumshot,
		scene_mayor_cam_all_wideshot,
		scene_mayor_cam_mayor_closeup,
		scene_mayor_cam_mayor_walkup,
		scene_mayor_cam_tal_closeup,
		scene_mayor_cam_tal_povshot,
		scene_mayor_cam5,
		scene_mayor_cam1,
	}
end

function f_SetCams_Eye()
	return {
		scene_mayor_eye_mediumshot,
		scene_mayor_eye_lighthouse_cam,
		scene_mayor_eye_cam,
		scene_mayor_eye_closeup_cam,
		scene_mayor_cam_all_mediumshot,
		scene_mayor_cam_all_mediumshot,
		scene_mayor_cam_all_mediumshot,
		scene_mayor_cam_all_mediumshot,
	}
end


-----------------------------------------------------------------------
-- MAYOR  RESPONSES ---------------------------------------------------
-----------------------------------------------------------------------
-- Mayor's initial greeting text
MayorDlgOpen = {	
	dialog = DialogueSpecs.NI_MEET_MAYOR_OPENER,
	--text = "Hey there, young feller! Welcome to Hoolefar Island! My name’s Barnabus Worley -- Mayor Barnabus Worley, to be precise. What brings you here?"
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_RH_WAVE,
		2.5,    AnimRoles.ANIM_ROLE_TH_EMPHASIS,--BHE
		6.5,	AnimRoles.ANIM_ROLE_RH_EMPHASIS,--RHE
		--10.0,	AnimRoles.ANIM_ROLE_TH_EMPHASIS,--BHE
		--12.0,	AnimRoles.ANIM_ROLE_STAND,
	}
}

-- Automatic response to CANNON
MayorDlgCannon = {	
	dialog = DialogueSpecs.NI_MEET_MAYOR_HEREMENU_CANNON_RESPONSE,
	--text = "A cannon, eh? Must’ve been messing around with those pirates. Well, any enemy of Sprocket and his gang is a friend of the island!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.2,    AnimRoles.ANIM_ROLE_SCRATCH_HEAD, --RHT
		2.0,    AnimRoles.ANIM_ROLE_TH_EMPHASIS, --BHE
	}
}

--Automatic response to TOURIST
MayorDlgTourist = {
	dialog = DialogueSpecs.NI_MEET_MAYOR_HEREMENU_TOURIST_RESPONSE,
	--text = "A tourist? Here? Not much to see right now, I’m afraid. Lost our power thanks to a mysterious saboteur.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.5,    AnimRoles.ANIM_ROLE_SCRATCH_HEAD,
		5.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

--Automatic response to SALESMAN
MayorDlgSalesman = {
	dialog = DialogueSpecs.NI_MEET_MAYOR_HEREMENU_SALESMAN_RESPONSE,
	--text = "Crotchetizers? Well, now, I don’t s’pose there’s much a demand for that particular item.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.4,    AnimRoles.ANIM_ROLE_SCRATCH_HEAD, --RHT
		2.4,	AnimRoles.ANIM_ROLE_RH_EMPHASIS, --RHE
	}
}

--Automatic response to BUSINESS
MayorDlgBusiness = {
	dialog = DialogueSpecs.NI_MEET_MAYOR_HEREMENU_BUSINESS_RESPONSE,
	--text = "Sorry, young feller. Didnt mean to pry. Your business is your business, I spose.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_DISAGREE,
		1.0,	AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

--Continues from CANNON,_RESPONSE, TOURIST_RESPONSE, SALESMAN_RESPONSE, or BUSINESS_RESPONSE
--CUT
MayorDlgFriend = {
	dialog = DialogueSpecs.NI_MEET_MAYOR_HEREMENU_BUSINESS_MAYOR_RESPONSE,
	--text = "Sorry Miss -- we had power, but someone vandalized our wind turbines last night and damaged our supply beacon. But if you help us repair them, I am sure youd be able to contact your friend!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = tal,
	gesture = {
		0.2,    AnimRoles.ANIM_ROLE_DISAGREE, --BHE
		2.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS, --RHE
		5.5,    AnimRoles.ANIM_ROLE_TH_EMPHASIS, --RHT
	}
}

-- Automatic response to HELPOUT_YES or CHANGEMIND
MayorDlgAid = {
	dialog = DialogueSpecs.NI_MEET_MAYOR_AIDMENU_RESPONSE,
	--text = "Really? Well, that is good news. Just climb up to the top of each windmill and give the old bolt crank a turn.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_AGREE,
		0.5,	AnimRoles.ANIM_ROLE_TH_EMPHASIS,
		--5.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT
	}
}

-- Automatic response to HELPOUT_BEACON
--This may be NI_RETURN_MAYOR_QUESTMENU_SIGNAL_RESPONSE
MayorDlgBeacon = {
	dialog = DialogueSpecs.NI_MEET_MAYOR_AIDMENU_BEACON_RESPONSE,
	--text = "This bedrock of this island is filled with trillium ore. Creates too much electromagnetic interference for most ships. That beacon’s our only way of hailing em.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_TH_EMPHASIS,
		6.0,	AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

-- Automatic response to DARKWATER
MayorDlgDarkwater = {
	dialog = DialogueSpecs.NI_MEET_MAYOR_AIDMENU_DARKWATER_RESPONSE,
	--text = "Darkwater? He was killed years ago, over there in Morrow Caverns -- by his own first mate, no less. What was his name? Slag!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_DISAGREE,--RHT
		2.5,    AnimRoles.ANIM_ROLE_REACH_LEFT,--RHE
		7.0,    AnimRoles.ANIM_ROLE_SCRATCH_HEAD,--RHT
		11.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS--BHE
	}
}

-- Automatically continues from ANY HELPOUT choice
MayorDlgHelp = {
	dialog = DialogueSpecs.NI_MEET_MAYOR_CLOSER,
	--text = "Anyhoo, the Hoolefoids will be most grateful for any help you can give em.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

-- Opener after Ratchet returns to Mayor IF he admitted to being shot out of a cannon: (MAYOR_CANNON)
MayorDlgOpenCannon = {
	dialog = DialogueSpecs.NI_RETURN_MAYOR_CANNON_OPENER,
	--text = "Well hey, there, young feller. Run into any more pirates?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

-- Opener after Ratchet returns to Mayor IF he called himself a tourist: (MAYOR_TOURIST)
MayorDlgOpenTourist = {
	dialog = DialogueSpecs.NI_RETURN_MAYOR_TOURIST_OPENER,
	--text = "Well if it isnt Hoolefar’s only tourist. What can I do for you, young feller?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

-- Opener after Ratchet returns to Mayor IF he called himself a crotchetizer salesmant: (MAYOR_SALESMAN)
MayorDlgOpenSalesman = {
	dialog = DialogueSpecs.NI_RETURN_MAYOR_SALESMAN_OPENER,
	--text = "Hey, young feller.  Found any buyers for that crotchetizer thing-a-majig?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		1.0,    AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

-- Opener after Ratchet returns to Mayor IF he said "none of your business": (MAYOR_BUSINESS)
MayorDlgOpenBusiness = {
	dialog = DialogueSpecs.NI_RETURN_MAYOR_BUSINESS_OPENER,
	--text = "Hey, Stranger. What can I do for ya?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_RH_WAVE,
		2.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

-- Automatic response to DOOR
MayorDlgDoor = {
	dialog = DialogueSpecs.NI_RETURN_MAYOR_QUESTMENU_DOOR_RESPONSE,
	--text = "Oh, that? That’s just somethin’ Darkwater was workin’ on. We sealed it off after he was killed. Best put it out of your mind.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,
		1.4,	AnimRoles.ANIM_ROLE_DISAGREE,
		4.0,	AnimRoles.ANIM_ROLE_RH_EMPHASIS
	}
}

-- Automatic response to DARK
MayorDlgDie = {
	dialog = DialogueSpecs.NI_RETURN_MAYOR_QUESTMENU_DARK_RESPONSE,
	--text = "Mutiny, I suspect. Legend has it Slag dropped anchor in Morrow Caverns and killed anyone who refused to call him “Captain”- includin’ ol’ Darkwater! Folks ‘round here still like to scare the tourists with ghost stories about that place.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_DISAGREE,
		2.0,	AnimRoles.ANIM_ROLE_RH_EMPHASIS,
		--5.0,	AnimRoles.ANIM_ROLE_INCH_BACKWARD,
		8.0,	AnimRoles.ANIM_ROLE_TH_EMPHASIS
	}
}

-----------------------------------------------------------------------
-- TALWYN RESPONSES ---------------------------------------------------
-----------------------------------------------------------------------
-- Continues from CLOSER_RESPONSE. Ends conversation
-- This one isn't in the conduit yet
TalDlgFriend = {
	dialog = DialogueSpecs.NI_MEET_MAYOR_HEREMENU_BUSINESS_TALWYN_RESPONSE,
	--text = "Were trying to contact a friend of ours, but I cant seem to catch a signal. I dont suppose you have a radio tower we could use?",
	stance = AnimRoles.ANIM_ROLE_IDLE,
	target  = npc_mayor,
	gesture = {
		0.2,	AnimRoles.ANIM_ROLE_BLINK,
		1.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT, --RHE
		3.0,	AnimRoles.ANIM_ROLE_BLINK,
		--2.0,	AnimRoles.ANIM_ROLE_IDLE,
		4.0,	AnimRoles.ANIM_ROLE_QUESTION,	--RHT
		--5.0,	AnimRoles.ANIM_ROLE_IDLE,
	}
}

-----------------------------------------------------------------------
-- MAYOR/TALWYN FUNCTIONS----------------------------------------------
-----------------------------------------------------------------------
function f_TalResponse_Friend()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[5], true )
	actor_speak_and_wait( tal, TalDlgFriend)
	return true
end

function f_TalResponse_Beacon()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[5], true )
	actor_speak_and_wait( tal, TalDlgBeacon)
end

function f_MayorResponse_Friend()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[6], true )
	actor_speak_and_wait( npc_mayor, MayorDlgFriend )
	return true
end

--Opening scene
function f_MayorResponse_Open()
	scene_clear_title()
	actor_set_gesture(npc_mayor, AnimRoles.ANIM_ROLE_RH_WAVE)
	wait(1.0)
		
	activate_cam( active_hero, MyCamerasTable[3], true )
	
	actor_speak_and_wait( npc_mayor, MayorDlgOpen )
	wait(0.2)
	
	return true
end

--Opening to second part of the scene outside of the obsidian eye
function f_MayorResponse_OpenAlt()
	activate_cam( active_hero, MyCamerasTable[4], true )

	if (SAVE.scene_mayor_ratchet_answer == 1) then
		actor_speak_and_wait( npc_mayor, MayorDlgOpenCannon)
		
    elseif (SAVE.scene_mayor_ratchet_answer == 2) then
    	actor_speak_and_wait( npc_mayor, MayorDlgOpenTourist )
		
    elseif(SAVE.scene_mayor_ratchet_answer == 3) then
    	actor_speak_and_wait( npc_mayor, MayorDlgOpenSalesman )
		
	elseif(SAVE.scene_mayor_ratchet_answer == 4) then
		actor_speak_and_wait( npc_mayor, MayorDlgOpenBusiness )
	else
		prt("ERROR: RATCHET DIDNT ANSWER THE QUESTION")
		SAVE.scene_mayor_ratchet_answer = 1
	end
end

--Handles response from CANNON
function f_MayorResponse_Cannon()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[3], true )
	actor_speak_and_wait( npc_mayor, MayorDlgCannon )
		
	f_TalResponse_Friend()
	f_MayorResponse_Friend()

	SAVE.scene_mayor_ratchet_answer = 1		
	return true
end

--Handles response from TOURIST
function f_MayorResponse_Tourist()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[3], true )
	actor_speak_and_wait( npc_mayor, MayorDlgTourist )
	wait(0.2)
	
	f_TalResponse_Friend()
	f_MayorResponse_Friend()
	
	SAVE.scene_mayor_ratchet_answer = 2

	return true
end

--Handles response from SALESMAN
function f_MayorResponse_Salesman()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[3], true )
	actor_speak_and_wait( npc_mayor, MayorDlgSalesman )
	
	f_TalResponse_Friend()
	f_MayorResponse_Friend()
	
	SAVE.scene_mayor_ratchet_answer = 3
	return true
end

--Handles response from BUSINESS
function f_MayorResponse_Business()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[3], true )
	actor_speak_and_wait( npc_mayor, MayorDlgBusiness )
	
	f_TalResponse_Friend()
	f_MayorResponse_Friend()
	
	SAVE.scene_mayor_ratchet_answer = 4
	return true
end

--Handles response from YES
function f_MayorResponse_Yes()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[3], true )
	actor_speak_and_wait( npc_mayor, MayorDlgAid )
	return false
end

--Handles response from BEACON
function f_MayorResponse_Beacon()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[2], true )
	actor_speak_and_wait( npc_mayor, MayorDlgBeacon )
	return true
end

--Handles response from DARKWATER
function f_MayorResponse_Darkwater()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[3], true )
	actor_speak_and_wait( npc_mayor, MayorDlgDarkwater )

	--f_TalResponse_Beacon()
	--return true
end

function f_MayorResponse_Door()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[3], true )
	actor_speak_and_wait( npc_mayor, MayorDlgDoor)
	return true
end

function f_MayorResponse_Die()
	scene_clear_title()
	activate_cam( active_hero, MyCamerasTable[4], true )
	actor_speak_and_wait( npc_mayor, MayorDlgDie)
	return true
end

function f_MayorResponse_Goodbye()
	--This should crap out of the scene
end

-----------------------------------------------------------------------
-- RATCHET DIALOGUE DATA ----------------------------------------------
-----------------------------------------------------------------------
--First set of responses
RatchetDlgCannon = { 
	dialog = DialogueSpecs.NI_MEET_MAYOR_HEREMENU_CANNON,   
	func = f_MayorResponse_Cannon
	}
	
RatchetDlgTourist = { 
	dialog = DialogueSpecs.NI_MEET_MAYOR_HEREMENU_TOURIST,     
	func = f_MayorResponse_Tourist
	}
	
RatchetDlgSalesman = { 
	dialog = DialogueSpecs.NI_MEET_MAYOR_HEREMENU_SALESMAN,     
	func = f_MayorResponse_Salesman
	}
	
RatchetDlgBusiness = { 
	dialog = DialogueSpecs.NI_MEET_MAYOR_HEREMENU_BUSINESS,     
	func = f_MayorResponse_Business
	}

--Second set of responses
RatchetDlgYes = { 
	dialog = DialogueSpecs.NI_MEET_MAYOR_AIDMENU_YES,
	--text = "Sure, glad to help out!",
	func = f_MayorResponse_Yes
	}
	
RatchetDlgBeacon = { 
	dialog = DialogueSpecs.NI_MEET_MAYOR_AIDMENU_BEACON,     
	--text = "What's a supply beacon?",
	func = f_MayorResponse_Beacon
	}
	
RatchetDlgDarkwater = { 
	dialog = DialogueSpecs.NI_MEET_MAYOR_AIDMENU_DARKWATER,     
	--text = "Im kinda busy right now. Im looking for a pirate named Darkwater. Seen him?",
	func = f_MayorResponse_Darkwater
	}

--Third set of responses
RatchetDlgDoor = { 
	dialog = DialogueSpecs.NI_RETURN_MAYOR_QUESTMENU_DOOR,
	--text = "What's that door lead to?",
	func = f_MayorResponse_Door
	}
			
RatchetDlgDie = { 
	dialog = DialogueSpecs.NI_RETURN_MAYOR_QUESTMENU_DARK,
	--text = "How did Darkwater Die?",
	func = f_MayorResponse_Die
	}			

RatchetDlgGoodbye = {
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_MayorResponse_Goodbye,
	exit = true,
}

-----------------------------------------------------------------------
-- RATCHET DIALOGUE TABLES---------------------------------------------
-----------------------------------------------------------------------
RatchetDialogTable = {
  RatchetDlgCannon,
  RatchetDlgTourist,
  RatchetDlgSalesman,
  RatchetDlgBusiness
}

RatchetDialogTable2 = {
  RatchetDlgYes,
  RatchetDlgDarkwater
}

RatchetDialogTable3 = {
	RatchetDlgBeacon,
	RatchetDlgDoor,
	RatchetDlgDie,
	RatchetDlgGoodbye
}

-----------------------------------------------------------------------
-- RATCHET DIALOGUE Functions------------------------------------------
-----------------------------------------------------------------------
function f_RatchetMenu_Open()
	activate_cam( active_hero, MyCamerasTable[1], true )
	scene_set_title(DialogueSpecs.NI_MEET_MAYOR_HEREMENU)
	functionselection = scene_show_menu_and_wait( RatchetDialogTable )
	if(functionselection) then
		scene_clear_title()
		return functionselection
	end
end

function f_RatchetMenu_Help()
	activate_cam( active_hero, MyCamerasTable[1], true )
	scene_set_title(DialogueSpecs.NI_MEET_MAYOR_AIDMENU)
	functionselection = scene_show_menu_and_wait( RatchetDialogTable2 )
	if(functionselection) then
		scene_clear_title()
		return functionselection
	end
end

function f_RatchetMenu_Info()
	activate_cam( active_hero, MyCamerasTable[1], true )
	scene_set_title(DialogueSpecs.NI_RETURN_MAYOR_QUESTMENU)
	functionselection = scene_show_menu_and_wait( RatchetDialogTable3 )
	if(functionselection) then
		scene_clear_title()
		return functionselection
	end
end

-----------------------------------------------------------------------
-- ABORT --------------------------------------------------------------
-----------------------------------------------------------------------

--function abort()
--end
 
-----------------------------------------------------------------------
-- MAIN LOOP ----------------------------------------------------------
-----------------------------------------------------------------------

--set the actors and move them into place
active_hero = get_hero()
--unobviate(npc_mayor)

SAVE.scene_mayor_intro = true

--if here for first part, walking part and eye door(set a var in prebattle)
if not SAVE.scene_mayor_intro_state then
	request_mayor_music = true
	SAVE.scene_mayor_tal_no_gun = true
	hero_warp(active_hero, scene_mayor_hero_pos)
	ally_warp(tal, scene_mayor_tal_pos)
	make_actor(tal)
	actor_set_stance(tal, AnimRoles.ANIM_ROLE_IDLE)
	npc_warp(npc_mayor, scene_mayor_mayor_pos)
	SAVE.scene_mayor_walking = false
	MyCamerasTable = f_SetCams_Initial()
	activate_cam( active_hero, scene_mayor_cam_all_mediumshot, true )
else
	if is_in_volume(npc_mayor, scene_mayor_walkto_vol) then
		SAVE.scene_mayor_walking = false
		MyCamerasTable = f_SetCams_Eye()
		hero_warp(get_hero(), scene_mayor_ratchet_eye_vol, true )
		npc_warp(npc_mayor, scene_mayor_walkto_vol)
	else
		SAVE.scene_mayor_walking = true
	end
end

make_actor( npc_mayor )

local selection;

-- intro sequence
if not SAVE.scene_mayor_intro_state then
	SAVE.scene_mayor_intro_state = 1
	f_MayorResponse_Open()
	
else
	SAVE.scene_mayor_ratchet_state = 2
	f_MayorResponse_OpenAlt()

end

local continue = true;
while continue do
  
  -- get a dialogue response from the player
	if not SAVE.scene_mayor_ratchet_state then
		selection = f_RatchetMenu_Open()
		SAVE.scene_mayor_ratchet_state = 1
		
	elseif SAVE.scene_mayor_ratchet_state == 1 then
		selection = f_RatchetMenu_Help()
		
	elseif SAVE.scene_mayor_ratchet_state == 2 then
		selection = f_RatchetMenu_Info()
	end
    
  -- this calls the 'func' and returns the return value
  if (selection ~= nil and selection.func ~= nil) then
    continue = selection.func()
  else
    continue = false
  end

  wait()

end

if SAVE.scene_mayor_tal_no_gun then
	SAVE.scene_mayor_tal_no_gun = false
	revert_actor(tal)

end

foreach_moby_in_pod(NPC_POD, unobviate)

-- and we're done

-- fade out/back in, letterbox status, etc, all handled automatically

