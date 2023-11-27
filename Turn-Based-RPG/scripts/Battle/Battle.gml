// Call this script to start or end battles
function battle_start(_enemies, _background) {
	instance_create_depth (
		camera_get_view_x(view_current),
		camera_get_view_y(view_current),
		0,
		obj_battle,
		{enemies: _enemies, trigger: id, battle_background: _background}
	);
}

// TODO function battle_end