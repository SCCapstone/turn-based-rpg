image_speed = 0;

if (keyboard_check(ord("W"))) {
	y = y - _speed;
	image_index = 1;
}

if (keyboard_check(ord("A"))) {
	x = x - _speed;
	image_index = 2;
}

if (keyboard_check(ord("S"))) {
	y = y + _speed;
	image_index = 0;
}

if (keyboard_check(ord("D"))) {
	x = x + _speed;
	image_index = 3;
}