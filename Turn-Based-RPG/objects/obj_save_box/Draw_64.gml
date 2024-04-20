var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

draw_sprite_stretched(spr_menu_background, 1, round(110), round(global.namebox_y_buffer), 100, global.namebox_height);
draw_text_ext_transformed(115 + global.text_x_buffer, global.namebox_y_buffer + global.text_y_buffer, _text, 16, global.text_max_width, .125, .125, 0);
