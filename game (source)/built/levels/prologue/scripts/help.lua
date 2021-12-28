----------------------------------------------------------------------------------------------------
-- help script
----------------------------------------------------------------------------------------------------
--[[
L00_HELP_GPLAY_WRENCHATTACK
GEN_HELP_GPLAY_HEALTH
L00_HELP_GPLAY_BOLTCRANKATTACH
L00_HELP_GPLAY_BOLTCRANKTURN
L00_HELP_GPLAY_FIREWEAPON
L00_HELP_GPLAY_QUICKSELECT
L00_HELP_GPLAY_LONGRANGEWEAPONS
L00_HELP_GPLAY_LADDERS
L00_HELP_GPLAY_LOADEDCATAPULT
L00_HELP_GPLAY_TORNADOLAUNCHER
L00_HELP_GPLAY_PREDATORROCKETS
L01_HELP_GPLAY_CAMERACONTROL
L01_HELP_GPLAY_DOUBLEJUMP
L01_HELP_GPLAY_GRAVITYBOOTS
L01_HELP_GPLAY_SWINGSHOT
L01_HELP_GPLAY_WRENCHATTACH
L01_HELP_GPLAY_WRENCHMANIPULATE
L01_HELP_GPLAY_WRENCHDETACH
L01_HELP_GPLAY_SPRINGPAD
L01_HELP_GPLAY_ZIPLINE
L01_HELP_GPLAY_LEDGETRAVERSE
L01_HELP_GPLAY_LEDGEDETACH
L01_HELP_GPLAY_USEMAP
L01_HELP_GPLAY_USEMAPAGAIN
L01_HELP_GPLAY_PICKUPLAVAROCK
L01_HELP_GPLAY_DROPLAVAROCK
L01_HELP_GPLAY_DESTROYDOORSWITHLAVAROCK
L01_HELP_GPLAY_THROWLAVAROCK
L01_HELP_GPLAY_HOOKSHOT
L01_HELP_GPLAY_SIDEJUMPONGRINDRAIL
L01_HELP_GPLAY_WRENCHMANIPREMINDER
L01_HELP_GPLAY_PICKUPHELIOGRUB
L01_HELP_GPLAY_THROWHELIOGRUB
L01_HELP_GPLAY_WEAPONSNEEDED
L01_HELP_GPLAY_COVERNEEDED
L01_HELP_GPLAY_MOVESLOWLY
L01_HELP_GPLAY_FIREWEAPONS
L01_HELP_GPLAY_QUICKSELECTREMINDER
L01_HELP_GPLAY_BOMBDOORS
L02_HELP_GPLAY_MIXBREW
L02_HELP_GPLAY_PLAYORGAN
L02_HELP_GPLAY_MOVESHADOWOBJECTS
L00_HELP_GPLAY_THROWSKULLATGHOSTFORCEFIELD
L00_HELP_GPLAY_THROWSKULLATDARKWATER
L00_HELP_GPLAY_ELECTRICATTACKSCANCELED
--]]

if SAVE.hero_death == nil then
  SAVE.hero_death = 0
else
  SAVE.hero_death = SAVE.hero_death + 1
end

prt( "SAVE.hero_death = " .. SAVE.hero_death )

-- switching to pause messages after 5+ deaths
if SAVE.hero_death >= 5 then
  --SAVE.paused_messages = true
  prt("SAVE.paused_messages = true")
end

request_auto_save()

if SAVE.ladder_help_stage == nil then
SAVE.ladder_help_stage = 0
end

local last_hero_health = hero_get_health( get_hero() )

--------------------------------------------------------------------------------
-- MAIN LOOP
--------------------------------------------------------------------------------

while true do

-------------------------------------------------------------------------------------------------------------------------------------------------------

local cur_hero_health = hero_get_health( get_hero() )

if (cur_hero_health > last_hero_health) then

   helptext(GEN_HELP_GPLAY_HEALTH, "health message", 3, false,1, false)

end

last_hero_health = cur_hero_health

--------------------------------------------------------------------------------

-- how to change controls help message
if SAVE.hero_death >= 3 then
	if change_controls_help == nil then
		if is_in_volume(get_hero(), innervolume_wave1) then
		helptext(GEN_HELP_GPLAY_CHANGECONTROLSHINT , "change controls", 15, false, 20, false)
		change_controls_help = true
		end
	end
end

-- tornado help message

if hero_get_equipped( get_hero() ) == WPN_TORNADO then
helptext(L00_HELP_GPLAY_TORNADOLAUNCHER, "tornado help", 15, false, 3, false)
end



if SAVE.paused_messages == nil then

		if help_wrench_use == nil then
			if is_in_volume(get_hero(), innervolume_first2pirates) then
			wait(6)
			helptext(L00_HELP_GPLAY_WRENCHATTACK, "press X to use wrench", 20, false,20, false)
			help_wrench_use  = true
			end
		end


		--BOLTCRANK MESSAGE
		if boltcrank_used == nil then
		if get_num_alive(pirate_pod_all_before_boltcrank) < 1 then
			if is_in_volume(get_hero(), trig_boltcrank_message) then
				if not crank_is_in_use(boltcrank1) then
					if not crank_is_complete(boltcrank1) then
					helptext(L00_HELP_GPLAY_BOLTCRANKATTACH, "press square to use boltcrank", 3, false,20, false)
					end
				end
			end
		end
		end


		--killing messages when player starts turning boltcrank
		if is_cranking(get_hero(), boltcrank1) then
		wait(3)
		--force_close_help()
		prt("killing boltcrank messages")
		end
		
		--displaying help for turning boltcrank, if the player attaches but doesn't turn the boltcrank.
		if crank_is_in_use(boltcrank1) and crank_get_progress(boltcrank1) == 0 then
		force_close_help()	
		wait(2)
		helptext(L00_HELP_GPLAY_BOLTCRANKTURN, "turn boltcrank", 5, false, 20, false)
		prt("displaying instructions on turning boltcrank")
		boltcrank_used = true
		end
	
		
		--killing messages when player attaches to boltcrank
		if boltcrank_kill_message == nil then
		if crank_is_in_use(boltcrank1) then
		force_close_help()
		boltcrank_kill_message = true
		end
		end
		
		if boltcrank_kill_message == true then
		if not crank_is_in_use(boltcrank1) then
		boltcrank_kill_message = nil
		end
		end

		--------------------------------------------------------------------------------
		
	

		--weapon selection message
		if weapon_selection_help == nil then
			if crank_is_complete(boltcrank1) then
				if is_in_volume(get_hero(), trig_weapon_select_message) then
					helptext(L00_HELP_GPLAY_QUICKSELECT, "press triangle to select weapons", 5, false,20, false)
					wait(6)
					--weapon fire message
					helptext(L00_HELP_GPLAY_FIREWEAPON, "press circle to fire your weapon", 20, false,20, false)
					weapon_selection_help = true
				end
			end
		end

    -- checking to see if hero has fired weapon
		
		if weapon_selection_help == true then
		wait(5)
		if not check_flag(HERO_FIRED_WEAPON) then
		helptext(L00_HELP_GPLAY_FIREWEAPON, "press circle to fire your weapon", 20, false,20, false)
		end
		end
		
		--Quick select message
		if not check_flag( HERO_USED_QUICK_SELECT ) then
			if fire_wep_second_message == nil then
				if is_in_volume(get_hero(), innervol_ship2_shooter_g1) then
				helptext(L00_HELP_GPLAY_QUICKSELECT, "press triangle to select weapons", 5, false,20, false)
				helptext(L00_HELP_GPLAY_FIREWEAPON, "press circle to fire your weapon", 5, false,20, false)
				fire_wep_second_message = true
				end
			end
		end


		--------------------------------------------------------------------------------
		--LADDER HELP TEXt

		--if talwyn_waiting_to_fly_to_ship2 == true then
			if is_in_volume(get_hero(), trig_laddercam) then
			helptext(L00_HELP_GPLAY_LADDERS, "use ladders", 15, false,20, false)
			end
		--end
		
		--help for ladder 2
			if ladder2_help_counter == nil then
			  if is_in_volume(get_hero(), trig_ladder_2_help) then
			  SAVE.ladder_help_stage = (SAVE.ladder_help_stage + 1)
			  ladder2_help_counter = true
			  end
		  end
		  
		  if ladder2_help_counter == true then
			  if not is_in_volume(get_hero(), trig_ladder_2_help) then
			  ladder2_help_counter = nil
			  end
		  end

      if is_in_volume(get_hero(), trig_ladder_2_help) and SAVE.ladder_help_stage >= 3 then
		  helptext(L00_HELP_GPLAY_LADDERS, "use ladders", 15, false,5, false)
		  end

		--------------------------------------------------------------------------------
		-- message tells player how to use catapult
		if not is_alive(hunchback_pirate) then
		if is_in_volume(get_hero(), trig_catapult_help_message) then
		helptext(L00_HELP_GPLAY_LOADEDCATAPULT, "load cataput", 5)
		end
		end

		--------------------------------------------------------------------------------
		--if (hero_get_equipped() == WPN_RAVAGER) then
		if check_flag( HERO_HIT_ELECTRIC_IMMUNE ) then
		  -- AY - changed this to NOT pause the game, but to re-show the message after 20 seconds, up to 3 times
		  helptext( L00_HELP_GPLAY_ELECTRICATTACKSCANCELED, "testing message.", 20, false, 3, false, false, false, false, true)
		  clear_flag( HERO_HIT_ELECTRIC_IMMUNE )
		end

		--------------------------------------------------------------------------------

		-- Strafe message
		--[[
		if not is_alive(enemy_ship2_meleepirate1) then
		if is_in_volume(get_hero(), volume29) then
		helptext(GEN_HELP_GPLAY_HOWTOSTRAFE, "strafe message", 15, false,20, false)
		end
		end
		--]]


		-- help message for turret
		if turret_door_help_played == nil then
			if get_num_alive(enemypod_turretfodder_barge_pirates) < 1 then
			wait(20)
				if is_update_on( boltcrank_door4 ) then
				helptext(GEN_HELP_GPLAY_TURRETOPENDOOR, "turrets can be used to blow open some doors", 15, false,20, false)
				end
			end
		end

		-- help message for wrench throw
		if is_in_volume(get_hero(), trig_wrench_throw_message) then
			if is_alive(enemy_ship2_roofshooters_p1) then
			helptext(GEN_HELP_GPLAY_WRENCHTHROW, "throw wrench", 15, false,20, false)
			end
		end
		
		-- right stick control help
		if not check_flag( HERO_CAMERA_ADJUST ) then
			if is_in_volume(get_hero(), trig_wakeup_ship2_rearshooter) then
			helptext(GEN_HELP_GPLAY_HOWTOLOOKAROUND, "Right stick", 15, false,20, false)
			end
		end
		
		-- change controls
		

end






--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








-- Switching to paused messages if player dies too many times
if SAVE.paused_messages == true then

prt("switching to paused messages")

		if help_wrench_use == nil then
			if is_in_volume(get_hero(), innervolume_first2pirates) then
			helptext(L00_HELP_GPLAY_WRENCHATTACK, "press X to use wrench", 20, false,20, false)
			--helptext("Press 'CIRCLE' to fire weapon", true, false, false, false, true)
			help_wrench_use  = true
			end
		end


  --BOLTCRANK MESSAGE
		if boltcrank_used == nil then
		if get_num_alive(pirate_pod_all_before_boltcrank) < 1 then
			if is_in_volume(get_hero(), trig_boltcrank_message) then
				if not crank_is_in_use(boltcrank1) then
					if not crank_is_complete(boltcrank1) then
					helptext(L00_HELP_GPLAY_BOLTCRANKATTACH, "press square to use boltcrank", 3, false,20, false)
					end
				end
			end
		end
		end


		--killing messages when player starts turning boltcrank
		if is_cranking(get_hero(), boltcrank1) then
		force_close_help()
		prt("killing boltcrank messages")
		end
		
		--displaying help for turning boltcrank, if the player attaches but doesn't turn the boltcrank.
		if crank_is_in_use(boltcrank1) then
			if not is_cranking(get_hero(), boltcrank1) then
			wait(2)
			helptext(L00_HELP_GPLAY_BOLTCRANKTURN, "turn boltcrank", 5, false, 20, false)
			prt("displaying instructions on turning boltcrank")
			boltcrank_used = true
			end
		end
		
		--killing messages when player attaches to boltcrank
		if boltcrank_kill_message == nil then
		if crank_is_in_use(boltcrank1) then
		force_close_help()
		boltcrank_kill_message = true
		end
		end
		
		if boltcrank_kill_message == true then
		if not crank_is_in_use(boltcrank1) then
		boltcrank_kill_message = nil
		end
		end


		--------------------------------------------------------------------------------


		--weapon selection message
		if weapon_selection_help == nil then
			if crank_is_complete(boltcrank1) then
				if is_in_volume(get_hero(), trig_weapon_select_message) then
					helptext(L00_HELP_GPLAY_QUICKSELECT, "press triangle to select weapons", 5, false,20, true)
					wait(6)
					--weapon fire message
					helptext(L00_HELP_GPLAY_FIREWEAPON, "press circle to fire your weapon", 20, false,20, true)
					weapon_selection_help = true
				end
			end
		end


    -- checking to see if hero has fired weapon
		if weapon_selection_help == true then
		wait(5)
			if not check_flag(HERO_FIRED_WEAPON) then
			helptext(L00_HELP_GPLAY_FIREWEAPON, "press circle to fire your weapon", 20, false,20, true)
			end
		end
		

		--Quick Select Message
		if not check_flag( HERO_USED_QUICK_SELECT ) then
			if fire_wep_second_message == nil then
				if is_in_volume(get_hero(), innervol_ship2_shooter_g1) then
				helptext(L00_HELP_GPLAY_QUICKSELECT, "press triangle to select weapons", 2, false,20, true)
				fire_wep_second_message = true
				end
			end
		end

		
		--------------------------------------------------------------------------------
		--LADDER HELP TEXt

		if talwyn_waiting_to_fly_to_ship2 == true then
			if is_in_volume(get_hero(), trig_laddercam) then
			helptext(L00_HELP_GPLAY_LADDERS, "use ladders", 15, false,20, false)
			end
		end

		--------------------------------------------------------------------------------
		-- message tells player how to use catapult
		if is_in_volume(get_hero(), trig_catapult_help_message) then
		helptext(L00_HELP_GPLAY_LOADEDCATAPULT, "load cataput", 5)
		end

		--------------------------------------------------------------------------------
		--if (hero_get_equipped() == WPN_RAVAGER) then
		if check_flag( HERO_HIT_ELECTRIC_IMMUNE ) then
		  -- AY - changed this to NOT pause the game, but to re-show the message after 20 seconds, up to 3 times
		  helptext( L00_HELP_GPLAY_ELECTRICATTACKSCANCELED, "testing message.", 20, false, 3, false, false, false, false, true)
		  clear_flag( HERO_HIT_ELECTRIC_IMMUNE )
		end

		--------------------------------------------------------------------------------

		-- Strafe message
		--[[
		if not is_alive(enemy_ship2_meleepirate1) then
		if is_in_volume(get_hero(), volume29) then
		helptext(GEN_HELP_GPLAY_HOWTOSTRAFE, "strafe message", 15, false,20, true)
		end
		end
		--]]


		-- help message for turret
		if turret_door_help_played == nil then
			if get_num_alive(enemypod_turretfodder_barge_pirates) < 1 then
			wait(20)
				if is_update_on( boltcrank_door4 ) then
				helptext(GEN_HELP_GPLAY_TURRETOPENDOOR, "turrets can be used to blow open some doors", 15, false,20, false)
				end
			end
		end

		-- help message for wrench throw
		if is_in_volume(get_hero(), trig_wrench_throw_message) then
			if is_alive(enemy_ship2_roofshooters_p1) then
			helptext(GEN_HELP_GPLAY_WRENCHTHROW, "throw wrench", 15, false,20, false)
			end
		end
		
		-- right stick control help
		if not check_flag( HERO_CAMERA_ADJUST ) then
			if is_in_volume(get_hero(), trig_wakeup_ship2_rearshooter) then
			helptext(GEN_HELP_GPLAY_HOWTOLOOKAROUND, "Right stick", 15, false,20, false)
			end
		end


end






wait()
end