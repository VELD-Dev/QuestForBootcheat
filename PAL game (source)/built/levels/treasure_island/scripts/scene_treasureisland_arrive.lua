-- TREAUSRE ISLAND ARRIVE SCRIPT


scene_arrive_active = true

while scene_arrive_active == true do
--activate_cam(get_hero(), cam_taxi_in)
activate_cam(get_hero(), scene_smuggler_cam_new_far, true)
if scene_arrive_active == true then
wait(2)
end

if is_in_volume(get_hero(), trig_vol_smuggler_activate) then
scene_arrive_active = false
end

wait()
end