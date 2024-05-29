if(instance_exists(target) && controll == 0){
	controll = 1;
	var damage = atk - target.def;
	if(damage < 1){
		damage = 1
	}
	target.hp -= damage;
}
if(image_index >= image_number-1){
	instance_destroy();
}
