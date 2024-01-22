// This code dictates the flow of battle.
// NOTE all attacks are hardcoded to call attacks[0] (a unit's first attack),
// this will be changed when support for multiple attacks is added

// Get inputs
up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(ord("E"));

_is_target += down_key - up_key;
if (_is_target >= _e_length) {
	_is_target = 0;
}
if (_is_target < 0) {
	_is_target = _e_length - 1;
}

if (_turn == "player" && _moved == false) { // Player turn
	// Begin attack on E button pressed
	if (accept_key) {
		if (_gameover == false) {
			// Determine random damage
			var _dmg = irandom_range(party_units[_p_num]._attacks[0]._dmg_min, 
			party_units[_p_num]._attacks[0]._dmg_max);
			// Select random enemy to target (placeholder)
			var _target = _is_target;
			
			// Debug message
			show_debug_message("Player " + string(_p_num) + " (" + party_units[_p_num]._name + 
			") attacked Enemy " + string(_is_target) + " (" + enemy_units[_is_target]._name + ") for " + 
			string(_dmg) + " damage using " + party_units[_p_num]._attacks[0]._weapon + "!"); 
			
			// Play attack sound and flash weapon
			audio_play_sound(party_units[_p_num]._attacks[0]._sound, 1, false);
			_show_wpn = true;
		
			// Decrease targeted enemy health
			enemy_units[_is_target]._hp -= calculate_damage(enemy_units[_is_target], 
			party_units[_p_num]._attacks[0]._dmgtype, _dmg)
			
			if (enemy_units[_is_target]._hp <= 0) { // Check if target was killed
				enemy_units[_is_target]._hp = 0;
				show_debug_message(enemy_units[_is_target]._name + " was killed!");
				enemy_units[_is_target].visible = false; // Make instance invisible, can't remove it or it messes things up
				enemy_units[_is_target]._is_dead = true;
				instance_destroy(enemy_shadows[_is_target]);
				_gameover = check_gameover(party_units, enemy_units); // Check if either party is defeated
			}
		
			if (alarm[0] < 0 && _gameover == false) {
				alarm[0] = 120; // Wait and transition to next battle state
			}
		}
		_moved = true;
	}

} else if (_turn == "enemy" && _moved == false) { // Enemy turn
	if (_gameover == false) {
		// Determine random damage
		var _dmg = irandom_range(enemy_units[_e_num]._attacks[0]._dmg_min, 
		enemy_units[_e_num]._attacks[0]._dmg_max);
		
		// Select random living player to attack
		var _enemy_target = select_target(party_units, _p_length);
		
		// Debug message
		show_debug_message("Enemy " + string(_e_num) + " (" + enemy_units[_e_num]._name + 
		") attacked Player " + string(_enemy_target) + " (" + party_units[_enemy_target]._name + ") for " + 
		string(_dmg) + " damage using " + enemy_units[_e_num]._attacks[0]._weapon + "!");
		
		// Play attack sound and flash weapon
		audio_play_sound(enemy_units[_e_num]._attacks[0]._sound, 1, false);
		_show_wpn = true;
		
		// Decrease targeted player's health
			party_units[_enemy_target]._hp -= calculate_damage(party_units[_enemy_target], 
			enemy_units[_e_num]._attacks[0]._dmgtype, _dmg)
			
			if (party_units[_enemy_target]._hp <= 0) {
				party_units[_enemy_target]._hp = 0;
				show_debug_message(party_units[_enemy_target]._name + " was killed!");
				party_units[_enemy_target].visible = false; // Make instance invisible, can't remove it or it messes things up
				party_units[_enemy_target]._is_dead = true;
				instance_destroy(party_shadows[_enemy_target]);
				_gameover = check_gameover(party_units, enemy_units); // Check if either party is defeated
			}
		
		if (_gameover == false) {
			alarm[0] = 120; // Wait and transition to next battle state
		}
	} 
	_moved = true;
}
