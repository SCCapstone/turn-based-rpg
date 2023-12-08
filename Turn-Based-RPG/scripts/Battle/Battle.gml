// Call this function to start or end battles
function battle_start(_enemies, _background) {
	instance_create_depth (
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		0,
		obj_battle,
		{enemies: _enemies, trigger: id, battle_background: _background}
	);
}

// Call this function to select a random target from the indicated party
function select_target(party, p_length) {
	while (true) {
		_select = irandom_range(0,_p_length-1);
		if (party_units[_select]._is_dead == false) { // On selecting dead party member, try again
			break;
		}	
	}
	show_debug_message("Targeting " + party_units[_select]._name);
	return _select;
}

// Call this function to see if either party is dead
function check_gameover(party_units, enemy_units) {
	_gameover = false; // Assume false
	
// Check if the enemy party has been defeated
	var _e_state = "defeated"; // Assume enemy party is defeated
	for (var i = 0; i < _e_length; i++) {
		if (enemy_units[i]._is_dead == false) {
			_e_state = "alive"; // If any members are alive, state = alive
		}
	}

// Check if the friendly party has been defeated
	var _p_state = "defeated"; // Assume friendly party is defeated
	for (var i = 0; i < _p_length; i++) {
		if (party_units[i]._is_dead == false) {
			_p_state = "alive"; // If any members are alive, state = alive
		}
	}

if (_e_state == "defeated") {
	show_debug_message("Game Over! Player party wins.");
	return true;
}

if (_p_state == "defeated") {
	show_debug_message("Game Over! Enemy party wins.");
	return true;
}

return false;
}

// TODO function battle_end