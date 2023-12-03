// Draw event

draw_sprite(battle_background,0,x,y); // Draw background

if (_show_wpn == true &&_turn == "player") { // Flash player weapon
	draw_sprite_ext(party_units[_p_num]._attacks[0]._sprite, 0, 
	party_units[_p_num].x + 10, party_units[_p_num].y, 1, 1, 0, c_white, 1);
}

if (_show_wpn == true &&_turn == "enemy") { // Flash enemy weapon
	draw_sprite_ext(enemy_units[_e_num]._attacks[0]._sprite, 0, 
	enemy_units[_e_num].x - 10, enemy_units[_e_num].y, -1, 1, 0, c_white, 1)
}