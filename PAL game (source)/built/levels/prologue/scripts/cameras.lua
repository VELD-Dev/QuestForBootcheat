----------------------------------------------------------------------------------------------------
-- camera script
----------------------------------------------------------------------------------------------------



while true do


--boltcrank camera, ship1
if boltcrank1camera == nil then
	if crank_is_in_use(boltcrank1) then
		activate_cam(get_hero(), boltcrankcam)
		boltcrank1camera = true
	end
end

if boltcrank1camera == true then
	if not crank_is_in_use(boltcrank1) then
		deactivate_cam(get_hero(), boltcrankcam)
		boltcrank1camera = nil
	end
end

--boltcrank camera, ship 2

-- prologue catapult cameras

--catapult 1
if is_in_volume(get_hero(), trig_catapult1_camera) then
activate_cam(get_hero(), cam_catapult1)
end

if is_in_volume(get_hero(), outervol_ship2_shootersafterturretdoor) then
wait(1)
deactivate_cam(get_hero(), cam_catapult1)
end

--catapult 2
if is_in_volume(get_hero(), trig_catapult2_camera) then
activate_cam(get_hero(), cam_catapult2)
deactivate(moving_rocks_controller_small_left)
deactivate(moving_rocks_controller_medium_left)
deactivate(moving_rocks_controller_large_left)
car_spawner_obviate(moving_rocks_controller_small_left)
car_spawner_obviate(moving_rocks_controller_medium_left)
car_spawner_obviate(moving_rocks_controller_large_left)
end

if is_in_volume(get_hero(), pro_exit_vol) then
wait(1)
deactivate_cam(get_hero(), cam_catapult2)
end

--ladder camera


wait()
end 