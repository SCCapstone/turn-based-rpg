_sprite = spr_menu_background;

draw_set_font(fnt_pixeloid);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

_shop_text = [];
_shop_speaker = []; 
_item_price = 0;
_item = global.weapons.battleaxe;
_page = 0;
_choice = 1; //choice 0 is yes, 1 is no