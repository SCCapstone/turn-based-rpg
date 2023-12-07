// Draw event
draw_set_font(fnt_pixeloid_8);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_sprite(battle_background,0,x,y); // Draw background

draw_sprite_stretched(spr_menu_background,0,x+3,y+137,200,60); // Draw UI background

if (_show_wpn == true &&_turn == "player") { // Flash player weapon
	draw_sprite_ext(party_units[_p_num]._attacks[0]._sprite, 0, 
	party_units[_p_num].x + 10, party_units[_p_num].y, 1, 1, 0, c_white, 1){depth=1};
}

if (_show_wpn == true &&_turn == "enemy") { // Flash enemy weapon
	draw_sprite_ext(enemy_units[_e_num]._attacks[0]._sprite, 0, 
	enemy_units[_e_num].x - 10, enemy_units[_e_num].y, -1, 1, 0, c_white, 1){depth=1};
}

for (var i = 0; i < _p_length; i++) {
		var char = party_units[i];	// Stores a party unit
		if (i == _p_num) {
			draw_set_color(c_yellow); // Draw current unit text in yellow
		}
		if (party_units[i]._is_dead) {
			draw_set_color(c_red);	// Draw dead unit text in red
		}
		draw_text(x+12, y+141+(i*12),char._name);	//Draws party's names
		draw_text(x+87, y+141+(i*12), "HP: " + string(char._hp) + "/" + string(char._max_hp));	//Draw's party's HP values
		draw_text(x+143, y+141+(i*12), "MP: " + string(char._mp) + "/" + string(char._max_mp));	//Draw's party's MP values
		draw_set_color(c_white); // Reset color to white so non-selected units are still drawn in white
}

for (var i = 0; i < _e_length; i++) {
	draw_text(enemy_units[i].x + 2,enemy_units[i].y + 8, "HP: " + string(enemy_units[i]._hp));
}

//if (_turn == "player" && _e_state == "alive") {
//	if (enemy_units[_is_target]._is_dead) {
//		for (var i = 0; i < _e_length; i++) {
//			if (enemy_units[i]._is_dead == false) {
//				//_is_target = i;
//				draw_sprite(spr_arrow,0,enemy_units[_is_target].x + 2,enemy_units[_is_target].y + 8);
//			}
//		}
//	}
//	draw_sprite(spr_arrow,0,enemy_units[_is_target].x + 2,enemy_units[_is_target].y + 8);
//}


