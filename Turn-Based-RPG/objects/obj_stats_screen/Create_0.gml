selection[0] = "HP: ";// current selection of the text
selection[1] = "MP: ";
selection[2] = "STR: ";
selection[3] = "AGIL: ";
selection[4] = "DEX: ";
selection[5] = "INT: ";
//selection[6] = "FAI: ";
selection[6] = "SPD: ";
skill_points[0] = 0; // stat points available
skill_points[1] = 0;
skill_points[2] = 0;
skill_points[3] = 0;
//stat_party = ds_list_create()
//stat_party[0] = "party1";
//stat_party[1] = "party2";
//party_size = ds_list_size(global.party);
//ds_list_size(global.party);
/*for (var i = 0; i < ds_list_size(global.party); i++) {
	//stat_party[i] = ds_list_find_value(global.party, i);
	party_switch = ds_list_find_value(global.party, i);
	
}*/
/*stat_party[2] = "party3";
stat_party[3] = "party4";*/
//current_line = 0 // y axis line
//spacing = 16;
//scale = 4;
//original_hp = ds_list_find_value(global.party,0)._hp;
//original_max_hp = ds_list_find_value(global.party,0)._hp;
hp = 0;
new_hp = 0;
mp = 0;
new_mp = 0;
hp2 = 0;
new_hp2 = 0;
mp2 = 0;
new_mp2 = 0;
hp3 = 0;
new_hp3 = 0;
mp3 = 0;
new_mp3 = 0;
hp4 = 0;
new_hp4 = 0;
mp4 = 0;
new_mp4 = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
width = 0;
height = 0;

show_stats = false; // Shows true if the stats screen is the on the screen

statpos = 0; // Position of the selection
op_space = global.op_space;
op_margin = global.op_margin;
op_border = global.op_border;
op_length = array_length(selection);

//party_switch = array_length(stat_party);
partypos = 0;
party_disable = false;

spr_stat_ui = spr_menu_background; // Sprite used for the menu
spr_stat_party = spr_menu_border;
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
spr_icon1 = ds_list_find_value(global.party,0)._sprites.idle;
/*spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
spr_icon4 = ds_list_find_value(global.party,3)._sprites.idle;*/





