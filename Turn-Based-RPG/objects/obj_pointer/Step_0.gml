//runs each frame, functionality for moving pointer to each node is contained in here

/*
if at the starting village location, level has been cleared, and the D key is pressed, move towards the next node to the right

updates location
*/
if state == 0 && location == 0 && obj_village_node.is_cleared == true && keyboard_check_pressed(ord("D")) {
	state = 1;
}

if state == 0 && location == 1 && keyboard_check_pressed(ord("S")) {
	state = 2;
}

if state == 0 && location == 1 && obj_field_node.is_cleared = true && keyboard_check_pressed(ord("D")) {
	state = 3;
}

if state == 0 && location == 2 && keyboard_check_pressed(ord("W")) {
	state = 4;
}

//from village to field
if state = 1 {
	if point_distance(x, y, 50, 162) = 0 { //checks if pointer at starting area
		move_towards_point(96, 162, 1); //moves pointer towards 96,162 at speed of 1
	}
	if point_distance(x, y, 96, 162) = 0 { //if distance between pointer and 96,162 is 0, move towards 96,64
		move_towards_point(96, 64, 1);
	}
	if point_distance(x, y, 96, 64) = 0 { //if distance between pointer and 96,162 is 0, stop moving
		speed = 0;
		location = map_locations[1];
		state = 0;
	}
}

//from field to village
if state = 2 {
	if point_distance(x, y, 96, 64) = 0 { //checks if pointer at starting area
		move_towards_point(96, 162, 1); //moves pointer towards 96,162 at speed of 1
	}
	if point_distance(x, y, 96, 162) = 0 { //if distance between pointer and 96,162 is 0, move towards 50,162
		move_towards_point(50, 162, 1);
	}
	if point_distance(x, y, 50, 162) = 0 { //if distance between pointer and 50,162 is 0, stop moving
		speed = 0;
		location = map_locations[0];
		state = 0;
	}
}

//from field to forest
if state = 3 {
	if point_distance(x, y, 96, 64) = 0 { 
		move_towards_point(256, 64, 1); 
	}
	if point_distance(x, y, 256, 64) = 0 { 
		move_towards_point(256, 96, 1);
	}
	if point_distance(x, y, 256, 96) = 0 { 
		speed = 0;
		location = map_locations[2];
		state = 0;
	}
}

//from forest to field
if state = 4 {
if point_distance(x, y, 256, 96) = 0 { 
		move_towards_point(256, 64, 1); 
	}
	if point_distance(x, y, 256, 64) = 0 { 
		move_towards_point(96, 64, 1);
	}
	if point_distance(x, y, 96, 64) = 0 { 
		speed = 0;
		location = map_locations[1];
		state = 0;
	}
}