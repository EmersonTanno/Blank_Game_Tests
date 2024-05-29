var _wall = collision_rectangle(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, obj_wall, true, false)
if(instance_exists(_wall) && instance_exists(closest_target)){
	mp_potential_step_object(closest_target.x, closest_target.y, spd, _wall);
}



