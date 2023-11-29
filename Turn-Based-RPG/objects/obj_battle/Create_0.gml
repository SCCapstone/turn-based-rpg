// This code is run when a battle sequence is initiated.

instance_deactivate_all(true); // Pauses overworld

units = []; // Holds list of all units
shadows = []; // Holds list of unit shadows
var debugtxt = "Turn order: \n";

// Create enemy party
for (var i = 0; i < array_length(enemies); i++) {
	enemyUnits[i] = instance_create_depth(x+300-(i*8), y+75+(i*20), depth-1*(i+1), obj_enemy_unit, enemies[i]);
	enemyShadows[i] = instance_create_depth(x+268-(i*8), y+87+(i*20), depth-1*(i+1), obj_shadow);
	array_push(units, enemyUnits[i]); // Push enemy units to units array
	array_push(shadows, enemyShadows[i]); // Push enemy shadows to shadow array
}

// Create player party
for (var i = 0; i < array_length(global.party); i++) {
	partyUnits[i] = instance_create_depth(x+50+(i*8), y+75+(i*20), depth-1*(i+1), obj_friendly_unit, global.party[i]);
	partyShadows[i] = instance_create_depth(x+50+(i*8), y+87+(i*20), depth-1*(i+1), obj_shadow);
	array_push(units, partyUnits[i]); // Push friendly units to units array
	array_push(shadows, partyShadows[i]); // Push party shadows to shadow array
}

// Determine turn orders for both parties (bubble sort)
var p_length = array_length(partyUnits);
var e_length = array_length(enemyUnits); 
for (var i = 0; i < p_length-1; i++) {  // Turn order for friendly party
	var swapped = false;
	for (var j = 0; j < p_length-i-1; j++) {
		if (partyUnits[j]._speed < partyUnits[j+1]._speed) {
			var temp = partyUnits[j];
			partyUnits[j] = partyUnits[j+1];
			partyUnits[j+1] = temp;
			swapped = true;
		}
		if (swapped == false) {
			break;
		}
	}
}
for (var i = 0; i < e_length-1; i++) {  // Turn order for enemy party
	var swapped = false;
	for (var j = 0; j < e_length-i-1; j++) {
		if (enemyUnits[j]._speed < enemyUnits[j+1]._speed) {
			var temp = enemyUnits[j];
			enemyUnits[j] = enemyUnits[j+1];
			enemyUnits[j+1] = temp;
			swapped = true;
		}
		if (swapped == false) {
			break;
		}
	}
}

// Debug stuff
debugtxt += "Friendly Party: [";
for (var i = 0; i < p_length; i++) {
	debugtxt += string(i+1) + ". " + partyUnits[i].name + " ";
}

debugtxt += "]\nEnemy Party: [";
for (var i = 0; i < e_length; i++) {
	debugtxt += string(i+1) + ". " + enemyUnits[i].name + " ";
}
debugtxt += "]\n"

// Determine which party moves first before alternating control
if (partyUnits[0]._speed > enemyUnits[0]._speed) {
	debugtxt += "Friendly party moves first!";
	// TODO 
} else {
	debugtxt += "Enemy party moves first";
	// TODO
}

show_debug_message(debugtxt);