//runs each frame

if keyboard_check_pressed(ord("E")) && distance_to_object(obj_player) < 2 && obj_player.facing == 2 {
	show_message("Villager Placeholder Text, please do something else with this and use a dialogue box");
}