function weapons(){
	global.weapons  = ds_map_create();
	
	// creating sword
	var _item = ds_map_create();
	_item[? "_name"] = "Sword";
	_item[?"_sprite"] = spr_sword;
	_item[? "_attacks"] = [global.attacks.sword_slash, global.attacks.sword_stab];
	_item[? "_type"] = damage_source.melee;
	_item[? "_description"] = "Slashing. A medium weight sword commonly used by guards and bandits alike. Unremarkable in construction but readily available even in the smallest villages. Great for hunting.";
	// adds sword to weapons
	global.weapons[? "_sword"] = _item;
	
	// creating sycthe
	var _item = ds_map_create();
	_item[? "_name"] = "Scythe";
	_item[? "_sprite"] = spr_scythe;
	_item[? "_attacks"] = global.attacks.scythe_slash;
	_item[?"_type"] = damage_source.melee;
	_item[? "_description"] = "Slashing. The player’s starting weapon. A scythe handed down in a family for farming. Has seen better days but its wear is testament to its build.";
	// adds scythe to weapons
	global.weapons[? "_scythe"] = _item;
	
	// creating bow
	var _item = ds_map_create();
	_item[? "_name"] = "Bow";
	_item[? "_sprite"] = spr_bow;
	_item[? "_attacks"] = global.attacks.bow_shoot;
	_item[? "_type"] = damage_source.ranged;
	_item[? "_description"] = "Piercing. A sturdy bow used for hunting game. A touch more difficult to use than standard melee weapons, a skilled ranger or huntsman can make this into a precise, deadly tool.";
	// adds bow to weapons
	global.weapons[? "_bow"] = _item;
}

