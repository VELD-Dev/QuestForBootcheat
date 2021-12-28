------------------------------
-- PARSE WEAPON CONFIG DATA --
------------------------------

weapontype = nil;

for n,line in ipairs( CONFIG_TABLE ) do

  -- see if we have moved onto a new variable
  if ((line[1] ~= nil) and (string.len(line[1]) > 0)) then
  
    weapontype = line[1]
    
    -- validate the weapon type string
    if (string.find( weapontype, '[%p%c]+' )) then
      weapontype = nil; -- invalid weapon type
    end

    -- reset our max level tracker
    max_level = 0;
    
  -- if the second column is not nil, then we are defining config values for the variable set above
  elseif (line[2] ~= nil and string.len(line[2]) > 0 and weapontype ~= nil) then

    local variable = line[2]
    
    if (variable == nil or string.len(variable) == 0 or string.find( variable, '[%p%c]+' )) then
      -- invalid variable name
      variable = nil 
    else
      -- parse weapon level entries
      for c,value in ipairs( line ) do
        if (c > 3 and c < (num_weapon_levels+4)) then
        
          -- if everything is valid, execute "config.weapontype.variable[level] = value"
          if (value ~= nil and string.len(value) > 0) then
          
            level = (c-4);
          
            execute( 'config.' .. weapontype .. '.' .. variable .. '[' .. level .. '] = ' .. value .. '; ' ); -- index 1 in LUA is index 0 in C++
            
            if (level > max_level) then
              max_level = level;
            end
                        
          end
          
        end
        
      end -- end for loop
    
      -- set the max level
      execute( 'config.' .. weapontype .. '.NumLevels = ' .. max_level );
      
    end 
    
  end
  
end
