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
	},
	dagger:
	{
		_name: "Dagger",
		_sprite: spr_dagger,
		_attacks: [global.attacks.dagger_swipe, global.attacks.dagger_stab],
		_type: damage_source.melee
	},
	greatsword:
	{
		_name: "Greatsword",
		_sprite: spr_greatsword,
		_attacks: [global.attacks.greatsword_cleave, global.attacks.greatsword_powerstab],
		_type: damage_source.melee
	},
	halberd:
	{
		_name: "Halberd",
		_sprite: spr_halberd,
		_attacks: [global.attacks.halberd_chop, global.attacks.halberd_stab],
		_type: damage_source.melee
	},
	spear:
	{
		_name: "Spear",
		_sprite: spr_spear,
		_attacks: [global.attacks.spear_stab, global.attacks.spear_swipe],
		_type: damage_source.melee
	},
	warhammer:
	{
		_name: "War Hammer",
		_sprite: spr_warhammer,
		_attacks: [global.attacks.hammer_bash],
		_type: damage_source.melee
	},
	battleaxe:
	{
		_name: "Battleaxe",
		_sprite: spr_battleaxe,
		_attacks: [global.attacks.axe_chop],
		_type: damage_source.melee
	},
}
}
