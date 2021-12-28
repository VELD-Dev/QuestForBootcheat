----------------------------------------------------------------------------------------------------
-- viper platforms logic script
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------



while true do
	
--------------------------------------------------------------------------------------------------------
--viper 2 intro
--------------------------------------------------------------------------------------------------------

--cave viper 2 intro
if caveviper2intro == nil then
	if is_in_volume(get_hero(), vc_trigger_enemy_viper2) then
		caveviper_intro(vc_enemy_viper2)
		caveviper2intro = true
	end
end

--cave viper 2 outro, 
if caveviper2outro == nil then
	if is_in_volume(get_hero(), vc_trigger_enemy_viper2b) then
		caveviper_outro(vc_enemy_viper2)
		caveviper2outro = true
	end
end


--cave viper 2b intro,
if caveviper2bintro == nil then
	if is_in_volume(vc_viperplatform_slideplatform1, vc_trig_viperplatforms_viper2) then
		caveviper_intro(vc_enemy_viper2b)
		caveviper2bintro = true
	end
end



--cave viper 2b outro
if caveviper2boutro == nil then
	if is_in_volume(get_hero(), vc_trigger_enemy_viper2_retreat) then
 	caveviper_outro(vc_enemy_viper2b)
	caveviper2boutro = true
	end
end  

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

--sending pete cowering behind rock
if viper2intro_petehide == nil then
	if is_in_volume(get_hero(), vc_trigger_enemy_viper2) then
		ally_followpath(rustypete,pete_walkpath_11b,true,false)
		viper2intro_petehide = true
	end
end

--adjusting game camera
if camera_viperplatforms == nil then
	if is_in_volume(get_hero(), vc_trig_camera_viperplatforms) then
		set_follow_cam(get_hero(), 7, 13, 75, 2)
		ally_followpath(rustypete,pete_walkpath_11b,true,false)
		camera_viperplatforms = true
	end
end

if camera_viperplatforms == true then
	if not is_in_volume(get_hero(), vc_trig_camera_viperplatforms) then
		set_follow_cam(get_hero(), 4, 1, 75, 1.5)
		camera_viperplatforms = nil
	end
end

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

-- triggering grindrail viper
if grindrailviperintro == nil then
	if is_in_volume(get_hero(), vc_innervol_grindrailviper) then
		caveviper_intro(vc_enemy_viper_grindrailattack)
		grindrailviperintro = true
	end
end


if grindrailviperobviated == nil then
	if is_in_volume(get_hero(), vc_trig_camera_endgrindrail_end) then
	obviate(vc_enemy_viper_grindrailattack)
	grindrailviperobviated = true
end
end
  wait()

end

-- end gameplay, this occurs when the user gets to viper caverns