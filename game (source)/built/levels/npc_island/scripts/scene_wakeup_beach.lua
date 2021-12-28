-- Controls Tal talking to Ratchet when he wakes up on the Beach at the start of NPC Island

-----------------------------------------------------------------------
-- TAL AND RATCHET RESPONSES ---------------------------------------------------
-----------------------------------------------------------------------

TalOpening =
{
  -- Tal's initial opening line
  dialog =  DialogueSpecs.NI_TRAIN_WAKEUP,
  text    = "TEMP: Tal: Are you okay Ratchet? You hit your head pretty hard.",
  stance  = AnimRoles.ANIM_ROLE_STAND,
  target  = get_hero(),
  gesture = 
  {
--    0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
--    0.5,    AnimRoles.ANIM_ROLE_FIST_LEFT,
--    1.0,    AnimRoles.ANIM_ROLE_REACH_LEFT,
--   1.5,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
--    2.5,    AnimRoles.ANIM_ROLE_AGREE,
--    3.0,    AnimRoles.ANIM_ROLE_LOOK_AROUND,    
  }
}

RatchetReply =
{
  dialog =  DialogueSpecs.NI_TRAIN_WAKEUP_RESPONSE_ALT,
  text = "TEMP: Ratchet: Remind me to never audition for a position as a Lombax cannon ball.",
  stance = AnimRoles.ANIM_ROLE_STAND,
  target  = get_hero(),
  gesture = 
  {
 --   0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

--[[
TalExplore = 
{

  text = "TEMP: Ratchet: It reminded me of the time Clank and I….sigh.",
  stance = AnimRoles.ANIM_ROLE_STAND,
  target  = get_hero(),
  gesture = 
  {
 --   0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

TalDig2 =
{

  text = "TEMP: Tal: Come'n Ratchet. Let's take a look around.",
  stance = AnimRoles.ANIM_ROLE_STAND,
  target  = get_hero(),
  gesture = 
  {
 --   0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}
--]]
-----------------------------------------------------------------------
-- ABORT --------------------------------------------------------------
-----------------------------------------------------------------------

function abort()
end
 
-----------------------------------------------------------------------
-- MAIN LOOP ----------------------------------------------------------
-----------------------------------------------------------------------

active_hero = get_hero();

-- setup scene
make_actor( tal );
--make_actor( active_hero );

-- intro sequence
if not SAVE.scene_wakeup_beach then
	unobviate_pod( hide_s04_clank_rt_pod )
	actor_speak_and_wait( tal, TalOpening )
   scene_speak_and_wait( get_hero(), RatchetReply )
	SAVE.scene_wakeup_beach = true
end
  wait()

-- end

-- and we're done

-- fade out/back in, letterbox status, etc, all handled automatically

