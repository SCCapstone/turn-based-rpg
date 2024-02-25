// inventory
function Inventory() constructor {
	_inventory = []
	_max_inventory_size = 60;
	_inventory_width = 10;
	_inventory_height = 6;
	
	add_item = function(global.weapons){
		if (array_length(_inventory) < _max_inventory_size) {
			array_push(_inventory, {
				sprite: gloabl.weapons._sprite,
				name: global.weapons._name,
			});
		}
	}

	remove_item = function(_index){
		array_delete(_inventory, _index, 1)
	}	

	item_selected  = function(_index) {
		_inventory[_index].hover = true;
	}
}