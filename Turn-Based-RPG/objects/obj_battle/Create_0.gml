// This code is run when a battle sequence is initiated.

// Pauses overworld
instance_deactivate_all(true); 

// Placeholder arrays
units = []; // Holds list of all units
shadows = []; // Holds list of unit shadows

// Placeholder variables
state = turn.player; // Player or enemy turn
target = 0; // Holds targeted character

p_num = 0; // Counter for player array
e_num = 0; // Counter for enemy array

moved = false; // Ensures units only move once
finished = false; // Jumps to end of move
move_type = -1; // 0 - attack, 1 - magic, 2 - prayer
move_num = -1; // Move number
dmg = 0; // Attack damage value
dmg_source = damage_source.misc; // Attack damage source
_menu = noone;
_active = false;


// Create player party
var x_offset = 0;
for (var i = 0; i < array_length(global.party); i++) {
	if (i % 2 == 0 && i != 0) {
		x_offset += 40;
	}
	party_units[i] = instance_create_depth((x+29+(8*(i%2)))+x_offset, y+56+((i%2)*20), -2*(i+1), obj_party_unit, global.party[i]);
	party_shadows[i] = instance_create_depth((x+31+(8*(i%2))+x_offset), y+67+((i%2)*20), -2*(i+1)+1, obj_shadow);
	array_push(units, party_units[i]); // Push friendly units to units array
	array_push(shadows, party_shadows[i]); // Push party shadows to shadow array
}

// Create enemy party
x_offset = 0;
for (var i = 0; i < array_length(enemies); i++) {
	if (i % 2 == 0 && i != 0) {
		x_offset += 40;
	}
	enemy_units[i] = instance_create_depth((x+289-((i%2)*8))-x_offset, y+56+((i%2)*20), -2*(i+1), obj_enemy_unit, enemies[i]);
	enemy_shadows[i] = instance_create_depth((x+257-((i%2)*8))-x_offset, y+67+((i%2)*20), -2*(i+1)+1, obj_shadow);
	array_push(units, enemy_units[i]); // Push enemy units to units array
	array_push(shadows, enemy_shadows[i]); // Push enemy shadows to shadow array
}

// Determine turn orders for both parties (two bubble sorts)
p_length = array_length(party_units);
e_length = array_length(enemy_units);
var _swapped;

for (var i = 0; i < p_length-1; i++) {  // Turn order for friendly party
	_swapped = false;
	for (var j = 0; j < p_length-i-1; j++) {
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

for (var i = 0; i < e_length-1; i++) {  // Turn order for enemy party
	_swapped = false;
	for (var j = 0; j < e_length-i-1; j++) {
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

// Create array for storing player party XP changes
for (var i = 0; i < p_length; i++) {
	xp_gained[i] = 0;
}

// Holds debug message for printing turn order
var turn_order = "Turn order: \n"; 

// Debug code for turn order functionality
turn_order += "Friendly Party: [";
for (var i = 0; i < p_length; i++) {
	turn_order += string(i+1) + ". " + party_units[i]._name + " ";
}

turn_order += "]\nEnemy Party: [";
for (var i = 0; i < e_length; i++) {
	turn_order += string(i+1) + ". " + enemy_units[i]._name + " ";
}
turn_order += "]\n"

// Determine which party moves first before alternating control
if (party_units[0]._spd > enemy_units[0]._spd) {
	turn_order += "Friendly party moves first!\nBegin player " + string(p_num) + "'s turn";
	state = turn.player;
} else {
	turn_order += "Enemy party moves first!\nBegin enemy " + string(e_num) + "'s turn";
	state = turn.enemy;
}

show_debug_message(turn_order);  // Print turn order
