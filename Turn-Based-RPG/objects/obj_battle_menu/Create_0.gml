_move_types = ["Attack", "Magic", "Prayer", "Item"] // The types of moves all characters can use
_move_choices = []; // The moves available to each individual character
_pos = 0; // Player's menu selector position
_types_length = array_length(_move_types); // The number of move types available to the player
_choices_length = array_length(_move_choices); // The number of moves of a certain type available to the player, need to be set in step event as well
_player_party = []; // The player party array
_enemy_party = []; // The enemy party array
_p_length = array_length(_player_party); // Player party array size
_e_length = array_length(_enemy_party); // Enemy party array size
_p_num = 0; // The currently active player party member as decided in the battle object
_selected_type = noone; // The player's selected move type
_selected_move = noone; // The player's selected move
_selected_target = noone; // The player's selected enemy target
_exists = noone; // Placeholder for empty movesets, will store a string stating what moveset is empty
_delay = true; // A delay for the battle object. True = battle will not progress until all _selected variables != noone
_finished = false; // Determines if the battle menu's job is done and proceeds to destroy the battle menu when true
