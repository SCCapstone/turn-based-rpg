/// @description Insert description here
// You can write your code in this editor

if (enemy_script[state] != -1) 
	script_execute(enemy_script[state]);  

if (place_meeting(x + x_spd, y, obj_tree) == true) {
	x_spd = 0;
}

if (place_meeting(x, y + y_spd, obj_tree) == true) {
	y_spd = 0;
}





