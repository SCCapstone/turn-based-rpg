enum item_type {
	consumable,
	weapon,
	magic_weapon,
	prayer_book,
	armor, // TODO
}

// inventory
function Inventory() constructor {
	_inventory = []
	_max_inventory_size = 60;
	_inventory_width = 10;
	_inventory_height = 6;

	// Need to keep track of item indexes
	_index = 0;
	
	add_item = function(_item, _type){
		if (array_length(_inventory) < _max_inventory_size) {
			array_push(_inventory, {
				item: _item,
				type: _type,
				index: _index,
			});
			// Debug message for console
			show_debug_message("Pushed " + _item._name + " to inventory"
			+ " at index " + string(_index));
		}
		// Increment index
		_index++;
	}

	remove_item = function(_item_index){
		show_debug_message("Removed " + _inventory[_item_index].item._name
		+ " from inventory" + " at index " + string(_item_index));
		array_delete(_inventory, _item_index, 1);
	}	
}

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