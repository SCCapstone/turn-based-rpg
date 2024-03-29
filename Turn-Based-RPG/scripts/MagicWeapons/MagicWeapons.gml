function magic_weapons(){
global.magic_weapons =
	{
		staff: 
		{
			_name: "Mystic Staff",
			_dmg_multiplier: 1.25,
			_sprite: spr_staff,
			_description: "A basic staff, often a mage’s first. Natural materials and a surprising amount of care in its construction have made this staff reliable for channeling magic.",
			_item_type: item_type.magic_weapon
		},
		amulet: 
		{
			_name: "Emerald Amulet",
			_dmg_multiplier: 1.15,
			_sprite: spr_amulet,
			_description: "A mystical amulet which imbues its wearer with a supernatural affinity for spellcasting.",
			_item_type: item_type.magic_weapon
		}
	}
}
