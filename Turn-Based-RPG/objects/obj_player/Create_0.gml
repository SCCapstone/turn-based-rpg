//runs when instance of object is created
_collision_dist = 16;

_step_allow = true;

_disabled = false;

_speaker = noone;
_prev_speaker = noone;

_target_x = x;
_target_y = y;
_moving = false;
image_speed = 0;

//variable to indicate where player is facing
facing = 1;
/*
facing guide:
1 = towards user
2 = away from user
3 = left
4 = right
*/

//number of times e is pressed. used to determine when to move a character during dialogue
_e_pressed = 0;