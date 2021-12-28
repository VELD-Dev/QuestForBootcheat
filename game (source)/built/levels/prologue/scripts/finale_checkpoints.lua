--- Stores all checkpoint and restore scripts.

while true do

		--- End of intro taxi ride checkpoint
		if is_in_volume( get_hero(), reached_start_position_vol ) then
--			prt("In here!")
			checkpoint_volume( ratchet_warp_finale_start_vol )
--			prt( "End of Taxi Checkpoint" )
		end


		--- Start of Darkwater fight checkpoint
		if is_in_volume( get_hero(), darkwater_trigger_vol  ) and not SAVE.slag_fight2_complete then
			checkpoint_volume( darkwaters_ship_checkpoint_respawn_vol )
--			prt( "Start of Darkwater fight checkpoint" )
		end

--[[
		--- Slags West ship checkpoint
		if is_in_volume( get_hero(), slag_west_ship_topdeck_vol ) then
			checkpoint_volume( slag_west_ship_checkpoint_respawn_vol )
--			prt( "Slags East ship checkpoint" )
		end
--]]

		--- Slags East ship checkpoint
		if is_in_volume( get_hero(), slag_east_ship_cargo_door_trig_vol ) 
		and not is_current_checkpoint(defeated_slag_east_ship_checkpoint_respawn_vol) then
			checkpoint_volume( slag_east_ship_checkpoint_respawn_vol )
--			prt( "Slags East ship checkpoint" )
		end
		
		if SAVE.slag_fight2_complete and not SAVE.stop_spamming_darkwater_checkpoint then		
			checkpoint_volume( defeated_slag_east_ship_checkpoint_respawn_vol )
--			prt( "Deafeated Slags East ship checkpoint" )
		end

		--- Start of barge traversal checkpoint
		if is_in_volume( get_hero(), barge_traversal_checkpoint_vol ) then
			checkpoint_volume( barge_traversal_checkpoint_respawn_vol )
--			prt( "Start of barge traversal checkpoint" )
		end


		--- Start of Darkwater fight checkpoint
		if is_in_volume( get_hero(), darkwater_trigger_vol  ) and SAVE.slag_fight2_complete then
			checkpoint_volume( darkwaters_ship_checkpoint_respawn_vol )
--			prt( "2nd Darkwater fight checkpoint" )
		end

	
wait()

end
	