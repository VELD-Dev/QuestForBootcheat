----------------------------------------------------------------------------------------------------
-- Hero Setup Script
-- 
--  NOTES: 
--    - To use this script, you'll need to change the "hero" variable below, to match whatever 
--        you have called the hero in your level.
--    - No need to give WRENCH, he always has that one
--
--  EX:
--    - add level dependencies    -> unlock_from_level("metropolis");
--    - give hero weapons/gadgets -> hero_give_weapon(hero, WPN_COMBUSTER, 1350)
--    - give hero experiance      -> hero_set_xp(hero, 5001)
--    - give hero bolts           -> hero_add_bolts(hero, 2000)
--    - give hero minerals        -> hero_add_minerals(hero, 1000)
--
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- variables
----------------------------------------------------------------------------------------------------

local hero = ratchet;

----------------------------------------------------------------------------------------------------
-- hero setup
----------------------------------------------------------------------------------------------------

-- level dependenices -- 

-- hero experiance --
hero_set_xp(hero, 5001);
--hero_add_bolts(hero, 2000);
--hero_add_minerals(hero, 1000);

-- hero weapons --

-- hero gadgets --

-- other --
ratchet_remove_clankpack(hero);

