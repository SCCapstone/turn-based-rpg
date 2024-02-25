/// @description Insert description here
// You can write your code in this editor
var up_key = keyboard_check_pressed(ord("W"));
var down_key = keyboard_check_pressed(ord("S"));
var accept_key = keyboard_check_pressed(ord("E"));
var back_key = keyboard_check_pressed(ord("Q"));

if (_selected_type == noone) {
	_pos += down_key - up_key;
	if (_pos >= _types_length) {
		_pos = 0;
	}
	if (_pos < 0) {
		_pos = _types_length - 1;
	}
	if (accept_key) {
		_selected_type = _pos;
		_pos = 0;
	}
} else if (_selected_move == noone) {
	switch (_selected_type)
	{
		case 0:
			if (_player_party[_p_num]._weapon != noone) {
				_move_choices = _player_party[_p_num]._weapon._attacks;
				_choices_length = array_length(_move_choices);
			} else {
				_exists = "No attacks!";
			}
		break;
		case 1: 
			if (_player_party[_p_num]._spells != noone) {
				_move_choices = _player_party[_p_num]._spells;
				_choices_length = array_length(_move_choices);
			} else {
				_exists = "No spells!";
			}
		break;
		case 2:
			if (_player_party[_p_num]._prayers != noone) {
				_move_choices = _player_party[_p_num]._prayers;
				_choices_length = array_length(_move_choices);
			} else {
				_exists = "No prayers!";
			}
		break;
	}
	for (i = 0; i < _choices_length; i++) {
		if (_selected_type == 1 && array_length(_player_party[_p_num]._spells) > 0
		&& _player_party[_p_num]._mp < _player_party[_p_num]._spells[i]._mp_cost) {
			_move_choices[i] = "MP too low!"
		}	
	}
	_pos += down_key - up_key;
	if (_pos >= _choices_length) {
		_pos = 0;
	}
	if (_pos < 0) {
		_pos = _choices_length - 1;
	}
	if (accept_key) {
		if (_selected_type == 0 && array_length(_move_choices) = 0) {
			show_debug_message("No attacks!");
			_exists = noone;
			_selected_type = noone;
			_pos = 0;
		}
		if (_selected_type == 1 && array_length(_move_choices) = 0) {
			show_debug_message("No spells!");
			_selected_type = noone;
			_pos = 0;
		}
		if (_selected_type == 2 && array_length(_move_choices) = 0) {
			show_debug_message("No prayers!");
			_selected_type = noone;
			_pos = 0;
		}
		if (_selected_type == 1 && array_length(_player_party[_p_num]._spells) > 0
		&& _player_party[_p_num]._mp < _player_party[_p_num]._spells[_pos]._mp_cost) {
			show_debug_message("Not enough MP to cast!");
			_selected_type = noone;
			_pos = 0;
		}
		if (_selected_type != noone){
			_selected_move = _pos;
			_pos = 0;
		}
	}
	if (back_key) {
		_selected_type = noone;
		_pos = 0;
	}
} else if (_selected_target == noone) {
	_e_length = array_length(_enemy_party);
	_pos += down_key - up_key;
	if (_pos >= _e_length) {
		_pos = 0;
	}
	if (_pos < 0) {
		_pos = _e_length - 1;
	}
	if (accept_key) {
		_selected_target = _pos;
		_pos = noone;
		_delay = false;
	}
	if (back_key) {
		_selected_move = noone;
		_pos = 0;
	}
}
if (_finished == true) {
	instance_destroy(self);
}
