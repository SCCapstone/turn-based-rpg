function attacks() {
global.attacks = 
{
	sword_slash: 
	{
		_dmgtype: "slash",
		_dmg_min: 10,
		_dmg_max: 30,
		_sound: snd_sword_slash
	},
	sword_stab:
	{
		_dmgtype: "pierce",
		_dmg_min: 10,
		_dmg_max: 30,
		_sound: snd_bow_shoot
	},
	scythe_slash:
	{
		_dmgtype: "slash",
		_dmg_min: 15,
		_dmg_max: 35,
		_sound: snd_scythe_slash
	},
	bow_shoot:
	{
		_dmgtype: "pierce",
		_dmg_min: 15,
		_dmg_max: 25,
		_sound: snd_bow_shoot
	},
	fireball:
	{
		_dmgtype: "magic",
		_dmg_min: 25,
		_dmg_max: 35,
		_sound: snd_fireball
	}
}
}