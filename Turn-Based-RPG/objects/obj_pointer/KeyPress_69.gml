//if the enter key is pressed, brings user into selected level

if location == 0 {
	room_goto(rm_town);
}

if location == 1 {
	room_goto(rm_plains);
}

if location == 2 {
	room_goto(rm_forest);
}