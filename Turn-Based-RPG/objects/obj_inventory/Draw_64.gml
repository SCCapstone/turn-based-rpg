if (!_show_inventory) exit; 

var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

//drawing inventory border and background
draw_sprite_stretched(_spr_inventory_border, 0, _gui_x_start, _gui_y_start, _gui_width, _gui_height);
draw_sprite_stretched(_spr_inventory_background, 0, _gui_x_start, _gui_y_start, _gui_width, _gui_height);
// drawing inventory slots
draw_sprite_stretched(_spr_inventory_slots, 0, _inventory_x_start, _inventory_y_start, _inventory_width, _inventory_height);