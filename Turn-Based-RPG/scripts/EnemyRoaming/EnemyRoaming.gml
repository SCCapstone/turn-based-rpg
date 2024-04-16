// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_roaming(){
	x += x_spd;
	y += y_spd;
	image_index = spr_move;
	if (time_passed > roam_distance / enemy_speed && enemy_disable == false) { // moves enemy
	                                                       // to a destination
		x_spd = 0;
		y_spd = 0;
	
		if (++wait >= wait_duration) { // sets a new destination for the enemy
			wait = 0;
			time_passed = 0;
			var random_direction = irandom(3);
			if (random_direction == 0) {
                x_to = x;
                y_to = y - roam_distance;
				spr_move = 1;
            } else if (random_direction == 1) {
                x_to = x;
                y_to = y + roam_distance;
				spr_move = 0;
            } else if (random_direction == 2) {
                x_to = x - roam_distance;
                y_to = y;
				spr_move = 2;
				//image_xscale = -1;
            } else if (random_direction == 3) {
                x_to = x + roam_distance;
                y_to = y;
				spr_move = 3;
				//image_xscale = 1;
            }
			/*dir = point_direction(x,y,xstart,ystart) + irandom_range(-35,50);
			x_to =  lengthdir_x(roam_distance, dir);
			y_to =  lengthdir_y(roam_distance, dir);*/
		}
	} else {  // moves to a new destination
		time_passed++;
		image_speed = 1.0;
		var _distance_move = point_distance(x,y,x_to,y_to);
		var _speed_move = enemy_speed;
		if(_distance_move < enemy_speed)
			_speed_move = _distance_move;
		dir = point_direction(x,y,x_to,y_to);
		x_spd = lengthdir_x(_speed_move, dir);
		y_spd = lengthdir_y(_speed_move, dir);
		/*if (x_spd != 0)
			image_xscale = sign(x_spd);*/
	}
  //Aggro check
	/*if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) <= aggro_radius) {
	    var _to_player = point_direction(x, y, obj_player.x, obj_player.y);
		state = ENEMY_STATE.CHASE;
	    var _angle = angle_difference(image_angle, _to_player);
	    if (abs(_angle) < 45) {
	        if (!collision_line(x, y, obj_player.x, obj_player.y, obj_tree, false, true)) {
	            obj_player._disabled = !obj_player._disabled;
	            state = ENEMY_STATE.CHASE;
	        }
	    }
	}*/
	/*if (++aggro >= aggro_duration) { // checks for the aggro variable and
								   // compares it to the duration vatiable
		aggro = 0;
		if (instance_exists(obj_player)) && 
		(point_distance(x,y,obj_player.x,obj_player.y) <= aggro_radius) {
		state = ENEMY_STATE.CHASE;  // calls the chase script if the player
	                              // is within a certain distance
		}
	}*/
}
