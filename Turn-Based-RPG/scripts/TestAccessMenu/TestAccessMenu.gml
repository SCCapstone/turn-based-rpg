// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// runs access menu event
function run_access_menu() {
	room_goto(rm_behavioral_test);
}

// selects map menu from the access menu
function select_map_menu() {
	keyboard_key_press(ord("E"));
	//keyboard_key_release(ord("E"))
}

// selects battle option from the access menu
function select_battle() {
	run_access_menu()
	keyboard_key_press(ord("S"));
	//keyboard_key_press(ord("E"));
}

// selects quit game from the access menu
function select_quit_game() {
	run_access_menu()
	keyboard_key_press(ord("S"));
	keyboard_key_press(ord("S"));
	keyboard_key_press(ord("E"));	
}

// tests that the map menu was seleected by checking the room
function test_select_map_menu() {
	select_map_menu();
	if (room == rm_world_map) { 
		return true; 
	} else {
		return false;
	}
}

function test_select_battle() {
	select_battle();
	// TODO: if battle opens test passes
		// check for battle_start
}

function test_select_quit_game() {
	select_quit_game();
	if (room == rm_world_map) {
		return true;
	} else {
		return false;
	}	
}

function test_movement() {
	var time = 10;
	var move = 0;
	if (++move >= time) {
		move = 0;
		var random_move = irandom(3);
		if (random_move == 0) {
			keyboard_key_press(ord("W"))
		}
		if (random_move == 1) {
			keyboard_key_press(ord("A"))
		}
		if (random_move == 2) {
			keyboard_key_press(ord("S"))
		}
		if (random_move == 3) {
			keyboard_key_press(ord("D"))
		}
	}
}