-- Controls cine's for Slag's intro on the East ship.

-- Controls cine's for Slag's intro on the West ship.

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

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
WestShipIntro_StillGotSomeFight =
{
	text =  "Got some fight in ye, eh?",
	dialog = DialogueSpecs.FI_DARKWATER_SKULL_HIT_RESPONSE,
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


--activate(petes_dingy)
deactivate(camera_small_sway_controller)
deactivate(camera_big_sway_controller)
deactivate(sway_ctrl)
activate_cam( get_hero(), slag_east_ship_intro_cam )

--debug_message("TEMP: Slag: Back for more eh, Lombax?.", 5)
captainslagwater_followpath( boss_darkwater, boss_slag_eastship_intro_path, 100, 100, 50, true)
wait(2.0)
scene_speak_and_wait(boss_darkwater, WestShipIntro_StillGotSomeFight, true)
wait(1.0)  -- Need this pause so that somthing futher down doesn't test before Darkwater is inside a volume.
bcs_intro() --- Stupid function name for calling Slag
prt("Fight Slag for second time")
activate(camera_small_sway_controller)
activate(camera_big_sway_controller)
activate(sway_ctrl)


-- Get the Lightning working
activate( darkwater_ship_lightning_controller )
activate( slag_west_ship_lightning_controller )
activate( slag_east_ship_lightning_controller )