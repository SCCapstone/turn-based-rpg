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
if (keyboard_check_pressed(ord("S"))) {
	_choice = false;
}
//moving to yes
if (keyboard_check_pressed(ord("W"))) {
	_choice = true;
}

//choosing yes
if (_choice = true && keyboard_check_pressed(ord("E")) && global.gold >= _item_price) {
	_shop_text = ["Thank you for your purchase!"];
	if (keyboard_check_pressed(ord("E"))) {
		_e_pressed += 1;
	if (_e_pressed = 2) {
		global.gold -= _item_price;
		global.inventory.add_item(_item);
		obj_player._disabled = false;
		instance_destroy();
		_e_pressed = 0;
	}
	}
}
//not enough gold
if (_choice = true && keyboard_check_pressed(ord("E")) && global.gold < _item_price) {
	_shop_text = ["You can't afford this!"];
	if (keyboard_check_pressed(ord("E"))) {
		_e_pressed += 1;
	if (_e_pressed = 2) {
		obj_player._disabled = false;
		instance_destroy();
		_e_pressed = 0;
	}
	}
}
//choosing no
if (_choice = false && keyboard_check_pressed(ord("E"))) {
	obj_player._disabled = false;
	instance_destroy();
}