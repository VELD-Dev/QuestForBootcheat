----------------------------------------------------------------------------------------------------
-- Help Script
----------------------------------------------------------------------------------------------------
if SAVE.quick_select_flag_reset == nil then
clear_flag(HERO_USED_QUICK_SELECT)
SAVE.quick_select_flag_reset = true
end

----------------------------------------------------------------------------------------------------
-- Main Loop 
----------------------------------------------------------------------------------------------------



while true do



--fireslug drop help
if fireslug_is_in_volume(vc_trig_help_dropfireslug) then
	if is_in_volume(get_hero(), vc_trig_help_dropfireslug) then
		if fireslugdrophelp == nil then
		--debug_message("To 'DROP' a Heliogrub, press SQUARE", 8)
		helptext(L01_HELP_GPLAY_DROPLAVAROCK, "pick up heliogrub", 6)
		fireslugdrophelp = true
		end
	end
end

if not fireslug_is_in_volume(vc_trig_help_dropfireslug) then
	if not is_in_volume(get_hero(), vc_trig_help_dropfireslug) then
		if fireslugdrophelp == true then
	
		fireslugdrophelp = nil
		end
	end
end	

-- drop from grindrail help

if ledgegrabdrophelp == nil then
	if is_ledge_grabbing(get_hero()) then
		if is_in_volume(ratchet, vc_trig_help_releaseledge) then
			helptext(L01_HELP_GPLAY_LEDGEDETACH, "let go of ledge", 3)
			ledgegrabdrophelp = true
		end
	end
end


--fireslug throw help

if fireslug_is_in_volume(vc_trig_help_throwfireslug) then
	if is_in_volume(get_hero(), vc_trig_help_throwfireslug) then
		if fireslugthrowhelp == nil then
		--debug_message("To 'THROW' a Heliogrub, press CIRCLE", 8)
		fireslugthrowhelp = true
		end
	end
end

if not fireslug_is_in_volume(vc_trig_help_throwfireslug) then
	if not is_in_volume(get_hero(), vc_trig_help_throwfireslug) then
		if fireslugthrowhelp == true then

		fireslugthrowhelp = nil
		end
	end
end	



-- fire weapons help message

if is_in_volume(get_hero(), vc_outervolume_ghostarena) then
	if SAVE.missions_escape == true then
		wait(6)
		if not check_flag(HERO_FIRED_WEAPON) then
			helptext(L01_HELP_GPLAY_FIREWEAPONS, "press cirle to fire", 12, false, 4)
		end
	end
end


-- use quick select
if not check_flag( HERO_USED_QUICK_SELECT ) then
	if is_in_volume(get_hero(), trig_tal_ghost_message) then
	helptext(L01_HELP_GPLAY_QUICKSELECTREMINDER, "press triangle to select weapons", 12, false, 4)
	end
end

--explosive to open door message
--if bomb_doors_check == nil then
if is_in_volume(get_hero(), vc_checkpoint_elevator) then
if not is_alive(cave_viper) or caveviperdamaged == true then
--wait(120)
wait(120)
if is_update_on(ja_vc_gratedoor2) then
helptext(L01_HELP_GPLAY_BOMBDOORS, "bomb doors reminder", 20, false, 4)
bomb_doors_help = true
bomb_doors_check = true
end
end
end
--end

if bomb_doors_check == true then
if not is_update_on(ja_vc_gratedoor2) then
--helptext(L01_HELP_GPLAY_BOMBDOORS, "bomb doors reminder", 12, false, 4)
prt("helpdesk message playing")
end
end

wait()
end

-- end gameplay, this occurs when the user gets to viper caverns