----------------------------------------------------------------------------------------------------
-- Global Functions
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- get_pod_members_in_area
--   pod  - pod to check
--   area - area to check pod against
--
--  this special function returns a table that can you can iterate through so 
--  for example you can get all the pod members in a volume and iterate through killing them
----------------------------------------------------------------------------------------------------
function get_pod_members_in_area(pod, area)

  -- initialize local variables
	local members = {};
	local index = 1;
	
  -- get first moby in pod
	nomad = pod:get_first();

  -- loop through entire pod
	while (nomad:is_valid()) do

    -- if moby is in area add to members table
	  if (is_in_area(nomad, area)) then
		  members[index] = nomad;
	  end

    -- get next moby in the pod
	  nomad = pod:get_next();
	end
	
  -- return table of mobies in area
	return members;

end

----------------------------------------------------------------------------------------------------
-- print_save_table
--  prints the save table
----------------------------------------------------------------------------------------------------
function print_save_table() 
  for k in pairs(SAVE) do print (k .. " = " .. tostring(SAVE[k])) end
end
