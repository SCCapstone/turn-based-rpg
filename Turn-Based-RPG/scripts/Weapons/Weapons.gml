function weapons(){
global.weapons =
{
	sword: 
	{
		_name: "Sword",
		_sprite: spr_sword,
		_attacks: [global.attacks.sword_slash, global.attacks.sword_stab],
		_type: damage_source.melee,
		_description: "A medium weight sword commonly used by guards and bandits alike. Unremarkable in construction but readily available even in the smallest villages. Great for hunting.",
		_item_type: item_type.weapon
	},
	scythe:
	{
		_name: "Scythe",
		_sprite: spr_scythe,
		_attacks: [global.attacks.scythe_slash],
		_type: damage_source.melee,
		_description: "A scythe handed down in a family for farming. Has seen better days but its wear is testament to its build.",
		_item_type: item_type.weapon
	},
	bow:
	{
		_name: "Bow",
		_sprite: spr_bow,
		_attacks: [global.attacks.bow_shoot],
		_type: damage_source.ranged,
		_description: "A sturdy bow used for hunting game. A touch more difficult to use than standard melee weapons, a skilled ranger or huntsman can make this into a precise, deadly tool.",
		_item_type: item_type.weapon
	},
	nothing:
	{
		_name: "Nothing",
		_sprite: spr_nothing,
		_attacks: [global.attacks.nothing],
		_type: damage_source.misc,
		_description: "",
		_item_type: item_type.weapon
	},
	dagger:
	{
		_name: "Dagger",
		_sprite: spr_dagger,
		_attacks: [global.attacks.dagger_swipe, global.attacks.dagger_stab],
		_type: damage_source.melee,
		_description: "A small hunting dagger that often never leaves the side of any adventurer worth their salt. Lacking in reach and cutting depth, this dagger can move like lightning in a skilled hand.",
		_item_type: item_type.weapon
	},
	greatsword:
	{
		_name: "Greatsword",
		_sprite: spr_greatsword,
		_attacks: [global.attacks.greatsword_cleave, global.attacks.greatsword_powerstab],
		_type: damage_source.melee,
		_description: "A large, heavy sword requiring two hands to wield. A trade off in strength and speed compared to a normal sword, this sword is often favored by heavy soldiers for its power and braggards for its weight.",
		_item_type: item_type.weapon
	},
	halberd:
	{
		_name: "Halberd",
		_sprite: spr_halberd,
		_attacks: [global.attacks.halberd_chop, global.attacks.halberd_stab],
		_type: damage_source.melee,
		_description: "Another favorite by cavalry, this two handed weapon is known for its cleaving blows against more heavily armored opponents.",
		_item_type: item_type.weapon
	},
	spear:
	{
		_name: "Spear",
		_sprite: spr_spear,
		_attacks: [global.attacks.spear_stab, global.attacks.spear_swipe],
		_type: damage_source.melee,
		_description: "A long spear favored by cavalry and foot soldiers alike for keeping the enemy at a distance. Despite its length, the shaft is sturdy enough for military use.",
		_item_type: item_type.weapon
	},
	warhammer:
	{
		_name: "War Hammer",
		_sprite: spr_warhammer,
		_attacks: [global.attacks.hammer_bash],
		_type: damage_source.melee,
		_description: "A hefty hammer made for bashing armor. Requires two hands to meaningfully handle. Strikes with this are slow yet crushing.",
		_item_type: item_type.weapon
	},
	battleaxe:
	{
		_name: "Battleaxe",
		_sprite: spr_battleaxe,
		_attacks: [global.attacks.axe_chop],
		_type: damage_source.melee,
		_description: "A two handed heavy axe with two heads. The weapon of a more brutal fighter, its heavy heads allow for deep, powerful, if slow slashes.",
		_item_type: item_type.weapon
	},
	fangs:
	{
		_name: "Fangs",
		_sprite: spr_nothing,
		_attacks: [global.attacks.bite],
		_type: damage_source.melee,
		_description: "This isn't supposed to go in the inventory!",
		_item_type: item_type.weapon
	}
}
}
