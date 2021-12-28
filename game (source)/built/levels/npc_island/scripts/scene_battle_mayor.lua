-----------------------------------------------------------------------
-- ACTORS PIECES ---------------------------------------------------
-----------------------------------------------------------------------

MayorOpening =
{
  -- Mayor's initial greeting text
  dialog = DialogueSpecs.NI_MAYOR_PRE_BATTLE_OPEN,
  text    = "Its them! They are attacking us! The undead crew of Angstrom Darkwater! Here, take these weapons. They washed ashore this afternoon.",
  stance  = AnimRoles.ANIM_ROLE_STAND,
  target  = get_hero(),
  req = true,
  gesture = {
    0.0,    AnimRoles.ANIM_ROLE_FIST_LEFT,
    3.0,    AnimRoles.ANIM_ROLE_DISAGREE,
    7.5,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

MayorEscaping =
{
  dialog = DialogueSpecs.NI_MAYOR_PRE_BATTLE_EYE,
  text = "Head for the Obsidian Eye!",
  stance = AnimRoles.ANIM_ROLE_STAND,
  target  = get_hero(),
  req = true,
  gesture = {
    0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

WindmillEscaping =
{
	dialog = DialogueSpecs.NI_MAYOR_PRE_BATTLE_WINDMILL,
	target  = get_hero(),
	req = true,
	gesture = {
    0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

BeaconEscaping =
{
	dialog = DialogueSpecs.NI_MAYOR_PRE_BATTLE_BEACON,
	target  = get_hero(),
	req = true,
	gesture = {
    0.0,    AnimRoles.ANIM_ROLE_REACH_RIGHT,
  }
}

-----------------------------------------------------------------------
-- ABORT --------------------------------------------------------------
-----------------------------------------------------------------------

--function abort()
--end
 
-----------------------------------------------------------------------
-- MAIN LOOP ----------------------------------------------------------
-----------------------------------------------------------------------

active_hero = get_hero();

-- setup scene
npc_warp(npc_mayor, scene_battle_mayor_beach_warp_vol)	--added this line to stop the progression stopper where the mayor wouldn't show up
make_actor( npc_mayor );

-- intro sequence to Battle
if not SAVE.scene_battle_mayor_intro then
	hero_warp( active_hero, scene_battle_hero_beach_warp_vol, true )	

	activate_cam( active_hero, scene_battle_mayor_cam_dramatic, true )
	actor_speak_and_wait( npc_mayor, MayorOpening  )
	
	fade_to_black(0)
	hero_give_weapon( get_hero(), WPN_TORNADO)
	play_sound(SoundSpecs.MUS_Q4B_Win_Weapons1) --adding music for receiving weapons. cro 5/20
	show_weapon_screen(WPN_TORNADO, 2, 2, 0)
	wait(0)
	hero_give_weapon( get_hero(), WPN_RAVAGER)
	play_sound(SoundSpecs.MUS_Q4B_Win_Weapons2) --adding music for receiving weapons. cro 5/20
	show_weapon_screen(WPN_RAVAGER, 2, 2, 0)
	wait(0.3)
	
	unobviate( battle_darkwater_ship )
	unobviate( captain_darkwater_slaghead   )

	activate( battle_darkwater_ship )
	activate_cam( active_hero, scene_battle_mayor_running_cam, true )
	fade_from_black(0.5)
	wait(0.5)
	
	actor_speak_and_wait( npc_mayor, MayorEscaping  )
	unobviate_pod( battle_npcs_pod )
	wait(2.0)
	npc_warp( npc_windmill, battle_wmo_warp_vol )
	npc_warp( npc_lighthouse, battle_bop_warp_vol )
	npc_warp( npc_battle_villager1, battle_gennpc_warp_vol1 )
	npc_warp( npc_battle_villager2, battle_gennpc_warp_vol2 )
	npc_warp( npc_battle_villager3, battle_gennpc_warp_vol3 )
	wait(0.2)
	make_actor( npc_windmill );
	make_actor( npc_lighthouse );
	make_actor( npc_battle_villager1 );
	make_actor( npc_battle_villager2 );
	make_actor( npc_battle_villager3 );
	wait(0.1)
	actor_move( npc_windmill, battle_villager_escape_path1, AnimRoles.ANIM_ROLE_RUN, 4.5 )
	actor_move( npc_lighthouse, battle_villager_escape_path2, AnimRoles.ANIM_ROLE_RUN, 4.5 )
	actor_move( npc_battle_villager1, battle_villager_escape_path1, AnimRoles.ANIM_ROLE_RUN, 4.5 )
	actor_move( npc_battle_villager2, battle_villager_escape_path2, AnimRoles.ANIM_ROLE_RUN, 4.5 )
	wait(1.0)
	actor_move( npc_battle_villager3, battle_villager_escape_path3, AnimRoles.ANIM_ROLE_RUN_CRAZY, 4.5 )
	activate_cam( active_hero, scene_battle_mayor_running_cam1, true )	
	actor_speak_and_wait( npc_windmill, WindmillEscaping )
	activate_cam( active_hero, scene_battle_mayor_obeye_cam, true )		
	door_open( obsidian_eye_door )
	actor_speak_and_wait( npc_lighthouse, BeaconEscaping )
	door_close( obsidian_eye_door )
	wait(1.5)


	SAVE.scene_battle_mayor_intro = true
end

  wait()



