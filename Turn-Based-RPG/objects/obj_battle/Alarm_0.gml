// Resolve battle state transition

_moved = false;

if (_turn == "player") { // Begin enemy turn
	while (true) { // Repeat until living unit is found
		if (_e_num+1 < _e_length && _firstmove == false) {
			_e_num++; // Increment enemy party array
		} else {
			_e_num = 0; // Wrap around to index 0
		}
		
		if (enemy_units[_e_num]._is_dead == false) {
			break;
		} else {
			show_debug_message("Enemy " + string(_e_num) + " is dead, skipping...");
		}
	}
	
	show_debug_message("Begin Enemy " + string(_e_num) + "'s turn");
	
	// Update all enemy status effects
	for (var e = 0; e < array_length(enemy_units); e++) {
			if(!is_undefined(enemy_units[e]._effects)) {
				for(var i = 0; i < array_length(enemy_units[e]._effects); i++) {
					// Inflict random damage
					var temp = irandom_range(enemy_units[e]._effects[i]._dmg_min,
					enemy_units[e]._effects[i]._dmg_max)
					enemy_units[e]._hp -= temp;
				
					show_debug_message(string(enemy_units[e]._effects[i]._name) + " dealt "
					+ string(temp) + " damage to " + string(enemy_units[e]._name) + "!");
				
					// Decrease status effect length by 1
					enemy_units[e]._effects_remaining_turns[i]--;
				
					show_debug_message("Resulting duration of " + string(enemy_units[e]._effects[i]._name) + ": "
					+ string(enemy_units[e]._effects_remaining_turns[i]));
				
					// Remove status effect if no remaining turns
					if (enemy_units[e]._effects_remaining_turns[i] < 1) {
						array_delete(enemy_units[e]._effects, i, 1);
						array_delete(enemy_units[e]._effects_remaining_turns, i, 1);
					}
				}
			}
		}
	_firstmove = false;
	_move_choice = -1;
	_turn = "enemy"; // Switch to enemy turn
} 

else if (_turn == "enemy") { // Begin player turn
	while (true) { // Repeat until living unit is found
		if (_p_num+1 < _p_length && _firstmove == false) {
			_p_num++; // Increment player party array
		} else {
			_p_num = 0; // Wrap around to index 0
		}
		
		if (party_units[_p_num]._is_dead == false) {
			break;
		} else {
			show_debug_message("Player " + string(_p_num) + " is dead, skipping...");
		}

	}
	
	show_debug_message("Begin Player " + string(_p_num) + "'s turn");
	_turn = "player"; // Switch to player turn
}
