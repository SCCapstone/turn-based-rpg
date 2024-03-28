function spells(){
	global.spells = ds_map_create()
	
	var _item = ds_map_create();
	_item[? "_name"] = "Fireball"
	_item[? "_dmgtype"] = "fire";
	_item[? "_dmg_min"] = 10;
	_item[? "_dmg_max"] = 30;
	_item[? "_sound"] = snd_fireball;
	_item[? "_sprite"] = spr_fireball;
	_item[? "_mp_cost"] = 10;
	_item[? "_description"] = "Conjure up a flame and hurl it at your enemy. Deals fire damage and chance to inflict the burn status effect.";
	global.spells[? "_fireball"] = _item;
	
	var _item = ds_map_create();
	_item[? "_name"] = "Ice Spike"
	_item[? "_dmgtype"] = "ice";
	_item[? "_dmg_min"] = 10;
	_item[? "_dmg_max"] = 30;
	_item[? "_sound"] = snd_ice_spike;
	_item[? "_sprite"] = spr_ice_spike;
	_item[? "_mp_cost"] = 10;
	_item[? "_description"] = "Form a large icicle in the air and launch it towards your enemy. Deals ice damage and a chance to inflict the frozen status effect.Conjure up a flame and hurl it at your enemy. Deals fire damage and chance to inflict the burn status effect.";
	global.spells[? "_ice_spike"] = _item;
	
	var _item = ds_map_create();
	_item[? "_name"] = "Magic Knife"
	_item[? "_dmgtype"] = "magic";
	_item[? "_dmg_min"] = 10;
	_item[? "_dmg_max"] = 30;
	_item[? "_sound"] = snd_magic_knife;
	_item[? "_sprite"] = spr_magic_knife;
	_item[? "_mp_cost"] = 10;
	_item[? "_description"] = "Command a knife magical in nature and watch it fly toward your enemy. Deals slash damage.";
	global.spells[? "_magic_knife"] = _item;
}
