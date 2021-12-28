----------------------------------
-- PARSE DIFFICULTY CONFIG DATA --
----------------------------------

evaluation_step = 0
-- evaluation_step 0 - look for start
-- evaluation_step 1 - global
-- evaluation_step 2 - segment

for n,line in ipairs( CONFIG_TABLE ) do
  if (line[1] == "Global") then
    evaluation_step = 1
  elseif (evaluation_step == 1) then
    if (line[1] == "Level") then
      evaluation_step = 2
    else
      execute( 'config.Difficulty.' .. line[2] .. ' = ' .. line[3] .. '; ' )
    end
  elseif (evaluation_step == 2) then
    if (line[1] == "Segment") then
      segment_index = line[2]
    elseif (line[2] ~= nil) then
      variable = line[2]
      for i,cell in ipairs(line) do
        if (i >= 3 and cell ~= nil and cell ~= '') then
          level_index = i - 3
          if(variable == "ZoneName") then
            execute( 'config.Difficulty.Level[' .. level_index .. '].Segment[' .. segment_index .. '].' .. variable .. ' = "' .. cell .. '"; ' )
          else
            execute( 'config.Difficulty.Level[' .. level_index .. '].Segment[' .. segment_index .. '].' .. variable .. ' = ' .. cell .. '; ' )
          end
        end
      end
    end
  end
end

