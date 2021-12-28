-------------------------------------------------------------------------------
-- SCENE FOR BEACH DOOR -------------------------------------------------------------
-------------------------------------------------------------------------------

function wait_for_cam( hero )
  wait(0.0)
  while not is_cam_done(hero) do wait(0.0) end
end

--Duck music & sfx
group_fade_vol(2, 0.5, 1.0)
group_fade_vol(13, 0.5, 1.0)
-------------------------------------------------------------------------------
-- MAIN LOOP ------------------------------------------------------------------
-------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Door Responses
--------------------------------------------------------------------------------
SkulDlg1 =
{
	text =  "Who be the greedy soul that dares set foot on Darkwater Cove?  State thy name, and pray it's reached mine ears before!",
	dialog = DialogueSpecs.TI_COVE_OPEN,
	target  = get_hero(),
	gesture =
	{

	}
}

SkulDlg2 =
{
	text =  "That aint no pirate I ever heard of. Be gone, or find your soul plucked from your bones fer all eternity.",
	dialog = DialogueSpecs.TI_COVE_PIRATE_RESPONSE,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}


SkulDlg3 =
{
	text =  "Slag?! Ye got a lotta nerve showing yerself on these shores! Be gone, ye foul cheat! This island is off limits save fer the one, true captain!",
	dialog = DialogueSpecs.TI_COVE_ROMULUS_RESPONSE,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}

SkulDlg4 =
{
	text =  "Captain! Is it possible? You dont look like him -- but its been a long time, and mine eyes arent what they once were! If ye really are Darkwater, prove yerself -- and fight like him!",
	dialog = DialogueSpecs.TI_COVE_ANGSTROM_RESPONSE,
	stance  = AnimRoles.ANIM_ROLE_STAND,
	target  = get_hero(),
	gesture =
	{

	}
}

--------------------------------------------------------------------------------
-- Ratchet Response functions
--------------------------------------------------------------------------------

 --actions that occur if player chooses response 1
function f_ratchet_response_1()

	--scene_speak_and_wait(get_hero(), RatDlg1)
	--wait(0.2)
	actor_speak_and_wait(talking_skull_beach_door,  SkulDlg2, true)
	wait(0.2)
	--revert_actor(talking_skull_beach_door)
	deactivate_cam(get_hero(), cam_beach_door_scene)

	return true
	
end

--actions that occur if player chooses response 2
function f_ratchet_response_2()

	--scene_speak_and_wait(get_hero(), RatDlg2)
	--wait(0.2)
	actor_speak_and_wait(talking_skull_beach_door,  SkulDlg3, true)
	wait(0.2)
	--revert_actor(talking_skull_beach_door)
	deactivate_cam(get_hero(), cam_beach_door_scene)

	return true
	
end

--actions that occur if player chooses response 3
function f_ratchet_response_3()

	--scene_speak_and_wait(get_hero(), RatDlg3)
	--wait(0.2)
	actor_speak_and_wait(talking_skull_beach_door,  SkulDlg4, true)
	wait(0.2)
	revert_actor(talking_skull_beach_door)
	deactivate_cam(get_hero(), cam_beach_door_scene)
	deactivate(talking_skull_beach_door)
	activate_cam(get_hero(), cam_beach_door_lookat_enemies)
	unobviate_pod(beetles_beach_wave1)
	wait_for_cam(get_hero())

	ally_cleartargets(talwyn)
	ally_addtarget(talwyn, beetles_beach_wave1)
	ally_setattitude(talwyn, 1)
	ally_setfirepoints(talwyn, fp_talwyn_beach)
	--SAVE.beach_door_opened = true
	SAVE.beach_cam = true
	request_auto_save()
	prt("request_auto_save, ti_beach_door_scene script line 122")
	fade_to_black(0)

	--return true
	
end

--------------------------------------------------------------------------------
-- Ratchet Response tables
--------------------------------------------------------------------------------

RatDlg1 =
{
	text =  "It is I, the Dread Pirate Ratchet!",
	dialog = DialogueSpecs.TI_COVE_PIRATE,
	func =  f_ratchet_response_1
}

RatDlg2 =
{
	text =  "It is I, Captain Romulus Slag!",
	dialog = DialogueSpecs.TI_COVE_ROMULUS,
	func =  f_ratchet_response_2

}

RatDlg3 =
{
	text =  "It is I, Captain Angstrom Darkwater!",
	dialog = DialogueSpecs.TI_COVE_ANGSTROM,
	func =  f_ratchet_response_3

}

--------------------------------------------------------------------------------
-- functions
--------------------------------------------------------------------------------


--inital skull line
function f_talk_to_door()

	actor_speak_and_wait(talking_skull_beach_door, SkulDlg1, true)
	wait(0.2)
	return true
	
end


----------------------------------------------------------------------------------------------------
-- Main Loop
----------------------------------------------------------------------------------------------------


--turning get_hero(), pete, and tal into actors

--if SAVE.beach_door_opened == nil then

	hero_warp(get_hero(), hero_warpvol_beach_door)  
	activate_cam(get_hero(), cam_beach_door_scene)
	ally_warp(talwyn, tal_warpvol_beach_door)
	active_hero = get_hero()
	make_actor(talking_skull_beach_door)

	f_talk_to_door()

local continue = true
while continue do

	local choice = scene_show_menu_and_wait( { RatDlg1, RatDlg2, RatDlg3 }, false )

	if (choice ~= nil and choice.func ~= nil) then
		continue = choice.func()
	else
		continue = false
	end
	
wait()

end

--end

-- end gameplay, this occurs when the user gets to viper caverns