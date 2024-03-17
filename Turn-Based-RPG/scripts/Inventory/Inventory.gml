function Inventory() constructor {
	_max_inventory_size = 60;
	// name, sprite, and description are attributes every item has
	_item_attributes = 3;
	_inventory = ds_grid_create(_item_attributes, 1);
	
	add_item = function(_item, _category) {
		// initializing item attributes
		_item_name = _category[? _item[? "_name"]];
		_item_sprite = _category[? _item[? "_sprite"]];
		_item_desc = _category[? _item[? "_description"]];
		// adds new item when there are no items in inventory
		if (ds_grid_height(_inventory) == 1) {
			ds_grid_add(_inventory, 0, 0, _item_name);
			ds_grid_add(_inventory, 0, 1, _item_sprite);
			ds_grid_add(_inventory, 0, 2, _item_desc);
		// adds a new item to "bottom" of inventory
		} else {
			while(ds_grid_height(_inventory) <= _max_inventory_size) {
				// increases current grid height by 1
				ds_grid_resize(_inventory, _item_attributes, (ds_grid_height(_inventory) + 1))
				ds_grid_add(_inventory, (ds_grid_height(_inventory) - 1), 0, _item_name);
				ds_grid_add(_inventory, (ds_grid_height(_inventory) - 1), 1, _item_sprite);
				ds_grid_add(_inventory, (ds_grid_height(_inventory) - 1), 2, _item_desc);
			}
		}
	}
	
	/*remove_item = function(_index) {
		TO-DO: remove row from grid at given index
				move index of item items below up by 1
				resize ds_grid to be height-1
	}*/	
}

/*
// Have to manually add items to inventory since no in-game way to access it yet
function inv_test() {
	inventory = new Inventory();
	inventory.add_item(global.consumables.health_potion, item_type.consumable);
	inventory.add_item(global.consumables.mana_potion, item_type.consumable);
	inventory.add_item(global.consumables.hot_tea, item_type.consumable);
	inventory.add_item(global.consumables.antidote, item_type.consumable);
	inventory.add_item(global.consumables.hot_tea, item_type.consumable);
	//consume_item(global.party[0], 0);
	//consume_item(global.party[0], 0);
	//consume_item(global.party[0], 0);
  }
  
	item_selected  = function(_index) {
		_inventory[_index].hover = true;
	}
*/