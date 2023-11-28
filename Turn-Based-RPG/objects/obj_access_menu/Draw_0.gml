// Lets the menu draw itself as decided when placed in room
draw_self();

// Draw background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

// Set the font and initial index for text drawing

draw_set_font(fnt_pixeloid_8);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Draw the text in options
for (var i = 0; i < op_length; i++) {
	var _c = c_white;
	if (pos == i) {
		_c = c_yellow;
	}
	draw_text_color(x+op_border, y+op_border + op_space* i, option[i], _c, _c, _c, _c, 1);
}
