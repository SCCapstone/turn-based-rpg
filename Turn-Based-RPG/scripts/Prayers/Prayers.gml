function prayers(){
global.prayers = {
	chill:
	{
		_name: "Chill",
		_effects: [global.status_effects.frosty],	
		_sprite: spr_frozen,
		_sound: snd_chill,
		_targets_friendly: false,
		_txt: "",
		_description: "A prayer that freezes the target in place for multiple turns leaving them unable to act.",
		_item_type: item_type.prayer
	},
	scorch:
	{
		_name: "Scorch",
		_effects: [global.status_effects.burn],	
		_sprite: spr_burn,
		_sound: snd_burn,
		_targets_friendly: false,
		_txt: "",
		_description: "A prayer that burns the target, causing them to take damage after each turn.",
		_item_type: item_type.prayer
	},
	poison:
	{
		_name: "Poison",
		_effects: [global.status_effects.poison],	
		_sprite: spr_poison,
		_sound: snd_poison,
		_targets_friendly: false,
		_txt: "",
		_description: "A prayer that creates a poison cloud around the opponent, poisoning them and causing steadily increasing damage after every turn.",
		_item_type: item_type.prayer
	},
	stun:
	{
		_name: "Stun",
		_effects: [global.status_effects.shock],	
		_sprite: spr_stun,
		_sound: snd_stun,
		_targets_friendly: false,
		_txt: "",
		_description: "A prayer that makes the target very likely to miss their next attack.",
		_item_type: item_type.prayer
	},
	heal:
	{
		_name: "Heal",
		_effects: [global.status_effects.heal],	
		_sprite: spr_heal,
		_sound: snd_heal,
		_targets_friendly: true,
		_txt: "",
		_description: "A basic healing prayer. Used to target an ally or yourself to regain a set amount of health.",
		_item_type: item_type.prayer
	},
	attack_up:
	{
		_name: "Attack Up",
		_effects: [global.status_effects.attack_up],	
		_sprite: spr_attack_up,
		_sound: snd_powerup,
		_targets_friendly: true,
		_txt: "+STR!",
		_description: "Envelope yourself or an ally with invigorating power. Causes target to deal more damage",
		_item_type: item_type.prayer
	},
	defense_up:
	{
		_name: "Defense Up",
		_effects: [global.status_effects.defense_up],	
		_sprite: spr_defense_up,
		_sound: snd_powerup,
		_targets_friendly: true,
		_description: "Envelope yourself or an ally with a defensive aura. Decreases damage taken for the target.",
		_item_type: item_type.prayer
	}
}
}
