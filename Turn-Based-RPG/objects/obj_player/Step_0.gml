//runs each frame
//IMPORTANT: OBJECTS MUST BE MARKED "Solid" TO HAVE WORKING NON-BASIC COLLISION WITH PLAYER


if _step_allow == true{
//Move the Sprite
//right
if (_target_x > x) {
	x += 2;
}
//left
if (_target_x < x) {
	x -= 2;
}
//down
if (_target_y > y) {
	y += 2;
}
//up
if (_target_y < y) {
	y -= 2;
}

//check if reached destination
if (_target_x == x && _target_y == y) {
	_moving = false;
} 

//key presses
if (_disabled == false) {
	if (keyboard_check(ord("W")) && place_free(x, y - _collision_dist)) && !_moving { //move up, place_free handles collisions with objects marked solid. More infor on place_free in documentation.
		_moving = true;
		_target_y -= 16;
		//y -= _speed;
		image_index = 1;
		facing = 2;
		_prev_speaker = noone;
		_prev_shop_speaker = noone;
	}
	
	if keyboard_check(ord("W")) && place_free(x, y - _collision_dist) == false { //allows player to face towards obstacles that can't be moved into
		image_index = 1;
		facing = 2;
	}
	
	if (keyboard_check(ord("A")) && place_free(x - _collision_dist, y)) && !_moving {//move left
		_moving = true;
		_target_x -= 16;
		//x -= _speed;
		image_index = 2;
		facing = 3;
		_prev_speaker = noone;
		_prev_shop_speaker = noone;
	}
	
	if keyboard_check(ord("A")) && place_free(x - _collision_dist, y) == false { //allows player to face towards obstacles that can't be moved into
		image_index = 2;
		facing = 3;
	}

	if (keyboard_check(ord("S")) && place_free(x, y + _collision_dist)) && !_moving { //move down
		_moving = true;
		_target_y += 16;
		//y += _speed;
		image_index = 0;
		facing = 1;
		_prev_speaker = noone;
		_prev_shop_speaker = noone;
	}
	
	if keyboard_check(ord("S")) && place_free(x, y + _collision_dist) == false { //allows player to face towards obstacles that can't be moved into
		image_index = 0;
		facing = 1;
	}

	if (keyboard_check(ord("D")) && place_free(x + _collision_dist, y)) && !_moving { //move right
		_moving = true;
		_target_x += 16;
		//x += _speed;
		image_index = 3;
		facing = 4;
		_prev_speaker = noone;
		_prev_shop_speaker = noone;
	}
	
	if keyboard_check(ord("D")) && place_free(x + _collision_dist, y) == false { //allows player to face towards obstacles that can't be moved into
		image_index = 3;
		facing = 4;
	}
	
	// When E is pressed, the player will look for an NPC in the direction it is facing.
	// This can be copied and repurposed for other objects by changing obj_NPC in the collision line function
	if (keyboard_check(ord("E"))) {
		if (facing == 1) {
			_speaker = collision_line(x + 8, y, x, y + 44, obj_NPC, false, true);
			_shop_speaker = collision_line(x + 8, y, x, y + 44, obj_shop_item, false, true);
		} 
		if (facing == 2) {
			_speaker =  collision_line(x + 8, y + 28, x, y, obj_NPC, false, true);
			_shop_speaker =  collision_line(x + 8, y + 28, x, y, obj_shop_item, false, true);
		}
		if (facing == 3) {
			_speaker =  collision_line(x, y + 26, x - 16, y + 26, obj_NPC, false, true);
			_shop_speaker =  collision_line(x, y + 26, x - 16, y + 26, obj_shop_item, false, true);
		}
		if (facing == 4) {
			_speaker =  collision_line(x + 16, y + 26, x + 16, y + 26, obj_NPC, false, true);
			_shop_speaker =  collision_line(x + 16, y + 26, x + 16, y + 26, obj_shop_item, false, true);
		}
		
		
		if (global.location == 0 && _speaker == obj_cool_wizard.id) {
			if (keyboard_check(ord("E"))) {
				_e_pressed += 1
			}
			if (_e_pressed >= 3) {
				addPlayer();
				show_debug_message("Added");
				obj_cool_wizard.id.x = 4000;
				_e_pressed = 0;
			}
		}
		
		if (global.location == 0 && _speaker == obj_mercenary.id) {
			if (keyboard_check(ord("E"))) {
				_e_pressed += 1
			}
			if (_e_pressed >= 3) {
				addMercenary();
				show_debug_message("Added");
				obj_mercenary.id.x = 4000;
				_e_pressed = 0;
			}
		}
		if (_speaker != noone && _speaker != _prev_speaker) {
			//show_debug_message(obj_cool_wizard.id);
			show_debug_message(_speaker);
			CreateTextbox(self, _speaker);
			_prev_speaker = _speaker;
		}
		
		if (_shop_speaker != noone && _shop_speaker != _prev_shop_speaker) {
			show_debug_message(_shop_speaker);
			CreatePurchaseBox(self, _shop_speaker);
			_prev_shop_speaker = _shop_speaker;
		}
	}
	
	if (keyboard_check(ord("P"))) {
		if (room != rm_start || room != rm_end || room != rm_access_menu) {
			CreatePauseMenu(self);
		}
	}
}
}
if _step_allow == false {
	_target_x = x;
	_target_y = y;
	_moving = false;
	image_speed = 0;
	_step_allow = true;
}
 