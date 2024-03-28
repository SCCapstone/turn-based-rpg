function prayer_books() {
	global.prayer_books = ds_map_create();
	
	var _item = ds_map_create();
	_item[? "_name"] = "Prayer Scroll";
	_item[? "_sprite"] = spr_prayer_slip;
  _item[? "_luck"] = 25;
	_item[? "description"] = "A small slip with holy prayers written on it used to heal curses.";
	global.prayer_books[? "_prayer_scroll"] = _item; 
  
  var _item = ds_map_create();
	_item[? "_name"] = "Holy Book";
	_item[? "_sprite"] = spr_prayer_book;
  _item[? "_luck"] = 50;
	_item[? "description"] = "";
	global.prayer_books[? "_holy_book"] = _item; 
}