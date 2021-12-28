----------------------------------
-- PARSE WEAPON MOD CONFIG DATA --
----------------------------------

weapontype = nil;
 
for n,line in ipairs( CONFIG_TABLE ) do

  -- see if we have moved onto a new variable
  if ((line[1] ~= nil) and (string.len(line[1]) > 0)) then
  
    weapontype = line[1]
    if (string.find( weapontype, '[%p%c]+' )) then
      weapontype = nil; -- invalid weapon type
    end
    
  -- if the second column is not nil, then we are defining config values for the variable set above
  elseif (line[2] ~= nil and string.len(line[2]) > 0 and weapontype ~= nil) then

    local index = line[2];
    local type  = line[3];
    local dtype = line[4];
    local value = line[5];
    local cost  = line[6];
    local name  = line[7];
    local desc  = line[8];
    
    -- validate values
    
    -- modify value based on percent boolean
    local percent = (dtype == "PERCENT");
    if (percent) then
      value = value * 0.01;
    end
    
    if (type ~= nil and string.len(type) > 0 and index ~= nil and tonumber(index) ~= nil) then
    
      -- config.weapontype.Mods[index].Type = type
      execute( 'config.' .. weapontype .. '.Mods[' .. tonumber(index) .. '].Type = ' .. type .. '; ' );
      
      -- config.weapontype.Mods[index].IsPercent = percent
      if percent then
        execute( 'config.' .. weapontype .. '.Mods[' .. tonumber(index) .. '].IsPercent = 1; ' );
      else
        execute( 'config.' .. weapontype .. '.Mods[' .. tonumber(index) .. '].IsPercent = 0; ' );
      end
      
      -- config.weapontype.Mods[index].Value = value
      if value ~= nil and string.len(value) > 0 then
        execute( 'config.' .. weapontype .. '.Mods[' .. tonumber(index) .. '].Value = ' .. value .. '; ' );
      end
      
      -- config.weapontype.Mods[index].Cost = cost
      if cost ~= nil and string.len(cost) > 0 then
        execute( 'config.' .. weapontype .. '.Mods[' .. tonumber(index) .. '].Cost = ' .. cost .. '; ' );
      end
      
      -- config.weapontype.Mods[index].NameTag = name
      if name ~= nil and string.len(name) > 0 then
        execute( 'config.' .. weapontype .. '.Mods[' .. tonumber(index) .. '].NameTag = ' .. name .. '; ' );
      end
      
      -- config.weapontype.Mods[index].DescTag = desc
      if desc ~= nil and string.len(desc) > 0 then
        execute( 'config.' .. weapontype .. '.Mods[' .. tonumber(index) .. '].DescTag = ' .. desc .. '; ' );
      end
      
      -- config.weapontype.NumMods = index+1
      execute( 'config.' .. weapontype .. '.NumMods = ' .. (index+1) .. '; ' );
      
    end
    
  end
  
end
