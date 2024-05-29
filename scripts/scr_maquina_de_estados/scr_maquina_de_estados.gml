/// @param sprite
function scr_idle_state(sprite){
	if(sprite_index != sprite){
		sprite_index = sprite;
	}
}

/// @param sprite_atk
/// @param sprite_idl
function scr_attack_state(sprite_atk, sprite_idl){
	if(sprite_index != sprite_atk){
		if(attack_animation == 1){
			sprite_index = sprite_atk;
			attack_animation = 0;
		}
	}else if (state == 1){
		if(image_index >= image_number-1){
			sprite_index = sprite_idl;
		}
	}
}

/// @param sprite
function scr_idle_damage_state(sprite){
	if(sprite_index != sprite){
		sprite_index = sprite;
	}
}

/// @param sprite_atk
/// @param sprite_idl
function scr_attack_damage_state(sprite_atk, sprite_idl){
	if(sprite_index != sprite_atk){
		if(attack_animation == 1){
			sprite_index = sprite_atk;
			attack_animation = 0;
		}
	}else if(state == 3){
		if(image_index >= image_number-1){
			sprite_index = sprite_idl;
		}
	}
}

///@param sprite_walk
function scr_walk_state(sprite_walk){
	if(states == "move" && sprite_index != sprite_walk){
		sprite_index = sprite_walk;
	}
}

/// @param sprite_death
function scr_death_state(sprite_death){
	if(hp<=0){
		state = 4;
	}
	if(state == 4 && sprite_index != sprite_death){
		char = instance_create_layer(x, y, layer, obj_duplicata);
		char.sprite_index = sprite_death;
		instance_destroy();
	}
}


/// @param spr_idl
/// @param spr_atk
/// @param spr_dmg
/// @param spr_atk_dmg
/// @param spr_dt
function scr_sm_minion(spr_idl, spr_atk, spr_dmg, spr_atk_dmg, spr_dt){
	switch (state){
	case 0:
		scr_idle_state(spr_idl);
		break;
	case 1:
		scr_attack_state(spr_atk, spr_idl);
		break;
	case 2:
		scr_idle_damage_state(spr_dmg);
		break;
	case 3:
		scr_attack_damage_state(spr_atk_dmg, spr_dmg);
		break;
	}
	scr_death_state(spr_dt);
}

/// @param spr_idl
/// @param spr_atk
/// @param sprite_walk
/// @param spr_dt
function scr_sm_commander(spr_idl, spr_atk, sprite_walk, spr_dt){
	switch (state){
	case 0:
		scr_idle_state(spr_idl);
		break;
	case 1:
		scr_attack_state(spr_atk, spr_idl);
		break;
	}
	scr_walk_state(sprite_walk)
	scr_death_state(spr_dt)
}