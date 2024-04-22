// Script for loading saved game data
function Load(){
	show_debug_message("Loading...")
	if (file_exists("savedgame.save")) {
		_buffer = buffer_load("savedgame.save");
		_string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		load_data = json_parse(_string);
		
		party_member_objects = array_shift(load_data);
		party_info = array_shift(load_data);
		inventory = array_shift(load_data);
		game = array_shift(load_data);
		
		room_goto(party_member_objects[0].current_room);
		
		party_list = ds_list_create();
		party_length = array_shift(party_info);
		for (_i = 0; _i < party_length; _i++) {
			ds_list_add(party_list, party_info[_i]);
		}
		show_debug_message(ds_list_find_value(party_list, 1));
		global.party = party_list;
		
		for (_i = 0; _i < 4; _i++) {
			for (_j = 0; _j < 10; _j++) {
				global.inventory[# _j, _i] = noone;
			}
		}
		
		for (_i = 0; _i < array_length(inventory); _i++) {
			global.inventory.add_item(inventory[_i]);
		}
		
		global.village_clear = game.village;
		global.field_clear = game.field;
		global.forest_clear = game.forest;
		global.castle_clear = game.castle;
		global.gold = game.gold;
		global.hp = game.hp;
		global.mp = game.mp;
	}
}