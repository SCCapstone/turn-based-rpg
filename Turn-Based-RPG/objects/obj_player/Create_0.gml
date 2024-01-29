//runs when instance of object is created
_speed = 2; //how fast the player moves
collision_speed = _speed + 1;

// Sets user to character array 0
unit = character[0];
unit.actor = id;

//variable to indicate where player is facing
facing = 1;
/*
facing guide:
1 = towards user
2 = away from user
3 = left
4 = right
*/
