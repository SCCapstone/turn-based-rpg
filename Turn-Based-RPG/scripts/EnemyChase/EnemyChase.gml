// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_chase() {
    // Check if the player is not disabled
    // sets the enemy to chase the player
    image_index = spr_move;
    
    if (instance_exists(obj_player)) {
        x_to = obj_player.x;
        y_to = obj_player.y;
        
            var dir = point_direction(x, y, x_to, y_to);
            x_spd = lengthdir_x(enemy_speed, dir);
            y_spd = lengthdir_y(enemy_speed, dir);
            
            if (x_spd < 0) {
                spr_move = 2;
            } else if (x_spd > 0) {
                spr_move = 3;
            }
            
            if (y_spd < 0) {
                spr_move = 1;
            } else if (y_spd > 0) {
                spr_move = 0;
            }
            
            x += x_spd;
            y += y_spd;
            
            if (distance_to_object(obj_player) >= give_up) {  
                // sets the enemy back to wander once
                state = ENEMY_STATE.ROAM;
            }
    }
}
