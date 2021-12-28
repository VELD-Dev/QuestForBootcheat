-- !-- villager anim roles
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

hellosproket = true --variable for music cue.
-----------------------------------------------------------------------
-- Shingle Pirate responses -------------------------------------------
-----------------------------------------------------------------------

--First line of conv when you enter the shingle volume
ShingleDlgOpen = {
	dialog = DialogueSpecs.VC2_SHINGLE_INTRO,
	--text    = "Youve been far too meddlesome to be left breathin the capns air, me hearty! Any final words before I nail your carcass to the pike?", 
	stance  = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_LOOK_AROUND,    
	}
}

--Automatic response to BATH
ShingleDlgBath = {
	dialog = DialogueSpecs.VC2_SHINGLE_BATH_RESPONSE,
	--text = "A sharp tongue ye got there, matey. Ill be sure to cut it out when were through!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

--Automatic response to BRIBE
ShingleDlgBribe = {
	dialog = DialogueSpecs.VC2_SHINGLE_BRIBE_RESPONSE,
	--text = "A bribe? I wouldnt trade the opportunity to skin yer scurvy carcass fer all the booty in the galaxy! Lets dance!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
		1.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,
  }
}

--Automatic response to BEG
ShingleDlgBeg = {
	dialog = DialogueSpecs.VC2_SHINGLE_SPECIES_RESPONSE,
	--text = "Im afraid yer prayers have fallen on deaf ears, me hearty. Ready yer head for the pike, and yer body fer the locker!",
	stance = AnimRoles.ANIM_ROLE_STAND,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_LOOK_AROUND,
		1.0,    AnimRoles.ANIM_ROLE_FIST_LEFT,
  }
}

-----------------------------------------------------------------------
-- Shingle Functions --------------------------------------------------
-----------------------------------------------------------------------

--Play at initial meeting
function f_ShingleResponse_Open()
	activate_cam( active_hero, vc2_shingle_scene_cam_closeup, true )
	actor_speak_and_wait(active_npc, ShingleDlgOpen);
	--wait(0.2)
	return true
end

--Play when Ratchet axes what the problem is
function f_ShingleResponse_Bath()
	activate_cam( active_hero, vc2_shingle_scene_cam_closeup, true )
	actor_speak_and_wait(active_npc, ShingleDlgBath);
	--wait(0.2)
	--return true
end

--Play when Ratchet axes if he can halp
function f_ShingleResponse_Bribe()
	activate_cam( active_hero, vc2_shingle_scene_cam_closeup, true )
	actor_speak_and_wait(active_npc, ShingleDlgBribe);
	--wait(0.2)
	--return true
end

--Play when Ratchet hasn't activated the towers yet and has asked about helping/probleming
function f_ShingleResponse_Beg()
	activate_cam( active_hero, vc2_shingle_scene_cam_closeup, true )
	actor_speak_and_wait(active_npc, ShingleDlgBeg);
	--wait(0.2)
	--return true
end


-----------------------------------------------------------------------
-- RATCHET DIALOGUE DATA ----------------------------------------------
-----------------------------------------------------------------------

--Available after OPENER
RatchetDlgBath = {
	dialog = DialogueSpecs.VC2_SHINGLE_BATH,
	--text = "Yeah. Youre in dire need of a bath.",
	func = f_ShingleResponse_Bath
}

--Available after OPENER
RatchetDlgBribe = { 
	dialog = DialogueSpecs.VC2_SHINGLE_BRIBE,
	--text = "I suppose a bribe is out of the question?",
	func = f_ShingleResponse_Bribe
}

--Available after OPENER(after Ratchet returns AND the windmills are fixed)
RatchetDlgBeg= {
	dialog = DialogueSpecs.VC2_SHINGLE_SPECIES,
	--text = "Please dont kill me! Im an endangered species!",
	func = f_ShingleResponse_Beg
}
	
RatchetDialogTable = {
	RatchetDlgBath,
	RatchetDlgBribe,
	RatchetDlgBeg,
}

-----------------------------------------------------------------------
-- Ratchet Functions --------------------------------------------------
-----------------------------------------------------------------------
function f_RatchetMenu_Open()
	activate_cam( active_hero, vc2_shingle_scene_cam, true )
	return scene_show_menu_and_wait(RatchetDialogTable)
end

-----------------------------------------------------------------------
-- ABORT --------------------------------------------------------------
-----------------------------------------------------------------------
--function abort()
--end

-----------------------------------------------------------------------
-- MAIN LOOP ----------------------------------------------------------
-----------------------------------------------------------------------

--Hero, NPC, warp stuff
active_hero = get_hero()
active_npc = vc2_shinglepirate
--teleport(vc2_shinglepirate, vc2_shingle_warp_vol)
make_actor(active_npc)
--actor_move(active_npc, vc2_shingle_warp_vol, AnimRoles.ANIM_ROLE_STAND, 5)

hero_warp( active_hero, vc2_shingle_ratchet_warp_vol, true )

-- intro sequence
f_ShingleResponse_Open();

local continue = true;
while continue do
  
	--Response to intro sequence
	selection = f_RatchetMenu_Open();
	
	-- this calls the 'func' and returns the return value
	if (selection ~= nil and selection.func ~= nil) then
		continue = selection.func()
	else
		continue = false
	end

wait()

end

--hero_warp(active_hero, vc2_shingle_ratchet_warp_after_vol, true)
SAVE.fightsproket = true
-- and we're done

-- fade out/back in, letterbox status, etc, all handled automatically

