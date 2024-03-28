// press I key to open and close inventory 
if (keyboard_check_pressed(ord("I")) && room != rm_world_map && room != rm_access_menu) {
	_show_inventory = !_show_inventory;
}

if (!_show_inventory) exit;

// move through inventory
var _up_key = keyboard_check_pressed(ord("W"));
var _down_key = keyboard_check_pressed(ord("S"));
var _left_key = keyboard_check_pressed(ord("A"));
var _right_key = keyboard_check_pressed(ord("D"));

_x_pos += _down_key - _up_key;
_y_pos += _left_key - _right_key;
if (_x_pos > _x_pos_max) {
	_x_pos = 0;
} else if (_x_pos < 0) {
	_x_pos = _x_pos_max;
}
if (_y_pos > _y_pos_max) {
	_y_pos = 0;
} else if (_y_pos < 0) {
	_y_pos = _y_pos_max;
}

// TO-DO: highlight current selected inventory item for equipping