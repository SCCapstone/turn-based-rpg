function magic_weapons(){
	global.magic_weapons = ds_map_create();
	
	var _item = ds_map_create();
	_item[? "_name"] = "Staff";
	_item[? "_sprite"] = spr_staff;
  _item[? "_dmg_multiplier"] = 1.25;
	_item[? "_description"] = "A basic staff, often a mage’s first. Natural materials and a surprising amount of care in its construction have made this staff reliable for channeling magic.";
	global.magic_weapons[? "_staff"] = _item;
  
  var _item = ds_map_create();
	_item[? "_name"] = "Emerald Amulet";
	_item[? "_sprite"] = spr_amulet;
  _item[? "_dmg_multiplier"] = 1.15;
	_item[? "_description"] = "";
	global.magic_weapons[? "_emerald_amulet"] = _item;
  }