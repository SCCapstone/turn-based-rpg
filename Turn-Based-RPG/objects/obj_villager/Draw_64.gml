var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

if (_talking) {
	draw_sprite_stretched(spr_menu_background,0,global.ui_x_buffer,global.ui_y_buffer,global.width,global.height);
	draw_text_ext(global.ui_x_buffer + global.text_x_buffer, global.ui_y_buffer + global.text_y_buffer, _text[0], 16, global.text_max_width)
}
