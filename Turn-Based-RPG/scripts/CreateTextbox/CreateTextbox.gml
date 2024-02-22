// @arg1 player id
// @arg2 NPC id
function CreateTextbox(_player, _NPC){
	if (_player._disabled == false) {
	_player._disabled = true;
		_textbox = instance_create_layer(100, 100, "Player", obj_dialogue_box);
	
		_textbox._text = _NPC._text;
		_textbox._speaker = _NPC._speaker;
	}
}