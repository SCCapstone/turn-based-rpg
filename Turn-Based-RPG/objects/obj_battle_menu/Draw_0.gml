/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_pixeloid);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_sprite_stretched(spr_menu_background,0,x+236,y+global.ui_y_buffer,81,global.textbox_height);

if (_selected_type == noone) { // Draws available move types
	for (var i = 0; i < _types_length; i++) {
		var _c = c_white;
		if (_pos == i) {
			_c = c_yellow;
		}
		draw_text_ext_transformed_color(x+244, y+123+(i*12), _move_types[i], global.op_space, 3000, .1, .1, 0, _c, _c, _c, _c, 1)
	}
} else if (_selected_move == noone && _exists == noone) { // Draws available moves of a specific type
	for (var i = 0; i < array_length(_move_choices); i++) {
		var _c = c_white;
		if (_pos == i) {
			_c = c_yellow;
		}
		if (_selected_type == 3) {
			draw_text_ext_transformed_color(244, y+123+(i*12), _move_choices[i].item._name, 3000, 3000, .1, .1, 0, _c, _c, _c, _c, 1)
		} else {
			draw_text_ext_transformed_color(244, y+123+(i*12), _move_choices[i]._name, 3000, 3000, .1, .1, 0, _c, _c, _c, _c, 1);
		}
	}
} else if (_selected_move == noone && _exists != noone) { // Draws what moveset is empty
	draw_text_ext_transformed(244, y+123, _exists, 3000, 3000, .1, .1, 0)
}

if (_selected_type != noone && _selected_move != noone && _pos != noone) { // Draws player's targeting arrow
	draw_sprite(spr_arrow,0,_enemy_party[_pos].x - 7,_enemy_party[_pos].y + 10);
}
