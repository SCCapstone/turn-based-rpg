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

// Call this function to factor in a character's damage 
// resistance before dealing damage to them
function calculate_damage(_character, _type, _dmg) {
	
	// Catch 32-bit signed int overflow
	if (_dmg > 2147483647 ) {
		_dmg = 2147483647
	}
	
	var _res = 0; // Target's armor resistance
	
	if (_type == "slash") {
		_res = (_character._armor_head._prot_slash 
		+ _character._armor_chest._prot_slash
		+ _character._armor_legs._prot_slash);
	} else if (_type == "pierce") {
		_res = (_character._armor_head._prot_pierce
		+ _character._armor_chest._prot_pierce
		+ _character._armor_legs._prot_pierce);
	} else if (_type == "magic") {
		_res = (_character._armor_head._prot_magic
		+ _character._armor_chest._prot_magic
		+ _character._armor_legs._prot_magic);
	}
	else {
		return 0;
	}
	
	_new_dmg = ceil(_dmg * ((100 - _res) / 100));
	
	// Catch 32-bit signed int overflow
	if (_new_dmg > 2147483647 ) {
		_new_dmg = 2147483647
	}
	
	show_debug_message(_character._name + " blocked " + string(_dmg - _new_dmg) 
	+ " damage due to " + string(_res) + " " + string(_type) + " resistance. Damage taken: "
	+ string(_new_dmg) + ".")
	
	return _new_dmg;
}

// TODO function battle_end