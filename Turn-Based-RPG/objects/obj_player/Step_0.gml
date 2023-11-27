//runs each frame
//IMPORTANT: OBJECTS MUST BE MARKED "Solid" TO HAVE WORKING NON-BASIC COLLISION WITH PLAYER

if (keyboard_check(ord("W")) && place_free(x, y - collision_speed)) { //move up, place_free handles collisions with objects marked solid. More infor on place_free in documentation.
	y -= _speed;
	image_index = 1;
}

if (keyboard_check(ord("A")) && place_free(x - collision_speed, y)) { //move left
	x -= _speed;
	image_index = 2;
}

if (keyboard_check(ord("S")) && place_free(x, y + collision_speed)) { //move down
	y += _speed;
	image_index = 0;
}

if (keyboard_check(ord("D")) && place_free(x + collision_speed, y)) { //move right
	x += _speed;
	image_index = 3;
}


//OUTDATED BELOW

/*
x_spd = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * _speed;
y_spd = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * _speed;
*/

/*
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
*/