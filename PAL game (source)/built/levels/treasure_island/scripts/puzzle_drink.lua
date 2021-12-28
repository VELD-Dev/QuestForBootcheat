-------------------------------------------------------------------------------
-- FUNCTION DECLARATIONS ------------------------------------------------------
-------------------------------------------------------------------------------

local tank_list =
{
  drink_blue_button,
  drink_yellow_button,
  drink_purple_button,
  drink_red_button,
}

local current_tank_list = nil;

local correct_tank_list = nil;

-- simply returns TRUE if the given tank button is required, FALSE otherwise
function is_required_tank( tank )

  if correct_tank_list == nil then 
    return false
  end

  for k2,v2 in ipairs(correct_tank_list) do
    if v2 == tank then
      return true
    end
  end

  return false
  
end

-- this function determines if ALL the buttons are in their correct state
function is_tank_puzzle_correct()

  -- if we haven't used any tanks yet, then false
  if (current_tank_list == nil) or (correct_tank_list == nil) then
    return false
  end

  -- if we haven't done the right NUMBER of tanks, then false
  if table.getn(correct_tank_list) ~= table.getn(current_tank_list) then
    return false
  end

  -- now make sure the tanks are in the right order
  for k,v in ipairs(correct_tank_list) do
    if (v ~= current_tank_list[k]) then
      return false
    end
  end

  return true;
  
end

-- this function simply tells us if all the right buttons are pressed, but in the wrong order
function is_tank_puzzle_wrong_order()

  -- if we haven't used any tanks yet, then false
  if (current_tank_list == nil) or (correct_tank_list == nil) then
    return false
  end

  -- if we haven't done the right NUMBER of tanks, then false
  if table.getn(correct_tank_list) ~= table.getn(current_tank_list) then
    return false
  end

  -- now make sure the tanks are in the right order
  for k,v in ipairs(current_tank_list) do
    local found = false
    for k2, v2 in ipairs(correct_tank_list) do
      if v2 == v then found = true end
    end
    if not found then
      return false
    end
  end

  return true;

end

-- this function simply tells us if ANY buttons have been pressed
function is_tank_puzzle_attempted()

  return (current_tank_list ~= nil);

end

-- this function just resets the puzzle
function reset_tanks()

  current_tank_list = nil

  for k,v in ipairs(tank_list) do
    button_switch( v, false, true )
  end
  
end

-- this function just activates all the buttons
function empty_tanks()

  for k,v in ipairs(tank_list) do
    button_switch( v, true, true )
  end
  
end

-- this function sets the tanks to their CORRECT setting, just for DEBUG assistance
function correct_tanks()

  for k,v in ipairs(tank_list) do
    button_switch( v, is_required_tank(v), true )
  end
  
end

-- use this to set which tanks are correct
function set_correct_tanks( ... )

  correct_tank_list = arg;
  
end

-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------

-- all tanks initially empty
empty_tanks()

-- setup the correct sequence
-- this is done in another script

-- activate pirate dude
activate( drink_pirate )

while is_in_volume( get_hero(), treasure_island_puzzle_vol ) do

  for k,v in ipairs(tank_list) do
    if button_is_on(v) then
      if (current_tank_list == nil) then
        current_tank_list = { v }
      else
        local already_in = false
        for k2,v2 in ipairs(current_tank_list) do
          if v == v2 then
            already_in = true
          end
        end
        if not already_in then
          table.insert( current_tank_list, v )
        end
      end
    end
  end

  if is_triggered( drink_pirate ) then

    -- show scene where pirate tells you you got it right or wrong
    queue_scene( "scene_drink_pirate" )
    wait()
    
    -- reset the puzzle
    reset_tanks()
  
  end

  wait()
  
end
