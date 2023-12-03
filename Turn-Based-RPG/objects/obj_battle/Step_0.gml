// This code dictates the flow of battle.

if (_turn == "player" && _moved == false) { // Player turn
	// Begin attack on key press
	if (keyboard_check_pressed(ord("E"))) { // Zandair needs to replace this button press with UI elements
		_gameover = check_gameover(party_units, enemy_units); // Check if either party is dead
		if (_gameover == false) {
			// Determine random damage
			var _dmg = irandom_range(party_units[_p_num]._attacks[0]._dmg_min, 
			party_units[_p_num]._attacks[0]._dmg_max);
		
			// Select enemy
			var _target = 0;
		
			// Debug message
			show_debug_message("Player " + string(_p_num) + " (" + party_units[_p_num]._name + 
			") attacked enemy " + string(_target) + " (" + enemy_units[_target]._name + ") for " + 
			string(_dmg) + " damage!"); 
		
			if (alarm[0] < 0) {
				//show_debug_message("Alarm 0 triggered");
				alarm[0] = 120; // Wait and resolve next battle state
			}
		}
		_moved = true;
	}

} else if (_turn == "enemy" && _moved == false) { // Enemy turn
	_gameover = check_gameover(party_units, enemy_units); // Check if either party is dead
	if (_gameover == false) {
		// Determine random damage
		var _dmg = irandom_range(enemy_units[_e_num]._attacks[0]._dmg_min, 
		enemy_units[_e_num]._attacks[0]._dmg_max);
		
		// Select random living player to attack
		var _target = select_target(party_units, _p_length);
	
		// Debug message
		show_debug_message("Enemy " + string(_e_num) + " (" + enemy_units[_e_num]._name + 
		") attacked player " + string(_target) + " (" + party_units[_target]._name + ") for " + 
		string(_dmg) + " damage!");
	
		//show_debug_message("Alarm triggered");
		alarm[0] = 120; // Wait and resolve next battle state
	} 
	_moved = true;
}