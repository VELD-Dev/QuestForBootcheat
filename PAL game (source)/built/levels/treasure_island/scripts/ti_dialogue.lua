-- TREAUSRE ISLAND DIALOGUE

while true do
--------------------------------------------------------------------------------
-- line 1 "Darkwater probably built these defenses to keep out anyone but himself."
if SAVE.line1_played == nil then
		if is_in_volume(get_hero(), trig_talwyn_flytohub) then
		wait(2)
		speak_and_wait(talwyn, DialogueSpecs.TI_COVE_DEFENSE)
		speak_and_wait(get_hero(), DialogueSpecs.TI_COVE_DEFENSE_RESPONSE, true) --added 2D true case for Ratchet
		wait(1.5)
		SAVE.line1_played = true
		end
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- line 3 "Ratchet, look! That skull has to be Darkwater’s treasure room!."
if SAVE.line3_played == nil then
		if is_in_volume(get_hero(), checkpoint_vol_hub) then
		wait(1.5)
		speak_and_wait(talwyn, DialogueSpecs.TI_COVE_TREASURE_ROOM)
		speak_and_wait(get_hero(), DialogueSpecs.TI_COVE_ISLAND, true) --added 2D true case for Ratchet
		SAVE.line3_played = true
		end
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- line 5
if SAVE.line5_played == nil then
	if SAVE.puzzle_stage == 1 then
	speak_and_wait(talwyn, DialogueSpecs.TI_TAL_MISC1) --changed to speak cro 5/13
	SAVE.line5_played = true
	end
end

--------------------------------------------------------------------------------
-- line 6
if SAVE.line6_played == nil then
	if SAVE.puzzle_stage == 2 then
	speak_and_wait(talwyn, DialogueSpecs.TI_TAL_MISC2) --changed to speak cro 5/13
	SAVE.line6_played = true
	end
end

--------------------------------------------------------------------------------
-- line 8
if SAVE.line8_played == nil then
if SAVE.puzzle_stage == 1 then
if is_in_volume(get_hero(), trig_dialogue_line8) then
speak_and_wait(talwyn, DialogueSpecs.TI_TAL_MISC4)
SAVE.line8_played = true
end
end
end

--------------------------------------------------------------------------------
-- line 9
if SAVE.meteor_pad_dialogue == true then
speak_and_wait(talwyn, DialogueSpecs.TI_ORGAN_HELP_JUMPPAD)
SAVE.meteor_pad_dialogue = false
end

--------------------------------------------------------------------------------
-- line 10, 11, 12
if SAVE.line10_played == nil then
  if SAVE.darkwater_fleet_revealed == true then
    if is_in_volume(get_hero(), trig_talwyn_walktobeach) then
        if not SAVE.ti_dialogue_scene_smuggler_queued then
          queue_scene("scene_smuggler")
          SAVE.ti_dialogue_scene_smuggler_queued = true
        end
      SAVE.line10_played = true
    end
  end
end
--------------------------------------------------------------------------------
--line 13

if SAVE.line13_played == nil then
  if is_in_volume(get_hero(), trig_shadowpuzzle_camera) then
  speak_and_wait(talwyn, DialogueSpecs.TI_SHADOW_APPROACH)
  SAVE.line13_played = true
	end
end


wait()
end