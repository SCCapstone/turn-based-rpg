function weapons(){
global.weapons =
{
	sword: 
	{
		_name: "Sword",
		_sprite: spr_sword,
		_attacks: [global.attacks.sword_slash, global.attacks.sword_stab]
	},
	scythe:
	{
		_name: "Scythe",
		_sprite: spr_scythe,
		_attacks: [global.attacks.scythe_slash]
	},
	bow:
	{
		_name: "Bow",
		_sprite: spr_bow,
		_attacks: [global.attacks.bow_shoot]
	}
}
}