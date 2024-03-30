var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);
draw_set_font(fnt_pixeloid);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_sprite_stretched(spr_menu_background, 0, x + 3, y + 3, 314, 174)

if (!_menu_disable) {
	for (_i = 0; _i < _op_length; _i++) {
		if (_i = _pos) {
			draw_sprite_stretched(spr_menu_background, 2, x + 8 + (_i * 76), y + 9, 75, 22);
			draw_text_ext_transformed(x + 15 + (_i * 76), y + 13, _options[_i], 1000, 1000, .125, .125, 0);
		} else {
			draw_sprite_stretched(spr_menu_background, 0, x + 8 + (_i * 76), y + 9, 75, 22);
			draw_text_ext_transformed(x + 15 + (_i * 76), y + 13, _options[_i], 1000, 1000, .125, .125, 0);	
		}
	}
}

if (_show_pause) {
	for (_i = 0; _i < _op_length; _i++) {
		if (_i = 0) {
			draw_sprite_stretched(spr_menu_background, 2, x + 8 + (_i * 76), y + 9, 75, 22);
			draw_text_ext_transformed(x + 15 + (_i * 76), y + 13, _options[_i], 1000, 1000, .125, .125, 0);
		} else {
			draw_sprite_stretched(spr_menu_background, 0, x + 8 + (_i * 76), y + 9, 75, 22);
			draw_text_ext_transformed(x + 15 + (_i * 76), y + 13, _options[_i], 1000, 1000, .125, .125, 0);	
		}
	}
	draw_sprite_stretched(spr_menu_background, 0, x + 120, y + 50, 80, 80);
	for (_i = 0; _i < _pause_length; _i++) {
		if (_i = _pos) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
		draw_text_ext_transformed(x + 127, y + 54 + (_i * 16), _pause_options[_i], 1000, 1000, .125, .125, 0);
	}
}
