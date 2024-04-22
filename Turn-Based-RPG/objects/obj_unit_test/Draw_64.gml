draw_set_font(fnt_pixeloid);

draw_text_relative("Unit Testing", c_white, .2, 0);
draw_text_relative("Press 'E' to cycle through pages (" + string(pos+1) + "/" 
+ string(pages) + ")", c_white, .2, 45);

if (pos == 0) {
	ds_list_clear(enemies[0]._effects)
	ds_list_clear(enemies[1]._effects)
	ds_list_clear(party[0]._effects)
	ds_list_clear(party[1]._effects)
	var offset0 = 9;
	var offset1 = 11;
	draw_text_relative("Function:          " + "resolve_state_transition()", c_white, .2, 3)
	draw_text_relative("Parameters:     " + "(state, player_turn, enemy_turn, player_party, enemy_party)", c_white, .2, 5)

	draw_text_relative("Test Case 1:     resolve_state_transition(turn.player, 0, 0, party, enemies): ", c_white, .2, offset0)
	print_test_result(resolve_state_transition(turn.player, 0, 0, party, enemies), turn.enemy, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;

	draw_text_relative("Test Case 2:     resolve_state_transition(turn.enemy, 0, 0, party, enemies): ", c_white, .2, offset0)
	print_test_result(resolve_state_transition(turn.enemy, 0, 0, party, enemies), turn.player, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 3:     resolve_state_transition(turn.player, 1, 0, party, enemies): ", c_white, .2, offset0)
	print_test_result(resolve_state_transition(turn.player, 0, 0, party, enemies), turn.enemy, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;

	draw_text_relative("Test Case 4:     resolve_state_transition(turn.enemy, 0, 1, party, enemies): ", c_white, .2, offset0)
	print_test_result(resolve_state_transition(turn.enemy, 0, 0, party, enemies), turn.player, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 5:     resolve_state_transition(turn.player, 1, 0, noone, enemies): ", c_white, .2, offset0)
	print_test_result(resolve_state_transition(turn.player, 0, 0, noone, enemies), turn.gameover, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;

	draw_text_relative("Test Case 6:     resolve_state_transition(turn.enemy, 0, 1, party, noone): ", c_white, .2, offset0)
	print_test_result(resolve_state_transition(turn.enemy, 0, 0, party, noone), turn.gameover, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
} else if (pos == 1) {
	var offset0 = 9;
	var offset1 = 11;
	
	draw_text_relative("Function:          " + "calculate_damage_scaling()", c_white, .2, 3)
	draw_text_relative("Parameters:     " + "(attacker, dmg, dmg_source)", c_white, .2, 5)
	
	show_debug_message(string(calculate_damage_scaling(party[0], 50, damage_source.melee)));
	show_debug_message(string(calculate_damage_scaling(party[1], 500, damage_source.ranged)));
	show_debug_message(string(calculate_damage_scaling(enemies[0], 50, damage_source.spell)));
	show_debug_message(string(calculate_damage_scaling(party[0], 0, damage_source.prayer)));
	show_debug_message(string(calculate_damage_scaling(party[0], -999, damage_source.melee)));

	draw_text_relative("Test Case 1:     calculate_damage_scaling(player1, 75, melee): ", c_white, .2, offset0)
	print_test_result(calculate_damage_scaling(party[0], 50, damage_source.melee), 75, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 2:     calculate_damage_scaling(player1, 500, ranged): ", c_white, .2, offset0)
	print_test_result(calculate_damage_scaling(party[1], 500, damage_source.ranged), 500, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 3:     calculate_damage_scaling(player1, 50, spell): ", c_white, .2, offset0)
	print_test_result(calculate_damage_scaling(enemies[0], 50, damage_source.spell), 50, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 4:     calculate_damage_scaling(player1, 0, prayer): ", c_white, .2, offset0)
	print_test_result(calculate_damage_scaling(party[0], 0, damage_source.prayer), 0, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 5:     calculate_damage_scaling(player1, -999, melee): ", c_white, .2, offset0)
	print_test_result(calculate_damage_scaling(party[0], -999, damage_source.melee), -1498, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
} else {
	ds_list_add(enemies[0]._effects, [global.status_effects.frosty, 9999, false, noone]);
	ds_list_add(party[0]._effects, [global.status_effects.poison, 9999, false, noone]);
	ds_list_add(enemies[1]._effects, [global.status_effects.attack_up, 9999, false, noone]);
	ds_list_add(party[1]._effects, [global.status_effects.shock, 9999, false, noone]);

var offset0 = 9;
	var offset1 = 11;
	
	draw_text_relative("Function:          " + "check_has_effect()", c_white, .2, 3)
	draw_text_relative("Parameters:     " + "(character, effect)", c_white, .2, 5)
	
	draw_text_relative("Test Case 1:     check_has_effect(enemy1, frosty): ", c_white, .2, offset0)
	print_test_result(check_has_effect(enemies[0], global.status_effects.frosty), true, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 2:     check_has_effect(enemy1, heal): ", c_white, .2, offset0)
	print_test_result(check_has_effect(enemies[0], global.status_effects.heal), false, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 3:     check_has_effect(player1, poison): ", c_white, .2, offset0)
	print_test_result(check_has_effect(party[0], global.status_effects.poison), true, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 4:     check_has_effect(enemy2, attack_up): ", c_white, .2, offset0)
	print_test_result(check_has_effect(enemies[1], global.status_effects.attack_up), true, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 5:     check_has_effect(player2, shock): ", c_white, .2, offset0)
	print_test_result(check_has_effect(party[1], global.status_effects.shock), true, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
	draw_text_relative("Test Case 6:     check_has_effect(enemy2, burn): ", c_white, .2, offset0)
	print_test_result(check_has_effect(enemies[1], global.status_effects.burn), false, .2, offset1)
	offset0 = offset1 + 4;
	offset1 = offset0 + 2;
	
}

