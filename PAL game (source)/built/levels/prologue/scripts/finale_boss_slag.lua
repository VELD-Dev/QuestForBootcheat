
--[[------------------------------------------------------------------------------------------------
-- BossCaptainSlagwaterStateManager functions:
--
--
-- BossCaptainSlagwaterStateManager* GetInstance();
--
-- void Reset();
--
-- void SetPowerLevels(lua_State* L, lua_Object* power_level_table);
-- u32 GetCurrentPowerLevel();
-- void SetCurrentPowerLevel(u32 power_level);
--
-- void SetIntroPath(path_handle intro_path_handle);
-- void SetOutroPath(path_handle outro_path_handle);
--
-- void AddFirepoint(volume_handle firepoint_handle);
-- void ReplaceFirepoint(u32 firepoint_index, volume_handle firepoint_handle);
-- void RemoveFirepoint(u32 firepoint_index);
-- void ClearFirepoints();
--
-- void SetAttackChances(f32 melee_attack_chance, f32 range_attack_chance, f32 lunge_attack_chance);
-- void SetAttackRangeData(u32 attack_count, f32 attack_wait_time, u32 cycle_count, f32 cycle_wait_time);
-- void SetBulletData(f32 bullet_speed, f32 bullet_burn_time);
-- void SetLungeData(f32 stuck_time);
-- 
-- void SetDarkwaterSpawnPosition(volume_handle darkwater_spawn_volume, u32 darkwater_count = 0, bool end_with_slag = false);
      
--
-- void SetIntroPathSpeed(f32 accel, f32 decel, f32 max_speed);
-- void SetOutroPathSpeed(f32 accel, f32 decel, f32 max_speed);
-- void SetGotoFirepointSpeed(f32 accel, f32 decel, f32 max_speed);
-- void SetFollowTargetSpeed(f32 accel, f32 decel, f32 max_speed);
--
--]]------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Local Functions
----------------------------------------------------------------------------------------------------

-- function wrapper so i don't have to type alot :D
function bcs_intro()
  captainslagwater_intro(boss_darkwater);
end

-- initialize slagwater :: only needs to be called once ever in script
function slagwater_initialize(bcs_sm, power_levels)

  -- set power levels (this only needs to be done once ever in script)
  bcs_sm:SetPowerLevels(power_levels);

  -- set attack range data (can be done here if this is not going to change between stages)
  bcs_sm:SetAttackRangeData(5, 0.25, 1, 3.0);

  -- set movement speeds
  bcs_sm:SetIntroPathSpeed(100.0, 100.0, 20.0);
  bcs_sm:SetOutroPathSpeed(100.0, 100.0, 60.0);
  bcs_sm:SetGotoFirepointSpeed(20.0, 20.0, 15.0);
  bcs_sm:SetFollowTargetSpeed(40.0, 40.0, 20.0);

  bcs_sm:SetBulletData(20.0, 5.0);
  if get_difficulty( ) == 1 then
  	bcs_sm:SetBulletData(15.0, 2.0);
  elseif get_difficulty( ) == 3 then
	bcs_sm:SetBulletData(20.0, 10.0);
  end
  bcs_sm:SetLungeData(3.5);
end

-- returns power level for this instance
function get_power_level(bcs_sm)
	return bcs_sm:GetCurrentPowerLevel();
end

-- slagwater_stage_0 :: setup slagwater for stage/powerlevel 0 (first encounter)
function slagwater_stage_0(bcs_sm, bcd_sm)
  
  -- reset state manager back to start (clears firepoints, intro_path, outro_path, darkwater_spawn_position)
	bcs_sm:Reset();

  -- set intro path
  bcs_sm:SetIntroPath(boss_slag_westship_bcs_path);

  -- set outro path
  bcs_sm:SetOutroPath(boss_slag_westship_outro_path);
  
   -- set attack chances (only do melee attacks the first round, MUST add up to 1.0!)
  bcs_sm:SetAttackChances(0.25, 0.75, 0.0);

  -- set darkwater spawn position (if darkwater spawn position is not set, darkwater will not spawn)
  --bcs_sm:SetDarkwaterSpawnPosition(bossdarkwater_attack_range_firepoint);

  -- add firepoints 
	bcs_sm:ClearFirepoints();
	bcs_sm:AddFirepoint(boss_slag_westship_firepoint1_vol);
	bcs_sm:AddFirepoint(boss_slag_westship_firepoint2_vol);
	bcs_sm:AddFirepoint(boss_slag_westship_firepoint3_vol);
	bcs_sm:AddFirepoint(boss_slag_westship_firepoint4_vol);
	bcs_sm:AddFirepoint(boss_slag_westship_firepoint5_vol);

end

-- slagwater_stage_1 :: setup slagwater for stage/powerlevel 1 - first fight on Darkwaters Ship
function slagwater_stage_1(bcs_sm, bcd_sm)
  
  -- reset state manager back to start (clears firepoints, intro_path, outro_path, darkwater_spawn_position)
	bcs_sm:Reset();

  -- set intro path
	bcs_sm:SetIntroPath(boss_slag_darkwatership_intro_bcs_path);

  -- set outro path
	bcs_sm:SetOutroPath(boss_slag_darkwatership_outro_path);

  -- set darkwater spawn position (if darkwater spawn position is not set, darkwater will not spawn)
	bcs_sm:SetDarkwaterSpawnPosition(boss_darkwater_melee_firepoint_2, 0, true);

   -- set attack chances (only do melee attacks the first round, MUST add up to 1.0!)
	bcs_sm:SetAttackChances(0.0, 0.7, 0.3);
  
  -- add firepoints 
	bcs_sm:ClearFirepoints();
	bcs_sm:AddFirepoint(boss_slag_darkwatership_firepoint1_vol);
	bcs_sm:AddFirepoint(boss_slag_darkwatership_firepoint2_vol);
	bcs_sm:AddFirepoint(boss_slag_darkwatership_firepoint3_vol);
	bcs_sm:AddFirepoint(boss_slag_darkwatership_firepoint4_vol);

end
  
  
 -- slagwater_stage_2 :: setup slagwater for stage/powerlevel 2 - fight on East Ship
function slagwater_stage_2(bcs_sm, bcd_sm)
  
  -- reset state manager back to start (clears firepoints, intro_path, outro_path, darkwater_spawn_position)
	bcs_sm:Reset();

  -- set intro path
	bcs_sm:SetIntroPath(boss_slag_eastship_bcs_path);
	
  -- set outro path
	bcs_sm:SetOutroPath(boss_slag_eastship_outro_path);

  -- set darkwater spawn position (if darkwater spawn position is not set, darkwater will not spawn)
	--bcs_sm:SetDarkwaterSpawnPosition(boss_darkwater_melee_firepoint_2);

   -- set attack chances (only do melee attacks the first round, MUST add up to 1.0!)
  bcs_sm:SetAttackChances(0.25, 0.5, 0.25);
  
  -- add firepoints 
	bcs_sm:ClearFirepoints();
	bcs_sm:AddFirepoint(boss_slag_eastship_firepoint1_vol);
	bcs_sm:AddFirepoint(boss_slag_eastship_firepoint2_vol);
	bcs_sm:AddFirepoint(boss_slag_eastship_firepoint3_vol);
	bcs_sm:AddFirepoint(boss_slag_eastship_firepoint4_vol);

end 
  
  

 -- slagwater_stage_3 :: setup slagwater for stage/powerlevel 3 - final fight on Darkwaters ship
function slagwater_stage_3(bcs_sm, bcd_sm)
  

  -- reset state manager back to start (clears firepoints, intro_path, outro_path, darkwater_spawn_position)
	bcs_sm:Reset();

  -- set intro path
	bcs_sm:SetIntroPath(boss_slag_darkwatership_intro_bcs_path);

  -- set outro path
	bcs_sm:SetOutroPath(boss_slag_darkwatership_intro_bcs_path);

  -- set darkwater spawn position (if darkwater spawn position is not set, darkwater will not spawn)
  bcs_sm:SetDarkwaterSpawnPosition(boss_darkwater_melee_firepoint_2, 1, true);

   -- set attack chances (only do melee attacks the first round, MUST add up to 1.0!)
  bcs_sm:SetAttackChances(0.25, 0.5, 0.25);

  -- add firepoints 
	bcs_sm:ClearFirepoints();
	bcs_sm:AddFirepoint(boss_slag_darkwatership_firepoint1_vol);
	bcs_sm:AddFirepoint(boss_slag_darkwatership_firepoint2_vol);
	bcs_sm:AddFirepoint(boss_slag_darkwatership_firepoint3_vol);
	bcs_sm:AddFirepoint(boss_slag_darkwatership_firepoint4_vol);
	-- set health
	bcd_sm:Reset();
	bcd_sm:SetSkullDamageMax(2);
	prt("bcd_sm:SetSkullDamageMax(2);")

end 

 -- slagwater_stage_4 :: setup slagwater for stage/powerlevel 3 - final fight on Darkwaters ship
function slagwater_stage_4(bcs_sm, bcd_sm)  
end 

function slagwater_stage_5(bcs_sm, bcd_sm)	  
end 

function slagwater_stage_6(bcs_sm, bcd_sm)
end 
----------------------------------------------------------------------------------------------------
-- Local vars
----------------------------------------------------------------------------------------------------

-- get the slagwater state manager
local bcs_sm = BossCaptainSlagwaterStateManager:GetInstance();
local bcd_sm = BossCaptainDarkwaterStateManager:GetInstance();

-- power levels
local power_levels = 
{
  0.85, -- power level 0 -> 100% - 85% health (Slag's West Ship)
  0.60, -- power level 1 ->  85% - 60% health (Darkwater's Ship)
  0.45, -- power level 2 ->  60% - 45% health (Slag's East Ship)
  0.20  -- power level 3 ->  45% - 20% health (Darkwater's Ship)
		-- power level 4 ->  20% -  0%
   
};
if SAVE.current_power_level == nil then
	SAVE.current_power_level = 0;
end

----------------------------------------------------------------------------------------------------
-- Main
----------------------------------------------------------------------------------------------------

---------
--DEBUG--
---------

--checkpoint_volume( barge_traversal_checkpoint_respawn_vol )

---------
---------
---------

slagwater_initialize(bcs_sm, power_levels)
slagwater_stage_0(bcs_sm);



if SAVE.current_power_level == 0 then
  slagwater_stage_0(bcs_sm, bcd_sm);
end

if SAVE.current_power_level == 1 then
  slagwater_stage_1(bcs_sm, bcd_sm);
end

if SAVE.current_power_level == 2 then
  slagwater_stage_2(bcs_sm, bcd_sm);
end 
  
if SAVE.current_power_level == 3 then
  slagwater_stage_3(bcs_sm, bcd_sm);
end
    
-- reset to beginnning of multi-stage section
if SAVE.current_power_level == 4 then
  SAVE.current_power_level = 3 
  slagwater_stage_3(bcs_sm, bcd_sm);
end
    

-- set current power level (if there are checkpoints in between power levels this can be used to start slag at the correct level)
-- power levels should be set before current level is set!
bcs_sm:SetCurrentPowerLevel(SAVE.current_power_level);
    


-- loop forever
while true do 

  -- check to see if a slag round has completed (power level will have increased)
  local new_power_level = bcs_sm:GetCurrentPowerLevel();
  
  if new_power_level == 3 
  and is_update_on( captainslagwater_get_darkwater(boss_darkwater) ) 
  and not been_spawned_at_level_three then
	been_spawned_at_level_three = true
  end
  
  if been_spawned_at_level_three
  and not is_update_on( captainslagwater_get_darkwater(boss_darkwater) ) 
  and not bcd_set_to_three_skulls then
	-- set health
	bcd_sm:Reset();
	bcd_sm:SetSkullDamageMax(3);	
	prt("bcd_sm:SetSkullDamageMax(3);")
	bcd_set_to_three_skulls = true
  end
  
  if not is_update_on( captainslagwater_get_darkwater(boss_darkwater) )  then
	special_delete( bcd_sm:GetSkullPod() )
	special_delete( bcd_sm:GetPiratePod() )
  end
  
  if (new_power_level > SAVE.current_power_level) then

    -- debug
    prt("captainslagwater has increased in POWER! now at power level " .. new_power_level .. "!!!");

    -- update current power level
    SAVE.current_power_level = new_power_level;
	request_auto_save();  

    -- power up
    if new_power_level == 1 then
      slagwater_stage_1(bcs_sm, bcd_sm);
    end
    
     if new_power_level == 2 then
    slagwater_stage_2(bcs_sm, bcd_sm);
    end
    
     if new_power_level == 3 then
      slagwater_stage_3(bcs_sm, bcd_sm);
    end 
    
    
    if new_power_level == 4 then
      slagwater_stage_4(bcs_sm, bcd_sm);
      bcs_intro();
	  prt("TRIGGERED INTRO: BS337")
    end
    
    if new_power_level == 5 then
      slagwater_stage_5(bcs_sm, bcd_sm);
      bcs_intro();
	  prt("TRIGGERED INTRO: BS343")
    end
    --[[
    if new_power_level == 6 then
      slagwater_stage_6(bcs_sm);
      bcs_intro();
    end
    ]]--
  end

  -- wait, let other scipts run...
  wait();

end

