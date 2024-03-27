if (instance_exists(obj_after_battle) == true) {
	obj_player._disabled = true;
}


switch(pos) {
	case 0:
	if (keyboard_check_pressed(ord("E"))) {
		var _max = ds_list_size(global.party)
		if (_page < _max - 1) {
			/*if (ds_list_find_index(global.xp,0) <= 0 || is_undefined(ds_list_find_index(global.xp,0))) {
				_page += 2;
			}
			if (ds_list_find_index(global.xp,1) <= 0 || is_undefined(ds_list_find_index(global.xp,1))) {
				_page += 2;
			}
			if (ds_list_find_index(global.xp,2) <= 0 || is_undefined(ds_list_find_index(global.xp,2))) {
				_page += 2;
			}
			if (ds_list_find_index(global.xp,3) <= 0 || is_undefined(ds_list_find_index(global.xp,3))) {
				_page += 2;
			}*/
			_page++;	
		} else {
			pos = 1;
		}
	}
	break;
	case 1:
		if (_gained_item == true) {
			_page = 1;
		} else {
			obj_player._disabled = false;
			instance_destroy();
		}
}


	






