if(role == "minion" && type == "melle"){
	if(states != "attack" && collision_rectangle(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, obj_enemy, true, false) && alive && !selected){
		states = "attack";
		target = other;
	}else if(hp >= hp_max/4 && alive){
		state = 0;
	}else if(hp <= hp_max/4 && alive){
		state = 2
	}else{
		target = noone;
	}
}


