-- Controls cine's for Slag's intro on the East ship.

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.4, 1.0)

-- turn the lightning off
deactivate( darkwater_ship_lightning_controller )
deactivate( slag_west_ship_lightning_controller )
deactivate( slag_east_ship_lightning_controller )

----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

local boss_slag = captainslagwater_get_darkwater(boss_darkwater)

local DarkwaterShipIntro_NoMore =
{
	text =  "No more running, Slag. Give me the fulcrum star!",
	dialog = DialogueSpecs.FI_RATCHET_SCENE_OPEN,
	--stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = boss_darkwater,
	gesture =
	{

	}
}

local DarkwaterShipIntro_AhFamiliar =
{
	text =  "Ah. Familiar threats from a tired adversary. Let’s end this quarrel once and fer all, the pirate way!",
	dialog = DialogueSpecs.FI_RATCHET_SCENE_OPEN_RESPONSE,
	--stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}

local DarkwaterShipIntro_ByPlayin =
{
	text =  "By playin’ DIRTY!!",
	dialog = DialogueSpecs.FI_RATCHET_SCENE_OPEN_RESPONSE2,
	--stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}



----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

deactivate(camera_small_sway_controller)
deactivate(camera_big_sway_controller)
deactivate(sway_ctrl)
ally_cleartargets( talwyn )
hero_warp(get_hero(), darkwaters_ship_checkpoint_respawn_vol)
activate_cam(get_hero(), slag_darkwater_ship_intro_cam_longshot)
activate( undead_fx_controller )
captainslagwater_followpath( boss_darkwater, boss_slag_darkwatership_intro_path, 100, 100, 50, true)
wait(1.0)
scene_speak_and_wait(get_hero(), DarkwaterShipIntro_NoMore, true)
--captainslagwater_followpath( boss_darkwater, boss_slag_darkwatership_intro_bcs_path, 100, 100, 50, true)
activate_cam( get_hero(), slag_darkwater_ship_intro_cam )
wait(0.5)
scene_speak_and_wait(boss_darkwater, DarkwaterShipIntro_AhFamiliar, true)
captainslagwater_grow(boss_darkwater)
activate_cam( get_hero(), slag_darkwater_ship_intro_cam1 )
obviate( petes_dingy)
unobviate( petes_dingy1)
obviate( pirate_hookshot_dingy1 )
ally_warp( rustypete, darkwater_ship_pete_warp_to_vol )
scene_speak_and_wait(captainslagwater_get_darkwater(boss_darkwater), DarkwaterShipIntro_ByPlayin, true)
set_follow_cam( get_hero(), 10, 0, 0, 3 )
captaindarkwater_start_battle(captainslagwater_get_darkwater(boss_darkwater))
boss_register_cam( get_hero(), boss_darkwater, 2*math.pi )
activate(camera_small_sway_controller)
activate(camera_big_sway_controller)
activate(sway_ctrl)


-- Get the Lightning working
activate( darkwater_ship_lightning_controller )
activate( slag_west_ship_lightning_controller )
activate( slag_east_ship_lightning_controller )

--[[
activate( undead_fx_controller )
captainslagwater_followpath( boss_darkwater, boss_slag_darkwatership_intro_path, 100, 100, 50, true)
wait(1.0)
activate_cam( get_hero(), slag_darkwater_ship_intro_cam )
wait(0.5)
scene_speak_and_wait(boss_darkwater, DarkwaterShipIntro_YeKnow)
captainslagwater_grow(boss_darkwater)
activate_cam( get_hero(), slag_darkwater_ship_intro_cam1 )
scene_speak_and_wait(captainslagwater_get_darkwater(boss_darkwater), DarkwaterShipIntro_ItsMine)
set_follow_cam( get_hero(), 10, 0, 0, 3 )
captaindarkwater_start_battle(captainslagwater_get_darkwater(boss_darkwater))
]]--
