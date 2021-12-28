-- Controls everything connected to the revealing of the Obsidian Eye.

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

-----------------------------------------------------------------------
-- MAYOR  RESPONSES ---------------------------------------------------
-----------------------------------------------------------------------
MayorDlgLine = {	
	dialog = DialogueSpecs.NI_OBSIDIAN_MAYOR_FULCRUM_ADVICE,
	--text = "That star oughta be locked away with the rest of Darkwaters treasure. Find the star, and youll find your friend!",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture = {
		0.0,	AnimRoles.ANIM_ROLE_PUT_OBJECT,
		1.6,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
		3.2,    AnimRoles.ANIM_ROLE_RH_EMPHASIS,
	}
}

function f_MayorResponse_Line()
	prt("mayor closeup cam activated")
	activate_cam(get_hero(), scene_obsidianeye_mayor_closeup_cam)
	fade_from_black(1.0)
	wait(1.0)
	actor_speak_and_wait(npc_mayor, MayorDlgLine)
	wait(0.2)
end

-----------------------------------------------------------------------
-- TAL  RESPONSES -----------------------------------------------------
-----------------------------------------------------------------------
TalDlgSignal = {	
	dialog = DialogueSpecs.NI_OBSIDIAN_TAL_GET_SIGNAL,
	--text = "Ratchet, I think I'm getting a signal!  Hold on, I'll patch it through to your nav unit.",
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = npc_mayor,
	gesture = {
		1.0,	AnimRoles.ANIM_ROLE_REACH_LEFT,
		2.0,	AnimRoles.ANIM_ROLE_BLINK,
	}
}

function f_TalResponse_Signal()
	activate_cam(get_hero(), scene_obsidianeye_tal_closeup_cam)
	actor_set_gesture(tal, AnimRoles.ANIM_ROLE_LH_HEAD_NOD)
	play_sound(SoundSpecs.AMB_NPC_Tals_Radio) --play sound here
	wait(1.0)
	
	actor_speak_and_wait(tal, TalDlgSignal)
	wait(0.2)
end

-----------------------------------------------------------------------
-- MAIN ---------------------------------------------------------------
-----------------------------------------------------------------------

--set up hero and actors
mayortheme2 = true  -- adding variable to restart the mayor theme after the cinematic cro 5/6

active_hero = get_hero();
hero_warp(active_hero, obsidian_eye_ratchet_warp_vol, true)
npc_warp(npc_mayor, obsidian_eye_mayor_warp_vol)
ally_warp(tal, obsidian_eye_tal_warp_vol )
make_actor( npc_mayor );
make_actor(tal)

--Take up after the movie
f_MayorResponse_Line()

--f_MayorResponse_Line2()

f_TalResponse_Signal()

--show the taxi arriving into the bay
unobviate(taxi_to_vc)
taxi_warp(taxi_to_vc, taxi_entrance_warp_vol_1)
ally_warp(rustypete, taxi_entrance_warp_vol_1)
taxi_start_move(taxi_to_vc)
activate_cam(get_hero(), scene_obsidianeye_petearriving_cam)

make_actor(rustypete)
actor_speak(rustypete, {dialog = DialogueSpecs.NI_PETE_BEACON_ACTIVE, req = true} )
wait(10.0)

revert_actor(tal)

mayortheme2 = false -- adding variable to stop the mayor theme cro 5/6
explorerestart = true  --restarting the light explore theme

--end