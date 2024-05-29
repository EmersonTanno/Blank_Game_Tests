/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

#region //status

hp_max = 10;
hp = hp_max;
atk_original = 1;
atk = 1;
atk_speed = 1;
def = 1;
original_speed = 1
spd = 1;
alive = true;
type = "melle";
attack_animation = 1;
role = "minion";

#endregion

spr_idl = spr_player_minion;
spr_atk = spr_player_minion_attack;
spr_dmg = spr_player_minion_damage;
spr_dmg_atk = spr_player_minion_damage_attack;
spr_dt = spr_player_minion_dead


#region //commander passives

knight = false;

#endregion