

--[[
ally_followpathhover(moby_handle ally_handle, volume_handle goto_point, f32 accel = 10.0, f32 decel = 10.0, f32 max_speed = 5.0, bool should_land = true);
ally_gotopointhover(moby_handle ally_handle, volume_handle goto_point, f32 accel = 10.0, f32 decel = 10.0, f32 max_speed = 5.0, bool should_land = true);
ally_hover_takeoff(moby_handle ally_handle);
ally_hover_land(moby_handle ally_handle); 
--]]
 
ally_hover_takeoff(tal)
tal_fightviper_hover = true

while tal_fightviper_hover == true do

if tal_fightviper_hover == true then
ally_gotopointhover(tal, tal_fightviper_hover_vol1, 10, 10, 15, false)
wait(1.5)
end

if tal_fightviper_hover == true then
ally_gotopointhover(tal, tal_fightviper_hover_vol2, 10, 10, 15, false)
wait(1.5)
end

if tal_fightviper_hover == true then
ally_gotopointhover(tal, tal_fightviper_hover_vol3, 10, 10, 15, false)
wait(1.5)
end

if tal_fightviper_land == true then
tal_fightviper_hover = false
--ally_gotopointhover(tal, tal_fightviper_land_vol1, 10, 10, 15, true)
tal_fightviper_land = false
end

wait()
end