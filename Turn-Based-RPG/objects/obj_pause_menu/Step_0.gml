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
				obj_inventory._show_inventory = true;
			break;
	
			case 2:
				_menu_disable = true;
				obj_equip_screen.show_equip = true;
			break;
		
			case 3:
				_menu_disable = true;
				obj_stats_screen.show_stats = true;
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
			
		}
	}
}

if (back_key && _menu_disable) {
	_menu_disable = false;
	_show_pause = false;
	obj_inventory._show_inventory = false;
	obj_stats_screen.show_stats = false;
	obj_equip_screen.show_equip = false;
} else if (back_key) {
	obj_player._disabled = false;
	instance_destroy(self);
}


