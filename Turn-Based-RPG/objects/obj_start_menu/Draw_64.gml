/// @description Insert description here
// You can write your code in this editor
var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy); // sets the gui size to the same size as the camera

draw_sprite(spr_field_old, 0, x, y - 1);

for (_i = 0; _i < op_length; _i++) {
	if (_i = pos) {
		draw_sprite_stretched(spr_menu_background, 2, x + 122, y + 54 + (_i * 27), 82, 25);
		draw_text_ext_transformed(x + 128, y + 59 + (_i * 27), options[_i], 1000, 1000, .125, .125, 0);	
	} else if (_i == 1 && load == false) {
		return;
	} else {
		draw_sprite_stretched(spr_menu_background, 0, x + 122, y + 54 + (_i * 27), 82, 25);
		draw_text_ext_transformed(x + 128, y + 59 + (_i * 27), options[_i], 1000, 1000, .125, .125, 0);	
	}
}

draw_text_transformed(x + 18, y + 10, "Turn Based RPG", .35, .35, 0)