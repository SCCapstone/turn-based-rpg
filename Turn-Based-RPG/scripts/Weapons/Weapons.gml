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

  var _item = ds_map_create();
	_item[? "_name"] = "Nothing";
	_item[? "_sprite"] = spr_nothing;
	_item[? "_attacks"] = global.attacks.nothing;
	_item[? "_type"] = damage_source.misc;
	_item[? "_description"] = "";
	global.weapons[? "_nothing"] = _item;

  var _item = ds_map_create();
	_item[? "_name"] = "Dagger";
	_item[? "_sprite"] = spr_dagger;
	_item[? "_attacks"] = [global.attacks.dagger_swipe, global.attacks.dagger_stab];
	_item[? "_type"] = damage_source.melee;
	_item[? "_description"] = "A small hunting dagger that often never leaves the side of any adventurer worth their salt. Lacking in reach and cutting depth, this dagger can move like lightning in a skilled hand.";
	global.weapons[? "_dagger"] = _item;
  
	var _item = ds_map_create();
	_item[? "_name"] = "Greatsword";
	_item[? "_sprite"] = spr_greatsword
	_item[? "_attacks"] = [global.attacks.greatsword_cleave, global.attacks.greatsword_powerstab];
	_item[? "_type"] = damage_source.melee;
	_item[? "_description"] = "A large, heavy sword requiring two hands to wield. A trade off in strength and speed compared to a normal sword, this sword is often favored by heavy soldiers for its power and braggards for its weight.";
	global.weapons[? "_greatsword"] = _item;
  
	var _item = ds_map_create();
	_item[? "_name"] = "Halberd";
	_item[? "_sprite"] = spr_halberd;
	_item[? "_attacks"] = [global.attacks.halberd_chop, global.attacks.halberd_stab];
	_item[? "_type"] = damage_source.melee;
	_item[? "_description"] = "Another favorite by cavalry, this two handed weapon is known for its cleaving blows against more heavily armored opponents.";
	global.weapons[? "_halberd"] = _item;
  
  var _item = ds_map_create();
	_item[? "_name"] = "Spear";
	_item[? "_sprite"] = spr_spear;
	_item[? "_attacks"] = [global.attacks.spear_stab, global.attacks.spear_swipe];
	_item[? "_type"] = damage_source.melee;
	_item[? "_description"] = "A long spear favored by cavalry and foot soldiers alike for keeping the enemy at a distance. Despite its length, the shaft is sturdy enough for military use.";
	global.weapons[? "_spear"] = _item;
  
  var _item = ds_map_create();
	_item[? "_name"] = "War Hammer";
	_item[? "_sprite"] = spr_warhammer;
	_item[? "_attacks"] = global.attacks.hammer_bash;
	_item[? "_type"] = damage_source.melee;
	_item[? "_description"] = "A hefty hammer often used for construction. Requires two hands to meaningfully handle. Strikes with this are slow yet crushing.";
	global.weapons[? "_warhammer"] = _item;
  
  var _item = ds_map_create();
	_item[? "_name"] = "Battleaxe";
	_item[? "_sprite"] = spr_battleaxe;
	_item[? "_attacks"] = global.attacks.axe_chop;
	_item[? "_type"] = damage_source.melee;
	_item[? "_description"] = "A two handed heavy axe with two heads. The weapon of a more brutal fighter, its heavy heads allow for deep, powerful, if slow slashes.";
	global.weapons[? "_battleaxe"] = _item;
  
  var _item = ds_map_create();
	_item[? "_name"] = "Fangs";
	_item[? "_sprite"] = spr_nothing;
	_item[? "_attacks"] = global.attacks.bite;
	_item[? "_type"] = damage_source.melee;
	_item[? "_description"] = "";
	global.weapons[? "_fangs"] = _item;
}