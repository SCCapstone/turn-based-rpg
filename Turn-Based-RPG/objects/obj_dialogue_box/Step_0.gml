/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("E"))) {
	var _max_pages = array_length(_text);
	show_debug_message(_max_pages);
	if (_page < _max_pages - 1) {
		_page++;
	} else {
		obj_player._disabled = false;
		instance_destroy();
	}
}


