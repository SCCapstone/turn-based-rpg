/// @description Insert description here
// You can write your code in this editor
var up_key = keyboard_check_pressed(ord("W"));
var down_key = keyboard_check_pressed(ord("S"));
var accept_key = keyboard_check_pressed(ord("E"));
var back_key = keyboard_check_pressed(vk_escape);

if (_selected_type == noone && _selected_move == noone && _selected_target == noone) { // Select move type
	_pos += down_key - up_key; // Player selection indicator
	if (_pos >= _types_length) {
		_pos = 0;
	}
	if (_pos < 0) {
		_pos = _types_length - 1;
	}
	if (accept_key) { // E pressed to select a move type
		_selected_type = _pos;
		_selected_move = noone;
		_move_choices = [];
		_pos = 0;
	}
} else if (_selected_type != noone && _selected_move == noone && _selected_target == noone) { // Select move of the chosen move type
	switch (_selected_type)
	{
		case 0: // Move type = Attack
			if (_player_party[_p_num]._weapon != noone) {
				_move_choices = _player_party[_p_num]._weapon._attacks;
				_choices_length = array_length(_move_choices);
			} else {
				_exists = "No attacks!";
			}
		break;
		case 1: // Move type = Magic
			if (array_length(_player_party[_p_num]._spells) != 0) {
				_move_choices = _player_party[_p_num]._spells;
				_choices_length = array_length(_move_choices);
			} else {
				_exists = "No spells!";
			}
		break;
		case 2: // Move type = Prayer
			if (array_length(_player_party[_p_num]._prayers) != 0) {
				_move_choices = _player_party[_p_num]._prayers;
				_choices_length = array_length(_move_choices);
			} else {
				_exists = "No prayers!";
			}
		break;
		case 3: // Move type = Item
			for (_i = 0; _i < 4; _i++) {
				for (_j = 0; _j < 10; _j++) {
					if (global.inventory[# _j, _i] != noone && _item_stop = false &&
					global.inventory[# _j, _i]._item_type == item_type.consumable){
						array_push(_move_choices, global.inventory[# _j, _i]);
						array_push(_item_position, [_j, _i]);
					}
				}
					
			}
			_item_stop = true;
			_choices_length = array_length(_move_choices);
			if (array_length(_move_choices) == 0) {
				_exists = "No items!"
			}
		break;
	}
	_pos += down_key - up_key;
	if (_pos >= _choices_length) {
		_pos = 0;
	}
	if (_pos < 0) {
		_pos = _choices_length - 1;
	}
	if (accept_key) { // E pressed to select a move
		if (_selected_type == 0 && array_length(_move_choices) = 0) { // If no attacks are available
			show_debug_message("No attacks!");
			_exists = noone;
			_selected_type = noone;
			_selected_move = noone;
			_pos = 0;
		}
		if (_selected_type == 1 && array_length(_move_choices) = 0) { // If no spells are available
			show_debug_message("No spells!");
			_exists = noone;
			_selected_type = noone;
			_selected_move = noone;
			_pos = 0;
		}
		if (_selected_type == 2 && array_length(_move_choices) = 0) { // If no prayers are available
			show_debug_message("No prayers!");
			_exists = noone;
			_selected_type = noone;
			_selected_move = noone;
			_pos = 0;
		}
		if (_selected_type == 3 && array_length(_move_choices) = 0) { // If no items are available
			show_debug_message("No items!");
			_exists = noone;
			_selected_type = noone;
			_selected_move = noone;
			_pos = 0;
		}
		// If the player doesn't have enough MP to cast a specific spell
		if (_selected_type == 1 && array_length(_player_party[_p_num]._spells) > 0
		&& _player_party[_p_num]._mp < _player_party[_p_num]._spells[_pos]._mp_cost) {
			show_debug_message("Not enough MP to cast!");
			_selected_type = noone;
			_pos = 0;
		}
		if (_selected_type == 0 || _selected_type == 1 || _selected_type == 2){ // If all prior checks don't have an issue, the move is selected
			_selected_move = _pos;
			_pos = 0;
			_exists = noone;
		}
		if (_selected_type == 3) {
			consume_item(_player_party[_p_num], _item_position[_pos]);
			_pos = 0;
			_exists = noone;
			_selected_target = 0;
			_delay = false;
		}
	}
	if (back_key) { // Moves back to the move type menu
		_selected_type = noone;
		_selected_move = noone;
		_move_choices = [];
		_exists = noone;
		_pos = 0;
	}
} else if (_selected_type != noone && _selected_move != noone && _selected_target == noone) { // Select a target
	// Targeting for friendly prayers
	if(_selected_type == 2 && _player_party[_p_num]._prayers[_selected_move]._targets_friendly == true) {
		_p_length = array_length(_player_party);
		_pos += down_key - up_key;
		if (_pos >= _p_length) {
			_pos = 0;
		}
		if (_pos < 0) {
			_pos = _p_length - 1;
		}
		if (_player_party[_pos]._is_dead == true) {
			if (_pos + 1 < _p_length) {
				_pos++;
			}
			if (_pos + 1 > _p_length) {
				_pos = 0;
			}
		}
		if (accept_key) { // Select target and continue battle object progression
			_selected_target = _pos;
			_pos = noone;
			_delay = false;
		}
		if (back_key) { // Move back to move selection
			_selected_move = noone;
			_pos = 0;
		}
	} 
	// Targeting for attacking enemies
	else {
		_e_length = array_length(_enemy_party); // Sets the enemy's party size
		_pos += down_key - up_key;
		if (_pos >= _e_length) {
			_pos = 0;
		}
		if (_pos < 0) {
			_pos = _e_length - 1;
		}
		if (_enemy_party[_pos]._is_dead == true) {
			if (_pos + 1 < _e_length) {
				_pos++;
			}
			if (_pos + 1 > _e_length) {
				_pos = 0;
			}
		}
		if (accept_key) { // Select target and continue battle object progression
			_selected_target = _pos;
			_pos = noone;
			_delay = false;
		}
		if (back_key) { // Move back to move selection
			_selected_move = noone;
			_pos = 0;
		}
	}
}
if (_finished == true) { // Destroys particular instance of the battle menu
	instance_destroy(self);
}
