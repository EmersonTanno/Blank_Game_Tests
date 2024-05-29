// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function scr_idle(){
	friction = .1;
}


/// @param target
function scr_move(target){

	friction = 0;
	
		if(instance_exists(target)){
			mp_potential_step(target.x, target.y, spd, false);
		
			if(type == "melle" || obj_player_minions_ranged){
				if(position_meeting(x, y, target)){
					var target_object = target.object_index;
					states = "idle"
					if(target_object == obj_target){
						instance_destroy(target)
						selected = false;
					}
				}
			} else if(type == "ranged"){
				if(collision_circle(x, y, 50, target, true, false) && !collision_line(x, y, target.x, target.y, obj_wall, true, false)){
						var target_object = target.object_index;
						states = "idle"
						if(target_object == obj_target){
							instance_destroy(target)
						selected = false;
					}
				}
			}
		}


		if(speed > spd){
			speed = spd;
		}

}

