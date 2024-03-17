inventory = new Inventory();

_show_inventory = false;

// TO-DO: these values needs to be standardized
_gui_width = 320;
_gui_height = 180;
_gui_x_start = 20;
_gui_y_start = 10;
_inventory_width = 314;
_inventory_height = 174;
_inventory_x_start = 2;
_inventory_y_start = 7;

_spr_inventory_border = spr_menu_border;
_spr_inventory_background = spr_menu_background;
_spr_inventory_slots = spr_inventory_slots;

// testing add inventory method
inventory.add_item(global.weapons_map[? "Sword"], global.weapons_map);