--Hoolefoid Conversations

----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

--local update_check = nil
local play_lines = false


----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

while true do

-- play lines when ratchet is in small volume

if is_in_volume( get_hero(), NC_with_ratchet) and not play_lines then

		if (SAVE.completed_island_battle) then
		speak_and_wait(NC01_npc_villager, DialogueSpecs.NI_HOOL_CONV_PRE_MORROW1)
		speak_and_wait(NC02_npc_Villager, DialogueSpecs.NI_HOOL_CONV_PRE_MORROW2)
		play_lines = true
		
		elseif (SAVE.obsidian_eye_revealed) then
		speak_and_wait(NC03_npc_villager, DialogueSpecs.NI_HOOL_CONV_AFTER_EYE)
		play_lines = true
		
		elseif (SAVE.scene_lighthouse_view_played) then
		speak_and_wait(NC03_npc_villager, DialogueSpecs.NI_HOOL_CONV)
		play_lines = true
		
		elseif (SAVE.windmill_number == 4) then
		speak_and_wait(NC02_npc_villager, DialogueSpecs.NI_HOOL_CONV_ONE_TURBINE_FIXED4)
		play_lines = true

		elseif (SAVE.windmill_number == 3) then
		speak_and_wait(NC01_npc_villager, DialogueSpecs.NI_HOOL_CONV_ONE_TURBINE_FIXED3)
		play_lines = true
		
		elseif (SAVE.windmill_number == 2) then
		speak_and_wait(NC02_npc_villager, DialogueSpecs.NI_HOOL_CONV_ONE_TURBINE_FIXED2)
		play_lines = true
		
		else
		speak_and_wait(NC03_npc_villager, DialogueSpecs.NI_HOOL_CONV_ONE_TURBINE_FIXED1)
		play_lines = true
		
		end
		
npc_set_path(NC01_npc_villager, NC01_npc_path, NPC_PATROL_PINGPONG)
npc_set_mode(NC01_npc_villager, NPC_MODE_ACTIVE)
npc_set_path(NC02_npc_villager, NC02_npc_path, NPC_PATROL_PINGPONG)
npc_set_mode(NC02_npc_villager, NPC_MODE_ACTIVE)
npc_set_path(NC03_npc_villager, NC03_npc_path, NPC_PATROL_PINGPONG)
npc_set_mode(NC03_npc_villager, NPC_MODE_ACTIVE)

end

-- reset when ratchet leaves the large volume

		if not is_in_volume(get_hero(), NC_large_vol) then
		npc_warp(NC01_npc_villager, NC01_stop)
		npc_warp(NC02_npc_villager, NC02_stop)
		npc_warp(NC03_npc_villager, NC03_stop)
		play_lines = false
		
	end
	
wait()

end
