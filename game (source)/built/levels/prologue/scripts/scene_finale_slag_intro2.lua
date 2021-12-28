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

local DarkwaterShipIntro_YeKnow =
{
	text =  "Ye know, there’s a spot of irony in all this madness. Fer once, it’s YOU who’s tryin’ to steal from me. After all, it ain’t YOUR fulcrum star...",
	dialog = DialogueSpecs.FI_SLAG_SECOND_OPEN,
	--stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}

local DarkwaterShipIntro_ItsMine =
{
	text =  "It’s MINE!!!",
	dialog = DialogueSpecs.FI_DARKWATER_APPEARS,
	--stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}



----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------


--activate(petes_dingy)
deactivate(camera_small_sway_controller)
deactivate(camera_big_sway_controller)
deactivate(sway_ctrl)
hero_warp(get_hero(), slag_westship_wrench_catapult_vol)--added by duncan 5/31
activate( undead_fx_controller )
captainslagwater_followpath( boss_darkwater, boss_slag_darkwatership_intro_path, 100, 100, 50, true)
wait(1.0)
activate_cam( get_hero(), slag_darkwater_ship_intro_cam )
wait(0.5)
scene_speak_and_wait(boss_darkwater, DarkwaterShipIntro_YeKnow, true)
captainslagwater_grow(boss_darkwater)
activate_cam( get_hero(), slag_darkwater_ship_intro_cam1 )
scene_speak_and_wait(captainslagwater_get_darkwater(boss_darkwater), DarkwaterShipIntro_ItsMine, true)
set_follow_cam( get_hero(), 10, 0, 0, 3 )
local actual_darkwater = captainslagwater_get_darkwater(boss_darkwater)
captaindarkwater_start_battle(actual_darkwater)
ally_hover_takeoff( talwyn )
ally_setfirepoints( talwyn, tal_darkwater_ship_firepoints )
ally_addtarget( talwyn, boss_darkwater )
ally_addtarget( talwyn, actual_darkwater )
ally_setattitude( talwyn, ALLY_ATT_AGGRESSIVE  ) 
boss_register_cam( get_hero(), boss_darkwater, 2*math.pi )
activate(camera_small_sway_controller)
activate(camera_big_sway_controller)
activate(sway_ctrl)
fade_to_black(0)

-- Get the Lightning working
activate( darkwater_ship_lightning_controller )
activate( slag_west_ship_lightning_controller )
activate( slag_east_ship_lightning_controller )