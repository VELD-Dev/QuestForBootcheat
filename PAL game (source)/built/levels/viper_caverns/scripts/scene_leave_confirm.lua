----------------------------------------------------------------------------------------------------
-- Leave Confirm Script
----------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ConfirmMsg1 =
{
  text = "Are you sure you want to leave Morrow Caverns?", 
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Ratchet Response functions
--------------------------------------------------------------------------------

function f_ratchet_leave_cavern()

	revert_actor( taxi_to_vc )
	
end

function f_ratchet_stay_cavern()

  revert_actor( taxi_to_vc )
  deactivate( taxi_to_vc )
  deactivate_taxi = true
  
end

--------------------------------------------------------------------------------
Ratchet_leave_response1 = 

{
  text = "Yes",
	func = f_ratchet_response_leave 
}
--------------------------------------------------------------------------------
Ratchet_leave_response2 = 

{
  text = "No",
	func = f_ratchet_response_stay 
}
--------------------------------------------------------------------------------

active_hero = get_hero();

make_actor( taxi_to_vc )


function f_talk_to_barge()
	actor_speak_and_wait(taxi_to_vc, ConfirmMsg1)
end


f_talk_to_door()

local choice = scene_show_menu_and_wait( {Ratchet_leave_response1, Ratchet_leave_response2 }, false)

choice.func()

 
