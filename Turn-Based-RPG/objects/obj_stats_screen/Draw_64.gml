draw_set_font(fnt_pixeloid);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
var _stat_lines = 8;

// Places the stats one after the other instead of all on top of each other
var _line = ds_list_create();
for (var i = 0; i < _stat_lines; i++) {
	var y_line = 20 + (i * spacing);
	ds_list_add(_line, y_line);
}

var _menu = "Stats:\n";
draw_text_ext_transformed(20 + op_border, _line[| 0], "HP: " + string(character[0].stats.hp), op_space, op_margin, .125, .125, 0);
current_line++;
draw_text_ext_transformed(20 + op_border, _line[| 1], "MP: " + string(character[0].stats.mp), op_space, op_margin, .125, .125, 0);
current_line++;
draw_text_ext_transformed(20 + op_border, _line[| 2], "STR: " + string(character[0].stats.str), op_space, op_margin, .125, .125, 0);
current_line++;
draw_text_ext_transformed(20 + op_border, _line[| 3], "AGIL: " + string(character[0].stats.agil), op_space, op_margin, .125, .125, 0);
current_line++;
draw_text_ext_transformed(20 + op_border, _line[| 4], "ENDU: " + string(character[0].stats.endu), op_space, op_margin, .125, .125, 0);
current_line++;
draw_text_ext_transformed(20 + op_border, _line[| 5], "CC: " + string(character[0].stats.cc), op_space, op_margin, .125, .125, 0);
current_line++;
draw_text_ext_transformed(20 + op_border, _line[| 6], "SPD: " + string(character[0].stats.hp), op_space, op_margin, .125, .125, 0);
current_line++;

draw_text_ext_transformed(20 + op_border, _line[| 7], "Stat Points: " + string(skill_points), op_space, op_margin, .125, .125, 0);

//draw_text_ext_transformed(20 + op_border, 20 + op_border, _menu, op_space, op_margin, .1, .1, 0);

ds_list_destroy(_line);








