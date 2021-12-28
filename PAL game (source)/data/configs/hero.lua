----------------------------
-- PARSE HERO CONFIG DATA --
----------------------------

col_map = nil
row_num = 0

for n,line in ipairs( CONFIG_TABLE ) do

  if (line[1] == "Hero") then
  
    col_map = line;
  
  elseif (col_map) then

    if (line[2] ~= nil and string.len(line[2]) > 0) then

      for i,cell in ipairs(line) do
        if (i > 1) then
          variable = col_map[i];
          value = line[i];
          if (variable ~= nil and value ~= nil and (string.len(variable) > 0) and (string.len(value) > 0)) then
            execute( 'config.Hero.' .. variable .. '[' .. row_num .. '] = ' .. value .. '; ' ); -- index 1 in LUA is index 0 in C++
          end
        end
      end
    
      row_num = row_num + 1
    
    end
    
  end
  
end
