selection[0] = "HP: ";// current selection of the text
selection[1] = "MP: ";
selection[2] = "STR: ";
selection[3] = "AGIL: ";
selection[4] = "DEX: ";
selection[5] = "SPD: ";
skill_points = 0; // stat points available
//current_line = 0 // y axis line
//spacing = 16;
//scale = 4;
hp = 0;
new_hp = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
width = 0;
height = 0;

show_stats = false; // Shows true if the stats screen is the on the screen

pos = 0; // Position of the selection
op_space = global.op_space;
op_margin = global.op_margin;
op_border = global.op_border;
op_length = array_length(selection);

spr_stat_ui = spr_menu_background; // Sprite used for the menu
stat_ui_width = 314;  // Stat screen width
stat_ui_height = 174; // Stat screen height
stat_ui_x = 3; // Stat screen x postion
//(gui_width * 0.5) - (stat_ui_width * 0.5 * scale);
stat_ui_y = 3; // Stat screen y postion
//(gui_height * 0.5) - (stat_ui_height * 0.5 * scale);

stat_info_x = stat_ui_x + 30; // Stat screen information x postion
stat_info_y = stat_ui_y + 45; // Stat screen information y postion
stat_description_x = stat_info_x + 50; // Stats description x postion

text_size = .085; // size of the text





