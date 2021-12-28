-------------------------------------------------------------------------------
-- TREASURE ISLAND CHECKPOINT SCRIPT -------------------------------------------
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- CHECKPOINT CONDITIONALS
--------------------------------------------------------------------------------

--start dock checkpoint (door not opened)


--start dock checkpoint (door opened)
if is_current_checkpoint(checkpoint_startdock_respawn_dooropened) then

end


--hub checkpoint
if is_current_checkpoint(checkpoint_hub_respawn) then

end
-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
--HUB CHECKPOING
------------------------------------------------------------------------------- 
while true do

if hubcheckpoint == nil then
	if is_in_volume(get_hero(), checkpoint_vol_hub) then 
	checkpoint_volume(checkpoint_hub_respawn)
	prt("checkpoint_hub_active")
	hubcheckpoint = true
	end
end

if hubcheckpoint == true then
if not is_in_volume(get_hero(), checkpoint_vol_hub) then
prt("checkpoint_hub_reset")
hubcheckpoint = nil
end
end


-------------------------------------------------------------------------------
--BREW PUZZLE CHECKPOINT
-------------------------------------------------------------------------------
if brew_puzzle_checkpoint == nil then
if is_in_volume(get_hero(), trig_drink_intro_scene) then
checkpoint_volume(checkpoint_volume_drink_puzzle)
prt("checkpoint_brew_active")
brew_puzzle_checkpoint = true
end
end
if brew_puzzle_checkpoint == true then
if not is_in_volume(get_hero(), trig_drink_intro_scene) then
checkpoint_volume(checkpoint_volume_drink_puzzle)
prt("checkpoint_brew_reset")
brew_puzzle_checkpoint = nil
end
end
-------------------------------------------------------------------------------
--ORGAN PUZZLE CHECKPOINT
-------------------------------------------------------------------------------
if organ_puzzle_checkpoint == nil then
if is_in_volume(get_hero(), trig_organ_intro_scene) then
checkpoint_volume(checkpoint_volume_organ_puzzle)
prt("checkpoint_organ_active")
organ_puzzle_checkpoint = true
end
end
if organ_puzzle_checkpoint == true then
if not is_in_volume(get_hero(), trig_organ_intro_scene) then
checkpoint_volume(checkpoint_volume_organ_puzzle)
prt("checkpoint_organ_reset")
organ_puzzle_checkpoint = nil
end
end
-------------------------------------------------------------------------------
--LIGHT PUZZLE CHECKPOINT
-------------------------------------------------------------------------------
if light_puzzle_checkpoint == nil then
if is_in_volume(get_hero(), trig_light_intro_scene) then
checkpoint_volume(checkpoint_volume_light_puzzle)
prt("checkpoint_light_active")
light_puzzle_checkpoint = true
end
end
if light_puzzle_checkpoint == true then
if not is_in_volume(get_hero(), trig_light_intro_scene) then
checkpoint_volume(checkpoint_volume_light_puzzle)
prt("checkpoint_light_reset")
light_puzzle_checkpoint = nil
end
end

--------------------------------
--vc2 exit - By Bill
-------------------------------
if is_in_volume(get_hero(), checkpoint_exit_vc2) and SAVE.completed_treasure_island then
  --prt("vc2 exit checkpoint")
  checkpoint_volume(checkpoint_exit_vc2_respawn_vol)
end


wait()

end


