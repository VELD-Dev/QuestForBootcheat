-------------------------------------------------------------------------------
-- INITIALIZATION -------------------------------------------------------------
-------------------------------------------------------------------------------

if --[[SAVE.missions_darkwatercove == false and]] SAVE.missions_search_clues == nil then
		add_mission(LEVEL_TREASURE_ISLAND, L03_LABEL_MISSION_SEARCHFORCLUES, L03_DESC_MISSION_SEARCHFORCLUES, true)
		npc_icon_on(talking_skull_beach_door, MAPICON_PIRATE_PUZZLE)
		SAVE.missions_search_clues = true
		prt("Mission Added: Search for Cloos")
end

--Warp Ratchet wherever on a save/load
if not has_valid_checkpoint() then
	if not SAVE.treasure_island_hero_location then
		hero_warp(get_hero(), checkpoint_startdock_respawn)
		prt("warping_ratchet_to_dock_from_main_script")
	elseif SAVE.treasure_island_hero_location == 1 then
		hero_warp(get_hero(), vc2_teleport_vol)
	end
end

--changed this check for bug 1548 - this is when you initially enter TI
if not SAVE.arrived_at_treasureisland then
  obviate_pod(darkwater_fleet_pod)
  taxi_warp(piratebargee, pirate_taxi_start_vol)
  
  prt("HERE AGAIN")
  hero_warp(get_hero(), warp_vol_ratchet_bargestart)
  npc_warp(biggamehunterer,warp_vol_talwyn_bargestart)
  ally_warp(talwyn,warp_vol_smuggler_bargestart)
  
  taxi_start_move(piratebargee)
  
  queue_scene("scene_treasureisland_arrive")
  wait(0)
  SAVE.arrived_at_treasureisland = true
  request_auto_save()
  
 --if you die and respawn
else

	--if you die and respawn after beating vc2
	if SAVE.completed_treasure_island then
		elevator_warp_to_node(caverns_elevator, 0)
		hero_warp(get_hero(), checkpoint_exit_vc2_respawn_vol)
		obviate(talwyn)
	end
  
  taxi_warp(piratebargee, pirate_taxi_stop_vol)
  npc_warp(biggamehunterer,ti_scene_smuggler_warp_vol)
  prt("warping smuggler here")
  
end

--turning on bangles for new barge

ally_setcollisionignore(talwyn, get_hero());
npc_setcollisionignore(biggamehunterer, get_hero() )
-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------
run_script( "music" );
run_script("missions")

-- Buoyant platforms are in a separate zone from their water clue
--foreach_moby_in_pod(buoyant_platforms, platform_set_water, clue5)
  
local cur_area = nil; -- 1 = TI, 2 = VC2

while true do

  --show location
  if is_in_volume(get_hero(), show_location_volume) and not SAVE.Treasure_Island_Location_Shown then
	--shows the location text when you enter hoolefar island
    SAVE.Treasure_Island_Location_Shown = true
    show_location(L02_PLACE_GPLAY_DARKWATERCOVE, 4)
  end
  
  if cur_area ~= 1 and is_in_volume( get_hero(), treasure_island_puzzle_vol ) then
    set_fog( 5.0, 60.0, 0.57, 0.0, 0.1378, 0.1653 )
    run_script( "puzzle_organ" );
    run_script( "puzzle_drink" );
    run_script( "puzzle_light" );
    run_script( "treasure_island" );
    cur_area = 1
  end

  --Adding in viper caverns 2 script
  if cur_area ~= 2 and is_in_volume(get_hero(), vc2_gameplay_vol) then
    SAVE.treasure_island_hero_location = 1
    set_fog( 5.0, 150.0, 0.35, 0.25, 0.25, 0.4)
    run_script("vc2_gameplay")
    run_script("TI_VC_Soundscape")
    cur_area = 2
  end

--coming out of vc2
if SAVE.completed_treasure_island and is_in_volume(get_hero(), vc2_exit_vol) then
	--unobviate(caverns_elevator)
	obviate(talwyn)
	--hero_lockout_control(get_hero(), false, false, false)
	--fade_to_black(0)	
	fade_from_black(2.0)
	wait(0.5)
	prt("warping hero up to TI BIATCH")
end

-------------------------------------------------------------------------------
-- Level transitions-----------------------------------------------------------
-------------------------------------------------------------------------------

  if is_in_volume( get_hero(), trig_transition_to_boss ) then
  
      --TRANSITION TO Boss
      --------------------------------
	set_level( LEVEL_PROLOGUE );
    
  end


wait()
  
end


