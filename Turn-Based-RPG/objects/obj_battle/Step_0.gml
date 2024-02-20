// This code dictates the flow of battle.

// Key placeholders
var up_key = keyboard_check_pressed(ord("W"));
var down_key = keyboard_check_pressed(ord("S"));
var accept_key = keyboard_check_pressed(ord("E"));
var attack_key = keyboard_check_pressed(ord("J"));
var magic_key = keyboard_check_pressed(ord("K"));
var prayer_key = keyboard_check_pressed(ord("L"));

// Code for selecting enemy
_target += down_key - up_key;
if (_target >= _e_length) {
	_target = 0;
}
if (_target < 0) {
	_target = _e_length - 1;
}

// Player turn
if (_turn == "player" && _moved == false && _gameover == false) {
	// Determine move type (mutually exclusive)
	if (attack_key && 
		party_units[_p_num]._weapon != noone) { // 'J' keypress
		_move_type = 0;
		_move_num = -1;
	} else if (magic_key &&
		!is_undefined(party_units[_p_num]._spells)
		&& array_length(party_units[_p_num]._spells) > 0) { // 'K keypress
		_move_type = 1;
		_move_num = -1;
	} else if (prayer_key &&
		!is_undefined(party_units[_p_num]._prayers)
		&& array_length(party_units[_p_num]._prayers) > 0) { // 'L' keypress
		_move_type = 2;
		_move_num = -1;
	}
	
	// Determine move choice from number keypress (1-9)
	if (get_move_num() != -1) {
		_move_num = get_move_num();
		if (_move_type == 0 && array_length(party_units[_p_num]._weapon._attacks) < _move_num) {
			_move_num = 0; // Default to first attack
		} else if (_move_type == 1 && array_length(party_units[_p_num]._spells) < _move_num) {
			_move_num = 0;
		} else if (_move_type == 2 && array_length(party_units[_p_num]._prayers) < _move_num) {
			_move_num = 0;
		} else {
		_move_num-- // Decrement by 1 (i.e., pressing '1' = move 0)
		}
		
		// Ensure player has enough MP to cast spell
		if (_move_type == 1 && array_length(party_units[_p_num]._spells) > 0
		&& party_units[_p_num]._mp < party_units[_p_num]._spells[_move_num]._mp_cost) {
			_move_type = -1; // Reset move type
			_move_num = -1; // Reset move num
			show_debug_message("Not enough MP to cast!");
		}
	}
	
	// Attack ('J')
	if (_move_type == 0 && _move_num != -1) {

		// Determine random damage from the selected attack's damage range
		_dmg = irandom_range(party_units[_p_num]._weapon._attacks[_move_num]._dmg_min, 
		party_units[_p_num]._weapon._attacks[_move_num]._dmg_max);
			
		// Show debug message
		show_debug_message("Player " + string(_p_num) + " (" + party_units[_p_num]._name + 
		") attacked Enemy " + string(_target) + " (" + enemy_units[_target]._name + ") for " + 
		string(_dmg) + " damage using " + party_units[_p_num]._weapon._name + "!"); 
			
		// Play attack sound and flash weapon
		audio_play_sound(party_units[_p_num]._weapon._attacks[_move_num]._sound, 1, false);
		_show_wpn = true;
		
		// Decrease targeted enemy health
		enemy_units[_target]._hp -= calculate_damage(enemy_units[_target], 
		party_units[_p_num]._weapon._attacks[_move_num]._dmgtype, _dmg)
			
		_finish = true; // Jump to end
	}
	
	// Magic ('K')
	if (_move_type == 1 && _move_num != -1) {
		// Determine random damage from the selected spells's damage range
		_dmg = irandom_range(party_units[_p_num]._spells[_move_num]._dmg_min, 
		party_units[_p_num]._spells[_move_num]._dmg_max);
		
		// Show debug message
		show_debug_message("Player " + string(_p_num) + " (" + party_units[_p_num]._name + 
		") cast " + party_units[_p_num]._spells[_move_num]._name+ " at Enemy " + string(_target) + " (" + enemy_units[_target]._name + ") for " + 
		string(_dmg) + " damage!"); 
		
		// Play spell sound and flash projectile
		audio_play_sound(party_units[_p_num]._spells[_move_num]._sound, 1, false);
		_show_spell = true;
		if (party_units[_p_num]._magic_weapon != noone) { // If player has magic weapon, flash it
			_show_magic_wpn = true;
		}
		
		// Decrease targeted enemy health
		enemy_units[_target]._hp -= calculate_damage(enemy_units[_target], 
		party_units[_p_num]._spells[_move_num]._dmgtype, _dmg)
		
		// Decrease player MP
		party_units[_p_num]._mp -= party_units[_p_num]._spells[_move_num]._mp_cost
		
		_finish = true; // Jump to end
	}
	
	// Prayers ('L')
	if (_move_type == 2 && _move_num != -1) {
		// Determine length of prayer effect
		
		_dmg = 0; // placeholder
		
		// Play prayer sound
		audio_play_sound(party_units[_p_num]._prayers[_move_num]._sound, 1, false);
		_show_prayer = true;
		if (party_units[_p_num]._prayer_book != noone) { // If player has prayer book, flash it
			_show_prayer_book = true;
		}
		
		// Inflict status effect if prayer has one
		
		if(!is_undefined(party_units[_p_num]._prayers[_move_num]._effects)) {
			if(!is_undefined(enemy_units[_e_num]._effects) 
			&& array_length(enemy_units[_target]._effects) > 0 // Make sure enemy has an effect
			&& party_units[_p_num]._prayers[_move_num]._effects[0] != enemy_units[_target]._effects[0]) {
			// If player already has this status effect, do this
			
			// TODO
			} else { // If player doesn't already have this effect, inflict it
				// Currently hardcoded to 1 effect per prayer [0]
				array_push(enemy_units[_target]._effects, 
				party_units[_p_num]._prayers[_move_num]._effects[0]);
			
				show_debug_message("Gave " + string(enemy_units[_target]._name) + " the " +
				string(enemy_units[_target]._effects[0]._name) + " effect");
			
				// Determine random status effect length
				var temp = irandom_range(party_units[_p_num]._prayers[_move_num]._effects[0]._duration_min,
				party_units[_p_num]._prayers[_move_num]._effects[0]._duration_max);
				array_push(enemy_units[_target]._effects_remaining_turns, temp);
				
				show_debug_message("Effect duration: " + string(temp));
			}
		}
		
		_finish = true; // Jump to end
	}
	
	// This executes after a move is complete (_finish = true)
	if (_finish) { 
		if (enemy_units[_target]._hp <= 0) { // Check if target was killed
			enemy_units[_target]._hp = 0;
			show_debug_message(enemy_units[_target]._name + " was killed!");
			enemy_units[_target].visible = false; // Make target instance invisible, can't remove it or it messes things up
			enemy_units[_target]._is_dead = true;
			instance_destroy(enemy_shadows[_target]);
			_gameover = check_gameover(party_units, enemy_units); // Check if either party is defeated
		}
		
		// Wait 120 frames and transition to next battle state
		if (alarm[0] < 0 && _gameover == false) {
			alarm[0] = 120; 
		}
		
		// Reset move variables
		_moved = true;
		_move_type = -1;
		_finish = false;
	}
} // End player turn

// Enemy turn
if (_turn == "enemy" && _moved == false) { 
	if (_gameover == false) {
		// Determine move type and number
		_move_type = determine_move_type(enemy_units[_e_num]);
		_move_num = determine_move_num(enemy_units[_e_num], _move_type);
		
		// Show debug message
		var temp;
		switch(_move_type) {
			case 0: temp = "attack";
				break;
			case 1: temp = "spell";
				break;
			case 2: temp = "prayer";
				break;
			default: temp = "unknown";
				break;
		}
		show_debug_message("Using " + string(temp) + " #" + string(_move_num))
		
		// Select random living player to attack
		_target = select_target(party_units, _p_length);
		
		// Attack
		if (_move_type == 0 && _move_num != -1) {
			// Determine random damage from the selected attack's damage range
			_dmg = irandom_range(enemy_units[_e_num]._weapon._attacks[_move_num]._dmg_min, 
			enemy_units[_e_num]._weapon._attacks[_move_num]._dmg_max);
			
			// Show debug message
			show_debug_message("Player " + string(_e_num) + " (" + enemy_units[_e_num]._name + 
			") attacked Enemy " + string(_target) + " (" + party_units[_target]._name + ") for " + 
			string(_dmg) + " damage using " + enemy_units[_e_num]._weapon._name + "!"); 
			
			// Play attack sound and flash weapon
			audio_play_sound(enemy_units[_e_num]._weapon._attacks[_move_num]._sound, 1, false);
			_show_wpn = true;
		
			// Decrease target's health
			party_units[_target]._hp -= calculate_damage(party_units[_target], 
			enemy_units[_e_num]._weapon._attacks[_move_num]._dmgtype, _dmg)
			
			_finish = true; // Jump to end
		}
		
		// Magic
		if (_move_type == 1 && _move_num != -1) {
			// Determine random damage from the selected spells's damage range
			_dmg = irandom_range(enemy_units[_e_num]._spells[_move_num]._dmg_min, 
			enemy_units[_e_num]._spells[_move_num]._dmg_max);
		
			// Show debug message
			show_debug_message("Enemy " + string(_e_num) + " (" + enemy_units[_e_num]._name + 
			") cast " + enemy_units[_e_num]._spells[_move_num]._name+ " at player " + string(_target) + " (" + enemy_units[_target]._name + ") for " + 
			string(_dmg) + " damage!"); 
		
			// Play spell sound and flash projectile
			audio_play_sound(enemy_units[_e_num]._spells[_move_num]._sound, 1, false);
			_show_spell = true;
			if (enemy_units[_e_num]._magic_weapon != noone) { // If player has magic weapon, flash it
				_show_magic_wpn = true;
			}
		
			// Decrease targeted player health
			party_units[_target]._hp -= calculate_damage(enemy_units[_target], 
			enemy_units[_e_num]._spells[_move_num]._dmgtype, _dmg)
		
			// Decrease enemy MP
			enemy_units[_e_num]._mp -= enemy_units[_e_num]._spells[_move_num]._mp_cost
		
			_finish = true; // Jump to end
		}
		
		// Prayer
		if (_move_type == 2 && _move_num != -1) {
			// Determine length of prayer effect
		
			_dmg = 0; // placeholder
		
			// Play prayer sound
			audio_play_sound(enemy_units[_e_num]._prayers[_move_num]._sound, 1, false);
			_show_prayer = true;
			if (enemy_units[_e_num]._prayer_book != noone) { // If player has prayer book, flash it
				_show_prayer_book = true;
			}
		
			// Inflict status effect if prayer has one
		
			if(!is_undefined(enemy_units[_e_num]._prayers[_move_num]._effects)) {
				if(!is_undefined(enemy_units[_e_num]._effects) 
				&& array_length(enemy_units[_target]._effects) > 0 // Make sure enemy has an effect
				&& enemy_units[_e_num]._prayers[_move_num]._effects[0] != enemy_units[_target]._effects[0]) {
				// If player already has this status effect, do this
			
				// TODO
				} else { // If player doesn't already have this effect, inflict it
					// Currently hardcoded to 1 effect per prayer [0]
					array_push(party_units[_target]._effects, 
					enemy_units[_e_num]._prayers[_move_num]._effects[0]);
			
					show_debug_message("Gave " + string(party_units[_target]._name) + " the " +
					string(party_units[_target]._effects[0]._name) + " effect");
			
					// Determine random status effect length
					var temp = irandom_range(enemy_units[_e_num]._prayers[_move_num]._effects[0]._duration_min,
					enemy_units[_e_num]._prayers[_move_num]._effects[0]._duration_max);
					array_push(party_units[_target]._effects_remaining_turns, temp);
				
					show_debug_message("Effect duration: " + string(temp));
				}
			}
			_finish = true; // Jump to end
		}
		
		// This executes after a move is complete (_finish = true)
		if (_finish) {
			if (party_units[_target]._hp <= 0) { // Check if target was killed
				party_units[_target]._hp = 0;
				show_debug_message(party_units[_target]._name + " was killed!");
				party_units[_target].visible = false; // Make instance invisible, can't remove it or it messes things up
				party_units[_target]._is_dead = true;
				instance_destroy(party_shadows[_target]);
				_gameover = check_gameover(party_units, enemy_units); // Check if either party is defeated
			}
			
		// Wait 120 frames and transition to next battle state
		if (_gameover == false) {
			alarm[0] = 120; 
		}
	} 
	
	// Reset move variables
	_moved = true;
	_move_type = -1;
	_finish = false;
	}
} // End enemy turn

// Code for showing move-related sprites
if (_show_wpn == true &&_turn == "player") { // Flash player weapon
	var temp = instance_create_depth(party_units[_p_num].x+13, party_units[_p_num].y+24, party_units[_p_num].depth-1,
	obj_sprite, global.party[_p_num])
	temp._sprite = party_units[_p_num]._weapon._sprite;
	temp._scale = 1;
	temp._time = 1000;
	_show_wpn = false;
}

if (_show_magic_wpn == true &&_turn == "player") { // Flash player magic weapon
	var temp = instance_create_depth(party_units[_p_num].x+13, party_units[_p_num].y+24, party_units[_p_num].depth-1,
	obj_sprite, global.party[_p_num]);
	temp._sprite = party_units[_p_num]._magic_weapon._sprite;
	temp._scale = 1;
	_show_magic_wpn = false;
}

if (_show_spell == true &&_turn == "player") { // Flash player spell
	var temp = instance_create_depth(party_units[_p_num].x+42, party_units[_p_num].y-2, party_units[_p_num].depth-1,
	obj_sprite, global.party[_p_num]);
	temp._sprite = party_units[_p_num]._spells[_move_num]._sprite;
	temp._scale = 1;
	_show_spell = false;
}

if (_show_prayer_book == true &&_turn == "player") { // Flash player prayer book
	var temp = instance_create_depth(party_units[_p_num].x+13, party_units[_p_num].y+24, party_units[_p_num].depth-1,
	obj_sprite, global.party[_p_num]);
	temp._sprite = party_units[_p_num]._prayer_book._sprite;
	temp._scale = 1;
	_show_prayer_book = false;
}

if (_show_prayer == true &&_turn == "player") { // Flash player prayer
	var temp = instance_create_depth(party_units[_p_num].x+42, party_units[_p_num].y-2, party_units[_p_num].depth-1,
	obj_sprite, global.party[_p_num]);
	temp._sprite = party_units[_p_num]._prayers[_move_num]._sprite;
	temp._scale = 1;
	_show_prayer = false;
}

if (_show_wpn == true &&_turn == "enemy") { // Flash enemy weapon
	var temp = instance_create_depth(enemy_units[_e_num].x-13, enemy_units[_e_num].y+24, enemy_units[_e_num].depth-1,
	obj_sprite, enemies[_e_num])
	temp._sprite = enemy_units[_e_num]._weapon._sprite;
	temp._scale = -1;
	_show_wpn = false;
}

if (_show_spell == true &&_turn == "enemy") { // Flash enemy spell
	var temp = instance_create_depth(enemy_units[_e_num].x-42, enemy_units[_e_num].y-2, enemy_units[_e_num].depth-1,
	obj_sprite, enemies[_e_num])
	temp._sprite = enemy_units[_e_num]._spells[_move_num]._sprite;
	temp._scale = -1;
	_show_spell = false;
}

if (_show_magic_wpn == true &&_turn == "enemy") { // Flash enemy magic weapon
	var temp = instance_create_depth(enemy_units[_e_num].x-13, enemy_units[_e_num].y+24, enemy_units[_e_num].depth-1,
	obj_sprite, enemies[_e_num])
	temp._sprite = enemy_units[_e_num]._magic_weapon._sprite;
	temp._scale = -1;
	_show_magic_wpn = false;
}

if (_show_prayer_book == true &&_turn == "enemy") { // Flash enemy prayer book
	var temp = instance_create_depth(enemy_units[_e_num].x-13, enemy_units[_e_num].y+24, enemy_units[_e_num].depth-1,
	obj_sprite, enemies[_e_num])
	temp._sprite = enemy_units[_e_num]._prayer_book._sprite;
	temp._scale = -1;
	_show_prayer_book = false;
}

if (_show_prayer == true &&_turn == "enemy") { // Flash enemy prayer
	var temp = instance_create_depth(enemy_units[_e_num].x-42, enemy_units[_e_num].y-2, enemy_units[_e_num].depth-1,
	obj_sprite, enemies[_e_num])
	temp._sprite = enemy_units[_e_num]._prayers[_move_num]._sprite;
	temp._scale = -1;
	_show_prayer = false;
}
