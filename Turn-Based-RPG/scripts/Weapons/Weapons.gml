function weapons(){
global.weapons =
{
	sword: 
	{
		_name: "Sword",
		_sprite: spr_sword,
		_attacks: [global.attacks.sword_slash, global.attacks.sword_stab],
		_type: damage_source.melee
	},
	scythe:
	{
		_name: "Scythe",
		_sprite: spr_scythe,
		_attacks: [global.attacks.scythe_slash],
		_type: damage_source.melee
	},
	bow:
	{
		_name: "Bow",
		_sprite: spr_bow,
		_attacks: [global.attacks.bow_shoot],
		_type: damage_source.ranged
	},
	nothing:
	{
		_name: "Nothing",
		_sprite: spr_nothing,
		_attacks: [global.attacks.nothing],
		_type: damage_source.misc
	}
}
}
