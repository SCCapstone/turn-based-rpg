// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_wander(){
	x += x_spd;
	y += y_spd;
	if (time_passed > enemy_wander_distance / enemy_speed) { // moves enemy
	                                                       // to a destination
		x_spd = 0;
		y_spd = 0;
	
		if (++wait >= wait_duration) { // sets a new destination for the enemy
			wait = 0;
			time_passed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45);
			x_to = x + lengthdir_x(enemy_wander_distance, dir);
			y_to = y + lengthdir_y(enemy_wander_distance, dir);
		}
	} else {  // moves to a new destination
		time_passed++;
		var _distance_move = point_distance(x,y,x_to,y_to);
		var _speed_move = enemy_speed;
		if(_distance_move < enemy_speed)
			_speed_move = _distance_move;
		dir = point_direction(x,y,x_to,y_to);
		x_spd = lengthdir_x(_speed_move, dir);
		y_spd = lengthdir_y(_speed_move, dir);
	}
  //Aggro check
	if (++aggro >= aggro_duration) { // checks for the aggro variable and
								   // compares it to the duration vatiable
		aggro = 0;
		if (instance_exists(obj_player)) && 
		(point_distance(x,y,obj_player.x,obj_player.y) <= aggro_radius) {
		state = ENEMY_STATE.CHASE;  // calls the chase script if the player
	                              // is within a certain distance
		}
	}
}
