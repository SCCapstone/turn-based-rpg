//runs when instance of pointer is created

//holds the location (node) that the pointer is currently at
map_locations = [0,1,2,3];

//PLACEHOLDER LOCATION VALUE
location = map_locations[0];

//State guide below
state = 0;
/*
0 = idle
1 = at village, village node cleared, D key pressed
2 = at field, S key pressed
3 = at field, field cleared, D key pressed
4 = at forest, W key pressed
*/