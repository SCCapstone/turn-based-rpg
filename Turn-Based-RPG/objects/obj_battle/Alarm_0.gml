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
	show_debug_message("Begin enemy " + string(_e_num) + "'s turn");
	_show_wpn = false;
	_firstmove = false;
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
	show_debug_message("Begin player " + string(_p_num) + "'s turn");
	_show_wpn = false;
	_turn = "player"; // Switch to player turn
} 
