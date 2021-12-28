----------------------------------------------------------------------------------------------------
-- Camera Script 
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

-- NEW SCRIPT
ViperScareStinger = true	--adding variable to que music at the start of this scene cro 5/6

hero_warp(get_hero(), vc_herowarpvol_viper1start)
activate_cam(get_hero(), cam_viper1_intro_version2)
caveviper_intro(cave_viper1);
awareness_add_targettype(cave_viper1, TRG.TT_ALLY)
awareness_remove_targettype(cave_viper1, TRG.TT_HERO)
wait(1)
ally_followpath(rustypete,pete_run_path_viper_intro,true, false)
announce_and_wait(DialogueSpecs.VC_PETE_PYTHOR_OPENER)

cave_viper_intro = true
viper1cam = true
viper_intro_dialogue = true
deactivate_cam(get_hero(), cam_viper1_intro_version2)

