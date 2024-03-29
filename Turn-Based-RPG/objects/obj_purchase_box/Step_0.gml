//if (keyboard_check_pressed(ord("E"))) {
//	var _max_pages = array_length(_shop_text);
//	if (_page < _max_pages - 1) {
//		_page++;
//	} else {
//		obj_player._disabled = false;
//		instance_destroy();
//	}
//}
//moving to no
if (keyboard_check_pressed(ord("D"))) {
	_choice = 1;
}
//moving to yes
if (keyboard_check_pressed(ord("W"))) {
	_choice = 0;
}

//choosing yes
if (_choice = 0 && keyboard_check_pressed(ord("E")) && global.gold >= _item_price) {
	global.gold -= _item_price;
	global.inventory.add_item(_item);
	obj_player._disabled = false;
	instance_destroy();
}
//not enough gold
if (_choice = 0 && keyboard_check_pressed(ord("E")) && global.gold < _item_price) {
	_shop_text = ["You can't afford this!"];
	if (keyboard_check_pressed(ord("E"))) {
		obj_player._disabled = false;
		instance_destroy();
	}
}
//choosing no
if (_choice = 1 && keyboard_check_pressed(ord("E"))) {
	obj_player._disabled = false;
	instance_destroy();
}