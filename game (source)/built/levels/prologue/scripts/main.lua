--- Controls Prologue and Finale scripts.


----------------------------------------------------------------------------------------------------
-- Initialization
----------------------------------------------------------------------------------------------------	

--Deactivate the taxi barge upon the Gameplay script is running. 
deactivate( smugglers_barge )


	-- Chooses to run the Prologue for the Finale scripts
	if not SAVE.completed_treasure_island then 
	
    -- opening cinematic! AY - doing this here so it happens on first frame!
    if not SAVE.first_cinematic_played == true then
      deactivate( sway_ctrl ) 
      deactivate( lightning_flash_control1 )
      deactivate( lightning_flash_control2 )
      suspend_weather(43)
      queue_cinematic("l00_s02_caught_rt")
      wait(0)
      SAVE.first_cinematic_played = true
      request_auto_save()
    end

skinny_pirate_set_scream_area( VOX_DEATH ) --call for pirates to scream if they are knocked overboard.
    
		run_script("prologue_combat")
		run_script("help")
		run_script("cameras")
		run_script("turret_pirate_wakeup")
		run_script("music")
		
		-- weapon equip
		if SAVE.weapons_acquired == nil then
		hero_give_weapon(get_hero(), WPN_COMBUSTER, 0)
		hero_give_weapon(get_hero(), WPN_GRENADE, 0)
		hero_give_weapon(get_hero(), WPN_TORNADO, 0)
		hero_give_weapon(get_hero(), WPN_RAVAGER, 0)
		hero_give_weapon( get_hero(), WPN_PREDATOR, 0 )
		hero_give_weapon( get_hero(), WPN_ROBO_HIVE, 0 )
		SAVE.weapons_acquired = true
		end
		
	else
		run_script("finale_gameplay" )   
		run_script("music")
	end
	
run_script("missions")
	
	
----------------------------------------------------------------------------------------------------
-- main script
----------------------------------------------------------------------------------------------------

while true do

----------------------------------------------------------------------------------------------------
-- TEMP DEBUG - Must remove everything in this section --- NOT DEBUG.
----------------------------------------------------------------------------------------------------

------------------------------------------------------------------
-- Look above for warping Ratchet on first frame to the Smugglers ship
------------------------------------------------------------------



-- Skip straight into the Finale and Boss battle
	if is_in_volume( get_hero(), DEBUG_TEMP_warp_to_boss_vol ) and not debug_start_finale_on then
			prt("in here")
			hero_give_weapon(get_hero(), WPN_COMBUSTER, 0)
			hero_give_weapon(get_hero(), WPN_GRENADE, 0)
			hero_give_weapon(get_hero(), WPN_TORNADO, 0)
			hero_give_weapon(get_hero(), WPN_RAVAGER, 0)
			hero_give_weapon(get_hero(), WPN_PREDATOR, 0)
			hero_give_weapon(get_hero(), WPN_ROBO_HIVE, 0)
			SAVE.completed_training = true
			SAVE.completed_viper_cavern = true
			SAVE.completed_treasure_island = true
			hero_warp( get_hero(), DEBUG_TEMP_ratchet_warp_finale_vol, true )
			run_script("finale_gameplay")
			run_script("finale_boss")
			debug_start_finale_on = true
			prt("DEBUG into Finale")
	end
	
----------------------------------------------------------------------------------------------------
-- END OF DEBUG
----------------------------------------------------------------------------------------------------		


  if is_in_volume( get_hero(), pro_exit_vol ) then
    fade_to_black(2)
    wait(1)
    queue_cinematic( "l00_s03_sprok_rt", __pod_handle_invalid, __pod_handle_invalid, __volume_handle_invalid, CINE_FADE_BLACK, CINE_FADE_BLACK, CINE_FADE_BLACK, CINE_FADE_NONE );
    --fade_to_black(2)
    --wait(1)
    wait(0)
    set_level( LEVEL_NPC_ISLAND );  
  end


  wait()
  
end


