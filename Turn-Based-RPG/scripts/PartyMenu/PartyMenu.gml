// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// initial variables for the drawing of the party menu
party_menu_depth = -1;
party_menu_width = display_get_gui_width()*0.75;
party_menu_height = display_get_gui_height()*0.75;
party_menu_x = ((display_get_gui_width() - party_menu_width)/2);
party_menu_y = ((display_get_gui_height() - party_menu_height)/2);

// call this function to show pop-up menu containing party inventory, stats, map, etc.
function party_menu() {
	instance_create_depth(party_menu_x, party_menu_y, party_menu_depth, obj_party_menu)
}