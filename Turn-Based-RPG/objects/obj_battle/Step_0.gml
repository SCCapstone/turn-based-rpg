// This code dictates the flow of battle.

// Keypress placeholders
var up_key = keyboard_check_pressed(ord("W"));
var down_key = keyboard_check_pressed(ord("S"));
var accept_key = keyboard_check_pressed(ord("E"));
var attack_key = keyboard_check_pressed(ord("J"));
var magic_key = keyboard_check_pressed(ord("K"));
var prayer_key = keyboard_check_pressed(ord("L"));

// Code for selecting enemy
target += down_key - up_key;
if (target >= e_length) {
	target = 0;
}
if (target < 0) {
	target = e_length - 1;
}

// Player turn
if (state == turn.player && moved == false) {
	if (_menu == noone) {
		CreateBattleMenu(party_units, enemy_units, p_num);
	}
	//// Determine move type (mutually exclusive)
	//if (attack_key && 
	//	party_units[p_num]._weapon != noone) { // 'J' keypress
	//	move_type = 0;
	//	move_num = -1;
	//} else if (magic_key &&
	//	!is_undefined(party_units[p_num]._spells)
	//	&& array_length(party_units[p_num]._spells) > 0) { // 'K keypress
	//	move_type = 1;
	//	move_num = -1;
	//} else if (prayer_key &&
	//	!is_undefined(party_units[p_num]._prayers)
	//	&& array_length(party_units[p_num]._prayers) > 0) { // 'L' keypress
	//	move_type = 2;
	//	move_num = -1;
	//}
	
	//// Determine move choice from number keypress (1-9)
	//if (get_move_num() != -1) {
	//	move_num = get_move_num();
	//	if (move_type == 0 && array_length(party_units[p_num]._weapon._attacks) < move_num) {
	//		move_num = 0; // Default to first attack
	//	} else if (move_type == 1 && array_length(party_units[p_num]._spells) < move_num) {
	//		move_num = 0;
	//	} else if (move_type == 2 && array_length(party_units[p_num]._prayers) < move_num) {
	//		move_num = 0;
	//	} else {
	//	move_num-- // Decrement by 1 (i.e., pressing '1' = move 0)
	//	}
		
	//	// Ensure player has enough MP to cast spell
	//	if (move_type == 1 && array_length(party_units[p_num]._spells) > 0
	//	&& party_units[p_num]._mp < party_units[p_num]._spells[move_num]._mp_cost) {
	//		move_type = -1; // Reset move type
	//		move_num = -1; // Reset move num
	//		show_debug_message("Not enough MP to cast!");
	//	}
	//}
	
	if (_menu._delay == false) {
		move_type = _menu._selected_type;
		move_num = _menu._selected_move;
		target = _menu._selected_target;
		
	// Attack ('J')
	if (move_type == 0) {

		// Determine random damage from the selected attack's damage range
		dmg = irandom_range(party_units[p_num]._weapon._attacks[move_num]._dmg_min, 
		party_units[p_num]._weapon._attacks[move_num]._dmg_max);
			
		// Show debug message
		show_debug_message("Player " + string(p_num) + " (" + party_units[p_num]._name + 
		") attacked Enemy " + string(target) + " (" + enemy_units[target]._name + ") for " + 
		string(dmg) + " damage using " + party_units[p_num]._weapon._name + "!"); 
			
		// Play attack sound and flash weapon
		audio_play_sound(party_units[p_num]._weapon._attacks[move_num]._sound, 1, false);
		flash_item(display.weapon);
		
		// Change targeted enemy health
		change_hp(party_units[p_num], enemy_units[target], dmg,
		party_units[p_num]._weapon._attacks[move_num]._dmgtype,
		party_units[p_num]._weapon._type)
			
		finished = true; // Jump to end
	}
	
	// Magic ('K')
	if (move_type == 1) {
		
		// Determine random damage from the selected spells's damage range
		dmg = irandom_range(party_units[p_num]._spells[move_num]._dmg_min, 
		party_units[p_num]._spells[move_num]._dmg_max);
		
		// Show debug message
		show_debug_message("Player " + string(p_num) + " (" + party_units[p_num]._name + 
		") cast " + party_units[p_num]._spells[move_num]._name+ " at Enemy " + string(target) + " (" + enemy_units[target]._name + ") for " + 
		string(dmg) + " damage!"); 
		
		// Play spell sound and flash projectile
		audio_play_sound(party_units[p_num]._spells[move_num]._sound, 1, false);
		flash_item(display.spell);
		if (party_units[p_num]._magic_weapon != noone) { // If player has magic weapon, flash it
			flash_item(display.magic_weapon);
		}
		
		// Decrease targeted enemy health
		change_hp(party_units[p_num], enemy_units[target], dmg,
		party_units[p_num]._spells[move_num]._dmgtype, damage_source.spell);
		
		// Decrease player MP
		party_units[p_num]._mp -= party_units[p_num]._spells[move_num]._mp_cost
		
		finished = true; // Jump to end
	}
	
	// Prayers ('L')
	if (move_type == 2) {
		
		// Determine length of prayer effect
		
		dmg = 0; // placeholder
		
		// Play prayer sound
		audio_play_sound(party_units[p_num]._prayers[move_num]._sound, 1, false);
		flash_item(display.prayer);
		if (party_units[p_num]._prayer_book != noone) { // If player has prayer book, flash it
			flash_item(display.prayer_book);
		}
		
		// Attempt to inflict the selected prayer's status effect
		
		// Check to see if enemy already has this status effect
		// so it isn't given twice
		var already_has_effect = false;
		for (var i = 0; i < ds_list_size(enemy_units[target]._effects); i++) {
			// See if intended effect already exists in the ds_list
			var temp = ds_list_find_value(enemy_units[target]._effects, i)
			// If effect exists, don't give it again
			if (temp[0] == party_units[p_num]._prayers[move_num]._effects) {
			already_has_effect = true;
			show_debug_message(enemy_units[target]._name + " already has "
			+ party_units[p_num]._prayers[move_num]._effects[0]._name);
			break;	
			}
		}
		
		// If player doesn't already have this effect, inflict it
		if (!already_has_effect) { 
			// Determine random status effect length
			var temp = irandom_range(party_units[p_num]._prayers[move_num]._effects[0]._duration_min,
			party_units[p_num]._prayers[move_num]._effects[0]._duration_max);
	
			// Inflict the prayer's status effect and duration
			// Currently hardcoded to 1 effect per prayer [0]
			ds_list_add(enemy_units[target]._effects, 
			[party_units[p_num]._prayers[move_num]._effects[0], temp]); // [effect, duration]
			
			// Debug message
			show_debug_message("Gave " + enemy_units[target]._name + " the " +
			string(party_units[p_num]._prayers[move_num]._effects[0]._name) + " effect. Duration: " + string(temp));
				
			// Show status effect
			// TODO this is really buggy
			// show_status_effect(enemy_units[target], party_units[p_num]._prayers[move_num]._effects[0]);
		}
		
		finished = true; // Jump to end
		}
	}
	
	// Items
	if (move_type == 3) {
		finished = true;
	}
	
	// This executes after a move is complete (finished = true)
	if (finished) { 
		// Check if player successfully killed target 
		// Still needs to be implemented for status effects
		if (enemy_units[target]._is_dead == true) {
			// Reward party member with XP
			xp_gained[p_num] += enemy_units[target]._xp_val;
			show_debug_message(party_units[p_num]._name + " gained " + 
			string(enemy_units[target]._xp_val) + " XP.");
		}
		
		// Wait 150 frames and transition to next battle state
		if (alarm[0] < 0) {
			alarm[0] = 150; 
		}
		
		// Reset move variables
		moved = true;
		move_type = -1;
		finished = false;
		_menu._finished = true;
		_menu = noone;
	}
} // End player turn

// Enemy turn
if (state == turn.enemy && moved == false) {
	// Determine move type and number
	move_type = determine_move_type(enemy_units[e_num]);
	move_num = determine_move_num(enemy_units[e_num], move_type);
		
	// Show debug message
	var temp;
	switch(move_type) {
		case 0: temp = "attack";
			break;
		case 1: temp = "spell";
			break;
		case 2: temp = "prayer";
			break;
		default: temp = "unknown";
			break;
		}
		show_debug_message("Using " + string(temp) + " #" + string(move_num))
		
	// Select random living player to attack
	target = select_target(party_units, p_length);
		
	// Attack
	if (move_type == 0 && move_num != -1) {
		// Determine random damage from the selected attack's damage range
		dmg = irandom_range(enemy_units[e_num]._weapon._attacks[move_num]._dmg_min, 
		enemy_units[e_num]._weapon._attacks[move_num]._dmg_max);
			
		// Show debug message
		show_debug_message("Player " + string(e_num) + " (" + enemy_units[e_num]._name + 
		") attacked Enemy " + string(target) + " (" + party_units[target]._name + ") for " + 
		string(dmg) + " damage using " + enemy_units[e_num]._weapon._name + "!"); 
			
		// Play attack sound and flash weapon
		audio_play_sound(enemy_units[e_num]._weapon._attacks[move_num]._sound, 1, false);
		flash_item(display.weapon);
		
		// Decrease target's health
		change_hp(enemy_units[e_num], party_units[target], dmg,
		enemy_units[e_num]._weapon._attacks[move_num]._dmgtype, 
		enemy_units[e_num]._weapon._type)
		
		finished = true; // Jump to end
	}
		
	// Magic
	if (move_type == 1 && move_num != -1) {
		// Determine random damage from the selected spells's damage range
		dmg = irandom_range(enemy_units[e_num]._spells[move_num]._dmg_min, 
		enemy_units[e_num]._spells[move_num]._dmg_max);
		
		// Show debug message
		show_debug_message("Enemy " + string(e_num) + " (" + enemy_units[e_num]._name + 
		") cast " + enemy_units[e_num]._spells[move_num]._name+ " at player " + string(target) + " (" + enemy_units[target]._name + ") for " + 
		string(dmg) + " damage!"); 
		
		// Play spell sound and flash projectile
		audio_play_sound(enemy_units[e_num]._spells[move_num]._sound, 1, false);
		flash_item(display.spell);
		if (enemy_units[e_num]._magic_weapon != noone) { // If player has magic weapon, flash it
			flash_item(display.magic_weapon);
		}
		
		// Decrease targeted player health
		change_hp(enemy_units[e_num], party_units[target], dmg,
		enemy_units[e_num]._spells[move_num]._dmgtype, damage_source.spell)
		
		// Decrease enemy MP
		enemy_units[e_num]._mp -= enemy_units[e_num]._spells[move_num]._mp_cost
		
		finished = true; // Jump to end
	}
		
	// Prayer
	if (move_type == 2 && move_num != -1) {
		// Determine length of prayer effect
	
		dmg = 0; // placeholder
		
		// Play prayer sound
		audio_play_sound(enemy_units[e_num]._prayers[move_num]._sound, 1, false);
		flash_item(display.prayer);
		if (enemy_units[e_num]._prayer_book != noone) { // If player has prayer book, flash it
			flash_item(display.prayer_book);
		}
		
		// Attempt to inflict the selected prayer's status effect
		
		// Check to see if player already has this status effect
		// so it isn't given twice
		var already_has_effect = false;
		for (var i = 0; i < ds_list_size(party_units[target]._effects); i++) {
			// See if intended effect already exists in the ds_list
			var temp = ds_list_find_value(party_units[target]._effects, i)
			// If effect exists, don't give it again
			if (temp[0] == enemy_units[e_num]._prayers[move_num]._effects) {
			already_has_effect = true;
			show_debug_message(party_units[target]._name + " already has "
			+ enemy_units[e_num]._prayers[move_num]._effects[0]._name);
			break;	
			}
		}
		
		// If player doesn't already have this effect, inflict it
		if (!already_has_effect) { 
			// Determine random status effect length
			var temp = irandom_range(enemy_units[e_num]._prayers[move_num]._effects[0]._duration_min,
			enemy_units[e_num]._prayers[move_num]._effects[0]._duration_max);
	
			// Inflict the prayer's status effect and duration
			// Currently hardcoded to 1 effect per prayer [0]
			ds_list_add(party_units[target]._effects, 
			[enemy_units[e_num]._prayers[move_num]._effects[0], temp]); // [effect, duration]
			
			// Debug message
			show_debug_message("Gave " + party_units[target]._name + " the " +
			string(enemy_units[e_num]._prayers[move_num]._effects[0]._name) + " effect. Duration: " + string(temp));
				
			// Show status effect
			// TODO this is really buggy
			// show_status_effect(enemy_units[target], party_units[p_num]._prayers[move_num]._effects[0]);
		}
		
		// Show status effect
		
		finished = true; // Jump to end
	}
		
	// This executes after a turn is complete (finished = true)
	if (finished) {
		// Wait 150 frames and transition to next battle state
		alarm[0] = 150; 
	}
	
	// Reset move variables
	moved = true;
	move_type = -1;
	finished = false;
} // End enemy turn
