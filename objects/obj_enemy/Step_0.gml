#region //definir inimigo mais próximo

if(!instance_exists(closest_target)){
	closest_target = noone
}

if(closest_target == noone){
	closest_target = instance_nearest(x, y, obj_player);
}	

#endregion

if(closest_target && states=="idle"){
	states = "move";
}else if(states != "attack" && !closest_target){
	closest_target = noone;
	states = "idle";
}






if(states == "move" && alive == true){
	scr_move(closest_target);
} else if(states == "attack" && hp>=0 && type == "melle"){
	attack_melle(atk_speed, atk, target);
} else if(states == "attack" && hp>=0 && type == "ranged"){
	attack_minion_ranged(atk_speed, atk, target);
} else if(states == "idle"){
	scr_idle();
}

if(type == "melle"){
	if(states != "attack" && collision_rectangle(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, obj_player, true, false) && alive){
		states = "attack";
		target = collision_rectangle(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, obj_player, true, false);
	}
}


if(type == "ranged"){
	if(instance_exists(closest_target)){
		if(states != "attack" && collision_circle(x, y, 50, obj_player, true, false) && !collision_line(x, y, closest_target.x, closest_target.y, obj_wall, true, false) && alive){
			target = collision_circle(x, y, 50, obj_player, true, false);
			states = "attack";
		}
	}
}

//conferir se existe um closest_target
if(!instance_exists(closest_target)){
	closest_target = noone;
}


//máquina de estado
if(role == "minion"){
	scr_sm_minion(spr_idl, spr_atk, spr_dmg, spr_dmg_atk, spr_dt);
}

if(role == "commander"){
	scr_sm_commander(spr_idl, spr_atk, spr_dt);
}