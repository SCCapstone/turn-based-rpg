// Input constants
up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
left_key = keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(ord("D"));
accept_key = keyboard_check_pressed(ord("E"));

// Get selected character
selected_character += right_key - left_key;
if (selected_character >= ds_list_size(global.party)) {
	selected_character = 0;
}
if (selected_character < 0) {
	selected_character = ds_list_size(global.party) - 1;
}
