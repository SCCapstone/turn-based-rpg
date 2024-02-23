//if the enter key is pressed, brings user into selected level
if ( _disabled == false) {
	if global.location == 0 {
		room_goto(rm_town);
	}

	if global.location == 1 {
		room_goto(rm_plains);
	}

	if global.location == 2 {
		room_goto(rm_forest);
	}

	if global.location == 3 {
		room_goto(rm_castle);
	}
}