----------------------------------------------------------------------------------------------------
-- Gameplay Script 
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------



while true do
	
-----------------------------------------------------------------------------------------------------
--vc entrance
-----------------------------------------------------------------------------------------------------
	
	
	--[[-- activate opening view camera
	if is_in_volume(Ratchet1, vc_trig_camera_vcentrance) then
	activate_camera()
	end]]--
	
	--trigger pete and talwyn to walk into cave
	if talpeteentercave == nil then
		if is_in_volume(get_hero(), vc_trig_camera_vcentrance) then
		ally_followpath(rustypete,Pete_walkpath_1)
		ally_followpath(talwyn,Tal_walkpath_1)
		talpeteentercave = true
		end
	end
	
	--trigger pete and talwyn to walk toward door
	if talpeteattrapdoor == nil then
		if is_in_volume(get_hero(), vc_trig_ally_talandpete_gototrapdoor) then
		ally_followpath(rustypete,Pete_walkpath_2)
		ally_followpath(talwyn,Tal_walkpath_2)
		end
	end
	
	
  wait()

end

-- end gameplay, this occurs when the user gets to viper caverns