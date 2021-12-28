-------------------------------------------------------------------------------
-- INITIALIZATION -------------------------------------------------------------
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------


  
while not SAVE.battlefield_finished == true do

	if is_alive(ti_battlefield_skullwalker) then
	prt("lightning flash")
	lightning( lightningController, walker_crash_volume_source1)
	end
	
	wait(.5)
	
  if is_alive(ti_battlefield_skullwalker) then
	lightning( lightningController, light_puzzle_success_look_volume)
	end
	
	wait(1)
	
  if is_alive(ti_battlefield_skullwalker) then
	lightning( lightningController, volume17)
	end
	
	wait(3)

wait()
  
end


