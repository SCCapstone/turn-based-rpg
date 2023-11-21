//runs each frame, functionality for moving pointer to each node is contained in here

/*
if at the starting village location, level has been cleared, and the D key is pressed, move towards the next node to the right

updates location
*/
if location == 0 && obj_village_node.is_cleared == true {
	if keyboard_check_pressed(ord("D")){ //checks for key press
		move_towards_point(96, 162, 1); //moves pointer towards 96,162 at speed of 1
	}
	if point_distance(x, y, 96, 162) = 0 { //if distance between pointer and 96,162 is 0, move towards 96,64
		move_towards_point(96, 64, 1);
	}
	if point_distance(x, y, 96, 64) = 0 { //if distance between pointer and 96,162 is 0, stop moving
		speed = 0;
		location = map_locations[1];
	}
}

if location == 1 {
	if keyboard_check_pressed(ord("S")){ //checks for key press
		move_towards_point(96, 162, 1); //moves pointer towards 96,162 at speed of 1
	}
	if point_distance(x, y, 96, 162) = 0 { //if distance between pointer and 96,162 is 0, stop moving
		move_towards_point(50, 162, 1);
	}
	if point_distance(x, y, 50, 162) = 0 { //if distance between pointer and 50,160 is 0, stop moving
		speed = 0;
		location = map_locations[0];
	}
}





