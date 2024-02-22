if (!show_stats) exit;

draw_set_font(fnt_pixeloid);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_sprite_ext(spr_stat_ui, 0, stat_ui_x - 200, stat_ui_y, scale + 10, scale, 0, c_white, 1);


if (pos = 0) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(global.party[0]._max_hp), op_space, op_margin, .2, .2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(global.party[0]._max_hp), op_space, op_margin, .2, .2, 0, c_white, c_white, c_white, c_white, 1);
}
if (pos = 1) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "MP: " + string(global.party[0]._max_mp), op_space, op_margin, .2, .2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "MP: " + string(global.party[0]._max_mp), op_space, op_margin, .2, .2, 0, c_white, c_white, c_white, c_white, 1);
}
if ( pos = 2) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "STR: " + string(global.party[0]._str), op_space, op_margin, .2, .2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "STR: " + string(global.party[0]._str), op_space, op_margin, .2, .2, 0, c_white, c_white, c_white, c_white, 1);
}
if (pos = 3) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "AGIL: " + string(global.party[0]._agi), op_space, op_margin, .2, .2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "AGIL: " + string(global.party[0]._agi), op_space, op_margin, .2, .2, 0, c_white, c_white, c_white, c_white, 1);
}
if (pos = 4) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 120, "DEX: " + string(global.party[0]._dex), op_space, op_margin, .2, .2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 120, "DEX: " + string(global.party[0]._dex), op_space, op_margin, .2, .2, 0, c_white, c_white, c_white, c_white, 1);
}
if (pos = 5) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 150, "SPD: " + string(global.party[0]._spd), op_space, op_margin, .2, .2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 150, "SPD: " + string(global.party[0]._spd), op_space, op_margin, .2, .2, 0, c_white, c_white, c_white, c_white, 1);
}
draw_text_ext_transformed_color(stat_info_x, stat_info_y + 180, "STAT POINTS: " + string(skill_points), op_space, op_margin, .2, .2, 0, c_white, c_white, c_white, c_white, 1);












