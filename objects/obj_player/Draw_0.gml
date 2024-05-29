draw_self()

if(role == "minion"){
	if(selected){
		draw_set_alpha(.25);
		draw_circle_color(x, y, 8, c_lime, c_lime, true);
		draw_set_alpha(.1)
		draw_circle_color(x, y, 8, c_lime, c_lime, false);
		draw_set_alpha(1);
	}
}else if(role == "commander"){
	if(selected){
		draw_set_alpha(.25);
		draw_rectangle_color(x - sprite_width, y - sprite_height, x + sprite_width, y + sprite_height, c_lime, c_lime, c_lime, c_lime, true);
		draw_set_alpha(1);
	}
}