//runs when instance of object is created
_speed = 2; //how fast the player moves
collision_speed = _speed + 1;

//variable to indicate where player is facing
facing = 1;
/*
facing guide:
1 = towards user
2 = away from user
3 = left
4 = right
*/

// Create Health event
health = 100;

// Damage done by enemy
var damage = 10;
health -= damage;

// Healing
var healingAmount = 20;
health = clamp(health + healingAmount, 0, 100);