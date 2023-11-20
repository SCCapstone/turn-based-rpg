// This code is run when a battle sequence is initiated.

instance_deactivate_all(true); // Pauses overworld

units = []; // Holds list of all units
shadows = []; // Holds list of all shadow sprites

// Create enemy party
for (var i = 0; i < array_length(enemies); i++) {
	enemyUnits[i] = instance_create_depth(x+300+(i*10), y+90+(i*20), depth-10, obj_enemy_unit, enemies[i]);
	array_push(units, enemyUnits[i]); // Push enemy units to units array
}

// Create player party
for (var i = 0; i < array_length(global.party); i++) {
	partyUnits[i] = instance_create_depth(x+50+(i*10), y+90+(i*20), depth-10, obj_friendly_unit, global.party[i]);
	array_push(units, partyUnits[i]); // Push friendly units to units array
}