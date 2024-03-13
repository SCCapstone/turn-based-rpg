function weapons_map(){
	global.weapons  = ds_map_create();
	
	// creating sword
	var _item = ds_map_create();
	ds_map_add(_item, "_name", "Sword");
	ds_map_add(_item, "_sprite", spr_sword);
	ds_map_add(_item, "_attacks", [global.attacks.sword_slash, global.attacks.sword_stab]);
	ds_map_add(_item, "_type", damage_source.melee);
	ds_map_add(_item, "_description", "Slashing. A medium weight sword commonly used by guards and bandits alike. Unremarkable in construction but readily available even in the smallest villages. Great for hunting.");
	// adds sword to weapons
	ds_map_add(global.weapons, "Sword", _item);
	
	// creating sycthe
	var _item = ds_map_create();
	ds_map_add(_item, "_name", "Scythe");
	ds_map_add(_item, "_sprite", spr_scythe);
	ds_map_add(_item, "_attacks", [global.attacks.scythe_slash]);
	ds_map_add(_item, "_type", damage_source.melee);
	ds_map_add(_item, "_description", "Slashing. The player’s starting weapon. A scythe handed down in a family for farming. Has seen better days but its wear is testament to its build.");
	// adds scythe to weapons
	ds_map_add(global.weapons, "Scythe", _item);
	
	// creating bow
	var _item = ds_map_create();
	ds_map_add(_item, "_name", "Bow");
	ds_map_add(_item, "_sprite", spr_bow);
	ds_map_add(_item, "_attacks", [global.attacks.bow_shoot]);
	ds_map_add(_item, "_type", damage_source.melee);
	ds_map_add(_item, "_description", "Piercing. A sturdy bow used for hunting game. A touch more difficult to use than standard melee weapons, a skilled ranger or huntsman can make this into a precise, deadly tool.");
	// adds bow to weapons
	ds_map_add(global.weapons, "Bow", _item);
}