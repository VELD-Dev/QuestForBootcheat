--- Controls Tal during the Battlefield if she was saved in Viper Caverns.


----------------------------------------------------------------------------------------------------
-- Globals
----------------------------------------------------------------------------------------------------

--Globals used to trigger audio in Tal's audio script
play_TAL_BATTLEFIELD_OPENING_vo = false
play_TAL_BATTLEFIELD_EYE_vo = false
play_TAL_BATTLEFIELD_NICESHOT_vo = false
play_TAL_BATTLEFIELD_FLANK_vo = false
play_TAL_BATTLEFIELD_FALLBACK_vo = false
play_TAL_BATTLEFIELD_THROUGH_vo = false
play_TAL_BATTLEFIELD_SKULLINTRO_vo = false
play_TAL_BATTLEFIELD_DOWN_vo  = false
play_TAL_BATTLEFIELD_WALKER_vo = false


----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

local battle_started = false
local b1_w1_target = false
local b1_w2_target = false
local b1_w3_target = false
local b1_w4_target = false
local b1_w5_target = false
local battle2_started = false
local b2_w0x_target = false
local b2_w0_target = false
local b2_w1x_target = false
local b2_w1_target = false
local b2_w2_target = false
local b2_w3_target = false
local b2_w4_target = false
local b2_w5_target = false
local move_beach = false


----------------------------------------------------------------------------------------------------
-- Initialization
----------------------------------------------------------------------------------------------------

--- Clear Tal in case anything remains.
ally_setattitude ( tal, ATT_PASSIVE )
ally_cleartargets( tal )
--ally_clearfirepoints( tal )



----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

while true do


--------------------------------
-- Battle #1
--------------------------------

	-- Get Tal ready and target first wave
	if SAVE.scene_battle_mayor_intro and not battle_started then
		ally_warp( tal, bat1_tal_pos_vol )
--		debug_message("TEMP: Tal: We have to do something, Ratchet!", 5)	
		wait(1.0)
		play_TAL_BATTLEFIELD_OPENING_vo = true
		ally_setattitude ( tal, ATT_AGGRESSIVE )
		ally_addtarget( tal, b1_w0_pirates_pod )
		ally_setfirepoints( tal, bat1_tal_beach_firepoints_pod ) 
		prt("Tal ready for battle")
		prt("Tal attack b1 w0")
		battle_started = true
	end		
	
	-- Target second wave
	if get_num_alive( b1_w0_pirates_pod ) == 0 and not b1_w1_target then
		ally_addtarget( tal, b1_w1_pirates_pod )
		play_TAL_BATTLEFIELD_EYE_vo = true
		prt("Tal attack b1 w1")
		b1_w1_target  = true
	end
	
	-- Target third wave
	if get_num_alive( b1_w1_pirates_pod ) == 0 and not b1_w2_target then
		ally_addtarget( tal, b1_w2_pirates_pod )
		play_TAL_BATTLEFIELD_FLANK_vo = true
		prt("Tal attack b1 w2")
		b1_w2_target = true
	end
	
	-- Target fourth wave		
	if get_num_alive( b1_w2_pirates_pod ) == 0 and not b1_w3_target then
		ally_addtarget( tal, b1_w3_pirates_pod )
		prt("Tal attack b1 w3")
		b1_w3_target = true
	end
	
	-- Target fifth wave
	if get_num_alive( b1_w3_pirates_pod ) == 0 and not b1_w4_target then
		play_TAL_BATTLEFIELD_NICESHOT_vo = true
		ally_addtarget( tal, b1_w4_pirates_pod )
		b1_w4_target = true
		prt("Tal attack b1 w4")
	end
	
	-- Target sixth wave
	if get_num_alive( b1_w4_pirates_pod ) == 0 and not b1_w5_target then
		ally_addtarget( tal, b1_w5_pirates_pod )
		prt("Tal attack b1 w5")
		b1_w5_target = true
	end
	
--------------------------------
-- Battle #2
--------------------------------

	-- If the cannons are destroyed go to the Ob Eye Door as it comes under attack
	if SAVE.island_battle1_complete and not battle2_started then
		wait(2.0)
		ally_setattitude ( tal, ATT_PASSIVE )
		ally_cleartargets( tal )
		ally_clearfirepoints( tal )
		ally_followpathhover( tal, bat2_tal_obeye_door_path, 3, 3, 6 )
		prt("Tal moves to Ob Eye Door")
		battle2_started = true
	end
	
	-- Fight the first wave
	if battle2_started and not b2_w0x_target then
--		debug_message("TEMP: Tal: Ratchet, keep them away from the door!", 5)
		play_TAL_BATTLEFIELD_FALLBACK_vo = true
		ally_setattitude ( tal, ATT_AGGRESSIVE )
		ally_setfirepoints( tal, bat2_tal_door_firepoints_pod )
		ally_addtarget( tal, b2_w0x_pirates_pod )
		ally_addtarget( tal, b2_w0_pirates_pod )
		prt("Tal attack b2 w0")
		b2_w0x_target = true
	end

	-- Fight the second wave
	if get_num_alive( b2_w0x_pirates_pod ) == 0 and get_num_alive( b2_w0_pirates_pod ) == 0 and not b2_w1x_target then		
		ally_addtarget( tal, b2_w1x_pirates_pod )
		play_TAL_BATTLEFIELD_THROUGH_vo = true
		prt("Tal attack b2 w1x")
		b2_w1x_target = true
	end

	-- Fight the Skull Walker
	if get_num_alive( b2_w1x_pirates_pod ) == 0 and not b2_w1_target then
--		debug_message("TEMP: Tal: Oh, no! They brought in a skull walker!", 5)
		play_TAL_BATTLEFIELD_SKULLINTRO_vo = true
		ally_addtarget( tal, b2_w1_pirates_pod )
		prt("Tal attack b2 w1")
		b2_w1_target = true
	end

	-- Move further up the beach
	if get_num_alive( b2_w1_pirates_pod ) == 0 and not move_mid_beach then
		play_TAL_BATTLEFIELD_DOWN_vo = true
		ally_setattitude ( tal, ATT_PASSIVE )
		ally_cleartargets( tal )
		ally_clearfirepoints( tal )
		ally_followpathhover( tal, bat2_tal_obeye_door_to_mid_beach_path, 4, 4, 8 )
		prt("Tal moves to mid beach")
		move_mid_beach = true
	end

	-- Fight the third wave
	if move_mid_beach and not b2_w2_target then
		ally_setattitude ( tal, ATT_AGGRESSIVE )
		ally_setfirepoints( tal, bat2_tal_mid_beach_firepoint_pod )
		ally_addtarget( tal, b2_w2_pirates_pod )
		prt("Tal attack b2 w2")
		b2_w2_target = true
	end

	-- Fight the fourth wave
	if  b2_w2_target and not b2_w3_target then
		ally_addtarget( tal, b2_w3_pirates_pod )	
		b2_w3_target = true
		prt("Tal attack b2 w3")
	end

	-- Return to beach and Fight the fourth wave
	if get_num_alive( b2_w3_pirates_pod ) == 0 and not move_beach then
		ally_setattitude ( tal, ATT_PASSIVE )
		ally_cleartargets( tal )
		ally_clearfirepoints( tal )
		ally_followpathhover( tal, bat2_tal_mid_beach_to_beach_path, 4, 4, 8 )
		move_beach = true
	end
	
	-- Fight the fift wave
	if move_beach and not b2_w4_target then
		play_TAL_BATTLEFIELD_WALKER_vo = true
		ally_setattitude ( tal, ATT_AGGRESSIVE )
		ally_setfirepoints( tal, bat1_tal_beach_firepoints_pod )
		ally_addtarget( tal, b2_w4_pirates_pod )
		prt("Tal attack b2 w4")
		b2_w4_target = true
	end
		
	-- Fight the fifth wave
	if get_num_alive( b2_w4_pirates_pod ) == 0  and not b2_w5_target then
		ally_addtarget( tal, b2_w5_pirates_pod )	
		b2_w5_target = true
		prt("Tal attack b2 w5")
	end
		
			
		
wait()

end
