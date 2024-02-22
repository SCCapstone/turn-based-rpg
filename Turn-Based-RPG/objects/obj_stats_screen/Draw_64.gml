if (!show_stats) exit;
var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

draw_set_font(fnt_pixeloid);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_sprite_stretched(spr_stat_ui, 0, stat_ui_x, stat_ui_y, stat_ui_width, stat_ui_height);
//draw_sprite_ext(spr_stat_ui, 0, stat_ui_x, stat_ui_y, 8.7, 4.8, 0, c_white, 1);
draw_text_ext_transformed_color(stat_info_x + 100, stat_info_y - 40, string(global.party[0]._name) + " Lvl: " + string(global.party[0]._lvl), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
draw_text_ext_transformed_color(stat_info_x + 110, stat_info_y - 25, "XP: " + string(global.party[0]._xp) + " / " + string(global.party[0]._max_xp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);

if (pos = 0) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
	draw_text_ext_transformed_color(stat_description_x, stat_info_y, "Health: A characters life.", op_space, op_margin, text_size - .02, text_size - .02, 0, c_white, c_white, c_white, c_white, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
}
if (pos = 1) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(global.party[0]._max_mp), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
	draw_text_ext_transformed_color(stat_description_x, stat_info_y + 15, "Mana: Magical energy.", op_space, op_margin, text_size - .02, text_size - .02, 0, c_white, c_white, c_white, c_white, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(global.party[0]._max_mp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
}
if ( pos = 2) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(global.party[0]._str), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
	draw_text_ext_transformed_color(stat_description_x, stat_info_y + 30, "Strength: A characters raw power.", op_space, op_margin, text_size - .02, text_size - .02, 0, c_white, c_white, c_white, c_white, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(global.party[0]._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
}
if (pos = 3) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(global.party[0]._agi), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
	draw_text_ext_transformed_color(stat_description_x, stat_info_y + 45, "Agility: The chance to dodge incoming attacks.", op_space, op_margin, text_size - .02, text_size - .02, 0, c_white, c_white, c_white, c_white, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(global.party[0]._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
}
if (pos = 4) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(global.party[0]._dex), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
	draw_text_ext_transformed_color(stat_description_x, stat_info_y + 60, "Dexterity: Allows use of more percise weaponry.", op_space, op_margin, text_size - .02, text_size - .02, 0, c_white, c_white, c_white, c_white, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(global.party[0]._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
}
if (pos = 5) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "SPD: " + string(global.party[0]._spd), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
	draw_text_ext_transformed_color(stat_description_x, stat_info_y + 75, "Speed: the quickness of a character.", op_space, op_margin, text_size - .02, text_size - .02, 0, c_white, c_white, c_white, c_white, 1);
} else {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "SPD: " + string(global.party[0]._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
}
draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "STAT POINTS: " + string(skill_points), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);












