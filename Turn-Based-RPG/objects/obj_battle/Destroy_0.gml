// Reactivate instances from previous level
instance_activate_all();
// Deactivate all units present in battle
for (var i = 0; i < _p_length; i++) {
	instance_destroy(party_units[i]);
	instance_destroy(party_shadows[i])
}
for (var i = 0; i < _e_length; i++) {
	instance_destroy(enemy_units[i]);
	instance_destroy(enemy_shadows[i]);
}
// Determine xp change
battle_end();