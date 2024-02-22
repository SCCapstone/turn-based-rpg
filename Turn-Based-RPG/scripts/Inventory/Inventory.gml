function Inventory() constructor {
	_inventory = []
	_max_inventory_size = 60;
	
	add_item = function(item){
		if (array_length(_inventory) < _max_inventory_size) {
			array_push(_inventory, {
				sprite: item._sprite,
				name: item._name,
			});
		}
	}

	remove_item = function(_index){
		array_delete(_inventory, _index, 1)
	}	

}