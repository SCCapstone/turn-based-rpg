// Input constants
up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
left_key = keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(ord("D"));
accept_key = keyboard_check_pressed(ord("E"));

// Open the equip screen on pressing "O"
if (keyboard_check_pressed(ord("O")) && room != rm_world_map && room != rm_access_menu) {
	show_equip = !show_equip;
	obj_player._disabled = !obj_player._disabled;
}

// Get selected character
selected_character += left_key - right_key;
if (selected_character >= ds_list_size(global.party)) {
	selected_character = 0;
}
if (selected_character < 0) {
	selected_character = ds_list_size(global.party) - 1;
}
