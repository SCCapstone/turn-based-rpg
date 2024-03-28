if (!show_stats) exit; // Displays the stats screen
var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy); // sets the gui size to the same size as the camera

draw_set_font(fnt_pixeloid);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_sprite_stretched(spr_stat_ui, 0, stat_ui_x, stat_ui_y, stat_ui_width, stat_ui_height);
// the background for the stats screen
//draw_sprite_ext(spr_stat_ui, 0, stat_ui_x, stat_ui_y, 8.7, 4.8, 0, c_white, 1);
// draws the current party member name and level then under displays the current XP and max XP to reach the next level
//draw_text_ext_transformed_color(stat_info_x + 40, stat_info_y - 15, string("Press ' O ' to switch between party members"), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
draw_sprite_stretched(spr_health, 0, stat_spr_x, stat_spr_y, 10, 10);

draw_sprite_stretched(spr_mana, 0, stat_spr_x, stat_spr_y + 14, 10, 10);

draw_sprite_stretched(spr_strength, 0, stat_spr_x, stat_spr_y + 29, 10, 10);

draw_sprite_stretched(spr_agility, 0, stat_spr_x, stat_spr_y + 44, 10, 10);

draw_sprite_stretched(spr_dexterity, 0, stat_spr_x, stat_spr_y + 59, 10, 10);

draw_sprite_stretched(spr_intelligence, 0, stat_spr_x, stat_spr_y + 74, 10, 10);

draw_sprite_stretched(spr_faith, 0, stat_spr_x, stat_spr_y + 89, 10, 10);

draw_sprite_stretched(spr_speed, 0, stat_spr_x, stat_spr_y + 104, 10, 10);

/*
 When the stat is currently being selected it will be highlighted and give a brief description of the current stat
*/
if (!party_disable) {
	if (partypos == 0) {
	draw_sprite_stretched(spr_stat_party, 1, 230, 45, 80, 25);
	draw_text_ext_transformed_color(250, 50, string(ds_list_find_value(global.party,0)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
	draw_text_ext_transformed_color(290, 50,"Lvl: " + string(ds_list_find_value(global.party,0)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
	draw_sprite_part_ext(spr_icon1, 0, 4, 0, 8, 10, 235, 51, 1.2, 1.2, c_white, 1);
	draw_text_ext_transformed_color(255, 58, string(ds_list_find_value(global.party,0)._hp) + "/" + string(ds_list_find_value(global.party,0)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
	if (ds_list_size(global.party) == 2) {
		var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
		draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
		draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
	}
	if (ds_list_size(global.party) == 3) {
		var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
		draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
		draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
		draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
		draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
	}
	if (ds_list_size(global.party) == 4) {
		var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
		draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
		draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
		draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
		draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		var spr_icon4 = ds_list_find_value(global.party,3)._sprites.idle;
		draw_sprite_stretched(spr_stat_party, 0, 230, 135, 80, 25);
		draw_text_ext_transformed_color(250, 140, string(ds_list_find_value(global.party,3)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 140,"Lvl: " + string(ds_list_find_value(global.party,3)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon4, 0, 4, 0, 8, 10, 235, 141, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 148, string(ds_list_find_value(global.party,3)._hp) + "/" + string(ds_list_find_value(global.party,3)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
	}
	draw_text_ext_transformed_color(stat_info_x + 102, stat_info_y - 30, string(ds_list_find_value(global.party,0)._name) + " Lvl: " + string(ds_list_find_value(global.party,0)._lvl), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_ext_transformed_color(stat_info_x + 105, stat_info_y - 15, "XP: " + string(ds_list_find_value(global.party,0)._xp) + " / " + string(ds_list_find_value(global.party,0)._max_xp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	if (statpos = 0) {
	draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		
	}
	if (statpos = 1) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	if ( statpos = 2) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,0)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 30, "Strength: Increases physical damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,0)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	if (statpos = 3) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,0)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 45, "Agility: Chance to dodge incoming attacks.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,0)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	if (statpos = 4) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,0)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 60, "Dexterity: Increases ranged damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,0)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	if (statpos = 5) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,0)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 75, "Intelligence: Increases magic damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,0)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	if (statpos = 6) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,0)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,0)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	if (statpos = 7) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,0)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,0)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 120, "STAT POINTS: " + string(skill_points[0]), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	} else if (partypos == 1) {
		draw_sprite_stretched(spr_stat_party, 0, 230, 45, 80, 25);
		draw_text_ext_transformed_color(250, 50, string(ds_list_find_value(global.party,0)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 50,"Lvl: " + string(ds_list_find_value(global.party,0)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon1, 0, 4, 0, 8, 10, 235, 51, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 58, string(ds_list_find_value(global.party,0)._hp) + "/" + string(ds_list_find_value(global.party,0)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		if (ds_list_size(global.party) == 2) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 1, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 3) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 1, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 4) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 1, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon4 = ds_list_find_value(global.party,3)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 135, 80, 25);
			draw_text_ext_transformed_color(250, 140, string(ds_list_find_value(global.party,3)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 140,"Lvl: " + string(ds_list_find_value(global.party,3)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon4, 0, 4, 0, 8, 10, 235, 141, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 148, string(ds_list_find_value(global.party,3)._hp) + "/" + string(ds_list_find_value(global.party,3)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x + 102, stat_info_y - 30, string(ds_list_find_value(global.party,1)._name) + " Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_ext_transformed_color(stat_info_x + 105, stat_info_y - 15, "XP: " + string(ds_list_find_value(global.party,1)._xp) + " / " + string(ds_list_find_value(global.party,1)._max_xp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		if (statpos = 0) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp2), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y, "Health: Total life energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp2), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 1) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp2), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 15, "Mana: Total Magical energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp2), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if ( statpos = 2) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,1)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 30, "Strength: Increases physical damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,1)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 3) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,1)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 45, "Agility: Chance to dodge incoming attacks.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,1)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 4) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,1)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 60, "Dexterity: Increases ranged damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,1)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 5) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,1)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 75, "Intelligence: Increases magic damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,1)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 6) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,1)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,1)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	if (statpos = 7) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,1)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,1)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 120, "STAT POINTS: " + string(skill_points[1]), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	} else if (partypos = 2) {
		draw_sprite_stretched(spr_stat_party, 0, 230, 45, 80, 25);
		draw_text_ext_transformed_color(250, 50, string(ds_list_find_value(global.party,0)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 50,"Lvl: " + string(ds_list_find_value(global.party,0)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon1, 0, 4, 0, 8, 10, 235, 51, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 58, string(ds_list_find_value(global.party,0)._hp) + "/" + string(ds_list_find_value(global.party,0)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		if (ds_list_size(global.party) == 2) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 3) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 1, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 4) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 1, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon4 = ds_list_find_value(global.party,3)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 135, 80, 25);
			draw_text_ext_transformed_color(250, 140, string(ds_list_find_value(global.party,3)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 140,"Lvl: " + string(ds_list_find_value(global.party,3)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon4, 0, 4, 0, 8, 10, 235, 141, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 148, string(ds_list_find_value(global.party,3)._hp) + "/" + string(ds_list_find_value(global.party,3)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x + 102, stat_info_y - 30, string(ds_list_find_value(global.party,2)._name) + " Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_ext_transformed_color(stat_info_x + 105, stat_info_y - 15, "XP: " + string(ds_list_find_value(global.party,2)._xp) + " / " + string(ds_list_find_value(global.party,2)._max_xp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		if (statpos = 0) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp3), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y, "Health: Total life energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp3), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 1) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp3), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 15, "Mana: Total Magical energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp3), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if ( statpos = 2) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,2)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 30, "Strength: Increases physical damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,2)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 3) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,2)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 45, "Agility: Chance to dodge incoming attacks.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,2)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 4) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,2)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//	draw_text_ext_transformed_color(stat_description_x, stat_info_y + 60, "Dexterity: Increases ranged damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,2)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 5) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,2)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 75, "Intelligence: Increases magic damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,2)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 6) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,2)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,2)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	if (statpos = 7) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,2)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,2)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 120, "STAT POINTS: " + string(skill_points[2]), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	} else if (partypos = 3) {
		draw_sprite_stretched(spr_stat_party, 0, 230, 45, 80, 25);
		draw_text_ext_transformed_color(250, 50, string(ds_list_find_value(global.party,0)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 50,"Lvl: " + string(ds_list_find_value(global.party,0)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon1, 0, 4, 0, 8, 10, 235, 51, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 58, string(ds_list_find_value(global.party,0)._hp) + "/" + string(ds_list_find_value(global.party,0)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		if (ds_list_size(global.party) == 2) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 3) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 4) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon4 = ds_list_find_value(global.party,3)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 1, 230, 135, 80, 25);
			draw_text_ext_transformed_color(250, 140, string(ds_list_find_value(global.party,3)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 140,"Lvl: " + string(ds_list_find_value(global.party,3)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon4, 0, 4, 0, 8, 10, 235, 141, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 148, string(ds_list_find_value(global.party,3)._hp) + "/" + string(ds_list_find_value(global.party,3)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x + 102, stat_info_y - 30, string(ds_list_find_value(global.party,3)._name) + " Lvl: " + string(ds_list_find_value(global.party,3)._lvl), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_ext_transformed_color(stat_info_x + 105, stat_info_y - 15, "XP: " + string(ds_list_find_value(global.party,3)._xp) + " / " + string(ds_list_find_value(global.party,3)._max_xp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		if (statpos = 0) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp4), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y, "Health: Total life energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp4), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 1) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp4), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 15, "Mana: Total Magical energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp4), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if ( statpos = 2) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,3)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 30, "Strength: Increases physical damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,3)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 3) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,3)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 45, "Agility: Chance to dodge incoming attacks.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,3)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 4) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,3)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 60, "Dexterity: Increases ranged damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,3)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 5) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,3)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
			//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 75, "Intelligence: Increases magic damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,3)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 6) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,3)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,3)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	if (statpos = 7) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,3)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		//draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
	} else {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,3)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
	draw_text_ext_transformed_color(stat_info_x, stat_info_y + 120, "STAT POINTS: " + string(skill_points[0]), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
} else {
	if (partypos == 0) {
		draw_sprite_stretched(spr_stat_party, 1, 230, 45, 80, 25);
		draw_text_ext_transformed_color(250, 50, string(ds_list_find_value(global.party,0)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 50,"Lvl: " + string(ds_list_find_value(global.party,0)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon1, 0, 4, 0, 8, 10, 235, 51, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 58, string(ds_list_find_value(global.party,0)._hp) + "/" + string(ds_list_find_value(global.party,0)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		if (ds_list_size(global.party) == 2) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 3) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 4) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon4 = ds_list_find_value(global.party,3)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 135, 80, 25);
			draw_text_ext_transformed_color(250, 140, string(ds_list_find_value(global.party,3)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 140,"Lvl: " + string(ds_list_find_value(global.party,3)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon4, 0, 4, 0, 8, 10, 235, 141, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 148, string(ds_list_find_value(global.party,3)._hp) + "/" + string(ds_list_find_value(global.party,3)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x + 102, stat_info_y - 30, string(ds_list_find_value(global.party,0)._name) + " Lvl: " + string(ds_list_find_value(global.party,0)._lvl), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_ext_transformed_color(stat_info_x + 105, stat_info_y - 15, "XP: " + string(ds_list_find_value(global.party,0)._xp) + " / " + string(ds_list_find_value(global.party,0)._max_xp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		if (statpos = 0) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		draw_text_ext_transformed_color(stat_description_x, stat_info_y, "Health: Total life energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 1) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 15, "Mana: Total Magical energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if ( statpos = 2) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,0)._str), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 30, "Strength: Increases physical damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,0)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 3) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,0)._agi), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 45, "Agility: Chance to dodge incoming attacks.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,0)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 4) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,0)._dex), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 60, "Dexterity: Increases ranged damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,0)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 5) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,0)._int), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 75, "Intelligence: Increases magic damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,0)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 6) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,0)._fai), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Faith: Increases proficiency of prayers", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,0)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 7) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,0)._spd), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 105, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,0)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 120, "STAT POINTS: " + string(skill_points[0]), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	} else if (partypos == 1) {
		draw_sprite_stretched(spr_stat_party, 0, 230, 45, 80, 25);
		draw_text_ext_transformed_color(250, 50, string(ds_list_find_value(global.party,0)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 50,"Lvl: " + string(ds_list_find_value(global.party,0)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon1, 0, 4, 0, 8, 10, 235, 51, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 58, string(ds_list_find_value(global.party,0)._hp) + "/" + string(ds_list_find_value(global.party,0)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		if (ds_list_size(global.party) == 2) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 1, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 3) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 4) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon4 = ds_list_find_value(global.party,3)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 135, 80, 25);
			draw_text_ext_transformed_color(250, 140, string(ds_list_find_value(global.party,3)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 140,"Lvl: " + string(ds_list_find_value(global.party,3)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon4, 0, 4, 0, 8, 10, 235, 141, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 148, string(ds_list_find_value(global.party,3)._hp) + "/" + string(ds_list_find_value(global.party,3)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x + 102, stat_info_y - 30, string(ds_list_find_value(global.party,1)._name) + " Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_ext_transformed_color(stat_info_x + 105, stat_info_y - 15, "XP: " + string(ds_list_find_value(global.party,1)._xp) + " / " + string(ds_list_find_value(global.party,1)._max_xp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		if (statpos = 0) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp2), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		draw_text_ext_transformed_color(stat_description_x, stat_info_y, "Health: Total life energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp2), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 1) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp2), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 15, "Mana: Total Magical energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp2), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if ( statpos = 2) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,1)._str), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 30, "Strength: Increases physical damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,1)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 3) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,1)._agi), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 45, "Agility: Chance to dodge incoming attacks.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,1)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 4) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,1)._dex), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 60, "Dexterity: Increases ranged damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,1)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 5) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,1)._int), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 75, "Intelligence: Increases magic damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,1)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 6) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,1)._fai), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Faith: Increases proficiency of prayers", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,1)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 7) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,1)._spd), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 105, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,1)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 120, "STAT POINTS: " + string(skill_points[1]), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	} else if (partypos = 2) {
		draw_sprite_stretched(spr_stat_party, 0, 230, 45, 80, 25);
		draw_text_ext_transformed_color(250, 50, string(ds_list_find_value(global.party,0)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 50,"Lvl: " + string(ds_list_find_value(global.party,0)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon1, 0, 4, 0, 8, 10, 235, 51, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 58, string(ds_list_find_value(global.party,0)._hp) + "/" + string(ds_list_find_value(global.party,0)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		if (ds_list_size(global.party) == 2) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 3) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 1, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 4) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon4 = ds_list_find_value(global.party,3)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 135, 80, 25);
			draw_text_ext_transformed_color(250, 140, string(ds_list_find_value(global.party,3)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 140,"Lvl: " + string(ds_list_find_value(global.party,3)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon4, 0, 4, 0, 8, 10, 235, 141, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 148, string(ds_list_find_value(global.party,3)._hp) + "/" + string(ds_list_find_value(global.party,3)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x + 102, stat_info_y - 30, string(ds_list_find_value(global.party,2)._name) + " Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_ext_transformed_color(stat_info_x + 105, stat_info_y - 15, "XP: " + string(ds_list_find_value(global.party,2)._xp) + " / " + string(ds_list_find_value(global.party,2)._max_xp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		if (statpos = 0) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp3), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		draw_text_ext_transformed_color(stat_description_x, stat_info_y, "Health: Total life energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp3), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 1) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp3), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 15, "Mana: Total Magical energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp3), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if ( statpos = 2) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,2)._str), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 30, "Strength: Increases physical damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,2)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 3) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,2)._agi), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 45, "Agility: Chance to dodge incoming attacks.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,2)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 4) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,2)._dex), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 60, "Dexterity: Increases ranged damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,2)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 5) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,2)._int), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 75, "Intelligence: Increases magic damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,2)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 6) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,2)._fai), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Faith: Increases proficiency of prayers", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,2)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 7) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,2)._spd), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 105, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,2)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 120, "STAT POINTS: " + string(skill_points[2]), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	} else if (partypos = 3) {
		draw_sprite_stretched(spr_stat_party, 0, 230, 45, 80, 25);
		draw_text_ext_transformed_color(250, 50, string(ds_list_find_value(global.party,0)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
		draw_text_ext_transformed_color(290, 50,"Lvl: " + string(ds_list_find_value(global.party,0)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		draw_sprite_part_ext(spr_icon1, 0, 4, 0, 8, 10, 235, 51, 1.2, 1.2, c_white, 1);
		draw_text_ext_transformed_color(255, 58, string(ds_list_find_value(global.party,0)._hp) + "/" + string(ds_list_find_value(global.party,0)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		if (ds_list_size(global.party) == 2) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 3) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (ds_list_size(global.party) == 4) {
			var spr_icon2 = ds_list_find_value(global.party,1)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 1, 230, 75, 80, 25);
			draw_text_ext_transformed_color(250, 80, string(ds_list_find_value(global.party,1)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 80,"Lvl: " + string(ds_list_find_value(global.party,1)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon2, 0, 4, 0, 8, 10, 235, 81, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 88, string(ds_list_find_value(global.party,1)._hp) + "/" + string(ds_list_find_value(global.party,1)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon3 = ds_list_find_value(global.party,2)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 105, 80, 25);
			draw_text_ext_transformed_color(250, 110, string(ds_list_find_value(global.party,2)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 110,"Lvl: " + string(ds_list_find_value(global.party,2)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon3, 0, 4, 0, 8, 10, 235, 111, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 118, string(ds_list_find_value(global.party,2)._hp) + "/" + string(ds_list_find_value(global.party,2)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			var spr_icon4 = ds_list_find_value(global.party,3)._sprites.idle;
			draw_sprite_stretched(spr_stat_party, 0, 230, 135, 80, 25);
			draw_text_ext_transformed_color(250, 140, string(ds_list_find_value(global.party,3)._name), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white,c_white, 1);
			draw_text_ext_transformed_color(290, 140,"Lvl: " + string(ds_list_find_value(global.party,3)._lvl), op_space,op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
			draw_sprite_part_ext(spr_icon4, 0, 4, 0, 8, 10, 235, 141, 1.2, 1.2, c_white, 1);
			draw_text_ext_transformed_color(255, 148, string(ds_list_find_value(global.party,3)._hp) + "/" + string(ds_list_find_value(global.party,3)._max_hp), op_space, op_margin, text_size_party, text_size_party, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x + 102, stat_info_y - 30, string(ds_list_find_value(global.party,3)._name) + " Lvl: " + string(ds_list_find_value(global.party,3)._lvl), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_ext_transformed_color(stat_info_x + 105, stat_info_y - 15, "XP: " + string(ds_list_find_value(global.party,3)._xp) + " / " + string(ds_list_find_value(global.party,3)._max_xp), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		if (statpos = 0) {
		draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp4), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		draw_text_ext_transformed_color(stat_description_x, stat_info_y, "Health: Total life energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y, "HP: " + string(hp4), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 1) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp4), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 15, "Mana: Total Magical energy.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 15, "MP: " + string(mp4), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if ( statpos = 2) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,3)._str), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 30, "Strength: Increases physical damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 30, "STR: " + string(ds_list_find_value(global.party,3)._str), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 3) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,3)._agi), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 45, "Agility: Chance to dodge incoming attacks.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 45, "AGIL: " + string(ds_list_find_value(global.party,3)._agi), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 4) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,3)._dex), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 60, "Dexterity: Increases ranged damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 60, "DEX: " + string(ds_list_find_value(global.party,3)._dex), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 5) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,3)._int), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 75, "Intelligence: Increases magic damage.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 75, "INT: " + string(ds_list_find_value(global.party,3)._int), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 6) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,3)._fai), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 90, "Faith: Increases proficiency of prayers", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 90, "FAITH: " + string(ds_list_find_value(global.party,3)._fai), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		if (statpos = 7) {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,3)._spd), op_space, op_margin, text_size, text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_ext_transformed_color(stat_description_x, stat_info_y + 105, "Speed: Determines battle order.", op_space, op_margin, text_size_description, text_size_description, 0, c_white, c_white, c_white, c_white, 1);
		} else {
			draw_text_ext_transformed_color(stat_info_x, stat_info_y + 105, "SPD: " + string(ds_list_find_value(global.party,3)._spd), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_text_ext_transformed_color(stat_info_x, stat_info_y + 120, "STAT POINTS: " + string(skill_points[3]), op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);
	}
}













