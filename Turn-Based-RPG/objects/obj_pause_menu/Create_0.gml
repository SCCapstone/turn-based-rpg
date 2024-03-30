
/// The player's pause menu
draw_set_font(fnt_pixeloid);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

_options = ["Pause","Inventory","Equip","Stats"]; // Standard inventory options
_pause_options = ["Save", "End game", "Party", "Access"]; // Save menu options
_op_length = array_length(_options); // Length of inventory options
_pause_length = array_length(_pause_options); // Length of pause menu options
_pressed = false; // Switches to true when Pause menu is selected so keystroke doesn't carry over to save menu
_pos = 0; // Player's selector position
_menu_disable = false; // Disables inventory menu if another menu is open
_show_pause = false; // Shows pause menu when set to true
_inventory = noone;
_equip = noone;
_stats = noone;
