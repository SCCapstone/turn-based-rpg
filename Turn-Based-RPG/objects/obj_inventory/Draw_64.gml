if (!_show_inventory) exit; 

var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

//drawing inventory border and background
draw_sprite_stretched(_spr_inventory_border, 0, _gui_x_start, _gui_y_start, _gui_width, _gui_height);
draw_sprite_stretched(_spr_inventory_background, 0, _gui_x_start, _gui_y_start, _gui_width, _gui_height);
// drawing inventory slots
draw_sprite_stretched(_spr_inventory_slots, 0, _inventory_x_start, _inventory_y_start, _inventory_width, _inventory_height);

// draws items from inventory
// item sprite is in ds_grid column 1

if (ds_grid_height(global.inventory) == 1) {
	var _item_name = ds_grid_get(global.inventory, 0, 0);
	var _item_sprite = ds_grid_get(global.inventory, 1, 0);
	var _item_desc = ds_grid_get(global.inventory, 2, 0);
	draw_sprite_stretched(_item_sprite, 0, (_inventory_x_start+_slot_padding_x), (_inventory_y_start+_slot_padding_y), _sprite_width, _sprite_height);
	// TO-DO: info bar GUI on right side of inventory
	//draw_sprite_stretched(_item_sprite, 0, _info_bar_start, _inventory_y_start, 25, 25);
	//draw_text_ext_transformed_color(_info_bar_start, _name_y, _item_name, 2, _info_width, _font_size, _font_size, 0, c_white, c_white, c_white, c_white, 1);
	//draw_text_ext_transformed_color(_info_bar_start, _desc_y, _item_desc, 2, _info_width, _font_size, _font_size, 0, c_white, c_white, c_white, c_white, 1);
} /*else if (ds_grid_height(global.inventory) > 1) {
	for(var i = 0; i < ds_grid_height(global.inventory); i += 1) {
		var _item_name = ds_grid_get(global.inventory, 0, i);
		var _item_sprite = ds_grid_get(global.inventory, 1, i);
		var _item_desc = ds_grid_get(global.inventory, 2, i);
		// TO-DO: calculate equation for item sprite box
		var _sprite_x_start = ((i % 10)*_inventory_width/10) + _slot_padding_x;
		var _sprite_y_start = (((i / 10) + 1)*_inventory_height/6) + _slot_padding_y;
		draw_sprite_stretched(_item_sprite, 0, _sprite_x_start, _sprite_y_start, _sprite_width, _sprite_height);
	}
}*/
