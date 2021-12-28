-------------------------------------------------------------------------------
-- PIRATE DIALOGUE ------------------------------------------------------------
-------------------------------------------------------------------------------
PirateIntroLine =
{
  text = "Hey! This facility is reserved for Captain Angstrom Jerkwater! Hic! Darkwater! Fix me a drink, and ye may pass!!" ,
  dialog = DialogueSpecs.TI_BREW_OPEN,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateGameInstruction =
{
  text = "It’s simple. I give you the ingredients in an unnecessarily cryptic and bizarre fashion. You step on the dispenser switches in the proper order. Got it?" ,
  dialog = DialogueSpecs.TI_BREW_PLAY_RESPONSE,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateFailDlg1 =
{
  text = "bad mixture response 1!" ,
  dialog = DialogueSpecs.TI_BREW_DRINK_INCORRECT1,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateFailDlg2 =
{
  text = "bad mixture response 2!" ,
  dialog = DialogueSpecs.TI_BREW_DRINK_INCORRECT2,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateFailDlg3 =
{
  text = "bad mixture response 3!" ,
  dialog = DialogueSpecs.TI_BREW_DRINK_INCORRECT3,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateFailDlg4 =
{
  text = "bad mixture response 4!" ,
  dialog = DialogueSpecs.TI_BREW_DRINK_INCORRECT4,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateDlgOrder =
{
  text = "Yer ingredients be fair, but yer order be rotten" ,
  dialog = DialogueSpecs.TI_BREW_DRINK_CORRECT_ORDER_WRONG,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateFirstCorrect =
{
  text = "Slightly bitter aftertaste, proper amount of Snog’s trout...A fine pint, indeed! Well done! Alright, here’s your next drink.",
  dialog = DialogueSpecs.TI_BREW_FIRST_CORRECT,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateSecondCorrect =
{
  text = "Zesty lemon liqueur, proper brain-cell-to-grog-cell ratio...You did it again, sir! You may be Darkwater after all! Alright, here’s your last drink...",
  dialog = DialogueSpecs.TI_BREW_SECOND_CORRECT,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateThirdCorrect =
{
  text = "Hmm...not bad. A little on the sour side, yet the dash of worm stool makes it blissfully reminiscent of a fine Chateau Villasante. You did it, sir! Welcome home! Hic! Allow me to fetch you the steps",
  dialog = DialogueSpecs.TI_BREW_THIRD_CORRECT,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateFirstRiddle = 
{ 
  text = "A bit of the bubbly, a chill to the bone. Top it with a twister, and send a happy pirate home.. (Yellow, Blue, Purple(green))",
	dialog = DialogueSpecs.TI_BREW_FIRST_RESPONSE,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateSecondRiddle =
{
  text = "A dash of a cyclone, a drop of hot fire. A wee bit of bubbly makes an honest man a liar.... (Purple(green), Red, Blue)",
  dialog = DialogueSpecs.TI_BREW_FIRST_CORRECT_RESPONSE,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

PirateThirdRiddle =
{
  text = "A pinch of lubber’s greed, a dash of winter’s sorrow. Top it off with golden sun and bid thee fair good morrow.... (Purple(green), Blue, Yellow)",
  dialog = DialogueSpecs.TI_BREW_SECOND_CORRECT_RESPONSE,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

--------------------------------------------------------------------------------
--RATCHET DIALOGUE
--------------------------------------------------------------------------------

RatResponse1 =
{
  text = "Give me the first drink",
  dialog = DialogueSpecs.TI_BREW_FIRST,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}

RatResponse2 =
{
  text = "How do I play?",
  dialog = DialogueSpecs.TI_BREW_PLAY,
  stance  = AnimRoles.ANIM_ROLE_STAND,
}
-------------------------------------------------------------------------------
-- INITIALIZATION -------------------------------------------------------------
-------------------------------------------------------------------------------

active_hero = get_hero();

-- setup scene
make_actor( drink_pirate );

-- while screen is black, warp the hero and camera
hero_warp( active_hero, drink_herp_warp_pos_1, true )
activate_cam( active_hero, drink_cam_1, true )

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)

-------------------------------------------------------------------------------
-- LOGIC FUNCTIONS ------------------------------------------------------------
-------------------------------------------------------------------------------

function f_intro_sequence()   -- introduction sequence

  actor_speak_and_wait( drink_pirate, PirateIntroLine, true );

  while not SAVE.drink_puzzle_stage do
    choice = scene_show_menu_and_wait( { RatResponse1, RatResponse2 }, false )
    if choice == RatResponse1 then
      SAVE.drink_puzzle_stage = 1
    elseif choice == RatResponse2 then
      actor_speak_and_wait( drink_pirate, PirateGameInstruction, true )
    end
  end
  
end

-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------

-- pause a moment
wait(0.5)

if SAVE.completed_drink_puzzle then

  -- we already finished this puzzle, just do trivial completion

  -- animate pirate pouring/tasting drink
  if is_tank_puzzle_attempted() then
    actor_set_gesture( drink_pirate, AnimRoles.ANIM_ROLE_AGREE );
    wait(4.0) -- wait for anim to finish
  end
  
  SAVE.drink_puzzle_stage = 5
  
elseif is_tank_puzzle_correct() then

  -- correct solution sequence!

  -- animate pirate pouring/tasting drink
  actor_set_gesture( drink_pirate, AnimRoles.ANIM_ROLE_AGREE );
  wait(4.0) -- wait for anim to finish
  
  -- have pirate indicate success
  if SAVE.drink_puzzle_stage == 1 then
    actor_speak_and_wait( drink_pirate, PirateFirstCorrect, true );
  elseif SAVE.drink_puzzle_stage == 2 then
    actor_speak_and_wait( drink_pirate, PirateSecondCorrect, true );
  elseif SAVE.drink_puzzle_stage == 3 then
    actor_speak_and_wait( drink_pirate, PirateThirdCorrect, true );
  end
  
  -- mark success
  SAVE.drink_puzzle_stage = SAVE.drink_puzzle_stage + 1
  request_auto_save()
  
elseif not SAVE.drink_puzzle_stage then

  -- introduction sequence
  f_intro_sequence();
  
elseif return_visit == true and is_tank_puzzle_attempted() then

  -- incorrect solution sequence

  -- animate pirate pouring/tasting drink
  actor_set_gesture( drink_pirate, AnimRoles.ANIM_ROLE_DISAGREE );
  wait(4.0) -- wait for anim to finish

  -- have pirate indicate failure
  if is_tank_puzzle_wrong_order() then
    actor_speak_and_wait( drink_pirate, PirateDlgOrder, true );
  else
	--removed PirateFailDlg4 for bug 2815, they think it implies enemies will attack you 
    actor_speak_and_wait( drink_pirate, rand_select(PirateFailDlg1, PirateFailDlg2, PirateFailDlg3), true );
  end
  
  SAVE.drink_help = SAVE.drink_help + 1
    
end

wait(0.25)

if SAVE.drink_puzzle_stage == 1 then

  actor_speak_and_wait( drink_pirate, PirateFirstRiddle, true );
  set_correct_tanks( drink_yellow_button, drink_blue_button, drink_purple_button )

elseif SAVE.drink_puzzle_stage == 2 then
  
  actor_speak_and_wait( drink_pirate, PirateSecondRiddle, true );
  set_correct_tanks( drink_purple_button, drink_red_button, drink_yellow_button )

elseif SAVE.drink_puzzle_stage == 3 then
  
  actor_speak_and_wait( drink_pirate, PirateThirdRiddle, true );
  set_correct_tanks( drink_purple_button, drink_blue_button, drink_yellow_button )

elseif SAVE.drink_puzzle_stage == 4 then
  
  SAVE.completed_drink_puzzle = true
  wait(0)
  queue_scene("scene_brew_success")
  
end

-------------------------------------------------------------------------------
-- CLEAN UP -------------------------------------------------------------------
-------------------------------------------------------------------------------

-- warp hero off the button again
fade_to_black(0)
fade_from_black(3)
hero_warp( active_hero, drink_herp_warp_pos_2, true )

return_visit = true
