-----------------------------
-- PARSE ARMOR CONFIG DATA --
-----------------------------

field_row = nil

for n,line in ipairs( CONFIG_TABLE ) do
  
  -- after the field row, everything should be data
  if (field_row ~= nil) then
    id = line[1]
  
    -- loop thru valid fields and assign them
    for i,field in ipairs(field_row) do
      if (i > 1 and field ~= nil and string.len(field) > 0) then
        value = line[i]
        
        -- convert boolean
        if (value == 'TRUE') then value = 'true' end
        if (value == 'FALSE') then value = 'false' end
        
        if (value ~= nil and string.len(value) > 0) then
          execute( 'config.Armor[' .. id .. '].' .. field .. ' = ' .. value .. '; ' );
        end      
      end    
    end
    
  end

  -- wait until we get our first entry on column 1, designates the field row
  if (field_row == nil and line[1] ~= nil and string.len(line[1]) > 0) then
    field_row = line
  end
  
end






