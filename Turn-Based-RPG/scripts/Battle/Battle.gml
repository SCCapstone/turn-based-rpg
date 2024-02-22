// Call this function to start battles
function battle_start(_enemies, _background) {
	instance_create_depth (
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		0,
		obj_battle,
		{enemies: _enemies, trigger: id, battle_background: _background}
	);
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

// Call this function to change a character's hp, either
// positively or negatively
function change_hp(_character, _type, _dmg) {
	if(_dmg > 0) {
		// Call damage calculation function
		_character._hp -= calculate_damage(_character, _type, _dmg);
	} else {
		// If _dmg <= 0, simply add HP
		_character._hp -= _dmg;
	}
}

// Call this function to factor in a character's damage 
// resistance before dealing damage to them
function calculate_damage(_character, _type, _dmg) {
	var _res = 0; // Target's armor resistance
	
	if (_type == "slash") {
		_res = (_character._armor_head._prot_slash 
		+ _character._armor_chest._prot_slash
		+ _character._armor_legs._prot_slash);
	} else if (_type == "pierce") {
		_res = (_character._armor_head._prot_pierce
		+ _character._armor_chest._prot_pierce
		+ _character._armor_legs._prot_pierce);
	} else if (_type == "blunt") {
		_res = (_character._armor_head._prot_blunt
		+ _character._armor_chest._prot_blunt
		+ _character._armor_legs._prot_blunt);
	} else if (_type == "magic") {
		_res = (_character._armor_head._prot_magic
		+ _character._armor_chest._prot_magic
		+ _character._armor_legs._prot_magic);
	} else if (_type == "fire") {
		_res = (_character._armor_head._prot_fire
		+ _character._armor_chest._prot_fire
		+ _character._armor_legs._prot_fire);
	} else if (_type == "ice") {
		_res = (_character._armor_head._prot_ice
		+ _character._armor_chest._prot_ice
		+ _character._armor_legs._prot_ice);
	}
	else {
		return 0;
	}
	
	_new_dmg = ceil(_dmg * ((100 - _res) / 100));
	
	show_debug_message(_character._name + " blocked " + string(_dmg - _new_dmg) 
	+ " damage due to " + string(_res) + " " + string(_type) + " resistance. Damage taken: "
	+ string(_new_dmg) + ".")
	
	return _new_dmg;
}

// Update the selected party's status effects
function update_status_effects(_party) {
	for (var e = 0; e < array_length(_party); e++) {
		if(!is_undefined(_party[e]._effects)) {
			for(var i = 0; i < array_length(_party[e]._effects); i++) {
				// Inflict random damage
				var temp = irandom_range(_party[e]._effects[i]._dmg_min,
				_party[e]._effects[i]._dmg_max)
				_party[e]._hp -= temp;
				if(_party[e]._hp <= 0) { // Check if still alive
					_party[e]._hp = 0;
					_party[e]._is_dead = true;
				}
				
				show_debug_message(string(_party[e]._effects[i]._name) + " dealt "
				+ string(temp) + " damage to " + string(_party[e]._name) + "!");
				
				// Decrease status effect length by 1
				_party[e]._effects_remaining_turns[i]--;
				
				show_debug_message("Resulting duration of " + string(_party[e]._effects[i]._name) + ": "
				+ string(_party[e]._effects_remaining_turns[i]));
				
				// Remove status effect if no remaining turns
				if (_party[e]._effects_remaining_turns[i] < 1) {
					array_delete(_party[e]._effects, i, 1);
					array_delete(_party[e]._effects_remaining_turns, i, 1);
				}
			}
		}
	}
}

function kill_enemy(target) {
	enemy_units[target].visible = false; // Make target instance invisible, can't remove it or it messes things up
	enemy_units[target]._is_dead = true;
	instance_destroy(enemy_shadows[target]);
}


function battle_end() {
	
}
