draw_set_font(fnt_pixeloid);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

for(var i = 0; i < obj_battle.p_length; i++) {
	var _char = obj_battle.party_units[i];	// Stores a character whose stats will be drawn
	if (i == obj_battle.p_num) {	// Checks to see what player character is the currently active character
		draw_set_color(c_yellow); // Sets font color to yellow
		draw_text_ext_transformed(x+12, y+123+(i*12),_char._name, obj_battle.op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+87, y+123+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp), obj_battle.op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+160, y+123+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp), obj_battle.op_space, 3000, .1, .1, 0)
	} else {	// Draws the inactive character's name
		draw_set_color(c_white);	// Sets font to white
		draw_text_ext_transformed(x+12, y+123+(i*12),_char._name, obj_battle.op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+87, y+123+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp), obj_battle.op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+160, y+123+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp), obj_battle.op_space, 3000, .1, .1, 0)
	}
	if (_char._is_dead) {	// Checks if the character whose stats are being drawn is dead
		draw_set_color(c_red);	// Sets font color to red
		draw_text_ext_transformed(x+12, y+123+(i*12),_char._name, obj_battle.op_space, 3000, .1, .1, 0) 
		draw_text_ext_transformed(x+87, y+123+(i*12), "HP: " + string(_char._hp) + "/" + string(_char._max_hp), obj_battle.op_space, 3000, .1, .1, 0)
		draw_text_ext_transformed(x+160, y+123+(i*12), "MP: " + string(_char._mp) + "/" + string(_char._max_mp), obj_battle.op_space, 3000, .1, .1, 0)
	}
	draw_set_color(c_white);	// Sets font back to white
}

for (var i = 0; i < obj_battle.e_length; i++) {
	if (obj_battle.enemy_units[i]._hp > 0) {
		draw_text_ext_transformed(obj_battle.enemy_units[i].x,obj_battle.enemy_units[i].y-10, "HP: " + string(obj_battle.enemy_units[i]._hp), obj_battle.op_space, 3000, .075, .075, 0)
		{depth = obj_battle.enemy_units[i].depth-1}
	}
}