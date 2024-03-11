// Determine xp change
battle_end(party_units, xp_gained);
// Reactivate instances from previous level
instance_activate_all();
// Deactivate all units present in battle
for (var i = 0; i < p_length; i++) {
	// Save changed hp/mp
	var temp = 0;
	temp = ds_list_find_value(global.party,i)
	temp._hp = party_units[i]._hp
	temp._mp = party_units[i]._mp
	instance_destroy(party_units[i]);
	instance_destroy(party_shadows[i])
}
for (var i = 0; i < e_length; i++) {
	instance_destroy(enemy_units[i]);
	instance_destroy(enemy_shadows[i]);
}
