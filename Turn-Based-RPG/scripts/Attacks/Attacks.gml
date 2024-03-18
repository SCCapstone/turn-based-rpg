function attacks() {
global.attacks = 
{
	sword_slash: 
	{
		_name: "Slash",
		_dmgtype: "slash",
		_dmg_min: 10,
		_dmg_max: 30,
		_sound: snd_sword_slash
	},
	sword_stab:
	{
		_name: "Stab",
		_dmgtype: "pierce",
		_dmg_min: 10,
		_dmg_max: 30,
		_sound: snd_sword_stab
	},
	scythe_slash:
	{
		_name: "Slash",
		_dmgtype: "slash",
		_dmg_min: 15,
		_dmg_max: 35,
		_sound: snd_scythe_slash
	},
	bow_shoot:
	{
		_name: "Single shot",
		_dmgtype: "pierce",
		_dmg_min: 15,
		_dmg_max: 25,
		_sound: snd_bow_shoot
	},
	fireball:
	{
		_name: "Fireball",
		_dmgtype: "magic",
		_dmg_min: 25,
		_dmg_max: 35,
		_sound: snd_fireball
	},
	nothing:
	{
		_name: "nothing",
		_dmgtype: "nothing",
		_dmg_min: 0,
		_dmg_max: 0,
		_sound: snd_nothing
	}
}
}
