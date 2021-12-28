-- All Help messages used on NPC Island

----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

tal_opening_vo = false
tal_flank_vo  = false
tal_niceshot_vo = false
tal_fallback_vo = false
tal_through_vo  = false
tal_skullintro_vo = false
tal_down_vo = false
tal_walker_vo =  false

----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

while true do

--------------------------
-- Battle #1
--------------------------
	
	-- Start of battle line for Tal
	if play_TAL_BATTLEFIELD_OPENING_vo and not tal_opening_vo then
		announce_and_wait( DialogueSpecs.NI_TAL_BATTLEFIELD_OPENING )
		tal_opening_vo = true
	end

	-- They're after the Obsidian Eye
	if play_TAL_BATTLEFIELD_EYE_vo	and not tal_eye_vo then
		wait(3.0)
		tal_eye_vo = true
	end
	
	-- They're flanking - After third wave has been started
	if play_TAL_BATTLEFIELD_FLANK_vo and not tal_flank_vo then
		wait(4.0)
		announce( DialogueSpecs.NI_TAL_BATTLEFIELD_FLANK )
		tal_flank_vo = true
	end

	-- Nice shot Ratchet!
	if play_TAL_BATTLEFIELD_NICESHOT_vo and not tal_niceshot_vo then
		announce( DialogueSpecs.NI_TAL_BATTLEFIELD_NICESHOT )
		tal_niceshot_vo = true
	end
	
	
--------------------------
-- Battle #2
--------------------------
	
	-- Fall back to the OB Eye Door
	if play_TAL_BATTLEFIELD_FALLBACK_vo and not tal_fallback_vo then
		wait(5.0)
		announce( DialogueSpecs.NI_TAL_BATTLEFIELD_FALLBACK )
		tal_fallback_vo = true
	end

   -- Don't let them through
	if play_TAL_BATTLEFIELD_THROUGH_vo and not tal_through_vo then
		wait(3.0)
		announce( DialogueSpecs.NI_TAL_BATTLEFIELD_THROUGH )
		tal_through_vo = true
	end
	
	-- intro of the Skull Walker
	if play_TAL_BATTLEFIELD_SKULLINTRO_vo and not tal_skullintro_vo then
		wait(5.0)
		announce( DialogueSpecs.NI_TAL_BATTLEFIELD_SKULLINTRO )
		tal_skullintro_vo = true
	end
	
	-- There's one down!
	if play_TAL_BATTLEFIELD_DOWN_vo and not tal_down_vo then
		announce( DialogueSpecs.NI_TAL_BATTLEFIELD_DOWN )	
		tal_down_vo = true
	end
	
wait()

end

