// This code is run when a battle sequence is initiated.

instance_deactivate_all(true); // Pauses overworld

// Placeholder arrays
units = []; // Holds list of all units
shadows = []; // Holds list of unit shadows

// Placeholder variables
_debugtxt = "Turn order: \n"; // Holds debug message for console output
_turn = ""; // Player or enemy turn
_p_num = 0; // Counter for player array
_e_num = 0; // Counter for enemy array
_p_state = "alive"; // State of entire friendly party
_e_state = "alive"; // State of entire enemy party
_moved = false; // Ensures units only move once
_gameover = false; // If game is over or not
_timer = 0; // Timer for alarms
_show_wpn = false; // For spawning weapon object
_show_magic_wpn = false;
_show_prayer_book = false;
_show_prayer = false;
_show_spell = false;
_dmg = 0;
_target = 0; // Holds player target
_enemy_target = 0; // Holds enemy target
_firstmove = true;
_move_type = -1; // 0 - attack, 1 - magic, 2 - prayer
_move_num = -1; // Move number
_finish = false; // Jumps to move resolution

// Create player party
for (var i = 0; i < array_length(global.party); i++) {
	party_units[i] = instance_create_depth(x+29+(i*8), y+76+(i*20), -2*(i+1), obj_party_unit, global.party[i]);
	party_shadows[i] = instance_create_depth(x+31+(i*8), y+87+(i*20), -2*(i+1)+1, obj_shadow);
	array_push(units, party_units[i]); // Push friendly units to units array
	array_push(shadows, party_shadows[i]); // Push party shadows to shadow array
}

// Create enemy party
for (var i = 0; i < array_length(enemies); i++) {
	enemy_units[i] = instance_create_depth(x+289-(i*8), y+76+(i*20), -2*(i+1), obj_enemy_unit, enemies[i]);
	enemy_shadows[i] = instance_create_depth(x+257-(i*8), y+87+(i*20), -2*(i+1)+1, obj_shadow);
	array_push(units, enemy_units[i]); // Push enemy units to units array
	array_push(shadows, enemy_shadows[i]); // Push enemy shadows to shadow array
}

// Determine turn orders for both parties (two bubble sorts)
_p_length = array_length(party_units);
_e_length = array_length(enemy_units);
var _swapped;
for (var i = 0; i < _p_length-1; i++) {  // Turn order for friendly party
	_swapped = false;
	for (var j = 0; j < _p_length-i-1; j++) {
		if (party_units[j]._spd < party_units[j+1]._spd) {
			var _temp = party_units[j];
			party_units[j] = party_units[j+1];
			party_units[j+1] = _temp;
			_swapped = true;
		}
		if (_swapped == false) {
			break;
		}
	}
}
for (var i = 0; i < _e_length-1; i++) {  // Turn order for enemy party
	_swapped = false;
	for (var j = 0; j < _e_length-i-1; j++) {
		if (enemy_units[j]._spd < enemy_units[j+1]._spd) {
			var _temp = enemy_units[j];
			enemy_units[j] = enemy_units[j+1];
			enemy_units[j+1] = _temp;
			_swapped = true;
		}
		if (_swapped == false) {
			break;
		}
	}
}

// Debug code for turn order functionality
_debugtxt += "Friendly Party: [";
for (var i = 0; i < _p_length; i++) {
	_debugtxt += string(i+1) + ". " + party_units[i]._name + " ";
}

_debugtxt += "]\nEnemy Party: [";
for (var i = 0; i < _e_length; i++) {
	_debugtxt += string(i+1) + ". " + enemy_units[i]._name + " ";
}
_debugtxt += "]\n"

// Determine which party moves first before alternating control
if (party_units[0]._spd > enemy_units[0]._spd) {
	_debugtxt += "Friendly party moves first!\nBegin player " + string(_p_num) + "'s turn";
	_turn = "player";
} else {
	_debugtxt += "Enemy party moves first!\nBegin enemy " + string(_e_num) + "'s turn";
	_turn = "enemy";
}

show_debug_message(_debugtxt);  // Print create event debug text
_debugtxt = "";  // Reset debug text
