--- Stores all checkpoint and restore scripts.

while true do

		--- Beach / Start of Battlefield 
		if is_in_volume( get_hero(), checkpoint_beach_vol  ) then
		  if SAVE.scene_battle_mayor_intro then
			SAVE.island_checkpoints_number = 0
				if not SAVE.island_battle1_complete then
					checkpoint_volume( battle_start_hero_warp_vol )
				else
					checkpoint_volume (battle_midpoint_ratchet_respawn_vol )
				end
		  else
			SAVE.island_checkpoints_number = 1
			checkpoint_volume( checkpoint_beach_respawn_vol )
		  end
		end

		--- Windmill #1 Checkpoint	
		if is_in_volume( get_hero(), checkpoint_wmill1_vol ) then
			SAVE.island_checkpoints_number = 2
			checkpoint_volume( wmill1_teleport_dest_vol )
--			prt( "Windmill1 Checkpoint" )
		end

		--- Windmill #2 Checkpoint			
		if is_in_volume( get_hero(), checkpoint_wmill2_vol ) then
			SAVE.island_checkpoints_number = 3
			checkpoint_volume( wmill2_teleport_dest_vol )
--			prt( "Windmill2 Checkpoint" )
		end

		--- Windmill #3 Checkpoint			
		if is_in_volume( get_hero(), checkpoint_wmill3_vol ) then
			SAVE.island_checkpoints_number = 4
			checkpoint_volume( wmill3_teleport_dest_vol )
--			prt( "Windmill3 Checkpoint" )
		end

		--- Windmill #4 Checkpoint		
		if is_in_volume( get_hero(), checkpoint_wmill4_vol ) then
			SAVE.island_checkpoints_number = 5
			checkpoint_volume( wmill4_teleport_dest_vol )
--			prt( "Windmill4 Checkpoint" )
		end

		--- Windmill #5 Checkpoint		
		if is_in_volume( get_hero(), checkpoint_wmill5_vol )  then
			SAVE.island_checkpoints_number = 6
			checkpoint_volume( wmill5_teleport_dest_vol )
--			prt( "Windmill5 Checkpoint" )
		end
		
		-- Obsidian Eye Checkpoint
		if is_in_volume( get_hero(), checkpoint_obsidian_eye_vol )  then
			SAVE.island_checkpoints_number = 7
			checkpoint_volume( checkpoint_obsidian_eye_respawn_vol )
		end
		
	--- Beacon Checkpoint		
		if is_in_volume( get_hero(), checkpoint_beacon_vol )  then
			SAVE.island_checkpoints_number = 8
			checkpoint_volume( lighthouse_warp_vol )
--			prt( "Beacon Checkpoint" )
		end
		
		--Village Checkpoint		
		if is_in_volume( get_hero(), checkpoint_village_vol )  then
			SAVE.island_checkpoints_number = 9
			checkpoint_volume( checkpoint_village_respawn_vol ) 
		end	
		
		--grindrail checkpoint
		if is_in_volume( get_hero(), checkpoint_grindrail_vol )  then
			SAVE.island_checkpoints_number = 10
			checkpoint_volume( checkpoint_grindrail_respawn_vol ) 
		end	
		
		
			
wait()

end
	