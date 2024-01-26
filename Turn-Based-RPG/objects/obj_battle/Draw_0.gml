// Draw event
draw_set_font(fnt_pixeloid);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

// The margins around all text in the object
op_border = 8;
// The space between each line of text
op_space = 12;

draw_sprite(battle_background,0,x,y); // Draw background

draw_sprite_stretched(spr_menu_background,0,x+global.ui_x_buffer,y+global.ui_y_buffer,200,60); // Draw UI background

if (_show_wpn == true &&_turn == "player") { // Flash player weapon
	draw_sprite_ext(party_units[_p_num]._attacks[0]._sprite, 0, 
	party_units[_p_num].x + 10, party_units[_p_num].y, 1, 1, 0, c_white, 1){depth=1};
}

if (_show_wpn == true &&_turn == "enemy") { // Flash enemy weapon
	draw_sprite_ext(enemy_units[_e_num]._attacks[0]._sprite, 0, 
	enemy_units[_e_num].x - 10, enemy_units[_e_num].y, -1, 1, 0, c_white, 1){depth=1};
}

for(var i = 0; i < _p_length; i++) {
	_char = party_units[i];	// Stores a character whose stats will be drawn
	if (i == _p_num) {	// Checks to see what player character is the currently active character
		draw_set_color(c_yellow); // Sets font color to yellow
		draw_text_ext_transformed(x+12, y+141+(i*12),_char._name, op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+87, y+141+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp), op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+143, y+141+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp), op_space, 3000, .1, .1, 0)
		//draw_text(x+12, y+141+(i*12),_char._name);	//Draws active character's name
		//draw_text(x+87, y+141+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp));	//Draws active character's HP
		//draw_text(x+143, y+141+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp));	//Draws active character's MP
	} else {	// Draws the inactive character's name
		draw_set_color(c_white);	// Sets font to white
		draw_text_ext_transformed(x+12, y+141+(i*12),_char._name, op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+87, y+141+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp), op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+143, y+141+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp), op_space, 3000, .1, .1, 0)
		//draw_text(x+12, y+141+(i*12),_char._name);	// Draws the inactive character's name
		//draw_text(x+87, y+141+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp));	// Draws the inactive character's HP
		//draw_text(x+143, y+141+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp));	// Draws the inactive character's MP
	}
	if (_char._is_dead) {	// Checks if the character whose stats are being drawn is dead
		draw_set_color(c_red);	// Sets font color to red
		draw_text_ext_transformed(x+12, y+141+(i*12),_char._name, op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+87, y+141+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp), op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+143, y+141+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp), op_space, 3000, .1, .1, 0)
		//draw_text(x+12, y+141+(i*12),_char._name);	//Draws dead character's name
		//draw_text(x+87, y+141+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp));	//Draws dead character's HP
		//draw_text(x+143, y+141+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp));	//Draws dead character's MP
	}
	draw_set_color(c_white);	// Sets font back to white
}

if (_gameover == false) {
	for (var i = 0; i < _e_length; i++) {
		//draw_text(enemy_units[i].x - 77,enemy_units[i].y + 8, "HP: " + string(enemy_units[i]._hp));
		draw_text_ext_transformed(enemy_units[i].x - 77,enemy_units[i].y + 8, "HP: " + string(enemy_units[i]._hp), op_space, 3000, .1, .1, 0)
		
	}
	if (_turn == "player" && _e_state == "alive") {
		if (enemy_units[_is_target]._is_dead) {
			for (var i = 0; i < _e_length; i++) {
				if (enemy_units[i]._is_dead == false) {
					_is_target = i;
					draw_sprite(spr_arrow,0,enemy_units[_is_target].x + 2,enemy_units[_is_target].y + 8);
				}
			}
		}
		draw_sprite(spr_arrow,0,enemy_units[_is_target].x + 2,enemy_units[_is_target].y + 8);
	}
}



