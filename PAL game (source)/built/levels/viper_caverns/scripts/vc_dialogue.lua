----------------------------------------------------------------------------------------------------
-- Dialogue Script 
----------------------------------------------------------------------------------------------------


rusty_vs_viper = nil

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------

while true do

if not (SAVE.vc_escape_start) == true then

	
	  
	----------------------------------------------------------------------------------------------------
	--pete talk 1

	----------------------------------------------------------------------------------------------------
	if not crank_is_in_use(vc_boltcrank1) then
		if petetalk1 == nil then
			if is_in_volume(tal, trig_talspeak_friendofyours) then
			--talwyn, "friend of yours?"
			rusty_line1 = speak_and_wait(tal, DialogueSpecs.VC_TAL_DEAD1_OPENER)
			if not crank_is_complete(vc_boltcrank1) then
					if not is_cranking(get_hero(), vc_boltcrank1) then
					--pete: "Oh that's fred, used to give me wedgies..."
					rusty_line1 = speak_and_wait(rustypete, DialogueSpecs.VC_PETE_DEAD1_RESPONSE)
					prt("Wedgie Line Plays Here")
					wait(2)
						if not crank_is_complete(vc_boltcrank1) then
							if not is_cranking(get_hero(), vc_boltcrank1) then
							--pete: "get the door wouldjs mate?" 
							speak_and_wait(rustypete, DialogueSpecs.VC_PETE_GETDOOR)
							end
						end
					end
				end
			petetalk1 = true
			end
		end
	end
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	
	------------------------------------------------------------------------------
	------------------------------------------------------------------------------
	--Cave-in-sequence-vo
	
	if cave_in_active == true then
	--stop_vo(rusty_line1)
	speak_and_wait(rustypete, DialogueSpecs.VC_PETE_TALWAIT_OPENER) --changed to speak and wait cro 5/1
	wait(1)
	speak_and_wait(rustypete, DialogueSpecs.VC_PETE_TALWAIT_CLOSER) --changed to speak and wait cro 5/1
	SAVE.cave_in_dialogue_finished = true
	cave_in_active = false
	request_auto_save()
	end
	
	----------------------------------------------------------------------------------------------------
	--pete talk 2
	--"ahhh, here be me old mates, just where I left them"
	----------------------------------------------------------------------------------------------------
	if petetalk2 == nil then
		if is_in_volume(rustypete, vc_trig_petetalk_2) then
		speak(ally_get_slagshead(rustypete), DialogueSpecs.VC_SLAG_DEADPIRATE1) --changed to speak cro 5/1
		--debug_message("Pete: ahhh, here be me old mates, just where I left them", 3)
		wait(3)
		ally_followpath(rustypete,pete_walkpath_5,false,false)
		petetalk2 = true
		end
	end
	
	-- Pete: "Hey, that guy still owes me thirty quid!"
	if pete_say_owesme == nil then
	if is_in_volume(rustypete, trig_pete_talk_owesme) then
	speak_and_wait(rustypete, DialogueSpecs.VC_PETE_DEADPIRATE1) --changed to speak and wait cro 5/1
	speak_and_wait(rustypete, DialogueSpecs.VC_PETE_DEADPIRATE2) --changed to speak and wait cro 5/1
	pete_say_owesme = true
	end
	end
	
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	if is_current_checkpoint(vc_checkpoint_cavein) then
	
		
				----------------------------------------------------------------------------------------------------
				--pete talk 3
				--"Looks like the bridge is retracted.  Let's see if we can get around this"
				----------------------------------------------------------------------------------------------------
				if petetalk3 == nil then
					if is_in_volume(rustypete, vc_trig_petetalk_3) then
						if is_in_volume(get_hero(), vc_trig_petetalk_3) then
						--debug_message("Pete: Looks like the bridge is closed.  Let's see if we can get around this", 3)
						speak(rustypete, DialogueSpecs.VC_PETE_BRIDGE_RETRACTED) --changed to speak  cro 5/1
						wait(3)
						ally_followpath(rustypete,pete_walkpath_6,false,false)
						petetalk3 = true
						end
					end
				end
				----------------------------------------------------------------------------------------------------
				----------------------------------------------------------------------------------------------------
				
				----------------------------------------------------------------------------------------------------
				--pete talk: batwarning
				--"Careful Sir, You shouldn't travel far without a light.  Your wrench will do no good against these beasts."
				----------------------------------------------------------------------------------------------------
				
				if petetalk_batwarning == nil then
					if petetalk3 == nil then
						if is_in_volume(get_hero(), vc_trig_petetalk_batwarning) then
						--debug_message("Careful Sir, You shouldn't travel far without a light.  Your wrench will do no good against these beasts", 3)
						speak(rustypete, DialogueSpecs.VC_PETE_LIGHTTIP1) --changed to speak cro 5/1
						petetalk_batwarning = true
						end
					end
				end
				----------------------------------------------------------------------------------------------------
				----------------------------------------------------------------------------------------------------
				
				
				----------------------------------------------------------------------------------------------------
				--pete talk 4
				--"Shoo!!! Wretched creatures...The only thing they are scared of is the light."
				----------------------------------------------------------------------------------------------------
				if petetalk4 == nil then
					if is_in_volume(rustypete, vc_trig_petetalk_4) then
					--wait(2)
					--debug_message("Pete: Shoo!!! Wretched creatures...The only thing they are scared of is the light.", 3)
          speak_and_wait(ally_get_slagshead(rustypete), DialogueSpecs.VC_SLAG_LIGHTTHEWAY_RESPONSE)
					petetalk4 = true
					end
				end
			
	

	
				----------------------------------------------------------------------------------------------------
				----------------------------------------------------------------------------------------------------

				----------------------------------------------------------------------------------------------------
				-- slag reads scroll on the wall
				
				if slag_read_scroll == nil then
				if is_in_volume(rustypete, trig_pete_talk_writing_on_wall) then
				ally_followpath(rustypete,pete_walkpath_to_ledgegrab,false,false)
				slag_read_scroll = true
				--end
				end
				end

  end
				----------------------------------------------------------------------------------------------------
				--pete talk 5
				--"Here ya go, get_hero()... Looks like you can shimmy across this rail."
				----------------------------------------------------------------------------------------------------
				if petetalk5 == nil then
					if is_in_volume(rustypete, vc_trig_petetalk_5) then
					--wait(2)
					--debug_message("Pete: Here ya go, sir... Looks like you can shimmy across this rail.", 6)
          speak_and_wait(rustypete, DialogueSpecs.VC_PETE_BROKENRAIL2)
					petetalk5 = true
					end
				end
				----------------------------------------------------------------------------------------------------
				----------------------------------------------------------------------------------------------------
				
				----------------------------------------------------------------------------------------------------
				----------------------------------------------------------------------------------------------------
				--shadow viper sequence dialogue
				
				if SAVE.shadow_viper == nil then
				if shadowviperintro == true then
				wait(3)
				announce_and_wait(DialogueSpecs.VC_RAT_VIPERSHADOW_OPENER, true)
				speak_and_wait(rustypete, DialogueSpecs.VC_PETE_VIPERSHADOW_RESPONSE) --changed to speak and wait cro 5/1
				shadowviperintro = false
				--SAVE.shadow_viper = true
				request_auto_save()
				end
				end

	
	
	----------------------------------------------------------------------------------------------------
	--pete talk 6
	--"Careful, Mate....don't go in there without a light.  Look around for a heliogrub"
	----------------------------------------------------------------------------------------------------
	
	if not fireslug_is_in_volume(vc_trig_petetalk_6_fireslugcheck) then
		if petetalk6== nil then
			if is_in_volume(get_hero(), vc_trig_petetalk_6) then
			--debug_message("Wait, don't go in there without a light!! ", 3)
			speak_and_wait(rustypete, DialogueSpecs.VC_PETE_LIGHTTIP3) --changed to speak and wait cro 5/1
			
			--wait(3)
			petetalk6b = true
			petetalk6 = true
			end
		end
	end
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	
	----------------------------------------------------------------------------------------------------
	--pete talk 6b
	--"Careful, Mate....don't go in there without a light.  Look around for a heliogrub"
	----------------------------------------------------------------------------------------------------
	if petetalk6b == true then
		if is_in_volume(get_hero(), vc_trig_petetalk_6b) then
 	--debug_message("Look around for a heliogrub to guide the way.", 3)
		speak_and_wait(rustypete, DialogueSpecs.VC_PETE_LIGHTTIP2) --changed to speak and wait cro 5/1
		petetalk6 = true
		petetalk6b = false
		end
	end
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	
	
	
	
	----------------------------------------------------------------------------------------------------
	--pete talk 7
	--"There ya go.. try picking one of those guys up"
	----------------------------------------------------------------------------------------------------
	if SAVE.petetalk7 == nil then
		if not is_grabbing( get_hero() ) then
			if is_in_volume(get_hero(), vc_trig_petetalk_7) then
			wait(2)
			helptext(L01_HELP_GPLAY_PICKUPHELIOGRUB, "pick up heliogrub", 5, true, 5, false)
			end
		end
	end
	
	if is_grabbing( get_hero() ) then
	SAVE.petetalk7 = true
	end
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	
	----------------------------------------------------------------------------------------------------
	--pete talk 8
	--"WHOA!!  You scared me, cap'n!  What took ya so long?  Get that bridge open why don't ya. "
	----------------------------------------------------------------------------------------------------
	
	if not is_current_checkpoint(vc_checkpoint_elevator_respawn) then
		if petetalk8 == nil then
			if is_in_volume(get_hero(), vc_trig_ally_petewalktobridge) then
			--debug_message("Pete: WHOA!!  You scared me, cap'n!  What took ya so long?  Get that bridge open why don't ya.", 3)
			speak_and_wait(ally_get_slagshead(rustypete), DialogueSpecs.VC_SLAG_FLAVOR3) --changed to speak and wait cro 5/1
			speak_and_wait(rustypete, DialogueSpecs.VC_PETE_CONGRATS_OPENER) --changed to speak and wait cro 5/1
			wait(2)
			petetalk8 = true
			end
		end
	end
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	
	
	
	----------------------------------------------------------------------------------------------------
	--pete talk 9
	--"Let me get this old elevator working. "
	----------------------------------------------------------------------------------------------------
	if petetalk9 == nil then
		if is_in_volume(rustypete, trig_pete_open_elevator) then

		petetalk9 = true
		end
	end
	
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
--DURING ELEVATOR RIDE

if elevator_dialogue_played == nil then
if is_in_volume(get_hero(), vc_cavernelevatortrigger) then
speak_and_wait(rustypete, DialogueSpecs.VC_PETE_ELEV_CONV_OPENER) --changed to speak and wait cro 5/1
speak_and_wait(ally_get_slagshead(rustypete), DialogueSpecs.VC_SLAG_ELEV_CONV_RESPONSE) --changed to speak and wait cro 5/1
camera_shake(get_hero(), 10, 20, 4)
play_explicit_sound_spec(SoundSpecs.AMB_VC_Viper_Elevator_Spook, get_hero())
wait(4)
speak_and_wait(get_hero(),DialogueSpecs.VC_RAT_VIPERSOUND_OPENER, true)
speak_and_wait(rustypete, DialogueSpecs.VC_PETE_VIPERSOUND_RESPONSE) --changed to speak and wait cro 5/1
elevator_dialogue_played = true
end
end

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--FIRST VIPER INTRO

function f_DoViperIntroDialog()

	wait(2)

	rusty_vs_viper = speak( ally_get_slagshead(rustypete), DialogueSpecs.VC_SLAG_PYTHOR_RESPONSE1 ) --changed to speak and wait cro 5/1
	while not is_vo_done( rusty_vs_viper ) do wait() end
	if not viper_intro_dialogue then return end
	
	rusty_vs_viper = speak( ally_get_slagshead(rustypete), DialogueSpecs.VC_SLAG_PYTHOR_RESPONSE2 ) --changed to speak and wait cro 5/1
	while not is_vo_done( rusty_vs_viper ) do wait() end
	if not viper_intro_dialogue then return end
	
	rusty_vs_viper = speak( ally_get_slagshead(rustypete), DialogueSpecs.VC_SLAG_PYTHOR_RESPONSE3 ) --changed to speak and wait cro 5/1
	while not is_vo_done( rusty_vs_viper ) do wait() end
	if not viper_intro_dialogue then return end
	
	rusty_vs_viper = speak( rustypete, DialogueSpecs.VC_PETE_PYTHOR_RESPONSE3 ) --changed to speak and wait cro 5/1
	while not is_vo_done( rusty_vs_viper ) do wait() end
	if not viper_intro_dialogue then return end

end

if viper_intro_dialogue == true then
	f_DoViperIntroDialog()
	viper_intro_dialogue = false
end

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--DARKWATER SHIP INTRO 

if SAVE.dialogue_darkwater_ship_intro == true then
SAVE.dialogue_darkwater_ship_intro = false
end

if SAVE.elevator_door_opened == true then
if pete_rail_dialogue == nil then
wait(2)
speak_and_wait(rustypete, DialogueSpecs.VC_PETE_RAILPATH_OPENER) --changed to speak and wait cro 5/1
speak_and_wait(ally_get_slagshead(rustypete), DialogueSpecs.VC_SLAG_RAILPATH_RESPONSE) --changed to speak and wait cro 5/1
pete_rail_dialogue = true
end
end

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--DARKWATER SHIP DECK

if dialogue_darwater_ship_deck_played == nil then
if is_in_volume(get_hero(), vc_trig_2viperfight_retreat) then
wait(2)
speak_and_wait(rustypete, DialogueSpecs.VC_PETE_EXTENDPLANK) --changed to speak and wait cro 5/1
dialogue_darwater_ship_deck_played = true 
end
end

--------------------------------------------------------------------------------------------------------


end

if SAVE.vc_escape_start == true then
if tal_ghosts_message == nil then
if is_in_volume(get_hero(), trig_tal_ghost_message) then
announce(DialogueSpecs.TALW_R01_OBJ111)
tal_ghosts_message = true
end
end
end


wait()
end


