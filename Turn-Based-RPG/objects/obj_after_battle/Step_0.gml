if (instance_exists(obj_after_battle) == true) {
	obj_player._disabled = true;
}


switch(pos) {
	case 0:
	if (keyboard_check_pressed(ord("E"))) {
		var _max = ds_list_size(global.party)
		if (_page < array_length(global.xp) - 1) {
			_page++;	
		} else {
			pos = 1;
		}
	}
	break;
	case 1:
		if (_gained_item == true) {
			_page = 0;
			if (keyboard_check_pressed(ord("E"))) {
				if (_page < array_length(global.weapon_gained)) {
					_page++;
				}
			}
		} else {
			obj_player._disabled = false;
			instance_destroy();
		}
}


	






