//runs each frame
if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_player) < 16 && obj_player.facing == 2 && _talking == false) {
	_talking = true;
	_dialogue = CreateTextbox(obj_player, self);
	show_debug_message("Added");
	addMercenary();
}

for (_i = 0; _i < ds_list_size(global.party); _i++) {
	if (ds_list_find_value(global.party, _i)._name = "Mercenary" && 
	obj_player._disabled == false) {
		x = 5000;
		y = 5000;
	}
}
