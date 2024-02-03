// Miscellaneous functions that don't belong anywhere else live here

// Call this in a game object to ensure all game scripts load in correct order 
// Always have this in a new room unless you want everything to break
function init(){
	armor();
	attacks();
	weapons();
	party_data();
	enemy_templates();
}

// Sets default text properties
global.op_border = 8;
global.op_space = 16;
global.op_margin = 5000;

// Simpler draw text function
function draw_text_relative(_text, _color, _size, _offset) {
	return draw_text_ext_transformed_color(round(x + global.op_border), round(y + global.op_border + global.op_space * _offset), 
	_text, global.op_space, global.op_margin, _size, _size, 0, _color, _color, _color, _color, 1)
}

// Prints unit test results
function print_test_result(_result, _expected, _size, _offset) {
	if (_result == _expected) {
		draw_text_relative("OK", c_green, _size, _offset)
	} else {
		draw_text_relative("FAILED", c_red, _size, _offset)
	}
}

// Returns 
function get_move_choice() {
	return ( 
	(keyboard_key >= ord("0") && keyboard_key <= ord("9"))
    ? keyboard_key - ord("0") : -1
	)
}