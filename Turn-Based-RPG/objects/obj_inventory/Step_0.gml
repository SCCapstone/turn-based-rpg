// press I key to open and close inventory 
if (keyboard_check_pressed(ord("I"))) {
	_show_inventory = !_show_inventory;
}

if (!_show_inventory) exit;
