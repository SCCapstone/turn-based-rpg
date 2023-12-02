//if the enter key is pressed, brings user into selected level

if location == 0 {
	room_goto(RoomTown);
}

if location == 1 {
	room_goto(RoomPlains);
}

if location == 2 {
	room_goto(RoomForest);
}