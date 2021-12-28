----------------------------------------------------------------------------------------------------
-- Camera Shake Script
----------------------------------------------------------------------------------------------------









----------------------------------------------------------------------------------------------------
-- Main Loop
----------------------------------------------------------------------------------------------------

while (ratchethelpingtalwyn == nil) do
	
	if 	SAVE.cave_in_dialogue_finished == true then
		if caveintriggered == true then
      tal_help_handle = speak( tal, DialogueSpecs.VC_TAL_CALLOVER )
      wait_for_vo( tal_help_handle )
		  tal_help_handle = nil
      wait(10)
		end
	end
	
	wait()
end


-- end gameplay, this occurs when the user gets to viper caverns