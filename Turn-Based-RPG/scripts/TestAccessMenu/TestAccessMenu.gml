// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// runs access menu event
function run_access_menu() {
}

// selects map menu from the access menu
function select_map_menu() {
	keyboard_key_press(ord("E"));
	//keyboard_key_release(ord("E"))
}

// selects battle option from the access menu
function select_battle() {
	keyboard_key_press(ord("S"));
	keyboard_key_press(ord("E"));
}

// selects quit game from the access menu
function select_quit_game() {
	keyboard_key_press(ord("S"));
	keyboard_key_press(ord("S"));
	keyboard_key_press(ord("E"));	
}

// tests that the map menu was seleected by checking the room
function test_select_map_menu() {
	select_map_menu();
	if (room == rm_world_map) { 
		return true; }
	else {
		return false;
	}
}

function test_select_battle() {
	select_battle();
	// to-do : if battle opens test passes
	// check for battle_start
}

function test_select_quit_game() {
	select_quit_game();
	// to-do : ifi game quits test passes
	// check for game_end() call
} 