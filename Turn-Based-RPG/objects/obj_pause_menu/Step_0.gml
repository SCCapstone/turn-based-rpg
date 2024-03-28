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
			break;
	
			case 1:
			
			break;
	
			case 2:
			
			break;
		
			case 3:
		
			break;
		}
	}
}

if (_show_pause) {
	_pos += down_key - up_key; // Player selection indicator
	if (_pos >= _pause_length) {
		_pos = 0;
	}
	if (_pos < 0) {
		_pos = _pause_length - 1;
	}
	
	if (accept_key) {
		switch (_pos) {
			case 0: 
			
			break;
			
			case 1:
			
			break;
			
		}
	}
}

if (back_key && _menu_disable) {
	_menu_disable = false;
	_show_pause = false;
} else if (back_key) {
	obj_player._disabled = false;
	instance_destroy(self);
}


