if (instance_exists(obj_after_battle) == true) {
	obj_player._disabled = true;
}

// Page control for displaying messages after battle
// Case 0 is for xp while case 1 is for weapons/items
// Will delete itself after case 1
switch(pos) {
	case 0:
	if (keyboard_check_pressed(ord("E"))) {
		if (_page < array_length(global.xp) - 1) {
			_page++;	
		} else {
			pos = 1;
		}
	}
	break;
	case 1:
		if (_gained_item == true) {
			if (keyboard_check_pressed(ord("E"))) {
		        if (_page2 < array_length(global.item_gained) - 1) {
		            _page2++;
		        } else {
		            _gained_item = false;
		        }
		    }
		} else {
			pos = 2;
		}
	break;
	case 2:
		if (keyboard_check_pressed(ord("E"))) {
			if (_page < array_length(global.xp) - 1) {
				_page++;	
			} else {
				obj_player._disabled = false;
				instance_destroy();
			}
		}
}


	






