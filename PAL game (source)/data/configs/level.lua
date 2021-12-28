-----------------------------
-- PARSE LEVEL CONFIG DATA --
-----------------------------
desired_column = nil
default_column = nil

for n,line in ipairs( CONFIG_TABLE ) do

  -- see if we have reached the "Level" line
  if (line[1] == "Level") then
  
    for i,cell in ipairs(line) do
      if i > 3 then
        if (cell == "default") then
          default_column = i
        elseif (cell ~= nil and string.len(cell) > 0 and string.find( level, cell ) ~= nil) then
          desired_column = i
        end
      end
    end
  
  elseif (default_column ~= nil or desired_column ~= nil) then

    local variable = line[2]
    local value = nil

    if (variable == nil or string.len(variable) == 0 or string.find( variable, '[%p%c]+' )) then
      -- invalid variable name
      variable = nil 
    else
      -- determine variable value
      if (desired_column ~= nil) then
        value = line[ desired_column ]
      end
      if ((value == nil or string.len(value) <= 0) and default_column ~= nil) then
        value = line[ default_column ]
      end
      if (value == nil or string.len(value) == 0) then
        value = nil
      end
    end 
       
    -- if everything is valid, execute "config.Level.variable = value"
    if (variable ~= nil and value ~= nil) then
      execute( 'config.Level.' .. variable .. ' = ' .. value .. '; ' );
    end
    
  end
  
end
