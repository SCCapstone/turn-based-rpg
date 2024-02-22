selection[0] = "HP: ";// current selection of the text
selection[1] = "MP: ";
selection[2] = "STR: ";
selection[3] = "AGIL: ";
selection[4] = "DEX: ";
selection[5] = "SPD: ";
skill_points = 0; // stat points available
current_line = 0 // y axis line
spacing = 16;
//scale = 4;
hp = 1;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
width = 0;
height = 0;

show_stats = false;

pos = 0;
op_space = global.op_space;
op_margin = global.op_margin;
op_border = global.op_border;
op_length = array_length(selection);

spr_stat_ui = spr_menu_background;
stat_ui_width = 314;
stat_ui_height = 174;
stat_ui_x = 3;
//(gui_width * 0.5) - (stat_ui_width * 0.5 * scale);
stat_ui_y = 3;
//(gui_height * 0.5) - (stat_ui_height * 0.5 * scale);

stat_info_x = stat_ui_x + 30;
stat_info_y = stat_ui_y + 45;
stat_description_x = stat_info_x + 50;

text_size = .085;





