
function fail_response_1()
announce(DialogueSpecs.TI_ORGAN_RANDOM_SONG_INCORRECT1)
end

function fail_response_2()
announce(DialogueSpecs.TI_ORGAN_RANDOM_SONG_INCORRECT2)
end

function fail_response_3()
announce(DialogueSpecs.TI_ORGAN_RANDOM_SONG_INCORRECT3)
end

function fail_response_4()
announce(DialogueSpecs.TI_ORGAN_RANDOM_SONG_INCORRECT4)
end

function fail_response_5()
announce(DialogueSpecs.TI_ORGAN_RANDOM_SONG_INCORRECT5)
end

function fail_response_6()
announce(DialogueSpecs.TI_ORGAN_RANDOM_SONG_INCORRECT6)
end


-- this is the list of pedals, from note #1 up, in order
local organ_puzzle_pedals =
{
  organ_pedal_1,
  organ_pedal_2,
  organ_pedal_3,
  organ_pedal_4,
}

-- this is the CORRECT sequence of notes, note numbers correspond to array order above, any length is okay
local correct_note_sequence = nil

-- this function is TRUE if ALL the correct notes have been chosen
function is_sequence_right()

  if note_sequence == nil or correct_note_sequence == nil then
    return false
  end

  seq_len = table.getn( note_sequence )
  cor_len = table.getn( correct_note_sequence )
  
  if seq_len ~= cor_len then
    return false
  end
  
  for i=1,seq_len do
    if note_sequence[i] ~= correct_note_sequence[i] then
      return false
    end
  end
  
  return true

end

-- this function is TRUE if the WRONG note has been played, its FALSE if the notes SO FAR are correct but incomplete
function is_sequence_wrong()

  if note_sequence == nil or correct_note_sequence == nil then
    return false
  end

  seq_len = table.getn( note_sequence )
  cor_len = table.getn( correct_note_sequence )
  
  if seq_len > cor_len then
    return true
  end
  
  for i=1,seq_len do
    if note_sequence[i] ~= correct_note_sequence[i] then
      return true
    end
  end
  
  return false

end

function reset_notes()
  note_sequence = nil
end

function add_note( value )
  if type(value) == 'number' then
    if note_sequence == nil or table.getn(note_sequence) > 100 then
      note_sequence = { }
    end
    table.insert( note_sequence, value )
  end
end

function set_correct_sequence( ... )
  correct_note_sequence = arg;
end

function play_demo_sequence( delay )
  for k,v in ipairs( correct_note_sequence ) do
    trigger( organ_puzzle_pedals[v] )
    if delay ~= nil then
      wait( delay )
    else
      while is_triggered( organ_puzzle_pedals[v] ) do wait() end
    end
  end
end

-- ============================================================================

sequence_done = false
camera_active = false

--set_correct_sequence( 1,2,3,4,1 )

while is_in_volume( get_hero(), treasure_island_puzzle_vol ) do

  
	if SAVE.has_spoken_to_organ_pirate == true then
	
  -- detect when notes are triggered and add new note to the list
  for k,v in ipairs(organ_puzzle_pedals) do
    if is_triggered(v) then
      -- if the pedal is triggered, add the note, then wait for the note to finish before continuing
      add_note(k)
      while is_triggered(v) do wait() end
    end    
  end
  
  -- handle organ puzzle camera activation/deactivation
  if is_in_volume( get_hero(), organ_cam_volume ) and not camera_active then
    activate_cam( get_hero(), organ_cam )
    camera_active = true
    mobyspawner_clear( SPAWNER_PIPEORGAN_FAIL )
  end
  
  if not is_in_volume( get_hero(), organ_cam_volume ) and camera_active then
    deactivate_cam( get_hero(), organ_cam )
    camera_active = false
  end
  
  -- if hero jumps off the organ ...
  if not is_in_volume( get_hero(), organ_cam_volume ) and note_sequence ~= nil and correct_note_sequence ~= nil then
  
    --wait(0.5)
  
    if not SAVE.completed_organ_puzzle then
      
      if is_sequence_right() then
        queue_scene( "scene_organ_pirate" );
        wait();
      else
		mobyspawner_spawn( SPAWNER_PIPEORGAN_FAIL, 3 )
		   
        pick_negative_response = rand_select(fail_response_1, fail_response_2, fail_response_3, fail_response_4, fail_response_5, fail_response_6)
        
        pick_negative_response()
        
        SAVE.organ_help = SAVE.organ_help + 1
        
        wait()
				
        
      end
  
    end
    
    -- reset the puzzle
    reset_notes()

  end

  if not SAVE.completed_organ_puzzle then

      if is_sequence_right() then
        queue_scene( "scene_organ_pirate" );
        wait();
      end

    end

 
	if is_triggered(organ_pirate) then
	
	queue_scene("scene_organ_pirate")
	wait()
	
	end
	
end	
  wait()

end

