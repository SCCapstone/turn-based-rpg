/// @description Insert description here
// You can write your code in this editor
var _up_key = keyboard_check_pressed(ord("W"));
var _down_key = keyboard_check_pressed(ord("S"));
var _accept_key = keyboard_check_pressed(ord("E"));
var _back_key = keyboard_check_pressed(vk_escape);

//show_debug_message(_in_magic)

if (_in_magic._item_type == item_type.spell && _added == false) {
	obj_inventory._show_tooltip = false;
	if (array_length(_member._spells) < 5) {
		array_push(_member._spells, _in_magic);
		global.inventory.remove_item(_in_magic);
		_added = true;
		alarm[0] = 2 * room_speed;
		obj_inventory._magic_equip = false;
		obj_inventory._equipping = false;
	} else {
		obj_inventory._show_tooltip = false;
		_pos += _down_key - _up_key;
		if (_pos >= array_length(_member._spells)) {
			_pos = 0;
		}
		if (_pos < 0) {
			_pos = array_length(_member._spells) - 1;
		}
		if (_accept_key) {
			global.inventory.add_item(_member._spells[_pos]);
			_member._spells[_pos] = _in_magic;
			global.inventory.remove_item(_in_magic);
			_added = true;
			alarm[0] = 2 * room_speed;
			obj_inventory._magic_equip = false;
			obj_inventory._equipping = false;
		}
	}
} 
if (_in_magic._item_type == item_type.prayer && _added == false) {
	obj_inventory._show_tooltip = false;
	if (array_length(_member._prayers) < 5) {
		array_push(_member._prayers, _in_magic);
		global.inventory.remove_item(_in_magic);
		_added = true;
		alarm[0] = 2 * room_speed;
		obj_inventory._magic_equip = false;
		obj_inventory._equipping = false;
	} else {
		obj_inventory._show_tooltip = false;
		_pos += _down_key - _up_key;
		if (_pos >= array_length(_member._prayers)) {
			_pos = 0;
		}
		if (_pos < 0) {
			_pos = array_length(_member._prayers) - 1;
		}
		if (_accept_key) {
			global.inventory.add_item(_member._prayers[_pos]);
			_member._prayers[_pos] = _in_magic;
			global.inventory.remove_item(_in_magic);
			_added = true;
			alarm[0] = 2 * room_speed;
			obj_inventory._magic_equip = false;
			obj_inventory._equipping = false;
		}
	}
}