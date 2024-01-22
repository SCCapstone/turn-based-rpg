function attacks() {
global.attacks = 
{
	sword_slash:
	{
		_weapon: "Sword", // Weapons will eventually have structs of their own to support multiple attacks
		_dmgtype: "slash",
		_dmg_min: 10,
		_dmg_max: 30,
		_sprite: spr_sword,
		_sound: snd_sword_slash
	},
	scythe_slash:
	{
		_weapon: "Scythe",
		_dmgtype: "slash",
		_dmg_min: 15,
		_dmg_max: 35,
		_sprite: spr_scythe,
		_sound: snd_scythe_slash
	},
	bow_shoot:
	{
		_weapon: "Bow",
		_dmgtype: "pierce",
		_dmg_min: 15,
		_dmg_max: 25,
		_sprite: spr_bow,
		_sound: snd_bow_shoot
	}
}
}