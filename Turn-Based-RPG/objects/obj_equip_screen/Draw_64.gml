if (!show_equip) exit; // Displays the equip screen
var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy); // sets the gui size to the same size as the camera

draw_set_font(fnt_pixeloid);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Equip screen background
draw_sprite_stretched(spr_menu_background, 0, ui_x, ui_y+33, ui_width, ui_height-33); 

// Character name
draw_text_ext_transformed_color(124, 42, global.party[|selected_character]._name + " Lvl: " + string(global.party[|selected_character]._lvl), 
op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);

draw_text_ext_transformed_color(32, 58, "Navigate with A and D to switch between party members",
op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1);

// Character preview box
draw_sprite_stretched(spr_menu_background, 0, ui_x+12, ui_y+88, 48, 76);

// Character preview sprite
draw_sprite_ext(global.party[|selected_character]._sprites.idle, 0, ui_x+20, ui_y+98, 2, 2, 0, c_white, 1);

// Boxes for equipment slots
draw_sprite_stretched(spr_menu_background, 0, ui_x+66, ui_y+88, 25, 25);
draw_sprite_stretched(spr_menu_background, 0, ui_x+66, ui_y+114, 25, 25);
draw_sprite_stretched(spr_menu_background, 0, ui_x+66, ui_y+140, 25, 25);

// Text for equipment slots
draw_text_ext_transformed_color(ui_x+97, ui_y+96,"Weapon", op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1); 
draw_text_ext_transformed_color(ui_x+97, ui_y+122,"Magic Weapon", op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1); 
draw_text_ext_transformed_color(ui_x+97, ui_y+148,"Prayer Book", op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1); 

// Equipment sprites
if (global.party[|selected_character]._weapon != noone) {
	draw_sprite_ext(global.party[|selected_character]._weapon._sprite, 0, ui_x+69, ui_y+111, .75, .75, 0, c_white, 1);
}
if (global.party[|selected_character]._magic_weapon != noone) {
	draw_sprite_ext(global.party[|selected_character]._magic_weapon._sprite, 0, ui_x+70, ui_y+135, .75, .75, 0, c_white, 1);
}
if (global.party[|selected_character]._prayer_book != noone) {
	draw_sprite_ext(global.party[|selected_character]._prayer_book._sprite, 0, ui_x+73, ui_y+159, .75, .75, 0, c_white, 1);
}

// Text for spell/prayer boxes
draw_text_ext_transformed_color(ui_x+183, ui_y+85,"Spells", op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1); 
draw_text_ext_transformed_color(ui_x+183, ui_y+128,"Prayers", op_space, op_margin, text_size, text_size, 0, c_white, c_white, c_white, c_white, 1); 

// Boxes for spells
draw_sprite_stretched(spr_menu_background, 0, ui_x+175, ui_y+98, 25, 25);
draw_sprite_stretched(spr_menu_background, 0, ui_x+201, ui_y+98, 25, 25);
draw_sprite_stretched(spr_menu_background, 0, ui_x+227, ui_y+98, 25, 25);
draw_sprite_stretched(spr_menu_background, 0, ui_x+253, ui_y+98, 25, 25);
draw_sprite_stretched(spr_menu_background, 0, ui_x+279, ui_y+98, 25, 25);

// Boxes for prayers
draw_sprite_stretched(spr_menu_background, 0, ui_x+175, ui_y+140, 25, 25);
draw_sprite_stretched(spr_menu_background, 0, ui_x+201, ui_y+140, 25, 25);
draw_sprite_stretched(spr_menu_background, 0, ui_x+227, ui_y+140, 25, 25);
draw_sprite_stretched(spr_menu_background, 0, ui_x+253, ui_y+140, 25, 25);
draw_sprite_stretched(spr_menu_background, 0, ui_x+279, ui_y+140, 25, 25);

// Spell sprites
if (array_length(global.party[|selected_character]._spells) != 0) {
	for (var i = 0; i < array_length(global.party[|selected_character]._spells); i++) {
		draw_sprite(global.party[|selected_character]._spells[i]._sprite, 0, 190+(26*i), 113)
	}
}

// Prayer sprites
if (array_length(global.party[|selected_character]._prayers) != 0) {
	for (var i = 0; i < array_length(global.party[|selected_character]._spells); i++) {
		draw_sprite(global.party[|selected_character]._prayers[i]._sprite, 0, 190+(26*i), 155)
	}
}