

if(states == "move" && instance_exists(target)){
	scr_move(target);
} else if(states == "attack"){
	if(type == "melle"){
		attack_melle(atk_speed, atk, target);
	} else if(type == "ranged"){
		switch(role){
			case "minion":
				attack_minion_ranged(atk_speed, atk, target);
			break;
			
			case "commander":
				attack_commander_ranged(atk_speed, atk, atk_range, target, shot);
			break;
		}
	}
} else {
	scr_idle();
}


//minions
if(role == "minion"){
	//criar área de ataque
	if(type == "melle"){
		if(collision_rectangle(x-20, y-20, x+20, y+20, obj_enemy, true, true) && states == "idle" && !selected){
			target = collision_rectangle(x-20, y-20, x+20, y+20, obj_enemy, true, true);
			states = "move";
		}
	}

	if(type == "ranged"){
		if(states != "attack" && collision_circle(x, y, 50, obj_enemy, true, false) && !selected){
			target = collision_circle(x, y, 50, obj_enemy, true, false);
			if(!collision_line(x, y, target.x, target.y, obj_wall, true, false)){
				states = "attack";
			}
		}
	}
}

//commanders
if(role == "commander"){
	
	if(type == "melle" && !selected){
		if(collision_rectangle(x - sprite_width/2 - 20, y - sprite_height/2 - 20, x + sprite_width/2 +20, y + sprite_height/2 + 20, obj_enemy, true, false) && states == "idle"){
			target = collision_rectangle(x - sprite_width/2 - 20, y - sprite_height/2 - 20, x + sprite_width/2 +20, y + sprite_height/2 + 20, obj_enemy, true, false);
			states = "move";
		}else if(hp >= hp_max/4 && alive && !selected){
			state = 0;
		}else if(hp <= hp_max/4 && alive && !selected){
			state = 2
		}else{
			target = noone;
		}
		
		if(states != "attack" && collision_rectangle(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, obj_enemy, true, false) && alive && !selected){
			states = "attack";
			target = collision_rectangle(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, obj_enemy, true, false);
		}
		
	}
	
	if(type == "ranged" && !selected){
		if(states != "attack" && collision_circle(x, y, atk_range, obj_enemy, true, false)){
			target = collision_circle(x, y, 50, obj_enemy, true, false);
			if(!collision_line(x, y, target.x, target.y, obj_wall, true, false)){
				states = "attack";
			}
		}
	}
}

if(role = "commander"){
	switch(states){

		case "idle":
			state = 0;
			break;
		
		case "attack":
			state = 1;
			break;
	
	}
}

//reset parado
if(target == noone){
	states = "idle";
}

if(hp<=0){
	state = 4;
	alive = false;
}

//máquina de estado
if(role == "minion"){
	scr_sm_minion(spr_idl, spr_atk, spr_dmg, spr_dmg_atk, spr_dt);
}

if(role == "commander"){
	scr_sm_commander(spr_idl, spr_atk, spr_walk, spr_dt);
}