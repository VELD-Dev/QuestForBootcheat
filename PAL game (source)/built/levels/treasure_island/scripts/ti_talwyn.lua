-------------------------------------------------------------------------------
-- TREASURE ISLAND TALWYN SCRIPT -------------------------------------------------------------
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------

ally_addtarget(talwyn, beetlepod_brew)
ally_addtarget(talwyn, beetlepod_sunken_ships)
ally_addtarget(talwyn, beetlepod_organ)
  
while true do

if not SAVE.completed_treasure_island == true then

		
		--talwyn flies from dock to beach door
		if talwynatbeach == nil then
			if is_in_volume(get_hero(), trig_talwyn_walktobeach) then
			ally_followpathhover(talwyn, tal_fly_tobeach, 10, 10, 10)
			talwynatbeach = true
			end
		end
		
		--talwyn flies from beach door to hub
		
		if talwynathub1 == nil then
			if is_in_volume(get_hero(), trig_talwyn_flytohub) then
			ally_followpathhover(talwyn, tal_fly_tohub_frombeach, 10, 10, 5)
			talwynathub1 = true
			end
		end
		
		--------------------------------------------------------------------------------
		-- SHIPSHORE AREA
		--------------------------------------------------------------------------------
		--[[
		-- talwyn flies from hub to shipshore
		
		if talwynatshipshore == nil then
			if is_in_volume(get_hero(), trig_talwyn_flytoshipshore) then
			ally_followpathhover(talwyn, tal_fly_toshipshore_fromhub, 10, 10, 15)
			talwynatshipshore = true
			end
		end
		
		-- talwyn flies from shipshore back to hub
		
		if talwynatshipshore == true then
			if is_in_volume(get_hero(), trig_talwyn_fly_tohub_fromshipshore) then
			ally_followpathhover(talwyn, tal_fly_tohub_fromshipshore, 10, 10, 15)
			talwynatshipshore = nil
			end
			
		--]]
		
		
		--------------------------------------------------------------------------------
		--ORGAN PUZZLE
		--------------------------------------------------------------------------------
		--talwyn flies to organ puzzle
		
		if talwynatorgan == nil then
			if is_in_volume(get_hero(), trig_talwyn_flytoorgan_fromhub) then
			ally_followpathhover(talwyn, tal_fly_path_toorgan_fromhub, 10, 10, 15)
			talwynatorgan = true
			end
		end
		
		--talwyn flies back to hub
		if talwynatorgan == true then
			if is_in_volume(get_hero(), trig_talwyn_fly_tohub_fromorgan) then
			ally_followpathhover(talwyn, tal_fly_tohub_fromorgan, 10, 10, 15)
			talwynatorgan = nil
			end
		end
		
		
		--------------------------------------------------------------------------------
		--BREW PUZZLE
		--------------------------------------------------------------------------------
		--talwyn flies to brew puzzle
		
		if talwynatbrew == nil then
			if is_in_volume(get_hero(), trig_talwyn_fly_tobrew_fromhub) then
			ally_followpathhover(talwyn, tal_fly_path_tobrew_fromhub, 10, 10, 15)
			talwynatbrew = true
			end
		end
		
		--talwyn flies back to hub
		if talwynatbrew == true then
			if is_in_volume(get_hero(), trig_talwyn_fly_tohub_frombrew) then
			ally_followpathhover(talwyn, tal_fly_tohub_frombrewpuzzle, 10, 10, 15)
			talwynatbrew = nil
			end
		end
		
		if talwyn_target_organ_beetles == nil then
			if is_in_volume(talwyn, trig_organ_intro_scene) then
			ally_addautotargetvolume(talwyn, trig_organ_intro_scene);
			ally_setattitude(talwyn,1)
			talwyn_target_organ_beetles = true
			end
		end
		
		if talwyn_target_organ_beetles == true then
			if not is_in_volume(talwyn, trig_organ_intro_scene) then
			ally_clearautotargetvolume (talwyn);
			talwyn_target_organ_beetles = nil
			end
		end
		
		--------------------------------------------------------------------------------
		--SHADOW PUZZLE
		--------------------------------------------------------------------------------
		--talwyn flies to shadow puzzle
		
		if talwynatbrew == nil then
			if is_in_volume(get_hero(), trig_talwyn_fly_toshadow_fromhub) then
			ally_followpathhover(talwyn, tal_fly_toshadowpuzzle_fromhub, 10, 10, 15)
			talwynatbrew = true
			end
		end


end

wait()
end




