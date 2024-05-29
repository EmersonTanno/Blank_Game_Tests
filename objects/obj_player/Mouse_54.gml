//mover
if(target && instance_exists(target)){
	var target_object = target.object_index;
	if(target_object == obj_target){
		with (target) instance_destroy();
	}
}

if(selected){
	target = instance_create_layer(mouse_x, mouse_y, layer, obj_target);
	states = "move";
}



