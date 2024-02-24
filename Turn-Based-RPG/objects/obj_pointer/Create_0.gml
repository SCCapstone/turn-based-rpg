//runs when instance of pointer is created

//location guide below
/*
0 = village
1 = field
2 = forest
3 = castle
*/

//these move the pointer to the node it should be at when the map room starts
if global.location == 0 {
	x = 50;
	y = 162;
}

if global.location == 1 {
	x = 96;
	y = 64;
}

if global.location == 2 {
	x = 256;
	y = 96;
}

if global.location == 3 {
	x = 320;
	y = 44;
}

_disabled = false;

//location guide below
/*
0 = village
1 = field
2 = forest
3 = castle
*/

//State guide below
state = 0;
/*
0 = idle
1 = at village, village node cleared, D key pressed
2 = at field, S key pressed
3 = at field, field cleared, D key pressed
4 = at forest, W key pressed
5 = at forest, D key pressed
6 = at castle, S key pressed
*/