// Script for saving game data
function Save(){
	save_data = [];
	
	party_member_objects = []; // Saves an array of in-game objects for party members as custom structs
		player = { // Player
			obj: obj_player,
			x: obj_player.x,
			y: obj_player.y,
			facing: obj_player.facing,
			current_room: room
		}
		cool = { // Cool wizard
			obj: obj_cool_wizard,
			x: obj_cool_wizard.x,
			y: obj_cool_wizard.y,
			current_room: room,
		}
		mercenary = { // Mercenary
			obj: obj_mercenary,
			x: obj_mercenary.x,
			y: obj_mercenary.y,
			current_room: room,
		}
	array_push(party_member_objects, player, cool, mercenary); 
	
	party_info = [] // Stores player party information as an array of party member structs
	array_push(party_info, ds_list_size(global.party));
	for (_i = 0; _i < ds_list_size(global.party); _i++) {
		array_push(party_info,ds_list_find_value(global.party, _i));
	}
	
	inventory = [] // Stores inventory information as an array of items
	for (_i = 0; _i < 4; _i++) { // Rows
		for (_j = 0; _j < 10; _j++) { // Columns
			// Ensures empty slots are not drawn
			if (global.inventory[# _j, _i] != noone) {
				array_push(inventory, global.inventory[# _j, _i]);
			}
		}
	}
	
	game = {
		obj: obj_game,
		village: global.village_clear,
		field: global.field_clear,
		forest: global.forest_clear,
		castle: global.castle_clear,
		gold: global.gold
		
	}
	
	array_push(save_data, party_member_objects, party_info, inventory, game);
	
	// Make data into a JSON string and save via a buffer
	_string = json_stringify(save_data);
	_buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "savedgame.save");
	buffer_delete(_buffer);

	show_debug_message("Game saved! " + _string);
}