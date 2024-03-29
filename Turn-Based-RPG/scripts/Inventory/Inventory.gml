enum item_type {
	weapon,
	magic_weapon,
	prayer_book,
	consumable,
	spell,
	prayer	
}

function Inventory() constructor {
	// Initialize global inventory object and (x,y) coordinates
	global.inventory = ds_grid_create(10, 5);
	_x = 0;
	_y = 0;
	
	// Initialize everything to noone (represents empty inventory slot)
	for (var i = 0; i < 5; i++) {
		for (var j = 0; j < 10; j++) {
			global.inventory[# j, i] = noone;
		}
	}
	
	// Adds item to inventory
	add_item = function(_item) {
		var added = false;
		while (true) { // Keep trying until empty slot is found
			// Ensure item is not being added outside the bounds of the inventory
			if (_x > 9 || _y > 4) {
				show_debug_message("[ERROR] Attempting to add item outside inventory bounds");
				return;	
			} 
			// Only add if slot is empty
			if (global.inventory[# _x, _y] == noone) {
				// Add item at current (x,y) coordinates
				ds_grid_add(global.inventory, _x, _y, _item);
				show_debug_message("Added " + _item._name + " at (" + string(_x) + ", " + string(_y) + ")");
				added = true;
			}
			// Increment x by 1
			_x++;
			// Reset x to 0 and increment y by 1 upon hitting end of current row
			if (_x == 10) {
				_x = 0;
				_y++;
			}
			// If successfully added, end loop
			if (added == true) {
				return;	
			}
		}
	}
	
	// Removes first instance of item from inventory
	remove_item = function(_item) {
		if (ds_grid_value_exists(global.inventory, 0, 0, 9, 4, _item)) {
			var temp_x = ds_grid_value_x(global.inventory, 0, 0, 9, 4, _item);
			var temp_y = ds_grid_value_y(global.inventory, 0, 0, 9, 4, _item);
			// Set item to noone
			global.inventory[# temp_x, temp_y] = noone
			// Next item added should go to empty slot
			_x = temp_x;
			_y = temp_y;
			show_debug_message("Removed " + _item._name + " from (" + string(_x) + ", " + string(_y) + ")");
		}
	}	
}	