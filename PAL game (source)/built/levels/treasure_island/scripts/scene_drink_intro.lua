-------------------------------------------------------------------------------
-- DRINK PUZZLE INTRO FLYBY -------------------------------------------------------------
-------------------------------------------------------------------------------

function wait_for_cam( hero )
  wait(0.0)
  while not is_cam_done(hero) do wait(0.0) end
end
-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------


  show_location(L02_PLACE_GPLAY_BREWPUZZLE, 5)
	activate_cam(get_hero(), cam_drink_intro_flyby)
	wait_for_cam( get_hero(), cam_drink_intro_flyby)
	SAVE.drink_intro_complete = true
	request_auto_save()
	fade_to_black(0)
