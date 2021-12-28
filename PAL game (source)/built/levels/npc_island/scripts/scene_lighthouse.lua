-- !-- villager anim roles
-- ANIM_ROLE_STAND - relaxed stance
-- ANIM_ROLE_INCH_FORWARD - lean forward (CRASHES!)
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
-- ANIM_ROLE_RH_HEAD_SIDE - RH = Right Hand
-- ANIM_ROLE_RH_HEAD_NOD
-- ANIM_ROLE_LH_HEAD_SIDE - Left Hand
-- ANIM_ROLE_LH_HEAD_NOD
-- ANIM_ROLE_LF_HEAD_NOD - Left Fist
-- ANIM_ROLE_LF_HEAD_SIDE

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.4, 1.0)

-----------------------------------------------------------------------
-- Lighthouse NPC responses -------------------------------------------
-----------------------------------------------------------------------

--First line of conv after pressing Triangle to start
LighthouseDlgOpen = {
	dialog = DialogueSpecs.NI_BOP_INITIAL_OPENER,
	--text    = "Lousy, low-down, good-for-nuttin vandals! Whens that Mayor gonna crack down on these bums?",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_DISAGREE,    
		3.0,    AnimRoles.ANIM_ROLE_RH_HEAD_SIDE,
	}
}

--Automatic response to PROBLEM
LighthouseDlgProblem = {
	dialog = DialogueSpecs.NI_BOP_INITIAL_ENQUIREMENU_PROBLEM_RESPONSE,
	--text = "Some wiseguy uncoupled the flippin energy conductor from supply beacon. How am I supposed to fix it without power?? Guess Ill just have to take lunch...",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_LH_HEAD_SIDE,
		3.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
		8.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,
	}
}

--Automatic response to HELP
LighthouseDlgHelp = {
	dialog = DialogueSpecs.NI_BOP_INITIAL_ENQUIREMENU_HELP_REPONSE,
	--text = "Preciate the offer, kid. But we cant do nothin till powers restored. Lucky for me, Im in the union! Hehe.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
		2.0,    AnimRoles.ANIM_ROLE_DISAGREE,
		4.5,	AnimRoles.ANIM_ROLE_LH_HEAD_NOD,
  }
}

--Plays at random when Ratchet speaks to BOP after PROBLEM or HELP and wind towers are not active.
--Plays at Random IF Ratchet returns to the BOP without the bolt.
LighthouseDlgAlt1 = {
	dialog = DialogueSpecs.NI_BOP_NOWIND_ALT1,
	--text = "Heya, kid. Still no dice on the power, huh?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_HEAD_UP,
		2.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,
  }
}

--Plays at random when Ratchet speaks to BOP after PROBLEM or HELP and wind towers are not active.
--Plays at Random IF Ratchet returns to the BOP without the bolt.
LighthouseDlgAlt2 = {
	dialog = DialogueSpecs.NI_BOP_NOWIND_ALT2,
	--text = "Good work so far, but not all the windmills have been repaired yet.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
		2.5,	AnimRoles.ANIM_ROLE_REACH_LEFT,
  }
}

--Plays at random when Ratchet speaks to BOP after PROBLEM or HELP and wind towers are not active.
--Plays at Random IF Ratchet returns to the BOP without the bolt.
LighthouseDlgAlt3 = {
	dialog = DialogueSpecs.NI_BOP_NOWIND_ALT3,
	--text = "Sorry, kid. Looks like youll be here for a while.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		2.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Plays at random when Ratchet speaks to BOP after PROBLEM or HELP and wind towers are not active.
--Plays at Random IF Ratchet returns to the BOP without the bolt.
LighthouseDlgAlt4 = {
	dialog = DialogueSpecs.NI_BOP_NOWIND_ALT4,
	--text = "Hey, Im woykin here. Honest.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.5,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Plays at random when Ratchet speaks to BOP after PROBLEM or HELP and wind towers are not active.
--Plays at Random IF Ratchet returns to the BOP without the bolt.
LighthouseDlgAlt5 = {
	dialog = DialogueSpecs.NI_BOP_NOWIND_ALT5,
	--text = "If anyone asks, Im on break.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,
  }
}

--Auto trigger upon Ratchet returning to the Beacon. 
LighthouseDlgActiveOpen = {
	dialog = DialogueSpecs.NI_BOP_WIND_ACTIVE_OPENER,
	--text = "Hey, kid! Didja see we got the power woykin? Thats good ol fashioned union labor for ya. Dont thank me, though -- Im just a guy on the job.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_HEAD_UP,
		0.5,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
		3.5,	AnimRoles.ANIM_ROLE_DISAGREE,
		4.5,	AnimRoles.ANIM_ROLE_REACH_LEFT,
  }
}

--Auto trigger IF Ratchet has not yet spoken to BOP
LighthouseDlgActiveOpenAlt = {
	dialog = DialogueSpecs.NI_BOP_WIND_ACTIVE_OPENER_ALT,
	--text = "Oh, hey, there pal! I hoyd there was a Lombax on the island -- but I didn’t believe it! What can I do for ya?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_HEAD_UP,
		2.5,	AnimRoles.ANIM_ROLE_RH_HEAD_SIDE,
  }
}

--Response to asking if beacon is working.
LighthouseDlgActiveBeacon = {
	dialog = DialogueSpecs.NI_BOP_WIND_ACTIVE_WORKMENU_BEACON_RESPONSE,
	--text = "Fraid not. Looks like some bum stole the bolt straight off the power coupling! I cant connect the darn thing. The noyve of some people...",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_DISAGREE,
		1.5,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		3.5,	AnimRoles.ANIM_ROLE_LH_HEAD_SIDE,
  }
}

--Response to SUMMER HOME
LighthouseDlgActiveHome = {
	dialog = DialogueSpecs.NI_BOP_WIND_ACTIVE_WORKMENU_HOME_RESPONSE,
	--text = "Oh, a wise guy, eh? Make you feel big, pickin on a woykin class Joe such as myself? For shame!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
		2.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		2.3,	AnimRoles.ANIM_ROLE_HEAD_UP,
		3.0,	AnimRoles.ANIM_ROLE_LH_HEAD_SIDE,
  }
}

--Response to asking about Zoni.
LighthouseDlgActiveZoni = {
	dialog = DialogueSpecs.NI_BOP_WIND_ACTIVE_WORKMENU_ZONI_REPONSE,
	--text = "Zoni, huh? Come to think of it, ol Angstrom used to jabber on about em. Said they were the watchers of the univoyse, or some such gobble-dee-gook.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_HEAD_DOWN,
		1.0,    AnimRoles.ANIM_ROLE_AGREE,
		3.5,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Plays automatically after any WORKMENU question has been answered
LighthouseDlgActiveFindBolt = {
	dialog = DialogueSpecs.NI_BOP_WIND_ACTIVE_FIND_BOLT,
	--text = "Anyway, if youre lookin to get a signal off the island, youll hafta find another bolt. I think I saw someone sellin one down by the beach.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
		5.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
  }
}

--Plays automatically after any WORKMENU question has been answered
LighthouseDlgNoBoltAlt1 = {
	dialog = DialogueSpecs.NI_BOP_NOBOLT_ALT1,
	--text = "Sorry, kid. I cant fix the beacon without that bolt.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		1.0,    AnimRoles.ANIM_ROLE_RH_HEAD_NOD,
  }
}

--Plays automatically after any WORKMENU question has been answered
LighthouseDlgNoBoltAlt2 = {
	dialog = DialogueSpecs.NI_BOP_NOBOLT_ALT2,
	--text = "You find that bolt yet, kid?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Plays automatically after any WORKMENU question has been answered
LighthouseDlgNoBoltAlt3 = {
	dialog = DialogueSpecs.NI_BOP_NOBOLT_ALT3,
	--text = "Still hangin around, huh, champ?",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,
  }
}

--Plays automatically after any WORKMENU question has been answered
LighthouseDlgNoBoltAlt4 = {
	dialog = DialogueSpecs.NI_BOP_NOBOLT_ALT4,
	--text = "Sorry, kid. Looks like youll be here for a while.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.5,    AnimRoles.ANIM_ROLE_DISAGREE,
  }
}

--Plays automatically after any WORKMENU question has been answered
LighthouseDlgNoBoltAlt5 = {
	dialog = DialogueSpecs.NI_BOP_NOBOLT_ALT5,
	--text = "Hey, Im woykin here. Honest.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Plays automatically after any WORKMENU question has been answered
LighthouseDlgNoBoltAlt6 = {
	dialog = DialogueSpecs.NI_BOP_NOBOLT_ALT6,
	--text = "If anyone asks, Im on break.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Automatic response to OPENER
LighthouseDlgBoltHead_Open = {
	dialog = DialogueSpecs.NI_BOP_GOT_BOLTHEAD_OPENER,
	--text = "Hey, you found one! Nice going, kid! Local Beacon Union 3-19 thanks you for your charitable contribution!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_HEAD_UP,
		2.5,	AnimRoles.ANIM_ROLE_REACH_LEFT,
  }
}

--Plays during designer cut scene, when we FADE OUT.
LighthouseDlgBoltHead_Repairing = {
	dialog = DialogueSpecs.NI_BOP_GOT_BOLTHEAD_REPAIRING,
	--text = "Here we go, just put this on here and -- Voial! A poyfect fit!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Plays when we fade back in.
LighthouseDlgBoltHead_Repaired = {
	dialog = DialogueSpecs.NI_BOP_GOT_BOLTHEAD_REPAIRED,
	--text = "See if you can give it a good turn, champ. Id do it myself, but Im on break. Union rules, you understand.",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
		3.0,	AnimRoles.ANIM_ROLE_LH_HEAD_NOD,
  }
}

--As Ratchet turns bolt crank -- timed out to restore power at the word "booyah!" :)
LighthouseDlgBoltHead_Cranking = {
	dialog = DialogueSpecs.NI_BOP_GOT_BOLTHEAD_CRANKING,
	--text = "Easy... Easy now... booyah! Nice woyk, champ. Now, alls ya gotta do is scoot to the top of the beacon and crank the antenna into position. Ill supervise from down here!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Plays at some point during traversal to top. Designer's discretion.
LighthouseDlgBoltHead_Ascending = {
	dialog = DialogueSpecs.NI_BOP_GOT_BOLTHEAD_ASCENDING,
	--text = "Keep goin, kid! You’re doin great!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--IF Ratchet gets zapped by electricity for the first time.
LighthouseDlgBoltHead_Zapped = {
	dialog = DialogueSpecs.NI_BOP_GOT_BOLTHEAD_ZAPPED,
	--text = "Woops -- watch out for the electricity, kid! Safety foyst!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Ratchet is almost at the top.
LighthouseDlgBoltHead_Ascending2 = {
	dialog = DialogueSpecs.NI_BOP_GOT_BOLTHEAD_ASCENDING2,
	--text = "Almost there!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Ratchet reaches the rop of beacon.
LighthouseDlgBoltHead_Antenna = {
	dialog = DialogueSpecs.NI_BOP_GOT_BOLTHEAD_ANTENNA,
	--text = "Just give that bolt crank a toyn to pull up the antenna!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--Ratchet wins at fixing the lighthouse
LighthouseDlgMeetMayor = {
	dialog = DialogueSpecs.NI_BOP_BEACON_ACTIVE,
	--text = "Ya done real good, kid. Go meet the Mayor, I will finish up here!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}


-----------------------------------------------------------------------
-- Lighthouse NPC Functions -------------------------------------------
-----------------------------------------------------------------------

--Play at initial meeting
function f_LighthouseResponse_Open()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	actor_speak_and_wait(active_npc, LighthouseDlgOpen);
	wait(0.2)
	return true
end

--Play when Ratchet axes what the problem is
function f_LighthouseResponse_Problem()
	activate_cam( active_hero, scene_lighthouse_cam_scrollup, true )
	actor_speak_and_wait(active_npc, LighthouseDlgProblem);
	wait(0.2)
	return true
end

--Play when Ratchet axes if he can halp
function f_LighthouseResponse_Help()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	actor_speak_and_wait(active_npc, LighthouseDlgHelp);
	wait(0.2)
	return true
end

--Play when Ratchet hasn't activated the towers yet and has asked about helping/probleming
function f_LighthouseResponse_NoWindAlt()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	local MyRandomLine = math.random(0, 4)
	if MyRandomLine == 0 then
		actor_speak_and_wait(active_npc, LighthouseDlgAlt1);
		wait(0.2)
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(active_npc, LighthouseDlgAlt2);
		wait(0.2)
	elseif MyRandomLine == 2 then
		actor_speak_and_wait(active_npc, LighthouseDlgAlt3);
		wait(0.2)
	elseif MyRandomLine == 3 then
		actor_speak_and_wait(active_npc, LighthouseDlgAlt4);
		wait(0.2)			
	elseif MyRandomLine == 4 then
		actor_speak_and_wait(active_npc, LighthouseDlgAlt5);
		wait(0.2)
	end
end

--Play when Ratchet has activated the towers
function f_LighthouseResponse_ActiveOpen()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )

	SAVE.scene_lighthouse_ratchet_state = 1

	actor_speak_and_wait(active_npc, LighthouseDlgActiveOpen);
	wait(0.2)
end

--Play when Ratchet has activated the towers AND has never spoken to the NPC before
function f_LighthouseResponse_ActiveOpenAlt()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )

	SAVE.scene_lighthouse_ratchet_state = 1

	actor_speak_and_wait(active_npc, LighthouseDlgActiveOpenAlt);
	wait(0.2)
end

--Play when Ratchet asks if the beacon is working
function f_LighthouseResponse_ActiveBeacon()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	actor_speak_and_wait(active_npc, LighthouseDlgActiveBeacon);
	wait(0.2)
	f_LighthouseResponse_ActiveFindBolt()
	
	return true
end

--Play when Ratchet asks about a summer home
function f_LighthouseResponse_ActiveHome()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	actor_speak_and_wait(active_npc, LighthouseDlgActiveHome);
	wait(0.2)
	
	--made another var so this only happens once
	if not SAVE.scene_lighthouse_findbolt_first then
		f_LighthouseResponse_ActiveFindBolt()
	end
	
	return true
end

--Play when Ratchet asks about the zoni
function f_LighthouseResponse_ActiveZoni()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	actor_speak_and_wait(active_npc, LighthouseDlgActiveZoni);
	wait(0.2)
	
	if not SAVE.scene_lighthouse_findbolt_first then
		f_LighthouseResponse_ActiveFindBolt()
	end
	
	return true
end

--Play no matter what he says
function f_LighthouseResponse_ActiveFindBolt()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	actor_speak_and_wait(active_npc, LighthouseDlgActiveFindBolt);
	
	--if you've already talked to smuggles, fast forward a bit
	if SAVE.scene_smuggler_initial_contact then
		SAVE.scene_smuggler_state = 2
	end
	
	--no matter what he has the bolt now
	SAVE.scene_smuggler_get_bolt = true
	SAVE.scene_lighthouse_findbolt_first = true
	
	return true	
end

--Play if he comes back without the bolt
function f_LighthouseResponse_NoBoltAlt()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	local MyRandomLine = math.random(0, 5)
	if MyRandomLine == 0 then
		actor_speak_and_wait(active_npc, LighthouseDlgNoBoltAlt1);
		wait(0.2)
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(active_npc, LighthouseDlgNoBoltAlt2);
		wait(0.2)
	elseif MyRandomLine == 2 then
		actor_speak_and_wait(active_npc, LighthouseDlgNoBoltAlt3);
		wait(0.2)
	elseif MyRandomLine == 3 then
		actor_speak_and_wait(active_npc, LighthouseDlgNoBoltAlt4);
		wait(0.2)			
	elseif MyRandomLine == 4 then
		actor_speak_and_wait(active_npc, LighthouseDlgNoBoltAlt5);
		wait(0.2)
	elseif MyRandomLine == 5 then
		actor_speak_and_wait(active_npc, LighthouseDlgNoBoltAlt5);
		wait(0.2)
	end
end

--When Ratchet returns with the bolt
function f_LighthouseResponse_BoltheadOpen()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	actor_speak_and_wait(active_npc, LighthouseDlgBoltHead_Open);
	wait(0.2)
		
	--Play Bolthead scene here
	fade_to_black(0.5)
	wait(2.0)
		
	--Adding sound effect for bolt being installed
	play_explicit_sound_spec(SoundSpecs.AMB_NPC_Lighthouse_Bolt_Install)
	actor_speak_and_wait(active_npc, LighthouseDlgBoltHead_Repairing)
	wait(3.0)
		
	--Take the bolt out of his inventory and put it on the crank
	hero_set_num_objects(get_hero(), OBJ_BEACON_PART, 0)
	unobviate(beacon_btm_bolt)
	activate(beacon_btm_bolt)
	SAVE.lighthouse_bottom_bolt_replaced = true
			
	--Move the lighthouse dude and ratchet next to the bolt crank
	revert_actor(active_npc)
	npc_warp(active_npc, scene_lighthouse_bolt_warp_vol)
	hero_warp( active_hero, scene_lighthouse_bolt_ratchet_warp_vol, true )
	make_actor(active_npc)
			
	--End of blackout scene, now reveal the bolt
	activate_cam(get_hero(), lighthouse_bolt_reveal_cam, true)
	fade_from_black(0.5)
	wait_for_cam(get_hero())
		
	--scene_lighthouse_bolt_cam
	activate_cam( active_hero,scene_lighthouse_bolt_cam, true )
	actor_speak_and_wait(active_npc, LighthouseDlgBoltHead_Repaired);
	wait(0.2)
		
	--Let the prebattle script know where the lighthouse operator is
	SAVE.scene_lighthouse_operator_at_bolt = true
	request_auto_save()
end

--Just a little touch if the player comes back after everything's done
function f_LighthouseResponse_Final()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	local MyRandomLine = math.random(0, 2)
	if MyRandomLine == 0 then
		actor_speak_and_wait(active_npc, LighthouseDlgNoBoltAlt3);
		wait(0.2)
	elseif MyRandomLine == 1 then
		actor_speak_and_wait(active_npc, LighthouseDlgNoBoltAlt4);
		wait(0.2)
	elseif MyRandomLine == 2 then
		actor_speak_and_wait(active_npc, LighthouseDlgNoBoltAlt5);
		wait(0.2)
	end
end

function f_LighthouseResponse_MeetMayor()
	activate_cam( active_hero, scene_lighthouse_cam_closeup, true )
	actor_speak_and_wait(active_npc, LighthouseDlgMeetMayor);
	wait(0.2)
end

function f_LighthouseResponse_Exit()

end

-----------------------------------------------------------------------
-- RATCHET DIALOGUE DATA ----------------------------------------------
-----------------------------------------------------------------------

--Available after OPENER
RatchetDlgProblem = {
	dialog = DialogueSpecs.NI_BOP_INITIAL_ENQUIREMENU_PROBLEM,
	--text = "What's the problem?",
	func = f_LighthouseResponse_Problem
	}

--Available after OPENER
RatchetDlgHelp = { 
	dialog = DialogueSpecs.NI_BOP_INITIAL_ENQUIREMENU_HELP,
	--text = "Anything I can do to help?",
	func = f_LighthouseResponse_Help
}

--Available after OPENER(after Ratchet returns AND the windmills are fixed)
RatchetDlgBeacon= {
	dialog = DialogueSpecs.NI_BOP_WIND_ACTIVE_WORKMENU_BEACON,
	--text = "I need to contact a friend of mine. Is the beacon working?",
	func = f_LighthouseResponse_ActiveBeacon
}

--Available after OPENER(after Ratchet returns AND the windmills are fixed)
RatchetDlgHome= {
	dialog = DialogueSpecs.NI_BOP_WIND_ACTIVE_WORKMENU_HOME,
	--text = "Im thinking about purchasing a summer home here.",
	func = f_LighthouseResponse_ActiveHome
}
	
--Available after OPENER(after Ratchet returns AND the windmills are fixed)
RatchetDlgZoni = {
	dialog = DialogueSpecs.NI_BOP_WIND_ACTIVE_WORKMENU_ZONI,
	--text = "Do you know anything about the Zoni?",
	func = f_LighthouseResponse_ActiveZoni
}

RatchetDlgExit = {
	dialog = DialogueSpecs.GLOBAL_RATCHET_NPC_EXIT,
	func = f_LighthouseResponse_Exit,
	exit = true,
}
	
RatchetDialogTableEnquireMenu = {
	RatchetDlgProblem,
	RatchetDlgHelp,
	RatchetDlgExit
}

RatchetDialogTableWorkMenu = {
	RatchetDlgBeacon,
	RatchetDlgHome,
	RatchetDlgZoni,
	RatchetDlgExit
}

-----------------------------------------------------------------------
-- Ratchet Functions --------------------------------------------------
-----------------------------------------------------------------------
function f_RatchetMenu_Enquire()
	activate_cam( active_hero, scene_lighthouse_cam_medium, true )
	return scene_show_menu_and_wait(RatchetDialogTableEnquireMenu)
end

function f_RatchetMenu_Work()
	activate_cam( active_hero, scene_lighthouse_cam_medium, true )
	return scene_show_menu_and_wait(RatchetDialogTableWorkMenu)
end

-----------------------------------------------------------------------
-- ABORT --------------------------------------------------------------
-----------------------------------------------------------------------
--function abort()
--end

-----------------------------------------------------------------------
-- MAIN LOOP ----------------------------------------------------------
-----------------------------------------------------------------------

--keep track of the windmills & if ratchet got teh bolt
local all_windmills_done = SAVE.windmill1_complete and
                          SAVE.windmill2_complete and
                          SAVE.windmill3_complete and
                          SAVE.windmill4_complete and
                          SAVE.windmill5_complete;

local has_bolt = hero_has_object(get_hero(), OBJ_BEACON_PART)
SAVE.scene_lighthouse_operator_at_bolt = false
prt(tostring(has_bolt))

--Hero, NPC stuff
active_hero = get_hero()
active_npc = npc_lighthouse
npc_warp(active_npc, scene_lighthouse_warp_vol)
make_actor(active_npc)

-- while screen is black, warp the hero and camera
hero_warp( active_hero, scene_lighthouse_hero_pos, true )

-- intro sequence
if SAVE.scene_lighthouse_state == nil then
	if(all_windmills_done == true) then
		
		--First time talking to him and all the windmills are done
		f_LighthouseResponse_ActiveOpenAlt()
	else
	
		--First time talking to him and NOT all the windmills are done
		f_LighthouseResponse_Open()
	end
	
	SAVE.scene_lighthouse_state = 1
	
--Ratchet speaks after intro and all windmills aren't fixed
elseif (SAVE.scene_lighthouse_state == 1) and not all_windmills_done then
	f_LighthouseResponse_NoWindAlt()
	
--Ratchet speaks after intro and windmills are fixed		
elseif (SAVE.scene_lighthouse_state == 1) and all_windmills_done then
	f_LighthouseResponse_ActiveOpen()
	
--Ratchet doesn't have bolt
elseif (SAVE.scene_lighthouse_state == 2) and not has_bolt then
	f_LighthouseResponse_NoBoltAlt()
		
--Ratchet does have bolt
elseif (SAVE.scene_lighthouse_state == 2) and has_bolt then
	f_LighthouseResponse_BoltheadOpen()
	SAVE.scene_lighthouse_state = 3
	SAVE.scene_lighthouse_ratchet_state = 2
	
--temp dialog in case the player comes back and talks to the lighthouse dude after everything else
elseif (SAVE.scene_lighthouse_state == 3) then
	f_LighthouseResponse_Final()

--After the beacon is completed
elseif (SAVE.scene_lighthouse_state == 4) then
	f_LighthouseResponse_MeetMayor()
end


--main loop responses
local continue = true;
while continue do
  
	--Response to the initial greeting
	if not SAVE.scene_lighthouse_ratchet_state then
		selection = f_RatchetMenu_Enquire()
		
	--After the beacon is powered Ratchet has some more quessions
	elseif SAVE.scene_lighthouse_ratchet_state == 1 then
		selection = f_RatchetMenu_Work()
	
	elseif SAVE.scene_lighthouse_ratchet_state == 2 then
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

