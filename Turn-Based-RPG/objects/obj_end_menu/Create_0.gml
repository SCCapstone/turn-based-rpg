/// @description Insert description here
// You can write your code in this editor
width = 0;
height = 0;

draw_set_font(fnt_pixeloid);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// The text that is displayed. Note: Text wrap is not a thing.
// Each line of text must be defined separately and each object must be resized manually
options = ["New game", "Load game", "Quit"]

// The length of the array, stored for ease of access
op_length = array_length(options);

pos = 0;

op_border = global.op_border
op_space = global.op_space
op_margin = global.op_margin
