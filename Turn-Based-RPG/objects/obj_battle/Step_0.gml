// This code dictates the flow of battle.

if (_turn == "player") {  // Player turn
	// Check if all units alive
	_p_state = "dead";  // Assume all party members are dead
	for (var i = 0; i < _e_length; i++) {
		if (party_units[i]._hp > 0) {
			_p_state = "alive";  // If any members are alive, state = alive
		}
	}
	if (keyboard_check_pressed(ord("E"))) {  // Zandair needs to replace this button press with UI elements
		// TODO attack
		alarm[0] = 120; // Wait and resolve next battle state
	}

} else if (_turn == "enemy") {
	// Check if all units alive
	_e_state = "dead";  // Assume all party members are dead
	for (var i = 0; i < _e_length; i++) {
		if (enemy_units[i]._hp > 0) {
			_e_state = "alive";  // If any members are alive, state = alive
		}
	}
	// TODO attack
	if (alarm[0] < 0) {
		alarm[0] = 120; // Wait and resolve next battle state
	}
}