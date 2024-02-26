// Miscellaneous functions that don't belong anywhere else live here

// Call this in a game object to ensure all game scripts load in correct order 
// Always have this in a new room unless you want everything to break
function init(){
	status_effects();
	armor();
	attacks();
	weapons();
	magic_weapons();
	prayer_books();
	spells();
	prayers();
	party_data();
	enemy_templates();
	consumables();
	Inventory();
	
	// Run inventory test
	inv_test();
}

init();

// Randomize seed
randomize();

// Sets default text properties
global.op_border = 8;
global.op_space = 16;
global.op_margin = 5000;
global.textbox_width = 314;
global.textbox_height = 60;
global.namebox_width = 157;
global.namebox_height = 23;
global.ui_x_buffer = 3;
global.ui_y_buffer = 117;
global.text_x_buffer = 6;
global.text_y_buffer = 4;
global.namebox_x_buffer = 3;
global.namebox_y_buffer = 92;
global.text_max_width = (global.textbox_width - (2 * (global.ui_x_buffer))) * 7.2;

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

function get_move_num() {
	if ((keyboard_key >= ord("0") && keyboard_key <= ord("9"))) {
		return keyboard_key - ord("0")
	} else { 
		return -1
	}
}

function addPlayer() {
coolStruct = 
		{
			_name : "Cool Wizard",
		
			// Stats
			_hp: 150,		// Current HP
			_mp: 50,		// Current MP
		
			_lvl: 1,		// Level
			_xp: 0,			// Experience/XP
			_max_xp: 100,	// Max XP

			_max_hp: 150,    // Health
			_max_mp: 100,    // Mana
			_spd: 10,		// Speed
			_str: 0,		// Strength
			_dex: 0,		// Dexterity
			_int: 15,        // Intelligence
			_agi: 10,		// Agility

			// Movesets
			_spells: [global.spells.fireball],
			_prayers: [global.prayers.chill, global.prayers.scorch,
			global.prayers.zap, global.prayers.poison],
		
			// Equipment
			_weapon: noone,
			_magic_weapon: global.magic_weapons.staff,
			_prayer_book: global.prayer_books.scroll,
		
			_armor_head: global.armor.mage_hood,
			_armor_chest: global.armor.mage_robes,
			_armor_legs: global.armor.leather_boots,
			
			// Misc
			_sprites: {idle: spr_cool_wizard},
			_effects: [],
			_effects_remaining_turns: [],
			_is_dead: false,
		}
ds_list_add(global.party, coolStruct)
}