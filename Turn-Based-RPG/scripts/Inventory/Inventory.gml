// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Inventory() constructor {
	_inventory = []
	_max_inventory_size = 60;
}

function add_item(_sprite, _name, _object) {
	if (array_length(_inventory) < _max_inventory_size) {
		array_push(_inventory, {
			sprite: _sprite,
			name: _name,
			object: _object,
		});
	}
}

function remove_item(_index) {
	array_delete(_inventory, _index, 1)
}		