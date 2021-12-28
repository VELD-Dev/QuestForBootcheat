

--[[
ally_followpathhover(moby_handle ally_handle, volume_handle goto_point, f32 accel = 10.0, f32 decel = 10.0, f32 max_speed = 5.0, bool should_land = true);
ally_gotopointhover(moby_handle ally_handle, volume_handle goto_point, f32 accel = 10.0, f32 decel = 10.0, f32 max_speed = 5.0, bool should_land = true);
ally_hover_takeoff(moby_handle ally_handle);
ally_hover_land(moby_handle ally_handle); 
--]]
 
ally_hover_takeoff(talwyn)


while true do

if talwyn_hover_group2 == true then


	ally_gotopointhover(talwyn, hovervol_group2_vol1, 10, 10, 15, false)
	wait(1.5)
	
	ally_gotopointhover(talwyn, hovervol_group2_vol2, 10, 10, 15, false)
	wait(1.5)
	
  ally_gotopointhover(talwyn, hovervol_group2_vol3, 10, 10, 15, false)
	wait(1.5)


end

if talwyn_hover_group1 == true then
  if not is_alive(enemy_ship2_turret1) then


	ally_gotopointhover(talwyn, hovervol_group1_vol1, 10, 10, 15, false)
	wait(1.5)
	
	ally_gotopointhover(talwyn, hovervol_group1_vol2, 10, 10, 15, false)
	wait(1.5)
	
	ally_gotopointhover(talwyn, hovervol_group1_vol3, 10, 10, 15, false)
	wait(1.5)
	
	end

end

if tal_hover_to_final_catapult == nil then

	if is_in_volume(get_hero(), innervol_ship2_roofshooters) then
	talwyn_hover_group2 = false
	talwyn_hover_group1 = false
	ally_followpathhover(talwyn, tal_hoverpath_to_catapult2, 10, 10, 30)
	wait(3)
	ally_gotopointhover(talwyn, tal_hoverpoint_catapult2, 10, 10, 15, false)
  ally_addtarget(talwyn, enemypod_roofpirates_ship2)
	tal_hover_to_final_catapult = true
	end
end

if tal_hover_to_final_catapult == true then
talwyn_hover_group2 = false
talwyn_hover_group1 = false
end


wait()
end