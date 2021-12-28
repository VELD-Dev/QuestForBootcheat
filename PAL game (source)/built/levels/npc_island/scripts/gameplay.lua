----------------------------------------------------------------------------------------------------
-- Gameplay Script 
----------------------------------------------------------------------------------------------------

-- This script is loaded at level start and is responsible for all global common gameplay 
-- elements.  Elements specific to one stage of NPC ISLAND or specific to viper caverns should
-- be put in their specific scripts.  Again, this is for level-wide, common gameplay 
-- scripting.

----------------------------------------------------------------------------------------------------
-- Initialization
----------------------------------------------------------------------------------------------------

-- hide the pirate invasion for now
-- obviate_pod( npc_island_pirates )

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------
deactivate(grindrail_first_swingshot)
prt("swingshot deactivated")

while true do

	--deactivating swingshot before grate is broken
	if first_grate_broken == nil then
		if not is_update_on(village_destructible_door) then
		activate(grindrail_first_swingshot)
		prt("swingshot activated")
		first_grate_broken = true
		end
end

----------------------------------------------------------------------------------------------------
-- NPC Island New Grindrail Cameras
----------------------------------------------------------------------------------------------------
-- Index cam 1

if is_in_volume(get_hero(), trig_newgrindrail_index_cam1) then
activate_cam(get_hero(), newgrindrail_index_cam1)
end

if is_in_volume(get_hero(), trig_newgrindrail_index_cam1_deactivate) then
deactivate_cam(get_hero(), newgrindrail_index_cam1)
end

-- Index cam 2

if is_in_volume(get_hero(), trig_newgrindrail_index_cam2) then
activate_cam(get_hero(), newgrindrail_index_cam2)
end

if is_in_volume(get_hero(), trig_newgrindrail_index_cam2_deactivate) then
deactivate_cam(get_hero(), newgrindrail_index_cam2)
end

-- Index cam 3
if is_in_area(get_hero(), area_grindrailcam3_activate ) then
activate_cam(get_hero(), newgrindrail_index_cam3)
deactivate_cam(get_hero(), loopcam_1)
end

if is_in_area(get_hero(), area_grindrailcam3_deactivate ) then
deactivate_cam(get_hero(), newgrindrail_index_cam3)
end
-- Index cam 4

--Camera for section after windmil
if is_in_volume(get_hero(), trig_newgrindrail_cam4_activate ) then
deactivate_cam(get_hero(), cam_windmill_5_preboltcrank)
activate_cam(get_hero(), newgrindrail_index_cam4)
end

if is_in_volume(get_hero(), trig_newgrindrail_cam4_deactivate ) then
deactivate_cam(get_hero(), newgrindrail_index_cam4)
end

-- Camera for loop 1
if is_in_volume(get_hero(), trig_activate_cam_loop1) then
--activate_cam(get_hero(), loopcam_1)
end

-- Camera for loop 2
if is_in_volume(get_hero(), trig_newgrindrail_camera1_deactivate1) then
--activate_cam(get_hero(), loopcam_2)
end


if is_in_volume(get_hero(), trig_newgrindrail_camera1_activate1) then
--deactivate_cam(get_hero(), loopcam_2)
end

--springpad cam
if is_in_volume(get_hero(), trig_newgrindrail_springpadcam) then
activate_cam(get_hero(), cam_newgrindrail_springpad)
springpad_cam_deactivated = nil
end


--deactivate springpad cam
if springpad_cam_deactivated == nil and not crank_is_complete(windmill5_crank) then
	if is_in_volume(get_hero(), trig_newgrindrail_springpadcam_deactivate) then
	deactivate_cam(get_hero(), cam_newgrindrail_springpad)
	activate_cam(get_hero(), wmill5_post_teleport_cam )
	windmill5_preboltcam_deactive = nil
	springpad_cam_deactivated = true
	prt("This cam piece is happening")
	end
end

----------------------------------------------------------------------------------------------------
-- NPC Island Turbine Cameras
----------------------------------------------------------------------------------------------------

	if is_in_area( get_hero(), turbine_cam_area ) and not turbinecam_active then
		prt( "Turbine cam activated" )
      activate_cam( get_hero(), turbine_shaft_camera ) 
      turbinecam_active = false
    end

	if not is_in_area( get_hero(), turbine_cam_area ) and turbinecam_active then
      prt( "Turbine cam deactivated" )
      deactivate_cam( get_hero(), turbine_shaft_camera )
      turbinecam_active = false
	end	

  wait()

end

