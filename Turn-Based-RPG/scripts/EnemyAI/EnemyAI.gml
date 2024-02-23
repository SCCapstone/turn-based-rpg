// Determines enemy move type (attack, spell, or prayer)
// Takes in enemy instance
// Currently chooses move type at random
function determine_move_type(_enemy) {
	var _type;
	var _count = 0;
	while (true) { // Keep rerolling until valid move is found
		_type = irandom_range(0,2);
		if (_type == 0 && _enemy._weapon != noone) { // Attack
			return 0;
		} else if (_type == 1 && !is_undefined(_enemy._spells)
		&& array_length(_enemy._spells) > 0) { // Spell
			return 1;
		} else if (_type == 2 && !is_undefined(_enemy._prayers)
		&& array_length(_enemy._prayers) > 0) { // Prayer
			return 2;
		} else if (_count >= 10) { // Prevents infinite loop if no valid moves are found
		show_debug_message("No valid move!");
		return -1;
		}
		_count++; 
	}
}

// Determines enemy move number
// Currently chooses move number at random
// Takes in enemy instance and move type
// 1 - attack, 2 - spell, 3 - prayer
function determine_move_num(_enemy, _move_type) {
	var _num;
	switch(_move_type) {
		case 0: _num = array_length(_enemy._weapon._attacks) - 1
			break;
		case 1: _num = array_length(_enemy._spells) - 1
			break;
		case 2: _num = array_length(_enemy._prayers) - 1
			break;
		default: return -1;
	}
	return irandom_range(0,_num)
}

// Determines party member to attack
// Currently chooses party member at random
// Takes in target party and number of members
function select_target(party, p_length) {
	while (true) {
		_select = irandom_range(0,p_length-1);
		if (party_units[_select]._is_dead == false) { // On selecting dead party member, try again
			break;
		}	
	}
	show_debug_message("Targeting " + party_units[_select]._name);
	return _select;
}
