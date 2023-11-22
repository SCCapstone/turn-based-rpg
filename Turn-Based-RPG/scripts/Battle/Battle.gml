// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function battle_start(_enemies, _background) {
	instance_create_depth (
		camera_get_view_x(view_current),
		camera_get_view_y(view_current),
		-99,
		obj_battle,
		{enemies: _enemies, trigger: id, battle_background: _background}
	);
}