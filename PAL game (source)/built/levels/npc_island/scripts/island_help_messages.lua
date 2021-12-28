-- All Help messages used on NPC Island

----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------
local help_grav_pause = false
local strafe_done = false
local help_springpad_state = 0
local moved_cam_once = false
----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------


while true do

--------------------------
-- Training Area
--------------------------
	if not SAVE.completed_training then
	
			-- Grav Ramp
		if is_in_volume( get_hero(), help_double_jump_vol ) and not SAVE.Help_double_jump then
			helptext( L01_HELP_GPLAY_DOUBLEJUMP, "Press [X] then press [X] again to jump higher.", 5, true, 1 )
			SAVE.Help_double_jump = true
			prt("first 2x jump message")
		elseif is_in_volume( get_hero(), help_double_jump_vol ) and SAVE.Help_double_jump then
			helptext( L01_HELP_GPLAY_DOUBLEJUMP, "Press [X] then press [X] again to jump higher.", 10 )
			prt("seconf 2x jump message")
		end
	
	
		-- Grav Ramp
		-- If you step on a grav ramp you don't get any more help
		if is_on_grav_surface(get_hero()) then
			SAVE.help_gravboots = true
		end
		
		-- So, if you haven't yet you do
		if not SAVE.help_gravboots then
		
			-- Wait 15 seconds after you're in the volume to play, and set pause to true
			if is_in_volume( get_hero(), training_tal_vo_grav ) and not help_grav_pause then
				helptext( L01_HELP_GPLAY_GRAVITYBOOTS, "Your Gravity Boots allow you to walk on special metallic surfaces.", 15, true, 1 )
				help_grav_pause = true
		
			-- If pause is true play it like this for the rest of eternity(or until you actually use a grav ramp)					
			elseif is_in_volume( get_hero(), training_tal_vo_grav ) and help_grav_pause then
				helptext( L01_HELP_GPLAY_GRAVITYBOOTS, "Your Gravity Boots allow you to walk on special metallic surfaces.", 10 )
			end
		end
	
	
	-- Swingshot
		if is_in_volume( get_hero(), training_tal_vo_swingshot_vol ) and not SAVE.Help_swingshot then
			helptext( L01_HELP_GPLAY_SWINGSHOT, "Jump toward the target then press and hold [circle] to swing across the gap.", 4 , true, 1 )
			 SAVE.Help_swingshot = true
		elseif is_in_volume( get_hero(), training_tal_vo_swingshot_vol ) and SAVE.Help_swingshot then
			helptext( L01_HELP_GPLAY_SWINGSHOT, "Jump toward the target then press and hold [circle] to swing across the gap.", 10 )
		end
	
	
	-- Wrench Manipulation
		if is_in_volume( get_hero(), training_tal_vo_wrench ) and not is_grappling(get_hero()) and not SAVE.Help_grapple then
			helptext( L01_HELP_GPLAY_WRENCHATTACH, "Hold [R2] and press [Square] to extend wrench head to bolt", 6, false, 1)
			SAVE.Help_grapple = true
		elseif is_in_volume( get_hero(), training_tal_vo_wrench ) and not is_grappling(get_hero()) and SAVE.Help_grapple then
			helptext( L01_HELP_GPLAY_WRENCHATTACH, "Hold [R2] and press [Square] to extend wrench head to bolt", 8, true, 999)
		end
	
	
	-- During Wrench Manipulation--
		if get_grapple_target( get_hero() ) == training_wrench_plat_bridge  then
			helptext( L01_HELP_GPLAY_WRENCHMANIPULATE, "Use [Right Analog Stick] to pull the bridge out.", 8 )
		end
			
--[[		
	-- Wrench Manipulation - let go
	--	if is_in_volume( get_hero(), training_tal_vo_wrench ) and is_grappling(get_hero()) then
		if ( get_grapple_target( get_hero() ) ==  training_wrench_plat_bridge) and ( get_grapple_progress( training_wrench_plat_bridge ) >=  0.75 ) then
			helptext( L01_HELP_GPLAY_WRENCHDETACH, "Press [Square] to detach the wrench head.", 5 )
		end
--]]			
	
	-- Springpad
	 if (help_springpad_state < 2) and is_in_volume( get_hero(), training_tal_cave_vol ) then
		if help_springpad_state == 0 then
			if helptext( L01_HELP_GPLAY_SPRINGPAD, "Hold [R2] and press [Square] to grab onto the spring pad. Use the [Right Analog Stick] to set the pad. Then jump off it.", 10, true, 1 ) then
				help_springpad_state = 1
			end
		elseif get_grapple_progress( training_wrench_plat_raising ) < 0.5 then
			helptext( L01_HELP_GPLAY_SPRINGPAD, "Hold [R2] and press [Square] to grab onto the spring pad. Use the [Right Analog Stick] to set the pad. Then jump off it.", 12, false, 999 ) 
		else
		  help_springpad_state = 2
		end
	end
	
		-- Zipline
		if is_in_volume( get_hero(), help_zipline_vol ) then
			helptext( L01_HELP_GPLAY_ZIPLINE, "Stand under the zipline then press [X] to jump up and latch on to it.", 6, true, 999 )
		end
		
	end
	
--------------------------
-- Main Island
--------------------------

	if not SAVE.completed_viper_cavern  then
	
--------------------------
-- Pre-Battle Audio
--------------------------

	if is_in_volume(get_hero(), tal_conv_curse_vol) and not SAVE.tal_conv_curse then
		SAVE.tal_conv_curse = true
		announce_and_wait(DialogueSpecs.NI_WMO_FOUR_TURBINES_COMPLETE)
		speak_and_wait( get_hero(), DialogueSpecs.NI_WMO_FOUR_TURBINES_COMPLETE_RESPONSE, true) --there was no lip sync for this line with announce. 
		announce_and_wait(DialogueSpecs.NI_WMO_FOUR_TURBINES_COMPLETE_RESPONSE2)
	end

	if is_in_volume(get_hero(), tal_fly_over_grindrail_ratchet_vol) and not SAVE.tal_grindrail_flyover and SAVE.windmill_number < 5 then
		SAVE.tal_grindrail_flyover = true
		--ally_warp(tal, tal_fly_over_grindrail_warp_vol)
		--ally_followpathhover(tal, tal_fly_around_grind_rail_path, 14, 12, 10)
		--wait(2.0)
		announce_and_wait(DialogueSpecs.NI_WMO_TWO_TURBINES_COMPLETE)
		speak_and_wait(get_hero(),DialogueSpecs.NI_WMO_TWO_TURBINES_COMPLETE_RESPONSE, true)  --there was no lip sync for this line with announce. 
		announce(DialogueSpecs.NI_WMO_TWO_TURBINES_COMPLETE_RESPONSE2)
	end
	
	
		--ledgegrab
		if is_in_volume(get_hero(), help_wmill1_ledgemove_vol ) then
			helptext( L01_HELP_GPLAY_LEDGETRAVERSE, "Use [Left analog stick] to travel left or right along a ledge.", 15, true, 999 )
		end

		--Drop down when hanging on the ledge 
		if is_in_volume( get_hero(), help_wmill1_dropdown_vol ) then
			helptext( L01_HELP_GPLAY_LEDGEDETACH, "Press R2 to drop down", 5, true, 999 )
		end

		--helptext for the springpad on wmill1
		if is_in_volume(get_hero(), wmill1_springpad_help_vol) then
			helptext( L01_HELP_GPLAY_SPRINGPAD, "Hold [R2] and press [Square] to grab onto the spring pad. Use the [Right Analog Stick] to set the pad. Then jump off it.", 10, true, 1 )
		end
--[[	
		--Drop down when hanging on the ledge 
		if is_in_volume(get_hero(), help_wmill1_dropdown_vol) and not SAVE.island_prebattle_dropdown then
			SAVE.island_prebattle_dropdown = true
			helptext( L01_HELP_GPLAY_LEDGEDETACH, "Press R2 to drop down", 3)
		end
--]]

		--Wall jump (on windmill #4)
		if is_in_volume(get_hero(), help_walljump_vol) and not SAVE.help_message_walljump then
			helptext( L01_HELP_GPLAY_WALLJUMPING, "Jump towards a wall, then press X again to rebound off of it.", 5, true, 999 )
			wait(10)
		end
		
		--Turn off wall jump
		if is_in_volume(get_hero(), help_walljump_vol2) then
			SAVE.help_message_walljump = true
		end
		
		-- Gate to the Grind Rail
		if is_in_volume( get_hero(), help_breakdoor_vol ) and is_alive(village_destructible_door) then
			helptext( L01_HELP_GPLAY_DESTROYDOORSWITHLAVAROCK, "Something explosive is needed to open this gate.", 5, true, 999 )
		end
			
		-- Lava Rocks picking up
		if is_in_area( get_hero(), help_lavarock_vol_layer ) and not SAVE.help_message_lavarocks_pickup then
			helptext( L01_HELP_GPLAY_PICKUPLAVAROCK, "Press [Square] to pick up objects.", 15, true, 999 )
		end
		
		-- Lava Rocks turn off
		if is_grabbing(  get_hero()  ) and not SAVE.help_message_lavarocks_pickup then
			SAVE.help_message_lavarocks_pickup = true
			request_auto_save()
		end

		-- no time to play dropping message

		-- Lava Rock throw	
		if is_in_area(get_hero(), help_lavarock_vol_layer) and is_grabbing(get_hero()) and SAVE.help_message_lavarocks_pickup and not SAVE.help_message_lavarocks_throw then
			helptext( L01_HELP_GPLAY_THROWLAVAROCK, "Press [Circle] to throw objects.", 5 )
		end
	
		-- Lava rock throw off
		if not is_grabbing(get_hero()) and SAVE.help_message_lavarocks_pickup and not SAVE.help_message_lavarocks_throw then
			SAVE.help_message_lavarocks_throw = true
			request_auto_save()
		end

		--map stuff
		if SAVE.windmill_number == 1 and (time_since_map_activated() > 300) then
			helptext(L01_HELP_GPLAY_USEMAP, "Press [Select] to view your map and find the other windmills.", 5, true, 1)
		end

		if SAVE.windmill_number == 4 and (time_since_map_activated() > 600) then
			helptext(L01_HELP_GPLAY_USEMAPAGAIN, "Press [Select] to view your map and find the other windmills.", 5, true, 1)
		end
		
		--hookshot help
		if is_in_volume(get_hero(), checkpoint_grindrail_vol) and not SAVE.help_message_hookshot then
			helptext(L01_HELP_GPLAY_HOOKSHOT,"Jump toward the target then press and hold [circle] to latch on with your Swingshot.", 10, true, 999)
		end

		if is_grinding(get_hero()) and not SAVE.help_message_hookshot then
			SAVE.help_message_hookshot = true
			request_auto_save()
		end


		--jump on grindrail help
		if is_in_volume(get_hero(), help_grind_jump_vol) then
		
			--first time
			if SAVE.help_message_grind_jump == nil then
				SAVE.help_message_grind_jump = 1
			
			--failure
			elseif SAVE.help_message_grind_jump == 1 then
				helptext(L01_HELP_GPLAY_SIDEJUMPONGRINDRAIL, "Jump toward the target then press and hold [circle] to latch on with your Swingshot.", 5, true, 999)
			end
		
		end

		--Success!
		if is_in_volume(get_hero(), help_grind_jump_success_vol) and (SAVE.help_message_grind_jump ~= 2) then
			SAVE.help_message_grind_jump = 2
			request_auto_save()
		end

		--[[
		--reset timer if you use the camera once
		if check_flag(HERO_CAMERA_ADJUST) and not SAVE.help_message_cam_use and not moved_cam_once then
			moved_cam_once = true
			help_message_initial_time = get_current_time()
		end
		]]--

		--use ur camra n00b!
		if has_scene_played("scene_mayor") and (get_current_time() > 600) and not check_flag(HERO_CAMERA_ADJUST) then
			helptext(L01_HELP_GPLAY_CAMERACONTROL, "Use [The right analog stick] to look around.", 5, true, 1)
		end

	end

--------------------------
-- Battlefield
--------------------------
	
	if SAVE.battle_begun then
		if not is_lock_strafe_active() then
			wait(5.0)
			helptext( L01_HELP_GPLAY_STRAFINGREMINDER , "Hold [L2] to strafe while carrying a weapon", 8, false, 1 )
		end
		strafe_done = true
	end

	if hero_get_equipped( get_hero() ) == WPN_TORNADO and strafe_done then
		helptext(L00_HELP_GPLAY_TORNADOLAUNCHER, "tornado help", 15, false, 1, false)
	end 

wait()

end

