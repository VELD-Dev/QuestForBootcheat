---------------------------
-- PARSE HAZARD CONFIG DATA --
---------------------------

desired_column = nil
default_column = nil

for n,line in ipairs( CONFIG_TABLE ) do

  -- see if we have moved onto a new variable
  if ((line[1] ~= nil) and (string.len(line[1]) > 0)) then
  
    configtype = line[1]

    -- if we found the SPECIAL case configtype LEVEL, then read the level to column mapping
    if (configtype == "LEVEL") then
      for i,cell in ipairs(line) do
        if i > 3 then
          if (cell == "default") then
            default_column = i
          elseif (cell ~= nil and string.len(cell) > 0 and string.find( level, cell ) ~= nil) then
            desired_column = i
          end
        end
      end
      if (default_column == nil) then
        default_column = table.getn(line) + 1
      end
      configtype = nil; -- 'LEVEL' is not a real config type
      
    elseif (string.find( configtype, '[%p%c]+' )) then
      configtype = nil; -- invalid configtype
    end
    
  -- if the second column is not nil, then we are defining config values for the variable set above
  elseif (line[2] ~= nil and string.len(line[2]) > 0 and configtype ~= nil) then

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
       
    -- if everything is valid, execute "config.configtype.variable = value"
    if (variable ~= nil and value ~= nil) then
      execute( 'config.' .. configtype .. '.' .. variable .. ' = ' .. value .. '; ' );
    end
    
  end
  
end
