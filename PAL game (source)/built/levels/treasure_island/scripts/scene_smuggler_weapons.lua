
--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

----------------------------------------------------
--Smuggler Lines------------------------------------
----------------------------------------------------

--arrival at darkwater island
SmugDlgOpen = {
	dialog = DialogueSpecs.TI_SMUG_ISLANDARRIVE,
	--text = "Well, alright. But might we suggest purchasing a few weapons before you go in? Ill give ya a deal -- buy one, get one free.", 
	stance = AnimRoles.ANIM_ROLE_STAND,
	target = get_hero(),
	req = true,
	gesture = {
		0.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,
		6.0,	AnimRoles.ANIM_ROLE_REACH_RIGHT,
	}
}

function f_SmugglerResponse_Open()
	--activate_cam(get_hero(), scene_smuggler_cam_closeup)
	activate_cam(get_hero(), scene_smuggler_cam_new_medium, true)
	actor_speak(smug, SmugDlgOpen)
	wait(5.0)
	activate_cam(get_hero(), scene_smuggler_cam_new_closeup, true)
	wait(5.0)
end

----------------------------------------------------
--Main----------------------------------------------
----------------------------------------------------

--Rats
active_hero = get_hero()
hero_warp(active_hero, ti_scene_smuggler_ratchet_warp_vol, true)

--Smugs
smug = biggamehunterer
npc_warp(smug, ti_scene_smuggler_warp_vol)
make_actor(smug)


f_SmugglerResponse_Open()

----------------------------------------------------
--The End-------------------------------------------
----------------------------------------------------
----------------------------------------------------
-- ... or is it??? ---------------------------------
----------------------------------------------------