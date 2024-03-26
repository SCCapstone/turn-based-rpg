if (instance_exists(obj_after_battle) == true) {
	obj_player._disabled = true;
}

if (keyboard_check_pressed(ord("E"))) {
	var _max = ds_list_size(global.party)
	if (_page < _max - 1) {
		_page++;
	} else {
		obj_player._disabled = false;
		instance_destroy();
	}
}
	






