// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// starts game; first screen that appears should be access menu
function run_game() {
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

function test_select_map_menu() {
	select_map_menu();
	// to-do : if map menu opens test passes
}

function test_select_battle() {
	select_battle();
	// to-do : if battle opens test passes
}

function test_select_quit_game() {
	select_quit_game();
	// to-do : ifi game quits test passes
} 