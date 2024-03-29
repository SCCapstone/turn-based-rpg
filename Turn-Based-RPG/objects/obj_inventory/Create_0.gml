global.inventory = new Inventory();

_show_inventory = false;

// values used in drawing inventory slots & border
 _gui_width = 314;
_gui_height = 174;
_gui_x_start = 3;
_gui_y_start = 3;
_inventory_width = 308;
_inventory_height = 168;
_inventory_x_start = 6;
_inventory_y_start = 6;

// values used in drawing sprites in each slot
// TO-DO: inventory slot pixels count
_sprite_width = 16;
_sprite_height = 16;
_slot_padding_x = 28;
_slot_padding_y = 28;
_info_bar_start = 290;
_info_width = 30;
_name_y = 48;
_desc_y = 60;
_font_size = 0.5;

// sprites
_spr_inventory_border = spr_menu_border;
_spr_inventory_background = spr_menu_background;
_spr_inventory_slots = spr_inventory_slots;

// inventory postions
_x_pos = 0;
_y_pos = 0;
_x_pos_max = 10;
_y_pos_max = 5;

// testing add inventory method

//inventory.add_item(global.weapons_map, "_sword");
global.inventory.add_item(global.weapons.bow);
global.inventory.add_item(global.weapons.greatsword);
global.inventory.add_item(global.weapons.dagger);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.consumables.health_potion);
global.inventory.add_item(global.consumables.health_potion);
global.inventory.add_item(global.consumables.health_potion);
global.inventory.add_item(global.consumables.health_potion);
global.inventory.add_item(global.consumables.health_potion);
global.inventory.add_item(global.consumables.health_potion);
global.inventory.add_item(global.consumables.hot_tea);
global.inventory.add_item(global.prayer_books.book);
global.inventory.add_item(global.prayers.chill);

//inventory.add_item(global.weapons_map, "_bow");

global.inventory.add_item(global.weapons.bow);
global.inventory.add_item(global.weapons.greatsword);
//global.inventory.add_item(global.weapons.dagger);
//global.inventory.add_item(global.spells.fireball);
//global.inventory.add_item(global.prayer_books.book);
//global.inventory.add_item(global.prayers.chill);
//global.inventory.add_item(global.weapons.greatsword);
//global.inventory.remove_item(global.weapons.greatsword);
//global.inventory.add_item(global.prayers.chill);
//global.inventory.add_item(global.weapons.sword);
//for (var i = 0; i < 5; i++) { // Rows
//	for (var j = 0; j < 10; j++) { // Columns
//		global.inventory.add_item(global.weapons.bow);
//	}
//}

