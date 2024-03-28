function magic_weapons(){
	global.magic_weapons = ds_map_create();
	
	var _item = ds_map_create();
	_item[? "_name"] = "Staff";
	_item[? "_sprite"] = spr_staff;
	_item[? "_description"] = "A basic staff, often a mage’s first. Natural materials and a surprising amount of care in its construction have made this staff reliable for channeling magic.";
	// TODO _dmg_multiplier
	global.magic_weapons[? "_staff"] = _item;
}
