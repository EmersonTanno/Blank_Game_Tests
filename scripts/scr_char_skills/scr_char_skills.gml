
#region //knight
//skill

///@param target
function scr_knight_innate_skills(){
	scr_knight01();
	scr_knight02();
}


//honor_of_knight
//Todos os seus minions melle tem seu ataque dobrado
function scr_knight01(){
    // Detectar se há minions dentro da área de efeito
    var eff_range = collision_circle(x, y, 50, obj_player_minions_melle, false, true);
    
    // Aplicar efeito aos minions na área de efeito
     if (eff_range) {
        // Verifique se o ataque do minion não foi alterado ainda
        if (eff_range.atk == eff_range.atk_original) {
            eff_range.knight = true;
            eff_range.atk *= 2;
        }
    } 

    // Verificar todos os minions e ajustar o ataque se estiverem fora da área de efeito
    with (obj_player_minions_melle) {
        if (knight == true && !collision_circle(x, y, 50, obj_commander_01, true, true)) {
            // Se o minion está fora da área de efeito e o ataque foi alterado pela passiva
            knight = false;
            atk = atk_original;
        }
    }
}

function scr_knight02(){
	if(atk_count >= 4){
		// Obter a lista de alvos na área de colisão
	    var target_list = ds_list_create();
	    collision_rectangle_list(x - sprite_width, y - sprite_height, x + sprite_width, y + sprite_height, obj_enemy, false, true, target_list, false);

	    // Iterar sobre cada inimigo na área de colisão
	    var target_count = ds_list_size(target_list);
	    for (var i = 0; i < target_count; i++) {
	        var target = target_list[| i];
	        create_slash(target.x, target.y, atk*2, target);
	    }

	    // Limpar a lista e resetar o contador
	    ds_list_destroy(target_list);
	    atk_count = 0;
	}
}

#endregion


///@param xx
///@param yy
///@param atk
///@param target
function create_slash(xx, yy, atk, target){
	slash = instance_create_layer(xx, yy, layer, obj_slash);
	slash.atk = atk;
	slash.target = target;
}