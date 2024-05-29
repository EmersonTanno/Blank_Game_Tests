/*state:
0 = normal
1 = atacando
2 = tomou dano
3 = tomou dano atacando
4 = morto
*/

/// @param atk_speed
/// @param atk
/// @param target
function attack_melle(atk_speed, atk, target){

	if(instance_exists(target) && collision_rectangle(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2, target, true, false) && state != 4){
		friction = .5;
		if(hp >= hp_max/4){
			state = 1;
		}else{
			state = 3;
		}
		if(timer <= 0/atk_speed){
			var damage = atk - target.def;
			timer = 60;
			attack_animation = 1;
			if(damage >= 1){
				target.hp -= damage;
			}else{
				target.hp -= 1;
			}
		}else{
			timer--;
		}
		
		if(target.hp <= target.hp_max/4){
			target.state = 2;
		}
		
		if(target.hp <= 0){
			target.state = 4;
			target.alive = false;
		}
	}else{
		closest_target = noone;
		if(hp >= hp_max/4){
			state = 0;
		}else{
			state = 2;
		}
		states = "idle";
	}
}


/// @param atk_speed
/// @param atk
/// @param target
function attack_minion_ranged(atk_speed, atk, target){
	if(instance_exists(target) && collision_circle(x, y, 100, target, true, false) && state != 4){
		friction = .5;
		if(hp >= hp_max/4){
			state = 1;
		}else{
			state = 3;
		}
		if(timer <= 0/atk_speed){
			var damage = atk - target.def;
			timer = 60;
			if(damage <= 1){
				damage = 1;
			}
			attack_animation = 1;
			create_arrow(target, damage);
			
		}else{
			timer--;
		}
		
		
	}else{
		closest_target = noone;
		if(hp >= hp_max/4){
			state = 0;
		}else{
			state = 2;
		}
		states = "idle";
	}
}


/// @param target
/// @param damage
function create_arrow(target, damage){
	var arrow = instance_create_layer(x, y, "Instances", obj_arrow);
	arrow.target = target;
	arrow.damage = damage;
}


/// @param atk_speed
/// @param atk
/// @param atk_range
/// @param target
/// @param shot
function attack_commander_ranged(atk_speed, atk, atk_range, target, shot){
	if(instance_exists(target) && collision_circle(x, y, atk_range+10, target, true, false) && state != 4){
		friction = .5;
		if(hp >= hp_max/4){
			state = 1;
		}else{
			state = 3;
		}
		if(timer <= 0/atk_speed){
			var damage = atk - target.def;
			timer = 60;
			if(damage <= 1){
				damage = 1;
			}
			attack_animation = 1;
			create_shot(target, damage, shot);
			
		}else{
			timer--;
		}
		
		
	}else{
		closest_target = noone;
		if(hp >= hp_max/4){
			state = 0;
		}else{
			state = 2;
		}
		states = "idle";
	}
}

/// @param target
/// @param damage
/// @param shots
function create_shot(target, damage, shots){
	var shot = instance_create_layer(x, y, "Instances", obj_arrow);
	shot.sprite_index = shots;
	shot.target = target;
	shot.damage = damage;
}