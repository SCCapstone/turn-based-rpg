// Don't add items from within the inventory object

_show_inventory = false;
_show_tooltip = false;
_pressed = true;
_equipping = false;
_equippable = false;
_magic_equip = false;


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

// sprites
_spr_inventory_border = spr_menu_border;
_spr_inventory_background = spr_menu_background;
_spr_inventory_slots = spr_inventory_slots;

// inventory postions
_x_pos = 0;
_y_pos = 0;
_x_pos_max = 9;
_y_pos_max = 3;

_pos = 0;

// tooltip pop-up dimensions
_tooltip_width = 120;
_tooltip_height = 60;
_tooltip_space = 80;
_tooltip_margin = 2180;

// globals
op_border = global.op_border
op_space = global.op_space
op_margin = global.op_margin

global.inventory.add_item(global.prayers.scorch);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);
global.inventory.add_item(global.spells.fireball);