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
	if (array_length(_move_choices) > 4 && _pos > 3) {
		for (var i = 0; i < 4; i++) {
			var _c = c_white;
			if (_pos == i+_pos-3) {
				_c = c_yellow;
			}
			if (_selected_type == 3) {
				draw_text_ext_transformed_color(x+244, y+123+(i*12), _move_choices[_pos+i-3].item._name, 3000, 3000, .1, .1, 0, _c, _c, _c, _c, 1)
			} else {
				// Checking which spells are unusable based on the current player's MP, lists them as "MP too low!" instead of their actual name
				if (_selected_type == 1 && array_length(_player_party[_p_num]._spells) > 0
				&& _player_party[_p_num]._mp < _player_party[_p_num]._spells[_pos+i-3]._mp_cost) {
					_c = c_gray;
				}	
				draw_text_ext_transformed_color(x+244, y+123+(i*12), _move_choices[_pos+i-3]._name, 3000, 3000, .1, .1, 0, _c, _c, _c, _c, 1);
			}
		}
	} else { 
		for (var i = 0; i < array_length(_move_choices); i++) {
			var _c = c_white;
			if (_pos == i) {
				_c = c_yellow;
			}
			if (_selected_type == 3 && i < 4) {
				draw_text_ext_transformed_color(x+244, y+123+(i*12), _move_choices[i].item._name, 3000, 3000, .1, .1, 0, _c, _c, _c, _c, 1)
			} else if (i < 4) {
				// Checking which spells are unusable based on the current player's MP, lists them as "MP too low!" instead of their actual name
				if (_selected_type == 1 && array_length(_player_party[_p_num]._spells) > 0
				&& _player_party[_p_num]._mp < _player_party[_p_num]._spells[i]._mp_cost) {
					_c = c_gray;
				}	
				draw_text_ext_transformed_color(x+244, y+123+(i*12), _move_choices[i]._name, 3000, 3000, .1, .1, 0, _c, _c, _c, _c, 1);
			}
		}
	}

} else if (_selected_move == noone && _exists != noone) { // Draws what moveset is empty
	draw_text_ext_transformed(x+244, y+123, _exists, 3000, 3000, .1, .1, 0)
}

// Draws player's targeting arrow
if (_selected_type != noone && _selected_move != noone && _pos != noone) { 
	// Sets player's targeting to friendly side when selecting friendly prayers
	if (_selected_type == 2 && _player_party[_p_num]._prayers[_selected_move]._targets_friendly == true) {
		draw_sprite_ext(spr_arrow,0,_player_party[_pos].x,_player_party[_pos].y + 10,
		-1, 1, 0, c_white, 1);
	} else { // Otherwise, draws targeting arrow normally
		draw_sprite(spr_arrow,0,_enemy_party[_pos].x,_enemy_party[_pos].y + 10);
	}
}
