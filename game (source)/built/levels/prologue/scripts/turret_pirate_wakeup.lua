



while true do

 -- waking up turret 
if turret_pirate_awake == nil then
	if is_in_volume(get_hero(), trig_opendoortoturret) then
		prt("unobviating turret pirate")

		if door_is_open(boltcrank_door1) then



		    unobviate(hunchback_pirate)
				turret_pirate_awake = true
		end
	end
end

wait()
end

