// Draw event
// Default values
draw_set_font(fnt_pixeloid_8);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_sprite(battle_background,0,x,y); // Draw background

draw_sprite_stretched(spr_menu_background,0,x+3,y+137,200,60); // Draw UI background

if (_show_wpn == true &&_turn == "player") { // Flash player weapon
	draw_sprite_ext(party_units[_p_num]._attacks[0]._sprite, 0, 
	party_units[_p_num].x + 10, party_units[_p_num].y, 1, 1, 0, c_white, 1);
}

if (_show_wpn == true &&_turn == "enemy") { // Flash enemy weapon
	draw_sprite_ext(enemy_units[_e_num]._attacks[0]._sprite, 0, 
	enemy_units[_e_num].x - 10, enemy_units[_e_num].y, -1, 1, 0, c_white, 1)
}

for (var i = 0; i < array_length(party_units); i++) {
		var char = party_units[i];	//Stores a party unit
		
		// TODO Change color of currently active party member to yellow, discuss with Chris to find currently active party member
		draw_text(x+12, y+140+(i*10),char._name);	//Draws party's names
		draw_text(x+70, y+140+(i*10), "HP: " + string(char._hp) + "/" + string(char._max_hp));	//Draw's party's HP values
		// TODO Change names and HP values to red when dead
		draw_set_color(c_white);
		
		// TODO Draw MP values
}
