/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();


#region //status

hp_max = 100;
hp = hp_max;
atk = 5;
atk_speed = 1;
def = 3;
original_speed = 1.2;
spd = 2;
alive = true;
//não mecher
type = "melle";
atk_range = 0;
attack_animation = 1;
role = "commander";

#endregion


spr_idl = spr_commander_01_idle;
spr_atk = spr_commander_01_attack;
spr_dt = spr_commander_01_dead;
spr_walk = spr_commander_01_walk

//controle skills
atk_count = 0;