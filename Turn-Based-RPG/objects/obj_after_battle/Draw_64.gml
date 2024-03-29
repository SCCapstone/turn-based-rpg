var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

draw_set_font(fnt_pixeloid);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_sprite_stretched(spr_menu_background, 0, global.ui_x_buffer, global.ui_y_buffer, global.textbox_width, global.textbox_height);
/*for (var i = 0; i < ds_list_size(global.party); i++) {
	draw_text_ext_transformed(global.ui_x_buffer + global.text_x_buffer, global.ui_y_buffer + global.text_y_buffer, string(ds_list_find_value(global.party,1)._name) + " gained " + string(ds_list_find_value(global.xp, 1)) + " XP!", 99, global.text_max_width, .125, .125, 0);
}*/
//if (pos = 0)
switch (pos) {
	case 0:
		switch(_page) {
			case 0:
		        if (array_length(global.xp)) > 0 {
		            draw_text_ext_transformed(global.ui_x_buffer + global.text_x_buffer, global.ui_y_buffer + global.text_y_buffer, string(ds_list_find_value(global.party,0)._name) + " gained " + string(global.xp[0]) + " XP!", 99, global.text_max_width, .125, .125, 0);
		        }
	        break;
			case 1:
		        if array_length(global.xp) > 1 {
		            draw_text_ext_transformed(global.ui_x_buffer + global.text_x_buffer, global.ui_y_buffer + global.text_y_buffer, string(ds_list_find_value(global.party,1)._name) + " gained " + string(global.xp[1]) + " XP!", 99, global.text_max_width, .125, .125, 0);
		        }
	        break;
			case 2:
				if array_length(global.xp) > 2 {
		            draw_text_ext_transformed(global.ui_x_buffer + global.text_x_buffer, global.ui_y_buffer + global.text_y_buffer, string(ds_list_find_value(global.party,2)._name) + " gained " + string(global.xp[2]) + " XP!", 99, global.text_max_width, .125, .125, 0);
		        }
			break;
			case 3:
				if array_length(global.xp) > 3 {
		            draw_text_ext_transformed(global.ui_x_buffer + global.text_x_buffer, global.ui_y_buffer + global.text_y_buffer, string(ds_list_find_value(global.party,3)._name) + " gained " + string(global.xp[3]) + " XP!", 99, global.text_max_width, .125, .125, 0);
		        }
			break;	
		}
	break;
	case 1:
		if (_gained_item == true) {
			draw_text_ext_transformed(global.ui_x_buffer + global.text_x_buffer, global.ui_y_buffer + global.text_y_buffer, global.weapon_gained[_page]._name, 99, global.text_max_width, .125, .125, 0);
		}
}






