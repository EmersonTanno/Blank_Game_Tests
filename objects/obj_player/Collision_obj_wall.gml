var _wall = collision_rectangle(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, obj_wall, true, false)
if(instance_exists(_wall) && instance_exists(target)){
	mp_potential_step_object(target.x, target.y, spd, _wall);
}




