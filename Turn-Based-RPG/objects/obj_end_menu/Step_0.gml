/// @description Insert description here
// You can write your code in this editor
// Get inputs
up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
left_key = keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(ord("D"));
accept_key = keyboard_check_pressed(ord("E"));

// Move through the menu
pos += down_key - up_key;
if (pos >= op_length) {
	pos = 0;
}
if (pos < 0) {
	pos = op_length - 1;
}

// Use an option
if (accept_key) {
	switch (pos) {
	
		case 0:
			global.location = 0;
			room_goto(rm_world_map);
		break;
	
		case 1:
			//TODO Load function here
		break;
	
		case 2:
			game_end();
		break;
	}
}

