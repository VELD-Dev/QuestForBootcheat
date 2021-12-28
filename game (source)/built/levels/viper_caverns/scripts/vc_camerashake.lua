----------------------------------------------------------------------------------------------------
-- Camera Shake Script
----------------------------------------------------------------------------------------------------




	function camera_shake_large()
		camera_shake(get_hero(),3, 10, 4, 0.1, 6, true)
		play_explicit_sound_spec(SoundSpecs.AMB_VC_Rumble, get_hero())
		wait(10)
	end

	function camera_shake_small()
		camera_shake(get_hero(),2, 6, .5,0.2, 3, true)
		play_explicit_sound_spec(SoundSpecs.AMB_VC_Rumble, get_hero())
		wait(30)
	end





----------------------------------------------------------------------------------------------------
-- Main Loop
----------------------------------------------------------------------------------------------------

while true do


	if camera_shake_sequence_active then

		pick_camera_shake = rand_select(camera_shake_large, camera_shake_small)

		pick_camera_shake()

        wait()
        
	else
	
	    wait(4)
	    
	end

end


-- end gameplay, this occurs when the user gets to viper caverns