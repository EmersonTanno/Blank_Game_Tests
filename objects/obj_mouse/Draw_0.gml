
if(mouse_check_button(mb_left)){
	draw_set_alpha(.25);
	draw_rectangle_color(px, py, mouse_x, mouse_y, c_lime, c_lime, c_lime, c_lime, true);
	draw_set_alpha(.1);
	draw_rectangle_color(px, py, mouse_x, mouse_y, c_lime, c_lime, c_lime, c_lime, false);
	draw_set_alpha(1);
}




