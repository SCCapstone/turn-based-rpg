// Delete GUI elements
instance_destroy(hp_display);
// Determine xp change
battle_end(party_units, xp_gained);
roll_loot_table(enemy_units);
// Reactivate instances from previous level
instance_activate_all();
// Deactivate all units present in battle
for (var i = 0; i < p_length; i++) {
	// Save changed hp/mp
	global.party[|i]._hp = party_units[i]._hp
	global.party[|i]._mp = party_units[i]._mp
	instance_destroy(party_units[i]);
	instance_destroy(party_shadows[i])
}
for (var i = 0; i < e_length; i++) {
	instance_destroy(enemy_units[i]);
	instance_destroy(enemy_shadows[i]);
}
instance_destroy(obj_status_effect);
instance_create_layer(0,0,"Player", obj_after_battle);
if (array_length(global.item_gained) > 0) {
	obj_after_battle._gained_item = true;
}
