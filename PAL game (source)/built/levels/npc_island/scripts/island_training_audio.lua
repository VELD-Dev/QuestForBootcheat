-- Small script to help with Choreo of the wakeuup audio.


----------------------------------------------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------------------------------------------

wake_up_vo = false
train_grav_vo = false
train_grav_clank_vo = false
help_wrench_vo = false



----------------------------------------------------------------------------------------------------
-- Initialization 
----------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

while true do

	-- first exchange on the beach
	if play_TRAIN_WAKEUP_vo and not wake_up_vo then 
			speak_and_wait( tal, DialogueSpecs.NI_TRAIN_WAKEUP ) --changed to speak and wait 3D cro 5/1
			speak( get_hero(), DialogueSpecs.NI_TRAIN_WAKEUP_RESPONSE_ALT, true )	--added 2D true case cro 5/1	
			wake_up_vo = true
	end
	
	-- 	Talk to Ratchet about the Grav Ramps
	if is_in_volume( get_hero(), training_tal_vo_grav) and not train_grav_vo then
		speak( tal, DialogueSpecs.NI_TRAIN_GRAV ) --removed 2D true case cro 5/1
--		helptext( L01_HELP_GPLAY_GRAVITYBOOTS, "Your Gravity Boots allow you to walk on special metallic surfaces.", 5, true)
		train_grav_vo = true
	end

-- Conversations during the Grav Ramp
  if is_in_volume( get_hero(), training_ratchet_vo_grav_vol ) and not train_grav_clank_vo then
		speak_and_wait( get_hero(), DialogueSpecs.NI_TRAIN_GRAV_CLANK, true )
		speak_and_wait( tal, DialogueSpecs.NI_TRAIN_GRAV_TRICKED ) --removed 2D true case cro 5/1
		--scene_speak( get_hero(), DialogueSpecs.NI_TRAIN_GRAV_TRICKED_RESPONSE )
		speak(get_hero(), DialogueSpecs.NI_TRAIN_GRAV_TRICKED_RESPONSE, true)
		train_grav_clank_vo = true
	end

	
-- Training for the Wrench Manipulation	
	if is_in_volume( get_hero(), training_tal_vo_wrench ) and not help_wrench_vo then		
		speak( tal, DialogueSpecs.NI_TRAIN_NEW_WRENCH_SLIDING ) --changed to speak and wait 3D cro 5/1
		help_wrench_vo = true
	end


wait()

end
