  
function f_chitter(source)
	play_sound( SoundSpecs.AMB_VC_Bat_Chitter_OS, source)
end

function f_metalgroan(source)
	play_sound( SoundSpecs.AMB_Viper_Caverns_Metal_Groans_OneShot, source)
end

function f_woodgroan(source)
	play_sound( SoundSpecs.AMB_Viper_Caverns_Wood_Groans_Long_Oneshot, source)
end

fireslug_set_scream_area(GlowSlug_Scream)
  
while true do

---------------------------------------------------------------------------------------------------------------
--Cave Bats--
---------------------------------------------------------------------------------------------------------------

  if cavebatchitter1 == nil then
	if is_in_volume( get_hero(), AUD_VOL_CaveBat_Chitter ) then
	    f_chitter(AUD_CaveBat_Chitter)
	    prt("my function works")
      cavebatchitter1 = true
    end
  end
   
  if cavebatchitter2 == nil then
    if is_in_volume( get_hero(), AUD_VOL_CaveBat_Chitter1 ) then
        f_chitter(AUD_CaveBat_Chitter1)
        prt("my function works")
     cavebatchitter2 = true  
    end
  end  
  
  if cavebatchitter3 == nil then 
    if is_in_volume( get_hero(), AUD_VOL_CaveBat_Chitter2 ) then
	    f_chitter(AUD_CaveBat_Chitter1)
	    prt("my function works")
     cavebatchitter3 = true
    end
  end
  
---------------------------------------------------------------------------------------------------------------
--WoodCreaking--
---------------------------------------------------------------------------------------------------------------
  if woodgroan == nil then 
    if is_in_volume( get_hero(), AUD_VOL_Wood_Groan ) then
       f_woodgroan(get_hero())
       prt("creaky wood")
     woodgroan = true
    end
  end
  
  if woodgroan1 == nil then 
    if is_in_volume( get_hero(), AUD_VOL_Wood_Groan1 ) then
       f_woodgroan(get_hero())
       prt("creaky wood1")
     woodgroan1 = true
    end
  end
 
---------------------------------------------------------------------------------------------------------------
--MetalCreaking--
---------------------------------------------------------------------------------------------------------------
  if metalgroan == nil then 
    if is_in_volume( get_hero(), AUD_VOL_Metal_Groan ) then
       f_metalgroan(get_hero())
       prt("creaky metal")
     metalgroan = true
    end
  end

  if metalgroan1 == nil then 
    if is_in_volume( get_hero(), AUD_VOL_Metal_Groan1 ) then
       f_metalgroan(get_hero())
       prt("creaky metal1")
     metalgroan1 = true
    end
  end

  if metalgroan2 == nil then 
    if is_in_volume( get_hero(), AUD_VOL_Metal_Groan2 ) then
       f_metalgroan(get_hero())
       prt("creaky metal2")
     metalgroan2 = true
    end
  end

  if metalgroan3 == nil then 
    if is_in_volume( get_hero(), AUD_VOL_Metal_Groan3 ) then
       f_metalgroan(get_hero())
       prt("creaky metal3")
     metalgroan3 = true
    end
  end

    wait()
end
