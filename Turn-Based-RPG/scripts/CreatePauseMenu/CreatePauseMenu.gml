// @arg1 player id
// @arg2 NPC id
function CreatePauseMenu(_player){
	if (_player._disabled == false) {
		_player._disabled = true;
		instance_create_layer(0, 0, "Player", obj_pause_menu);
	}
}