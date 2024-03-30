// Script for saving game data
function Save(){
	save_data = [];
	
	party_members = [];
	player = {
		obj: obj_player,
		x: obj_player.x,
		y: obj_player.y,
		facing: obj_player.facing,
		current_room: room
	}
	array_push(party_members, player);
	array_push(save_data, party_members);
	
	// Make data into a JSON string and save via a buffer
	_string = json_stringify(save_data);
	_buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "savedgame.save");
	buffer_delete(_buffer);

	show_debug_message("Game saved! " + _string);
}