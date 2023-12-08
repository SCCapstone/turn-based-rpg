//runs each frame
if keyboard_check_pressed(ord("E")) && distance_to_object(obj_player) < 2 && obj_player.facing == 2 {
	show_debug_message("Hi!");
	_talking = true;
	
}