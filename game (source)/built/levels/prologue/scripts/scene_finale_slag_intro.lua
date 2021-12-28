-- Controls cine's for Slag's intro on the West ship.

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.4, 1.5)
-- turn the lightning off
deactivate( darkwater_ship_lightning_controller )
deactivate( slag_west_ship_lightning_controller )
deactivate( slag_east_ship_lightning_controller )

----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

-- get the slagwater state manager
local bcs_sm = BossCaptainSlagwaterStateManager:GetInstance();


--------------------------------------------------------------------------------
WestShipIntro_WelcomeAboard =
{
	text =  "Welcome aboard, me hearty. Ye come in a fair breeze. I was just about to gut yer dear Sally like a Markazian trout!",
	dialog = DialogueSpecs.FI_SLAG_OPEN,
	--stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}

WestShipIntro_YourLastChance =
{
	text =  "This is your last chance, Slag. Just hand over Talwyn and the star.",
	dialog = DialogueSpecs.FI_SLAG_LAST_CHANCE,
	--stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = boss_darkwater,
	gesture =
	{

	}
}

WestShipIntro_TisAFool =
{
	text =  "‘Tis a fool who thinks he can reason with a man who’s head he once took. He might be wantin’ to return the favor! Ready the locker, Davy! Slag’s got one more for ye!",
	dialog = DialogueSpecs.FI_SLAG_LAST_CHANCE_RESPONSE,
	--stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}

----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------
deactivate(camera_small_sway_controller)
deactivate(camera_big_sway_controller)
deactivate(sway_ctrl)
hero_warp( get_hero(), slag_westship_intro_ratchet_warp_vol )
wait(0.1)
activate_cam( get_hero(), slag_westship_intro_cam )
wait(3.0)
captainslagwater_followpath( boss_darkwater, boss_slag_westship_intro_path, 10, 10, 30, true);
prt( "Slag intro first cam" )
activate_cam( get_hero(), slag_westship_ready_cam )
scene_speak_and_wait(boss_darkwater, WestShipIntro_WelcomeAboard, true)
scene_speak_and_wait(get_hero(), WestShipIntro_YourLastChance, true)
scene_speak_and_wait(boss_darkwater, WestShipIntro_TisAFool, true )
bcs_intro()
SAVE.slag_intro_west = true
request_auto_save()
prt( "setting SAVE.slag_intro_west to true" )
wait(1.0)
activate(camera_small_sway_controller)
activate(camera_big_sway_controller)
activate(sway_ctrl)
fade_to_black(0)

-- Get the Lightning working
activate( darkwater_ship_lightning_controller )
activate( slag_west_ship_lightning_controller )
activate( slag_east_ship_lightning_controller )