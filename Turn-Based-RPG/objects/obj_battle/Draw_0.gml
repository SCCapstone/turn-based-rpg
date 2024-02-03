// Draw event

draw_set_font(fnt_pixeloid);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

// The margins around all text in the object
op_border = 8;
// The space between each line of text
op_space = 12;

draw_sprite(battle_background,0,x,y){depth = 10}; // Draw background

draw_sprite_stretched(spr_menu_background,0,x+global.ui_x_buffer,y+global.ui_y_buffer,200,60); // Draw UI background

for(var i = 0; i < _p_length; i++) {
	_char = party_units[i];	// Stores a character whose stats will be drawn
	if (i == _p_num) {	// Checks to see what player character is the currently active character
		draw_set_color(c_yellow); // Sets font color to yellow
		draw_text_ext_transformed(x+12, y+141+(i*12),_char._name, op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+87, y+141+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp), op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+143, y+141+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp), op_space, 3000, .1, .1, 0)
	} else {	// Draws the inactive character's name
		draw_set_color(c_white);	// Sets font to white
		draw_text_ext_transformed(x+12, y+141+(i*12),_char._name, op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+87, y+141+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp), op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+143, y+141+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp), op_space, 3000, .1, .1, 0)
	}
	if (_char._is_dead) {	// Checks if the character whose stats are being drawn is dead
		draw_set_color(c_red);	// Sets font color to red
		draw_text_ext_transformed(x+12, y+141+(i*12),_char._name, op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+87, y+141+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp), op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+143, y+141+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp), op_space, 3000, .1, .1, 0)
	}
	draw_set_color(c_white);	// Sets font back to white
}

if (_gameover == false) {
	for (var i = 0; i < _e_length; i++) {
		draw_text_ext_transformed(enemy_units[i].x - 61,enemy_units[i].y + 6, "HP: " + string(enemy_units[i]._hp), op_space, 3000, .1, .1, 0)
		
	}
	if (_turn == "player" && _e_state == "alive") {
		if (enemy_units[_target]._is_dead) {
			for (var i = 0; i < _e_length; i++) {
				if (enemy_units[i]._is_dead == false) {
					_target = i;
					draw_sprite(spr_arrow,0,enemy_units[_target].x + 4,enemy_units[_target].y + 10);
				}
			}
		}
		draw_sprite(spr_arrow,0,enemy_units[_target].x + 4,enemy_units[_target].y + 10);
	}
}
