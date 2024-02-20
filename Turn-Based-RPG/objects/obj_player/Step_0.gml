//runs each frame
//IMPORTANT: OBJECTS MUST BE MARKED "Solid" TO HAVE WORKING NON-BASIC COLLISION WITH PLAYER

if (_disabled == false) {
	if (keyboard_check(ord("W")) && place_free(x, y - collision_speed)) { //move up, place_free handles collisions with objects marked solid. More infor on place_free in documentation.
		y -= _speed;
		image_index = 1;
		facing = 2;
		_prev_speaker = noone;
	}

	if (keyboard_check(ord("A")) && place_free(x - collision_speed, y)) { //move left
		x -= _speed;
		image_index = 2;
		facing = 3;
		_prev_speaker = noone;
	}

	if (keyboard_check(ord("S")) && place_free(x, y + collision_speed)) { //move down
		y += _speed;
		image_index = 0;
		facing = 1;
		_prev_speaker = noone;
	}

	if (keyboard_check(ord("D")) && place_free(x + collision_speed, y)) { //move right
		x += _speed;
		image_index = 3;
		facing = 4;
		_prev_speaker = noone;
	}
	
	// When E is pressed, the player will look for an NPC in the direction it is facing.
	// This can be copied and repurposed for other objects by changing obj_NPC in the collision line function
	if (keyboard_check(ord("E"))) {
		if (facing == 1) {
			_speaker = collision_line(x + 15, y + 15, x + 15, y + 39, obj_NPC, false, true);
		} 
		if (facing == 2) {
			_speaker =  collision_line(x + 15, y + 15, x + 15, y + 4, obj_NPC, false, true);
		}
		if (facing == 3) {
			_speaker =  collision_line(x + 15, y + 15, x - 11, y + 15, obj_NPC, false, true);
		}
		if (facing == 4) {
			_speaker =  collision_line(x + 15, y + 15, x + 35, y + 15, obj_NPC, false, true);
		}
		
		if (_speaker != noone && _speaker != _prev_speaker) {
			CreateTextbox(self, _speaker);
			_prev_speaker = _speaker;
		}
	}
}
 