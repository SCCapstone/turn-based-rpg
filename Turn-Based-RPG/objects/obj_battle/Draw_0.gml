// Draw event

draw_set_font(fnt_pixeloid);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_sprite(battle_background,0,x,y){depth = 10}; // Draw background

draw_sprite_stretched(spr_menu_background,0,x+global.ui_x_buffer,y+global.ui_y_buffer,230,60); // Draw UI background



