function Inventory() constructor {
	// Initialize global inventory object and (x,y) coordinates
	global.inventory = ds_grid_create(10, 6);
	_x = 0;
	_y = 0;
	
	// Initialize everything to noone (represents empty inventory slot)
	for (var i = 0; i < 6; i++) {
		for (var j = 0; j < 10; j++) {
			global.inventory[# j, i] = noone;
		}
	}
	
	// Adds item to inventory
	add_item = function(_item) {
		// Ensure item is not being added outside the bounds of the inventory
		if (_x > 9 || _y > 5) {
			show_debug_message("[ERROR] Attempting to add item outside inventory bounds");
			return;	
		} 
		// Add item at current (x,y) coordinates
		ds_grid_add(global.inventory, _x, _y, _item);
		show_debug_message("Added " + _item._name + " at (" + string(_x) + ", " + string(_y) + ")");
		// Increment x by 1
		_x++;
		// Reset x to 0 and increment y by 1 upon hitting end of current row
		if (_x == 10) {
			_x = 0;
			_y++;
		}
	}
	
	remove_item = function(_index) {
		
	}	
}	