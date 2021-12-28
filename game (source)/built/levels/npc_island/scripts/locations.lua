----------------------------------------------------------------------------------------------------
-- Windmill/Beacon Location Tags
----------------------------------------------------------------------------------------------------
locations_wait_time = 15.0	--essentially how quickly you can make each appear
locations_show_time = 4.0	--how long they stay onscreen

if has_scene_played("scene_mayor") then
	show_location(L01_PLACE_GPLAY_HOOLEFARISLAND, locations_show_time)
end

while true do

	--Windmill 1
	if is_in_volume( get_hero(), checkpoint_wmill1_vol ) and not SAVE.island_prebattle_wmill1_location then
		show_location(L01_PLACE_GPLAY_WINDTURBINEALPHA, locations_show_time)
		SAVE.island_prebattle_wmill1_location = true
	end

	--[[
	if not is_in_volume( get_hero(), checkpoint_wmill1_vol ) and SAVE.island_prebattle_wmill1_location then
		wait(locations_wait_time)
		SAVE.island_prebattle_wmill1_location = false
	end
	]]--

	--Windmill 2	
	if is_in_volume( get_hero(), checkpoint_wmill2_vol ) and not SAVE.island_prebattle_wmill2_location then
		show_location(L01_PLACE_GPLAY_WINDTURBINEBETA, locations_show_time)
		SAVE.island_prebattle_wmill2_location = true
	end

	--[[
	if not is_in_volume( get_hero(), checkpoint_wmill2_vol ) and SAVE.island_prebattle_wmill2_location then
		wait(locations_wait_time)
		SAVE.island_prebattle_wmill2_location = false
	end
	]]--

	--Windmill 3
	if is_in_volume( get_hero(), checkpoint_wmill3_vol ) and not SAVE.island_prebattle_wmill3_location then
		show_location(L01_PLACE_GPLAY_WINDTURBINEGAMMA, locations_show_time)
		SAVE.island_prebattle_wmill3_location = true
	end

	--[[
	if not is_in_volume( get_hero(), checkpoint_wmill3_vol ) and SAVE.island_prebattle_wmill3_location then
		wait(locations_wait_time)
		SAVE.island_prebattle_wmill3_location = false
	end
	]]--

	--Windmill 4
	if is_in_volume( get_hero(), checkpoint_wmill4_vol ) and not SAVE.island_prebattle_wmill4_location then
		show_location(L01_PLACE_GPLAY_WINDTURBINEDELTA, locations_show_time)
		SAVE.island_prebattle_wmill4_location = true
	end

	--[[
	if not is_in_volume( get_hero(), checkpoint_wmill4_vol ) and SAVE.island_prebattle_wmill4_location then
		wait(locations_wait_time)
		SAVE.island_prebattle_wmill4_location = false
	end
	]]--

	--Windmill 5
	if is_in_volume( get_hero(), checkpoint_wmill5_vol ) and not SAVE.island_prebattle_wmill5_location then
		show_location(L01_PLACE_GPLAY_WINDTURBINEEPSILON, locations_show_time)
		SAVE.island_prebattle_wmill5_location = true
	end
		
	--[[
	if not is_in_volume( get_hero(), checkpoint_wmill5_vol ) and SAVE.island_prebattle_wmill5_location then
		wait(locations_wait_time)
		SAVE.island_prebattle_wmill5_location = false
	end		
	]]--
		
	--Beacon
	if is_in_volume( get_hero(), checkpoint_beacon_vol ) and not SAVE.island_prebattle_beacon_location then
		show_location(L01_PLACE_GPLAY_HOOLEFARBEACON, locations_show_time)
		SAVE.island_prebattle_beacon_location = true
	end
	
	--[[
	if not is_in_volume( get_hero(), checkpoint_beacon_vol ) and SAVE.island_prebattle_beacon_location then
		wait(locations_wait_time)
		SAVE.island_prebattle_beacon_location = false
	end
	]]--
	
	if SAVE.windmill_hud_on then
		SAVE.windmill_hud_on = false
		wait(1.0)
		start_windmill_hud()
		wait(10.0)
		stop_windmill_hud()
	end		

wait()

end