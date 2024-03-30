/// @description Insert description here
// You can write your code in this editor
up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
left_key = keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(ord("D"));
accept_key = keyboard_check_pressed(ord("E"));
back_key = keyboard_check_pressed(vk_escape);

// Move through the menu
if (!_menu_disable) {
	_pos +=  right_key - left_key;
	if (_pos >= _op_length) {
		_pos = 0;
	}
	if (_pos < 0) {
		_pos = _op_length - 1;
	}

	if (accept_key) {
		switch (_pos) {
			case 0:
				_menu_disable = true;
				_show_pause = true;
				_pressed = true;
			break;
	
			case 1:
				_menu_disable = true;
				_inventory = instance_create_layer(x, y, "DepthSorter", obj_inventory);
				_inventory._show_inventory = true;
			break;
	
			case 2:
				_menu_disable = true;
				_equip = instance_create_layer(x, y, "DepthSorter", obj_equip_screen);
				_equip.show_equip = true;
			break;
		
			case 3:
				_menu_disable = true;
				_stats = instance_create_layer(x, y, "DepthSorter", obj_stats_screen);
				_stats.show_stats = true;
			break;
		}
	}
}

if (_show_pause) {
	if (keyboard_check_released(accept_key)) {
		_pressed = false;
	}
	_pos += down_key - up_key; // Player selection indicator
	if (_pos >= _pause_length) {
		_pos = 0;
	}
	if (_pos < 0) {
		_pos = _pause_length - 1;
	}
	
	if (accept_key && _pressed == false) {
		switch (_pos) {
			case 0: 
				Save();
			break;
			
			case 1:
				game_end();
			break;
			
			case 2:
				show_debug_message([ds_list_find_value(global.party,2)]);
			break;
			
			case 3:
				room_goto(0);
			break;
		}
	}
}

if (back_key && _menu_disable) {
	_menu_disable = false;
	_show_pause = false;
	if (_inventory != noone) {
		instance_destroy(_inventory);
	}
	if (_equip != noone) {
		instance_destroy(_equip);
	}
	if (_stats != noone) {
		instance_destroy(_stats);
	}
} else if (back_key) {
	obj_player._disabled = false;
	instance_destroy(self);
}