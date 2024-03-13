// This alarm updates the status effect icons of both parties

// Clear all previous status effect icons, just in case they change
instance_destroy(obj_status_effect);
	
// Create new status effect icons
for (var i = 0; i < array_length(party_units); i++) {
	update_status_icons(party_units[i], 0);
}
for (var i = 0; i < array_length(enemy_units); i++) {
	update_status_icons(enemy_units[i], 1);
}
