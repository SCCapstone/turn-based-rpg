// Call this function to start or end battles
function battle_start(_enemies, _background) {
	instance_create_depth (
		camera_get_view_x(view_current),
		camera_get_view_y(view_current),
		0,
		obj_battle,
		{enemies: _enemies, trigger: id, battle_background: _background}
	);
}

// Call this function to select a random target from the indicated party
function select_target(party, p_length) {
	while (true) {
		_select = irandom_range(0,_p_length-1);
		if (party_units[_select] != "x") { // On selecting dead party member, try again
			break;
		}	
	}
	return _select;
}

// Call this function to see if either party is dead
function check_gameover(party_units, enemy_units) {
	_gameover = false; // Assume false
	
// Check if the enemy party has been defeated
	var _e_state = "dead"; // Assume all party members are dead
	for (var i = 0; i < _e_length; i++) {
		if (enemy_units[i] != "x") {
			_e_state = "alive"; // If any members are alive, state = alive
		}
	}

// Check if the friendly party has been defeated
	var _p_state = "dead"; // Assume all party members are dead
	for (var i = 0; i < _p_length; i++) {
		if (party_units[i] != "x") {
			_p_state = "alive"; // If any members are alive, state = alive
		}
	}

if (_e_state == "dead") {
	show_debug_message("Game Over! Player party wins.");
	return true;
}

if (_p_state == "dead") {
	show_debug_message("Game Over! Enemy party wins.");
	return true;
}

return false;
}

// TODO function battle_end