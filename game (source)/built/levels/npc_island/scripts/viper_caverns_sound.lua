--This is the Path of sound that will help tell the player where danger lies.
--Hopefully this audio cue will help the player remember that they need a light
--source.

while true do

---------------------------------------------------------------------------------------------------------------
--Cave Bats--
---------------------------------------------------------------------------------------------------------------

  if cavebatchitter1 == nil then
	if is_in_volume( get_hero(), AUD_VOL_SFX_CALL_CHITTER ) then
       play_explicit_sound_spec( SoundSpecs.AMB_VC_Bat_Chitter_OS, AUD_CHITTER_CALL )
      cavebatchitter1 = true
    end
  end
   
  if cavebatchitter2 == nil then
    if is_in_volume( get_hero(), AUD_VOL_SFX_CALL_CHITTER1 ) then
       play_explicit_sound_spec( SoundSpecs.AMB_VC_Bat_Chitter_OS, AUD_CHITTER_CALL1 )
     cavebatchitter2 = true  
    end
  end  
  
  if cavebatchitter3 == nil then 
    if is_in_volume( get_hero(), AUD_VOL_SFX_CALL_CHITTER2 ) then
       play_explicit_sound_spec( SoundSpecs.AMB_VC_Bat_Chitter_OS, AUD_CHITTER_CALL2 )
     cavebatchitter3 = true
    end
  end
   
  if cavebatchitter4 == nil then 
    if is_in_volume( get_hero(), AUD_VOL_SFX_CALL_CHITTER3 ) then
       play_explicit_sound_spec( SoundSpecs.AMB_VC_Bat_Chitter_OS, AUD_CHITTER_CALL3 )
     cavebatchitter4 = true
    end
  end 
  
  if cavebatchitter5 == nil then 
    if is_in_volume( get_hero(), AUD_VOL_SFX_CALL_CHITTER4 ) then
       play_explicit_sound_spec( SoundSpecs.AMB_VC_Bat_Chitter_OS, AUD_CHITTER_CALL4 )
      cavebatchitter5 = true
    end
  end 
  
    if cavebatchitter6 == nil then 
      if is_in_volume( get_hero(), AUD_VOL_SFX_CALL_CHITTER5 ) then
       play_explicit_sound_spec( SoundSpecs.AMB_VC_Bat_Chitter_OS, AUD_CHITTER_CALL5 )
       cavebatchitter6 = true
    end
  end 
  
    if cavebatchitter7 == nil then 
      if is_in_volume( get_hero(), AUD_VOL_SFX_CALL_CHITTER6 ) then
       play_explicit_sound_spec( SoundSpecs.AMB_VC_Bat_Chitter_OS, AUD_CHITTER_CALL6 )
       cavebatchitter7 = true
    end
  end 
  
    if cavebatchitter8 == nil then 
      if is_in_volume( get_hero(), AUD_VOL_SFX_CALL_CHITTER7 ) then
       play_explicit_sound_spec( SoundSpecs.AMB_VC_Bat_Chitter_OS, AUD_CHITTER_CALL7 )
       cavebatchitter8 = true
      end
  end 
  
-----------Tal's Fight Sounds-----------------
  -- this starts tal's fight sounds
  if taltrig == nil then
    if is_in_volume( get_hero(), AUD_VOL_TAL_TRIG ) then
      GunBattle = play_sound( SoundSpecs.AMB_VC_Tal_fights_pirates, AUD_TAL_FIGHT )
      taltrig = true
      prt("taltrigistrue")
    end
  end
  
  --this stops tal's fight sounds
  if is_in_volume( get_hero(), AUD_VOL_TAL_STOP ) and taltrig == true then
     stop_sound( GunBattle ) 
     prt( "death to tal" )
  end
  
  
---------------------------------------------------------------------------------------------------------------
--WoodCreaking--
---------------------------------------------------------------------------------------------------------------
 
 
---------------------------------------------------------------------------------------------------------------
--MetalCreaking--
---------------------------------------------------------------------------------------------------------------
    wait()
end
