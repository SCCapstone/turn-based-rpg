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
		!is_undefined(party_units[_p_num]._weapon)) { // 'J' keypress
		_attack = true;	
		_magic = false;
		_prayer = false;
		_move_choice = -1;
	} else if (magic_key &&
		!is_undefined(party_units[_p_num]._spells)) { // 'K keypress
		_attack = false;	
		_magic = true;
		_prayer = false;
		_move_choice = -1;
	} else if (prayer_key &&
		!is_undefined(party_units[_p_num]._prayers)) { // 'L' keypress
		_attack = false;	
		_magic = false;
		_prayer = true;
		_move_choice = -1;
	}
	
	// Determine move choice from number keypress (1-9)
	if (get_move_choice() != -1) {
		_move_choice = get_move_choice();
		if (_attack && array_length(party_units[_p_num]._weapon._attacks) < _move_choice) {
			_move_choice = 0; // Default to first attack
		} else if (_magic && array_length(party_units[_p_num]._spells) < _move_choice) {
			_move_choice = 0;
		} else if (_prayer && array_length(party_units[_p_num]._prayers) < _move_choice) {
			_move_choice = 0;
		} else {
		_move_choice-- // Decrement by 1 (i.e., pressing '1' = move 0)
		}
		
		// Ensure player has enough MP to cast spell
		if (_magic && party_units[_p_num]._mp < party_units[_p_num]._spells[_move_choice]._mp_cost) {
			_magic = false;
			_move_choice = -1;
			show_debug_message("Not enough MP to cast!");
		}
	}
	
	// Attack ('J')
	if (_attack && _move_choice != -1) {

		// Determine random damage from the selected attack's damage range
		_dmg = irandom_range(party_units[_p_num]._weapon._attacks[_move_choice]._dmg_min, 
		party_units[_p_num]._weapon._attacks[_move_choice]._dmg_max);
			
		// Show debug message
		show_debug_message("Player " + string(_p_num) + " (" + party_units[_p_num]._name + 
		") attacked Enemy " + string(_target) + " (" + enemy_units[_target]._name + ") for " + 
		string(_dmg) + " damage using " + party_units[_p_num]._weapon._name + "!"); 
			
		// Play attack sound and flash weapon
		audio_play_sound(party_units[_p_num]._weapon._attacks[_move_choice]._sound, 1, false);
		_show_wpn = true;
		
		// Decrease targeted enemy health
		enemy_units[_target]._hp -= calculate_damage(enemy_units[_target], 
		party_units[_p_num]._weapon._attacks[_move_choice]._dmgtype, _dmg)
			
		_finish = true; // Jump to end
	}
	
	// Magic ('K')
	if (_magic && _move_choice != -1) {
		// Determine random damage from the selected spells's damage range
		_dmg = irandom_range(party_units[_p_num]._spells[_move_choice]._dmg_min, 
		party_units[_p_num]._spells[_move_choice]._dmg_max);
		
		// Show debug message
		show_debug_message("Player " + string(_p_num) + " (" + party_units[_p_num]._name + 
		") cast " + party_units[_p_num]._spells[_move_choice]._name+ " at Enemy " + string(_target) + " (" + enemy_units[_target]._name + ") for " + 
		string(_dmg) + " damage!"); 
		
		// Play spell sound and flash projectile
		audio_play_sound(party_units[_p_num]._spells[_move_choice]._sound, 1, false);
		_show_spell = true;
		if (party_units[_p_num]._magic_weapon != noone) { // If player has magic weapon, flash it
			_show_magic_wpn = true;
		}
		
		// Decrease targeted enemy health
		enemy_units[_target]._hp -= calculate_damage(enemy_units[_target], 
		party_units[_p_num]._spells[_move_choice]._dmgtype, _dmg)
		
		// Decrease player MP
		party_units[_p_num]._mp -= party_units[_p_num]._spells[_move_choice]._mp_cost
		
		_finish = true; // Jump to end
	}
	
	// Prayers ('L')
	if (_prayer && _move_choice != -1) {
		// Determine length of prayer effect
		
		_dmg = 0; // placeholder
		
		// Play prayer sound
		audio_play_sound(party_units[_p_num]._prayers[_move_choice]._sound, 1, false);
		_show_prayer = true;
		if (party_units[_p_num]._prayer_book != noone) { // If player has prayer book, flash it
			_show_prayer_book = true;
		}
		
		// Inflict status effect if prayer has one
		
		if(!is_undefined(party_units[_p_num]._prayers[_move_choice]._effects)) {
			if(!is_undefined(enemy_units[_e_num]._effects) 
			&& array_length(enemy_units[_target]._effects) > 0 // Make sure enemy has an effect
			&& party_units[_p_num]._prayers[_move_choice]._effects[0] != enemy_units[_target]._effects[0]) {
			// If player already has this status effect, do this
			
			// TODO
			} else { // If player doesn't already have this effect, inflict it
				// Currently hardcoded to 1 effect per prayer [0]
				array_push(enemy_units[_target]._effects, 
				party_units[_p_num]._prayers[_move_choice]._effects[0]);
			
				show_debug_message("Gave " + string(enemy_units[_target]._name) + " the " +
				string(enemy_units[_target]._effects[0]._name) + " effect");
			
				// Determine random status effect length
				var temp = irandom_range(party_units[_p_num]._prayers[_move_choice]._effects[0]._duration_min,
				party_units[_p_num]._prayers[_move_choice]._effects[0]._duration_max);
				array_push(enemy_units[_target]._effects_remaining_turns, temp);
				
				show_debug_message("Effect duration: " + string(temp));
			}
		}
		
		_finish = true; // Jump to end
	}
	
	// This executes after a move is complete (_finish = true)
	if (_finish = true) { 
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
		_attack = false;
		_magic = false;
		_prayer = false;
		_finish = false;
	}
} // End player turn

// Enemy turn
if (_turn == "enemy" && _moved == false) { 
	if (_gameover == false) {
		// Determine random damage
		_dmg = irandom_range(enemy_units[_e_num]._weapon._attacks[0]._dmg_min, 
		enemy_units[_e_num]._weapon._attacks[0]._dmg_max);
		
		// Select random living player to attack
		_enemy_target = select_target(party_units, _p_length);
		
		// Debug message
		show_debug_message("Enemy " + string(_e_num) + " (" + enemy_units[_e_num]._name + 
		") attacked Player " + string(_enemy_target) + " (" + party_units[_enemy_target]._name + ") for " + 
		string(_dmg) + " damage using " + enemy_units[_e_num]._weapon._name + "!");
		
		// Play attack sound and flash weapon
		audio_play_sound(enemy_units[_e_num]._weapon._attacks[0]._sound, 1, false);
		_show_wpn = true;
		
		// Decrease targeted player's health
			party_units[_enemy_target]._hp -= calculate_damage(party_units[_enemy_target], 
			enemy_units[_e_num]._weapon._attacks[0]._dmgtype, _dmg)
			
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
} // End enemy turn

// Code for showing move-related sprites
if (_show_wpn == true &&_turn == "player") { // Flash player weapon
	var temp = instance_create_depth(party_units[_p_num].x+10, party_units[_p_num].y-2, party_units[_p_num].depth-1,
	obj_sprite, global.party[_p_num])
	temp._sprite = party_units[_p_num]._weapon._sprite;
	temp._scale = 1;
	_show_wpn = false;
}

if (_show_magic_wpn == true &&_turn == "player") { // Flash player magic weapon
	var temp = instance_create_depth(party_units[_p_num].x+10, party_units[_p_num].y-2, party_units[_p_num].depth-1,
	obj_sprite, global.party[_p_num]);
	temp._sprite = party_units[_p_num]._magic_weapon._sprite;
	temp._scale = 1;
	_show_magic_wpn = false;
}

if (_show_spell == true &&_turn == "player") { // Flash player spell
	var temp = instance_create_depth(party_units[_p_num].x+42, party_units[_p_num].y-2, party_units[_p_num].depth-1,
	obj_sprite, global.party[_p_num]);
	temp._sprite = party_units[_p_num]._spells[_move_choice]._sprite;
	temp._scale = 1;
	_show_spell = false;
}

if (_show_prayer_book == true &&_turn == "player") { // Flash player prayer book
	var temp = instance_create_depth(party_units[_p_num].x+10, party_units[_p_num].y+6, party_units[_p_num].depth-1,
	obj_sprite, global.party[_p_num]);
	temp._sprite = party_units[_p_num]._prayer_book._sprite;
	temp._scale = 1;
	_show_prayer_book = false;
}

if (_show_prayer == true &&_turn == "player") { // Flash player prayer
	var temp = instance_create_depth(party_units[_p_num].x+42, party_units[_p_num].y-2, party_units[_p_num].depth-1,
	obj_sprite, global.party[_p_num]);
	temp._sprite = party_units[_p_num]._prayers[_move_choice]._sprite;
	temp._scale = 1;
	_show_prayer = false;
}

if (_show_wpn == true &&_turn == "enemy") { // Flash enemy weapon
	var temp = instance_create_depth(enemy_units[_e_num].x-10, enemy_units[_e_num].y-2, enemy_units[_e_num].depth-1,
	obj_sprite, enemies[_e_num])
	temp._sprite = enemy_units[_e_num]._weapon._sprite;
	temp._scale = -1;
	_show_wpn = false;
}
