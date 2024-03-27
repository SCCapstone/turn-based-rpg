function Inventory() constructor {
	_max_inventory_size = 60;
	// name, sprite, and description are attributes every item has
	_item_attributes = 3;
	global.inventory = ds_grid_create(_item_attributes, 1);
	
	// takes in ds map and key
	add_item = function(_category, _item) {
		// initializing item attributes
		if ds_map_exists(_category, _item) {
			var _item_map = _category[? _item];
			var _item_name = _item_map[? "_name"];
			var _item_sprite = _item_map[? "_sprite"];
			var _item_desc = _item_map[? "_description"];
			// adds new item when there are no items in inventory
			if (ds_grid_height(global.inventory) == 1) {
				ds_grid_add(global.inventory, 0, 0, _item_name);
				ds_grid_add(global.inventory, 1, 0, _item_sprite);
				ds_grid_add(global.inventory, 2, 0, _item_desc);
			// adds a new item to "bottom" of inventory
			} else if(ds_grid_height(global.inventory) <= _max_inventory_size) {
					// increases current grid height by 1
					ds_grid_resize(global.inventory, _item_attributes, (ds_grid_height(global.inventory) + 1))
					ds_grid_add(global.inventory, 0, (ds_grid_height(global.inventory) - 1), _item_name);
					ds_grid_add(global.inventory, 1, (ds_grid_height(global.inventory) - 1), _item_sprite);
					ds_grid_add(global.inventory, 2, (ds_grid_height(global.inventory) - 1) ,_item_desc);
			}
		}
	}

	// removes row from inventory at index
	remove_item = function(_index) {
		// moving evey row below index up one
		for(var i = _index; i <= ds_grid_height(global.inventory); i += 1) {
			ds_grid_set(global.inventory, 0, i, ds_grid_get(global.inventory, 0, i+1));
			ds_grid_set(global.inventory, 0, i, ds_grid_get(global.inventory, 0, i+1));
			ds_grid_set(global.inventory, 0, i, ds_grid_get(global.inventory, 0, i+1));
		}
		
		// resize inventory to be one row smaller
		if (ds_grid_height(global.inventory) > 1) {
			ds_grid_resize(global.inventory, _item_attributes, (ds_grid_height(global.inventory)-1));
		}
	}	
}

