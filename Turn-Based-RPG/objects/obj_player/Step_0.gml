image_speed = 0;

x_spd = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * _speed;
y_spd = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * _speed;

if (keyboard_check(ord("W"))) {
	image_index = 1;
}

if (keyboard_check(ord("A"))) {
	image_index = 2;
}

if (keyboard_check(ord("S"))) {
	image_index = 0;
}

if (keyboard_check(ord("D"))) {
	image_index = 3;
}

// When obj_player and obj_tree meet the player will be unable to move anymore
// in that direction
if (place_meeting(x + x_spd, y, obj_tree) == true) {
	x_spd = 0;
}

if (place_meeting(x, y + y_spd, obj_tree) == true) {
	y_spd = 0;
}

x += x_spd;
y += y_spd;