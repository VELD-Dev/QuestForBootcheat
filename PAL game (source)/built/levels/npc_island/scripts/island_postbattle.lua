-- Controls script for after the NPC Island battlefield



----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

local battle_ending = false
local battle_cleanup = false



----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------

--bring back the band
unobviate( npc_smuggler )
unobviate( npc_mayor )
unobviate( npc_lighthouse )
unobviate( npc_windmill )
unobviate_pod( battle_npcs_pod )
foreach_moby_in_pod(NPC_POD, unobviate)
door_open( water_tunnel_door )
obviate( npc_battle_villager1 )
obviate( npc_battle_villager2 )
obviate( npc_battle_villager3 )
npc_warp( npc_windmill, postbattle_windmill_warp_vol )
npc_warp( npc_lighthouse, postbattle_lighthouse_warp_vol )
npc_warp(npc_mayor, postbattle_mayor_warp_vol)
npc_warp(npc_smuggler, scene_postbattle_smuggler_vol)
activate(npc_smuggler)
activate(npc_mayor)
activate(npc_windmill)
activate(npc_lighthouse)

--it's illegal anyway
if SAVE.completed_island_battle then
	ally_unequipitem(tal, ALLY_ITEM_GUN)
	door_close( beach_door_to_village )
	door_close( beach_door_to_beacon )
end

--turn off green poisonous gas
deactivate(undeadFog1)
deactivate(undeadFog2)
deactivate(undeadFog3)
deactivate(undeadFog4)
deactivate(undeadFog5)
deactivate(undeadFog6)
deactivate(undeadFog7)
deactivate(undeadFog8)
deactivate(undeadFog9)
deactivate(undeadFog10)
deactivate(undeadFog11)
deactivate(undeadFog12)
deactivate(undeadFog13)
deactivate(undeadFog14)
deactivate(undeadFog15)
deactivate(undeadFog16)

door_open( water_tunnel_door )

--unobviate( npc_mayor)

-- Remove the water death from the Battlefield
deactivate( battlefield_water_death_plane )

--if you got the map decoded I'm not playing the tal scenes anymore so I gotta warp her here - bill
if SAVE.scene_postbattle_smuggler_decoded then
	ally_warp(tal, post_battle_tal_warp_vol)
end

----------------------------------------------------------------------------------------------------
-- Gameplay Script 
----------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

while true do
	
	--Trigger smuggler scene
	if is_triggered( npc_smuggler ) then
		untrigger( npc_smuggler )
		queue_scene("scene_postbattle_smuggler")
		wait(0)
	end
	
	--trigger windmill scene
	if is_triggered(npc_windmill) then
		untrigger(npc_windmill)
		queue_scene("scene_postbattle_windmill")
		wait(0)
	end
	
	--trigger lighthouse scene
	if is_triggered(npc_lighthouse) then
		untrigger(npc_lighthouse)
		queue_scene("scene_postbattle_lighthouse")
		wait(0)
	end
	
	--trigger mayor scene
	if is_triggered(npc_mayor) then
		untrigger(npc_mayor)
		queue_scene("scene_postbattle_mayor")
		wait(0)
	end
		
	-- Runs battle ending scene	
	if not battle_ending then
		--victoriousmuisc = true  --variable for music trigger cro 5/13
		prt("stop the battle muisc")
		queue_scene("scene_battle_ending")
		wait()
		battle_ending = true
		victoriousmuisc2 = true --variable for music trigger cro 5/13
	end
	
	
	if not battle_cleanup and not SAVE.scene_postbattle_smuggler_decoded then
		prt("activating Taxi in the Post Battle Script Line 53")
		turret_pirate_fall( battle_turret )	
		hero_warp( get_hero(), post_battle_ratchet_warp_vol )
		
		if SAVE.talwynfree  then
			queue_scene("scene_postbattle_tal_alt")
			wait()		
			queue_scene("scene_postbattle_tal")
			wait()
		else
			queue_scene("scene_postbattle_tal_arrives")
			wait()
			queue_scene("scene_postbattle_tal")
			wait()
		end	
		
		battle_cleanup = true
	
	end
	
  wait()

end



