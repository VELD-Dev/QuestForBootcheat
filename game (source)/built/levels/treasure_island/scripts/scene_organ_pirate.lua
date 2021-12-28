-------------------------------------------------------------------------------
-- PIRATE DIALOGUE ------------------------------------------------------------
-------------------------------------------------------------------------------

PirateDlg1 = 
{ 
  text = "That was perfect!  Good job, pirate!" ,
  stance  = AnimRoles.ANIM_ROLE_STAND,
  gesture = { 0.0, AnimRoles.ANIM_ROLE_LOOK_AGREE },    
}

PirateDlg2 = 
{ 
  text = "That sounded horrible, you're no pirate.",
  stance  = AnimRoles.ANIM_ROLE_STAND,
  gesture = { 0.0, AnimRoles.ANIM_ROLE_LOOK_DISAGREE },    
}

PirateDlg3 = 
{ 
  text = "You need to play a pirate tune to prove you're a pirate. (1,2,3,4,1)",
  dialog = DialogueSpecs.TI_ORGAN_OPEN,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateDlg4 = 
{ 
  text = "Yarrr... play the tune to prove yourself true!!",
  dialog = DialogueSpecs.TI_ORGAN_OPEN,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateDlg5 =
{
  text = "Yarrr... Have you not played the tune yet... give her another try, Mate!",
  dialog = DialogueSpecs.TI_ORGAN_TUNE_AGAIN_RESPONSE3,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateDlg6 =
{
  text = "That be pretty good, but only Darkwater himself could master the second verse...listen closely.",
  dialog = DialogueSpecs.TI_ORGAN_SONG_FIRST_PART_CORRECT,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateDlg7 =
{
  text = "Impressive, but lets see if you can match the third verse.",
  dialog = DialogueSpecs.TI_ORGAN_SONG_SECOND_PART_CORRECT,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateDlg8 =
{
  text = "I bow to ye...master Darkwater.  May the lost souls guide you to yer booty.",
  dialog = DialogueSpecs.TI_ORGAN_SONG_THIRD_PART_CORRECT,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateDlg9 =
{
  text = "Back for more....well maybe we have a little something special for you still",
  dialog = DialogueSpecs.TI_ORGAN_TUNE_AGAIN_RESPONSE2,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

-------------------------------------------------------------------------------
-- INITIALIZATION -------------------------------------------------------------
-------------------------------------------------------------------------------

active_hero = get_hero();

-- setup scene
make_actor( organ_pirate );

-- while screen is black, warp the hero and camera
hero_warp( active_hero, organ_herp_warp_pos_1, true )
activate_cam( active_hero, organ_cam_2, true )

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)  

-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------

if is_sequence_right() then

  -- correct solution sequence!

  reset_notes()

  -- have pirate indicate success
  --actor_speak_and_wait( organ_pirate, PirateDlg1 );
  
  if SAVE.organ_puzzle_stage == 1 then

		SAVE.organ_puzzle_stage = 2
		set_correct_sequence(1, 2, 4, 1, 2, 3)
		actor_speak_and_wait( organ_pirate, PirateDlg6, true );
		activate_cam(get_hero(), organ_cam_show_organ)
		wait(1.2)
  	play_demo_sequence(1)

	elseif SAVE.organ_puzzle_stage == 2 then
	
	  SAVE.organ_puzzle_stage = 3
		set_correct_sequence(1, 4, 3, 2, 1, 4)
		actor_speak_and_wait( organ_pirate, PirateDlg7, true );
		activate_cam(get_hero(), organ_cam_show_organ)
		wait(1.2)
  	play_demo_sequence(1)
  	
  elseif SAVE.organ_puzzle_stage == 3 then

	  SAVE.organ_puzzle_stage = 4

		actor_speak_and_wait( organ_pirate, PirateDlg8, true );
  	--activate_cam(get_hero(), organ_cam_show_organ)
  	--play_demo_sequence(1)
    SAVE.completed_organ_puzzle = true
    request_auto_save()
    
  elseif SAVE.organ_puzzle_stage == 5 then
  
    debug_message("BONUS ROUND WIN!!", 3)
    Save.organ_puzzle_stage = 6
    request_auto_save()
    SAVE.bonus_round_active = false
    
	end

elseif not SAVE.organ_puzzle_stage then

  reset_notes()

  -- introduction sequence
  actor_speak_and_wait( organ_pirate, PirateDlg4, true );
  set_correct_sequence(1, 2, 3, 4, 1)
  activate_cam(get_hero(), organ_cam_show_organ)
  wait(1.2)
  play_demo_sequence(1)
  

  -- mark intro complete
  SAVE.organ_puzzle_stage = 1
  
elseif not SAVE.completed_organ_puzzle then

  reset_notes()

  if SAVE.organ_puzzle_stage == 1 then

	  set_correct_sequence(1, 2, 3, 4, 1)

	elseif SAVE.organ_puzzle_stage == 2 then
	
		set_correct_sequence(1, 2, 4, 1, 2, 3)
  	
  elseif SAVE.organ_puzzle_stage == 3 then

		set_correct_sequence(1, 4, 3, 2, 1, 4)
	
	end

  actor_speak_and_wait( organ_pirate, PirateDlg5, true );
  activate_cam(get_hero(), organ_cam_show_organ)
  wait(1.2)
  play_demo_sequence(1)
  
  -- incorrect solution sequence (post intro speech)

elseif SAVE.bonus_round_active == true then
	--[[
  reset_notes()

	debug_message("BONUS ROUND ACTIVE", 3)
	actor_speak_and_wait( organ_pirate, PirateDlg9 );
	set_correct_sequence(1,1)
	activate_cam(get_hero(), organ_cam_show_organ)
	wait(1.2)
	play_demo_sequence(1)
	SAVE.organ_puzzle_stage = 5
	--]]
end

-------------------------------------------------------------------------------
-- CLEAN UP -------------------------------------------------------------------
-------------------------------------------------------------------------------

-- warp hero off the button again


if SAVE.organ_puzzle_success_flythrough == nil then

	if SAVE.completed_organ_puzzle == true then
	SAVE.organ_puzzle_success_flythrough = true
	queue_scene("scene_organ_success")
	wait(0)
	fade_from_black(3)
	end

end



if SAVE.meteor_pad_dialogue == nil then
SAVE.meteor_pad_dialogue = true
end
	
fade_to_black(0)
fade_from_black(3)
hero_warp( active_hero, organ_herp_warp_pos_2, true )	
	