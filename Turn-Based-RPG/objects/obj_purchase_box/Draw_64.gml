/// @description Insert description here
// Gets the camera view and sets the GUI size so sprites will always be a consistent size on the GUI layer
var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

// Draws the actual textbox and text
draw_sprite_stretched(spr_menu_background, 0, global.ui_x_buffer, global.ui_y_buffer, global.textbox_width, global.textbox_height);
draw_text_ext_transformed(global.ui_x_buffer + global.text_x_buffer, global.ui_y_buffer + global.text_y_buffer, _shop_text[_page], 99, global.text_max_width, .125, .125, 0);

// Draws the namebox and name text
draw_sprite_stretched(spr_menu_background, 0, round(global.namebox_x_buffer), round(global.namebox_y_buffer), global.namebox_width, global.namebox_height);
draw_text_ext_transformed(global.namebox_x_buffer + global.text_x_buffer, global.namebox_y_buffer + global.text_y_buffer, _shop_speaker[_page], 16, global.text_max_width, .125, .125, 0);

if (_choice == true && _e_pressed != 1) {
	draw_text_ext_transformed_color(global.ui_x_buffer + global.text_x_buffer, global.ui_y_buffer + global.text_y_buffer, "\n\nYes", 99, global.text_max_width, .125, .125, 0, c_yellow, c_yellow, c_yellow, c_yellow,1);
}
if (_choice == false && _e_pressed != 1) {
	draw_text_ext_transformed_color(global.ui_x_buffer + global.text_x_buffer, global.ui_y_buffer + global.text_y_buffer, "\n\n\nNo", 99, global.text_max_width, .125, .125, 0, c_yellow, c_yellow, c_yellow, c_yellow,1);
}