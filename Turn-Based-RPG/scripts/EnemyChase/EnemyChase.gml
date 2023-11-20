// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_chase(){  // sets the enemy to chase the player
	x += x_spd;
	y += y_spd;
	if (instance_exists(obj_player)) {
		x_to = obj_player.x;
		y_to = obj_player.y;
	
		var _distance_move = point_distance(x,y,x_to,y_to);
		dir = point_direction(x,y,x_to,y_to);
		if (_distance_move > enemy_speed) {
			x_spd = lengthdir_x(enemy_speed, dir);
			y_spd = lengthdir_y(enemy_speed, dir);
		} else {
			h_speed = lengthdir_x(_distance_move, dir);
			v_speed = lengthdir_y(_distance_move, dir);
		}
		if (_distance_move >= give_up)  // sets the enemy back to wander once
		                                // player reaches certain distance
			state = ENEMY_STATE.WANDER;
	}
}