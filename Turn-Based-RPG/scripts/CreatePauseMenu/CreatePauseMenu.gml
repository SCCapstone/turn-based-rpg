// @arg1 player id
function CreatePauseMenu(_player){
	if (_player._disabled == false) {
		_player._disabled = true;
		if (instance_exists(obj_enemy_par)) {
			obj_enemy_par.enemy_disable = true;
		}
		instance_create_layer(0, 0, "Player", obj_pause_menu);
	}
}