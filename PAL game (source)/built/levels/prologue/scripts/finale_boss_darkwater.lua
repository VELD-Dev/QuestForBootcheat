----------------------------------------------------------------------------------------------------
--[[ BossCaptainDarkwaterStateManage functions:
--
-- BossCaptainDarkwaterStateManager* GetInstance();

-- void Reset();

-- void SetIntroPaths(area_handle intro_paths_handle);
-- void SetAttackRangeData(u8 attack_count, f32 attack_wait_time, u8 cycle_count, f32 cycle_wait_time);
  
-- void AddFirepoint(volume_handle firepoint_handle);
-- void ReplaceFirepoint(u32 firepoint_index, volume_handle firepoint_handle);
-- void RemoveFirepoint(u32 firepoint_index);
-- void ClearFirepoints();

-- void AddTune(table tune_table);
-- void ReplaceTune(table tune_table, u32 tune_index);
-- void RemoveTune(u32 tune_index);
-- void ClearTunes();

-- void AddCycle(u32 stage_type, u32 index);
-- void ReplaceCycle(u32 cycle_index, u32 stage_type, u32 index);
-- void RemoveCycle(u32 cycle_index);
-- void ClearCycles();
--
--]]

----------------------------------------------------------------------------------------------------
-- Local Functions
----------------------------------------------------------------------------------------------------
  
----------------------------------------------------------------------------------------------------
-- Local vars
----------------------------------------------------------------------------------------------------

-- remap some enums so they aren't a million chars long
local StageTune          = BossCaptainDarkwaterStateManager.StageTypeTune;
local StageSpawn         = BossCaptainDarkwaterStateManager.StageTypeSpawn;

local SwordLeft          = BossCaptainDarkwaterStateManager.MeleeTypeSwordLeft;
local SwordLeftFromRight = BossCaptainDarkwaterStateManager.MeleeTypeSwordLeftFromRight;
local SwordRight         = BossCaptainDarkwaterStateManager.MeleeTypeSwordRight;
local SwordRightFromLeft = BossCaptainDarkwaterStateManager.MeleeTypeSwordRightFromLeft;
local SwordBoth          = BossCaptainDarkwaterStateManager.MeleeTypeSwordBoth;

-- get the darkwater state manager
local bcd_sm = BossCaptainDarkwaterStateManager:GetInstance();

-- define firepoint indices for sanity's sake
local melee_position_1 = 0;
local melee_position_2 = 1;
--local melee_position_3 = 2;
--local melee_position_4 = 3;
local ranged_position   = 2;



-- define some tunes
local tune_basic_index = 0;
local tune_basic_theme = 
{ 
  { melee_position_1, SwordLeft          },
  { melee_position_1, SwordRight         },
  { melee_position_1, SwordLeftFromRight },
  { melee_position_1, SwordRight         },
  { melee_position_1, SwordLeft          },
  { melee_position_1, SwordRightFromLeft },
};

local tune_basic_twin_index = 1;
local tune_basic_twin_theme = 
{ 
  { melee_position_1, SwordRight         },	
  { melee_position_2, SwordLeft          },
  { ranged_position,   SwordBoth          },
  { melee_position_2, SwordLeft          },
  { melee_position_1, SwordRight         },	
  { ranged_position,   SwordBoth          },
};

local tune_advanced_index = 2;
local tune_advanced_theme = 
{ 
  { melee_position_2, SwordLeft          },
  { melee_position_1, SwordRight         },
  { melee_position_1, SwordLeftFromRight },
  { melee_position_1, SwordRight         },
  { melee_position_2, SwordLeft          },
  { melee_position_1, SwordRightFromLeft },
  { melee_position_2, SwordLeft          },
  { melee_position_1, SwordRight         },
  { ranged_position,   SwordBoth          },
}
--[[
-- define some tunes
local tune_basic_index = 0;
local tune_basic_theme = 
{ 
  { melee_position_2, SwordLeft          },
  { melee_position_3, SwordRight         },
  { melee_position_4, SwordLeftFromRight },
  { melee_position_3, SwordRight         },
  { melee_position_2, SwordLeft          },
  { melee_position_1, SwordRightFromLeft },
};

local tune_basic_twin_index = 1;
local tune_basic_twin_theme = 
{ 
  { melee_position_3, SwordRight         },	
  { melee_position_2, SwordLeft          },
  { ranged_position,   SwordBoth          },
  { melee_position_4, SwordLeft          },
  { melee_position_1, SwordRight         },	
  { ranged_position,   SwordBoth          },
};

local tune_advanced_index = 2;
local tune_advanced_theme = 
{ 
  { melee_position_2, SwordLeft          },
  { melee_position_3, SwordRight         },
  { melee_position_4, SwordLeftFromRight },
  { melee_position_3, SwordRight         },
  { melee_position_2, SwordLeft          },
  { melee_position_1, SwordRightFromLeft },
  { melee_position_2, SwordLeft          },
  { melee_position_3, SwordRight         },
  { ranged_position,   SwordBoth          },
};
--]]
----------------------------------------------------------------------------------------------------
-- Main
----------------------------------------------------------------------------------------------------

-- reset state manager back to start
bcd_sm:Reset();

-- set intro paths for spawned enemies
bcd_sm:SetIntroPaths(boss_pirate_spawning_intro_paths);

-- set attack range data
--bcd_sm:SetAttackRangeData(3, 1.0, 2, 2.0);
bcd_sm:SetAttackRangeData(4, 2.0, 1, 2.0);

-- set max pirate/skulls allowed to be spawned
bcd_sm:SetPirateMax(8);
bcd_sm:SetSkullMax(4);

-- add firepoints (order matters! they will be indexed!)
bcd_sm:ClearFirepoints();
bcd_sm:AddFirepoint( boss_darkwater_melee_firepoint_1 );
bcd_sm:AddFirepoint(boss_darkwater_melee_firepoint_2 );
--bcd_sm:AddFirepoint( boss_darkwater_melee_firepoint_3 );
--bcd_sm:AddFirepoint( boss_darkwater_melee_firepoint_4 );
bcd_sm:AddFirepoint( boss_darkwater_ranged_firepoint );

-- add tunes
bcd_sm:ClearTunes();
bcd_sm:AddTune(tune_basic_theme);
bcd_sm:AddTune(tune_basic_twin_theme);
bcd_sm:AddTune(tune_advanced_theme);



-- add cycles
bcd_sm:ClearCycles();
bcd_sm:AddTuneCycle(tune_basic_index);
bcd_sm:AddSpawnCycle(ranged_position, 3);
bcd_sm:AddIdleCycle(ranged_position, 3.0);
bcd_sm:AddTuneCycle(tune_basic_twin_index);
bcd_sm:AddSpawnCycle(ranged_position, 3);

--[[ add cycles
bcd_sm:ClearCycles();
bcd_sm:AddCycle(StageTune, tune_basic_index);
bcd_sm:AddCycle(StageSpawn, ranged_position);

bcd_sm:AddCycle(StageTune, tune_basic_twin_index);
bcd_sm:AddCycle(StageTune, tune_basic_index);
bcd_sm:AddCycle(StageSpawn, range_position);
bcd_sm:AddCycle(StageTune, tune_basic_index);
--]]
