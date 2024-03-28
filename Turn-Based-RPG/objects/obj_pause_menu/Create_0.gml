/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_pixeloid);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

_options = ["Pause","Inventory","Equip","Stats"];
_pause_options = ["Save", "End game"];
_op_length = array_length(_options);
_pause_length = array_length(_pause_options);
_pos = 0;
_current = false;
_menu_disable = false;
_show_pause = false;
