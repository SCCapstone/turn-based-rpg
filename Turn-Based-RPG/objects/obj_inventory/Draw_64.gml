if (!_show_inventory) exit; 

var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

//drawing inventory border and background
//draw_sprite_stretched(_spr_inventory_border, 0, _gui_x_start, _gui_y_start, _gui_width, _gui_height);
//draw_sprite_stretched(_spr_inventory_background, 0, _gui_x_start, _gui_y_start, _gui_width, _gui_height);
//drawing inventory slots
//draw_sprite_stretched(_spr_inventory_slots, 0, _inventory_x_start, _inventory_y_start, _inventory_width, _inventory_height);


var _item_name;
var _item_sprite;
var _item_desc;

// Draws the inventory slots
for (_i = 0; _i < 4; _i++) {
	for (_j = 0; _j < 10; _j++) {
		if (_x_pos == _j && _y_pos == _i) {
			draw_sprite_stretched(spr_menu_background, 2, x + 11 + (_j * 30), y + 53 + (_i * 30), 28, 28)
		} else {
			draw_sprite_stretched(spr_menu_background, 0, x + 11 + (_j * 30), y + 53 + (_i * 30), 28, 28)
		}
	}
}
			
// Draws items from inventory
for (var i = 0; i < 4; i++) { // Rows
	for (var j = 0; j < 10; j++) { // Columns
		// Ensures empty slots are not drawn
		if (global.inventory[# j, i] != noone) {
			_item_name = global.inventory[# j, i]._name;
			_item_sprite = global.inventory[# j, i]._sprite;
	
			// Draw sprite in inventory
			draw_sprite_stretched(_item_sprite, 0, x + 17 + (j * 30), y + 59 + (i * 30), _sprite_width, _sprite_height);
		}
	}
}

draw_set_font(fnt_pixeloid);

// Draws gold sprite and amount
draw_sprite(spr_coin, 0, x + 15, y + 37);
draw_text_transformed(x + 27, y + 34, "Gold: " + string(global.gold), 0.125, 0.125, 0);

// draws tooltip description pop-up
if (global.inventory[# _x_pos, _y_pos] != noone) {
	_show_tooltip = true;
	
	if (_show_tooltip) {
			if (_x_pos < 6 && _y_pos < 2) {
			_item_name = global.inventory[# _x_pos, _y_pos]._name;
			_item_desc = global.inventory[# _x_pos, _y_pos]._description;
			var _equip = "Press 'E' to equip item.";
		
			draw_sprite_stretched(spr_menu_background, 1, x + 33 + (_x_pos * 30), y + 75 + (_y_pos * 30), _tooltip_width, _tooltip_height);
			draw_text_ext_transformed_color(x + 40 + (_x_pos * 30), y + 82 + (_y_pos * 30), _item_name, op_space, op_margin, .08, .08, 0, c_white, c_white, c_white, c_white, 1);
			draw_text_ext_transformed_color(x + 40 + (_x_pos * 30), y + 82 + (_y_pos * 30) + 10, _item_desc, _tooltip_space, _tooltip_margin, .05, .05, 0, c_white, c_white, c_white, c_white, 1);
			draw_text_ext_transformed_color(x + 40 + (_x_pos * 30), y + 82 + (_y_pos * 30) + 40, _equip, op_space, op_margin, .05, .05, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		} else if (_x_pos >= 6 && _y_pos < 2) {
			_item_name = global.inventory[# _x_pos, _y_pos]._name;
			_item_desc = global.inventory[# _x_pos, _y_pos]._description;
			var _equip = "Press 'E' to equip item.";
		
			draw_sprite_stretched(spr_menu_background, 1, x + 15 + (_x_pos * 30) - _tooltip_width, y + 75 + (_y_pos * 30), _tooltip_width, _tooltip_height);
			draw_text_ext_transformed_color(x + 22 + (_x_pos * 30) - _tooltip_width, y + 82 + (_y_pos * 30), _item_name, op_space, op_margin, .08, .08, 0, c_white, c_white, c_white, c_white, 1);
			draw_text_ext_transformed_color(x + 22 + (_x_pos * 30) - _tooltip_width, y + 82 + (_y_pos * 30) + 10, _item_desc, _tooltip_space, _tooltip_margin, .05, .05, 0, c_white, c_white, c_white, c_white, 1);
			draw_text_ext_transformed_color(x + 22 + (_x_pos * 30) - _tooltip_width, y + 82 + (_y_pos * 30) + 40, _equip, op_space, op_margin, .05, .05, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		} else if (_x_pos < 6 && _y_pos >= 2) {
			_item_name = global.inventory[# _x_pos, _y_pos]._name;
			_item_desc = global.inventory[# _x_pos, _y_pos]._description;
			var _equip = "Press 'E' to equip item.";
		
			draw_sprite_stretched(spr_menu_background, 1, x + 33 + (_x_pos * 30), y + 58 + (_y_pos * 30) - _tooltip_height, _tooltip_width, _tooltip_height);
			draw_text_ext_transformed_color(x + 40 + (_x_pos * 30), y + 65 + (_y_pos * 30) - _tooltip_height, _item_name, op_space, op_margin, .08, .08, 0, c_white, c_white, c_white, c_white, 1);
			draw_text_ext_transformed_color(x + 40 + (_x_pos * 30), y + 65 + (_y_pos * 30) - _tooltip_height + 10, _item_desc, _tooltip_space, _tooltip_margin, .05, .05, 0, c_white, c_white, c_white, c_white, 1);
			draw_text_ext_transformed_color(x + 40 + (_x_pos * 30), y + 65 + (_y_pos * 30) - _tooltip_height + 40, _equip, op_space, op_margin, .05, .05, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		} else if (_x_pos >= 6 && _y_pos >= 2) {
			_item_name = global.inventory[# _x_pos, _y_pos]._name;
			_item_desc = global.inventory[# _x_pos, _y_pos]._description;
			var _equip = "Press 'E' to equip item.";
		
			draw_sprite_stretched(spr_menu_background, 1, x + 15 + (_x_pos * 30) - _tooltip_width, y + 58 + (_y_pos * 30) - _tooltip_height, _tooltip_width, _tooltip_height);
			draw_text_ext_transformed_color(x + 22 + (_x_pos * 30) - _tooltip_width, y + 65 + (_y_pos * 30) - _tooltip_height, _item_name, op_space, op_margin, .08, .08, 0, c_white, c_white, c_white, c_white, 1);
			draw_text_ext_transformed_color(x + 22 + (_x_pos * 30) - _tooltip_width, y + 65 + (_y_pos * 30) - _tooltip_height + 10, _item_desc, _tooltip_space, _tooltip_margin, .05, .05, 0, c_white, c_white, c_white, c_white, 1);
			draw_text_ext_transformed_color(x + 22 + (_x_pos * 30) - _tooltip_width, y + 65 + (_y_pos * 30) - _tooltip_height + 40, _equip, op_space, op_margin, .05, .05, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		} 	
	}
}