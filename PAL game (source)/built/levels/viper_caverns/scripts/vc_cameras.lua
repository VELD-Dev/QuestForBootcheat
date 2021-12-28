----------------------------------------------------------------------------------------------------
-- Camera Script 
----------------------------------------------------------------------------------------------------
arenacamactive = false

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------



while true do

--activating grindrail camera

if is_grinding(get_hero()) then
	if endgrindrailon == nil then
		if is_in_volume(get_hero(),vc_trig_camera_endgrindrail_start ) then
		activate_cam(get_hero(),vc_camera_endgrindrail)
		prt("grindrail camera active")
		ally_followpath(rustypete,pete_walkpath_12,true,false)
		endgrindrailon = true
		end
	end
end

	
-----------------------------------------------------------------------------------------------------
--boltcrank cameras
-----------------------------------------------------------------------------------------------------

--boltcrank camera 1
if boltcrank1camera == nil then
if crank_is_in_use(vc_boltcrank1) then
	activate_cam(get_hero(), vc_camera_boltcrank1)
	boltcrank1camera = true
	end
end

if boltcrank1camera == true then
if not crank_is_in_use(vc_boltcrank1) then
	deactivate_cam(get_hero(), vc_camera_boltcrank1)
	boltcrank1camera = nil
	end
end

--boltcrank camera 2
if boltcrank2camera == nil then
if crank_is_in_use(vc_boltcrank2) then
	activate_cam(get_hero(), vc_camera_boltcrank2)
	boltcrank2camera = true
	end
end

if boltcrank2camera == true then
if not crank_is_in_use(vc_boltcrank2) then
	deactivate_cam(get_hero(), vc_camera_boltcrank2)
	boltcrank2camera = nil
	end
end
	
--boltcrank camera 3
if boltcrank3camera == nil then
if crank_is_in_use(vc_boltcrank3) then
	activate_cam(get_hero(), vc_camera_boltcrank3)
	boltcrank3camera = true
	end
end

if boltcrank3camera == true then
if not crank_is_in_use(vc_boltcrank3) then
	deactivate_cam(get_hero(), vc_camera_boltcrank3)
	boltcrank3camera = nil
	end
end

--boltcrank camera 4
if boltcrank4camera == nil then
if crank_is_in_use(vc_boltcrank4) then
	activate_cam(get_hero(), vc_camera_boltcrank4)
	viper1cam = false
	boltcrank4camera = true
	end
end

if boltcrank4camera == true then
	if not crank_is_in_use(vc_boltcrank4) then
		deactivate_cam(get_hero(), vc_camera_boltcrank4)
			if not crank_is_complete(vc_boltcrank4) then
				viper1cam = true
				--activate_cam(get_hero(),vc_camera_viperintro_indexcam)
			end
		boltcrank4camera = nil
	end
end

--boltcrank camera 5
if boltcrank5camera == nil then
if crank_is_in_use(tempboltcrank_5) then
	activate_cam(get_hero(), vc_camera_boltcrank5)
	boltcrank5camera = true
	end
end

if boltcrank5camera == true then
if not crank_is_in_use(tempboltcrank_5) then
	deactivate_cam(get_hero(), vc_camera_boltcrank5)
	boltcrank5camera = nil
	end
end


--------------------------------------------------------------------------------
--LEDGEGRAB CAMERA
--------------------------------------------------------------------------------

if is_in_volume(get_hero(), trig_cam_ledgegrab2) then
	if is_ledge_grabbing(get_hero()) then
		activate_cam(get_hero(), cam_ledgegrab2)
	end
end


if not is_ledge_grabbing(get_hero()) then
	deactivate_cam(get_hero(), cam_ledgegrab2)
end

----------------------------------------------------------------------------------------------------------------------------------
--get_hero() camera adjustments
----------------------------------------------------------------------------------------------------------------------------------

--[[
-- shoulder cam
if shouldercam == nil then
	if is_in_volume(get_hero(), vc_trig_camera_shouldercam) then
	set_follow_cam(get_hero(), 2.5, 1, 75, 1.6)
	shouldercam = true
	end
end

if shouldercam == true then
	if not is_in_volume(get_hero(), vc_trig_camera_shouldercam) then
	set_follow_cam(get_hero(), 5, 2, 75, 2)
	shouldercam = nil
	end
end


--------------------------------------------------------------------------------
-- dark area camera

if darkarea1cam == nil then

	if not is_ledge_grabbing(get_hero()) then
		if is_in_volume(get_hero(), vc_trig_camera_darkarea1) then
		set_follow_cam(get_hero(), 4, 2, 75, 1.5)
		darkarea1cam = true
		end
	end
	
end

if darkarea1cam == true then

	
		if not is_in_volume(get_hero(), vc_trig_camera_darkarea1) then
		darkarea1cam = nil
		end

	
end
--]]
--------------------------------------------------------------------------------
--grindrail to bridge

if grindrailtobridgecam == nil then
	if is_in_volume(get_hero(), vc_trig_ally_petewalktobridge) then
	set_follow_cam(get_hero(), 5, 2, 75, 2)
	grindrailtobridgecam = true
	end
end

--[[
-- pirate ship interior camera

if pirateshipcamera == nil then
	if is_in_volume(get_hero(), vc_trig_camera_pirateshipinterior) then
	set_follow_cam(get_hero(), 4, 1, 75, 1.5)
	pirateshipcamera = true
	end
end



--resetting followcam


if pirateshipcamera == true then
	if not is_in_volume(get_hero(), vc_trig_camera_pirateshipinterior ) then
	set_follow_cam(get_hero(), 4, 2, 75, 2 )
	pirateshipcamera = nil
	end
end
--]]


--------------------------------------------------------------------------------
--BOLTCRANK ELEVATOR CAM
--------------------------------------------------------------------------------

if is_cranking(get_hero(), boltcrank_boltcrank_elevator) then
	activate_cam(get_hero(), cam_boltcrank_elevator_cam )
end

if not is_cranking(get_hero(), boltcrank_boltcrank_elevator) then
	deactivate_cam(get_hero(), cam_boltcrank_elevator_cam)
end

--------------------------------------------------------------------------------
-- Catapult camera
--------------------------------------------------------------------------------

if is_in_volume(get_hero(), vc_trig_2vipers_outro) then
activate_cam(get_hero(), catapult_cam)
prt("catapult camera active")
end

if is_in_volume(get_hero(), vc_trig_2viperfight_retreat) then
deactivate_cam(get_hero(), catapult_cam)
end

--camera for combat in watery cave

if SAVE.vc_escape_start == true then
	if is_in_volume(get_hero(), vc_innervolume_pirategroup3) then
	set_follow_cam(get_hero(), 7, 2, 75, 2)
	end
end

-- pirate arena camera
if arenacamactive == false then
	if is_in_volume(get_hero(), vc_innervolume_ghostarena) then
		set_follow_cam(get_hero(), 5, 2, 75,  2)
		arenacamactive = true
	end
end


--[[
if arenacamactive == true then
	if not is_in_volume(get_hero(), vc_innervolume_ghostarena) then
		set_follow_cam(get_hero(), 4, 2, 75, 2)
		arenacamactive = false
	end
end
--]]

-- first viper fight at elevator cam

if SAVE.vc_escape_start == true then
	if elevatorvipercamset == nil then
		if is_in_volume(get_hero(), vc_innervolume_brokenbridgeviper) then
		set_follow_cam(get_hero(), 7, 2, 75, 2)
		elevatorvipercamset = true
		end
	end
end

-- balance beam cam
if is_in_volume(get_hero(), vc_innervolume_batgroup4) then
set_follow_cam(get_hero(),5,20, 75, 1.65 )
end

if is_in_volume(get_hero(), vc_trig_camera_endgrindrail_start) then
reset_follow_cam(get_hero())
end

  wait()

end

-- end gameplay, this occurs when the user gets to viper caverns