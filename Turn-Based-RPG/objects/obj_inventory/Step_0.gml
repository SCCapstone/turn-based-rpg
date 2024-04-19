if (!_show_inventory) {
	self.visible = false;
	_x_pos = 0;
	_y_pos = 0;
} else {
	self.visible = true;	
}

// move through inventory
var _up_key = keyboard_check_pressed(ord("W"));
var _down_key = keyboard_check_pressed(ord("S"));
var _left_key = keyboard_check_pressed(ord("A"));
var _right_key = keyboard_check_pressed(ord("D"));
var _accept_key = keyboard_check_pressed(ord("E"));
var _back_key = keyboard_check_pressed(vk_escape);

// navigating through inventory
if (_show_inventory && _show_tooltip == false) {
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

if (_show_tooltip == false && _accept_key && _pressed == false && global.inventory[# _x_pos, _y_pos] != noone) {
	 show_debug_message("Testing 1");
	_show_tooltip = true;
	if (global.inventory[# _x_pos, _y_pos]._item_type == item_type.weapon || 
	global.inventory[# _x_pos, _y_pos]._item_type == item_type.magic_weapon || 
	global.inventory[# _x_pos, _y_pos]._item_type == item_type.prayer_book) {
		_equippable = true;
	} else {
		_equippable = false;
	}
} else if (_equippable && _accept_key && _equipping != true) {
	show_debug_message("Testing 2");
	_equipping = true;
} else if (_equipping) {
	_pos += _down_key - _up_key;
	if (_pos >= ds_list_size(global.party)) {
		_pos = 0;
	}
	if (_pos < 0) {
		_pos = ds_list_size(global.party) - 1;
	}
	show_debug_message("Testing 3");
	if (_accept_key) {
		var _member = ds_list_find_value(global.party, _pos);
		var _member_equipment = noone;
		if (global.inventory[# _x_pos, _y_pos]._item_type == item_type.weapon) {
			_member_equipment = _member._weapon;
			if (_member_equipment == noone) {
				_member._weapon = global.inventory[# _x_pos, _y_pos];
			} else if (_member_equipment != noone) {
				_member._weapon = global.inventory[# _x_pos, _y_pos];
				global.inventory.remove_item(global.inventory[# _x_pos, _y_pos]);
				global.inventory.add_item(_member_equipment);
			} 
		} else if (global.inventory[# _x_pos, _y_pos]._item_type == item_type.magic_weapon) {
			_member_equipment = _member._magic_weapon;
			if (_member_equipment == noone) {
				_member._magic_weapon = global.inventory[# _x_pos, _y_pos];
			} else if (_member_equipment != noone) {
				_member._magic_weapon = global.inventory[# _x_pos, _y_pos];
				global.inventory.remove_item(global.inventory[# _x_pos, _y_pos]);
				global.inventory.add_item(_member_equipment);
			}
		} else if (global.inventory[# _x_pos, _y_pos]._item_type == item_type.prayer_book) {
			_member_equipment = _member._prayer_book;
			if (_member_equipment == noone) {
				_member._prayer_book = global.inventory[# _x_pos, _y_pos];
			} else if (_member_equipment != noone) {
				_member._prayer_book = global.inventory[# _x_pos, _y_pos];
				global.inventory.remove_item(global.inventory[# _x_pos, _y_pos]);
				global.inventory.add_item(_member_equipment);
			}
		}
	}
}

if (_show_tooltip && _back_key) {
	_show_tooltip = false;
} 

if (_equipping && _back_key) {
		_equipping = false;
}

_pressed = false;
