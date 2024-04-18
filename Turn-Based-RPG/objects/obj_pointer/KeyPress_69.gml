//if the enter key is pressed, brings user into selected level
if ( _disabled == false) {
	if (global.location == 0 && x = 50 && y = 162){
		room_goto(rm_town);
	}

	if (global.location == 1 && x = 96 && y = 64){
		room_goto(rm_plains);
	}

	if (global.location == 2 && x = 256 && y = 96){
		room_goto(rm_forest);
	}

	if (global.location == 3 && x = 320 && y = 44){
		room_goto(rm_castle);
	}
}