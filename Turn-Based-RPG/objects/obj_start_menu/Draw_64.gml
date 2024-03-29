/// @description Insert description here
// You can write your code in this editor
var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy); // sets the gui size to the same size as the camera

for (_i = 0; _i < op_length; _i++) {
		if (_i = pos) {
			draw_sprite_stretched(spr_menu_background, 2, x + 8 + (_i * 76), y + 9, 75, 22);
			draw_text_ext_transformed(x + 14 + (_i * 77), y + 12, _options[_i], 1000, 1000, .125, .125, 0);	
		} else {
			draw_sprite_stretched(spr_menu_background, 0, x + 8 + (_i * 76), y + 9, 75, 22);
			draw_text_ext_transformed(x + 14 + (_i * 77), y + 12, _options[_i], 1000, 1000, .125, .125, 0);		
		}
	}