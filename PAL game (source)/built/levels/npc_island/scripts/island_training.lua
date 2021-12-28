--- Comtrols everything in the Training Area of NPC Island.

----------------------------------------------------------------------------------------------------
-- Local variables 
----------------------------------------------------------------------------------------------------

local wakeup_movie_played = false
local gravpipe_cam_active = false
local tal_steps_path = false
local tal_pipes_path = false
local tal_pipes2_path = false
local help_swingshot = false
local tal_cave_path = false
local tal_mayor_path = false
local zipline_cam = false

----------------------------------------------------------------------------------------------------
-- Gameplay Script 
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Initialization
----------------------------------------------------------------------------------------------------
if not SAVE.completed_training then

  -- yoink!
  hero_take_weapon( get_hero(), WPN_COMBUSTER )
  hero_take_weapon( get_hero(), WPN_GRENADE )
  hero_take_weapon( get_hero(), WPN_TORNADO )
  hero_take_weapon( get_hero(), WPN_RAVAGER )
  hero_take_weapon( get_hero(), WPN_PREDATOR )
  hero_take_weapon( get_hero(), WPN_ROBO_HIVE )

  hero_equip( get_hero(), WPN_WRENCH )

end

if not SAVE.completed_viper_cavern then
	ally_unequipitem(tal, ALLY_ITEM_GUN)
end

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

while not SAVE.completed_training do
	
----------------------------------------------------------------------------------------------------
-- Cinematics/Movies 
----------------------------------------------------------------------------------------------------

	if not has_cinematic_played("l01_s04_clank_rt") then
		queue_cinematic("l01_s04_clank_rt", hide_s04_clank_rt_pod, hide_s04_clank_rt_pod ) 
   	wait()
		unobviate_pod( hide_s04_clank_rt_pod )
		activate_cam( get_hero(), opening_view_cam )		
		play_TRAIN_WAKEUP_vo = true	
	end

----------------------------------------------------------------------------------------------------
-- Tal during Training
----------------------------------------------------------------------------------------------------


-- First steps off the beach
	if not is_in_volume( get_hero(), ratchet_start_vol ) and not tal_steps_path then
--		ally_followpathhover( tal, training_tal_steps_path, 8, 8, 16 )
		ally_followpathhover( tal, training_tal_beach_vol, 8.5, 8.5, 10, false )	
		tal_steps_path = true
	end

-- Move Tal to the big Grav Ramp	
	if is_in_volume( get_hero(), training_tal_pipes_vol ) and not tal_pipes_path then
		ally_followpathhover( tal, training_tal_pipes_path, 4, 4, 10, false )
		tal_pipes_path = true
	end

-- Move Tal along the big Grav Ramp	
	if is_in_volume( get_hero(), training_tal_pipes2_vol ) and not tal_pipes2_path then
		enable_baked_shadows( tal, false )
		ally_followpathhover( tal, training_tal_pipes2_path, 4, 4, 7 )
		tal_pipes2_path = true
	end
	
-- Move into the Caves	
	if is_in_volume( get_hero(), training_tal_swingshot_vol ) and not tal_precave_path then
		enable_baked_shadows( tal, true )
		ally_followpathhover( tal, training_tal_pre_cave_path, 6, 6, 10, false )
		tal_precave_path = true
	end
	
--	Training for the Spring Pad.
	if is_in_volume( get_hero(), training_tal_cave_vol ) and not tal_cave_path then
		speak( tal, DialogueSpecs.NI_TRAIN_NEW_WRENCH_LIFT) --removed 2D true case cro 5/1
--		helptext( L01_HELP_GPLAY_SPRINGPAD, "Hold [R2] and press [Square] to latch the wrench on to top of the spring pad. Use the [Right Analog Stick] to move the pad down to the ground until it locks. Press [Square] to let go. Jump on the pad then jump again to bounce up to the ledge.", 5, 1)
		ally_followpathhover( tal, training_tal_cave_path, 12, 12, 7, false )
		tal_cave_path = true
	end

-- Moves off to the Beach
	if is_in_volume( get_hero(), training_tal_to_mayor_vol ) and not tal_mayor_path then
		speak( tal, DialogueSpecs.NI_TRAIN_END_VISTA) --removed 2D true case cro 5/1
		--ally_followpathhover( tal, training_tal_to_mayor_path, 12, 12, 17 )
		tal_mayor_path = true
	end
	
----------------------------------------------------------------------------------------------------
-- Gravpipe Camera 
----------------------------------------------------------------------------------------------------

	if is_in_area( get_hero(), training_gravpipe_cam_area ) and not gravpipe_cam_active then
		activate_cam( get_hero(), training_gravpipe_cam )
		gravpipe_cam_active = true
	end
	
	if not is_in_area( get_hero(), training_gravpipe_cam_area ) and gravpipe_cam_active then
		deactivate_cam( get_hero(), training_gravpipe_cam )
		gravpipe_cam_active = false
	end

  wait()

end
