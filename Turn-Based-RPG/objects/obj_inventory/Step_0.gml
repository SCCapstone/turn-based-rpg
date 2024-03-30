if (!_show_inventory) {
	self.visible = false;
	_x_pos = 0;
	_y_pos = 0;
} else {
	self.visible = true;	
};

// move through inventory
var _up_key = keyboard_check_pressed(ord("W"));
var _down_key = keyboard_check_pressed(ord("S"));
var _left_key = keyboard_check_pressed(ord("A"));
var _right_key = keyboard_check_pressed(ord("D"));

if (_show_inventory) {
	_y_pos +=  _down_key - _up_key;
	_x_pos += _right_key - _left_key;
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
}


// TO-DO: highlight current selected inventory item for equipping