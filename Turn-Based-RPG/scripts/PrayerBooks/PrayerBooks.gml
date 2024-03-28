function prayer_books() {
	global.prayer_books = ds_map_create();
	
	// TO-DO: make useable
	var _item = ds_map_create();
	_item[? "_name"] = "Prayer Scroll";
	_item[? "_sprite"] = spr_prayer_slip;
	_item[? "description"] = "";
	global.prayer_books[? "_scroll"] = _item; 
}