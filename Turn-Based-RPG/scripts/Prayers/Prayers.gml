function prayers(){
global.prayers = {
	chill:
	{
		_name: "Chill",
		_effects: [global.status_effects.frosty],	
		_sprite: spr_frozen,
		_sound: snd_chill,
		_targets_friendly: false,
		_txt: ""
	},
	scorch:
	{
		_name: "Scorch",
		_effects: [global.status_effects.burn],	
		_sprite: spr_burn,
		_sound: snd_burn,
		_targets_friendly: false,
		_txt: ""
	},
	poison:
	{
		_name: "Poison",
		_effects: [global.status_effects.poison],	
		_sprite: spr_poison,
		_sound: snd_poison,
		_targets_friendly: false,
		_txt: ""
	},
	stun:
	{
		_name: "Stun",
		_effects: [global.status_effects.shock],	
		_sprite: spr_stun,
		_sound: snd_stun,
		_targets_friendly: false,
		_txt: ""
	},
	heal:
	{
		_name: "Heal",
		_effects: [global.status_effects.heal],	
		_sprite: spr_heal,
		_sound: snd_heal,
		_targets_friendly: true,
		_txt: ""
	},
	attack_up:
	{
		_name: "Attack Up",
		_effects: [global.status_effects.attack_up],	
		_sprite: spr_attack_up,
		_sound: snd_powerup,
		_targets_friendly: true,
		_txt: "+STR!"
	},
	defense_up:
	{
		_name: "Defense Up",
		_effects: [global.status_effects.defense_up],	
		_sprite: spr_defense_up,
		_sound: snd_powerup,
		_targets_friendly: true,
	}
}
}
