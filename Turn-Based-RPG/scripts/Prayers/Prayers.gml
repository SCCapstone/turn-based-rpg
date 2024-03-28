function prayers(){
global.prayers = {
	chill:
	{
		_name: "Chill",
		_effects: [global.status_effects.frosty],
		_sprite: spr_frozen,
		_sound: snd_chill
	},
	scorch:
	{
		_name: "Scorch",
		_effects: [global.status_effects.burn],
		_sprite: spr_burn,
		_sound: snd_fireball
	},
	poison:
	{
		_name: "Poison",
		_effects: [global.status_effects.poison],
		_sprite: spr_poison,
		_sound: snd_fireball
	},
	zap:
	{
		_name: "Zap",
		_effects: [global.status_effects.shock],
		_sprite: spr_stun,
		_sound: snd_fireball
	}
}
}
