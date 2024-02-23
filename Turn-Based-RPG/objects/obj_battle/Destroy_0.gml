// Determine xp change
battle_end(party_units, xp_gained);
// Reactivate instances from previous level
instance_activate_all();
// Deactivate all units present in battle
for (var i = 0; i < p_length; i++) {
	instance_destroy(party_units[i]);
	instance_destroy(party_shadows[i])
}
for (var i = 0; i < e_length; i++) {
	instance_destroy(enemy_units[i]);
	instance_destroy(enemy_shadows[i]);
}
