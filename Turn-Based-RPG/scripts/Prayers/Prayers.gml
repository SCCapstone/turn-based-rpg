function prayers(){
	global.prayers = ds_map_create();
	
	var _item = ds_map_create();
	_item[? "_name"] = "Chill";
	_item[? "effects"] = global.status_effects.frosty;
	_item[? "_sprite"] = spr_frozen;
	_item[? "_sound"] = snd_chill;
	_item[? "_targets_friendly"] = false;
	_item[? "_txt"] = "";
	_item[? "_description"] = "A prayer that freezes the target in place for multiple turns leaving them unable to act.";
	global.prayers[? "_chill"] = _item;
	
	var _item = ds_map_create();
	_item[? "_name"] = "Scorch";
	_item[? "effects"] = global.status_effects.burn;
	_item[? "_sprite"] = spr_burn;
	_item[? "_sound"] = snd_burn;
	_item[? "_targets_friendly"] = false;
	_item[? "_txt"] = "";
	_item[? "_description"] = "A prayer that burns the target, causing them to take damage after each turn.";
	global.prayers[? "_scorch"] = _item;
	
	var _item = ds_map_create();
	_item[? "_name"] = "Poison";
	_item[? "effects"] = global.status_effects.poison;
	_item[? "_sprite"] = spr_poison;
	_item[? "_sound"] = snd_poison;
	_item[? "_targets_friendly"] = false;
	_item[? "_txt"] = "";
	_item[? "_description"] = "A prayer that creates a poison cloud around the opponent, poisoning them and causing steadily increasing damage after every turn.";
	global.prayers[? "_poison"] = _item;
	
	var _item = ds_map_create();
	_item[? "_name"] = "Stun";
	_item[? "effects"] = global.status_effects.shock;
	_item[? "_sprite"] = spr_stun;
	_item[? "_sound"] = snd_stun;
	_item[? "_targets_friendly"] = false;
	_item[? "_txt"] = "";
	_item[? "_description"] = "";
	global.prayers[? "_stun"] = _item;
	
	var _item = ds_map_create();
	_item[? "_name"] = "Heal";
	_item[? "effects"] = global.status_effects.heal;
	_item[? "_sprite"] = spr_heal;
	_item[? "_sound"] = snd_heal;
	_item[? "_targets_friendly"] = true;
	_item[? "_txt"] = "";
	_item[? "_description"] = "A basic healing prayer. Used to target an ally or yourself to regain a set amount of health.";
	global.prayers[? "heal"] = _item;
	
	var _item = ds_map_create();
	_item[? "_name"] = "Attack Up";
	_item[? "effects"] = global.status_effects.attack_up;
	_item[? "_sprite"] = spr_attack_up;
	_item[? "_sound"] = snd_powerup;
	_item[? "_targets_friendly"] = true;
	_item[? "_txt"] = "";
	_item[? "_description"] = "Envelope yourself or an ally with invigorating power. Causes target to deal more damage.";
	global.prayers[? "_attack_up"] = _item;
	
	var _item = ds_map_create();
	_item[? "_name"] = "Defense Up";
	_item[? "effects"] = global.status_effects.defense_up;
	_item[? "_sprite"] = spr_defense_up;
	_item[? "_sound"] = snd_powerup;
	_item[? "_targets_friendly"] = true;
	_item[? "_txt"] = "";
	_item[? "_description"] = "Envelope yourself or an ally with a defensive aura. Decreases damage taken for the target.";
	global.prayers[? "_defense_up"] = _item;
}