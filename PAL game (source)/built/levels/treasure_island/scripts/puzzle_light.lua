-------------------------------------------------------------------------------
-- FUNCTION DECLARATIONS ------------------------------------------------------
-------------------------------------------------------------------------------

function is_shadow_correct()
  return 
    is_in_volume( light_piece_1, light_puzzle_eye_2 ) and 
    is_in_volume( light_piece_2, light_puzzle_eye_1 ) and 
    is_in_volume( light_piece_3, light_piece_3_vol );
end

-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------

while is_in_volume( get_hero(), treasure_island_puzzle_vol ) do

if not SAVE.completed_light_puzzle == true then

  -- see if we're done yet
  if not SAVE.completed_light_puzzle and is_triggered( light_pirate ) then
    
		speak_and_wait(light_pirate, DialogueSpecs.TI_SHADOW_OPEN)
    --queue_scene("scene_light_pirate")
    untrigger( light_pirate )
    wait()
    
  end

  if is_shadow_correct() then
  --if is_shadow_correct() and is_triggered ( light_pirate ) then
  
  untrigger( light_pirate)
  target_set_targetable(light_piece_1, false)
  target_set_targetable(light_piece_2, false)
  target_set_targetable(light_piece_3, false)
 	speak_and_wait(light_pirate, DialogueSpecs.TI_SHADOW_YES_CHECK_RESPONSE)
  queue_scene( "scene_light_success")
  update_off( light_pirate )
  SAVE.completed_light_puzzle = true
  
  end
  
end
  wait()

end
