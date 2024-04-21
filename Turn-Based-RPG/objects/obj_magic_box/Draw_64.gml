var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

draw_sprite_stretched(spr_menu_background, 1, x + 110, y + 50, 100, 86);
if (_in_magic._item_type == item_type.spell) {
	for (_i = 0; _i < array_length(_member._spells); _i++) {
		if (_i = _pos) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
		draw_text_ext_transformed(x + 117, y + 54 + (_i * 16), _member._spells[_i]._name, 1000, 1000, .125, .125, 0);
	}
} else if (_in_magic._item_type == item_type.prayer) {
	for (_i = 0; _i < array_length(_member._prayers); _i++) {
		if (_i = _pos) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
		draw_text_ext_transformed(x + 117, y + 54 + (_i * 16), _member._prayers[_i]._name, 1000, 1000, .125, .125, 0);
	}
}

if (_added) {
	draw_sprite_stretched(spr_menu_background, 1, round(110), round(138), 100, global.namebox_height);
	draw_text_ext_transformed(110 + global.text_x_buffer, 138 + global.text_y_buffer, "Equipped", 16, global.text_max_width, .125, .125, 0);
}