if(instance_exists(target)){
	if(place_meeting(x, y, target)){
	
		target.hp -= damage;
	
		if(target.hp <= target.hp_max/4){
				target.state = 2;
		}
		
		if(target.hp <= 0){
			target.state = 4;
			target.alive = false;
		}
		
		instance_destroy();
	}else{
		move_towards_point(target.x, target.y, spd)
	}
}else{
	instance_destroy()
}