function enemy_templates() {
global.enemies = 
{
	dark_wizard:
	{
		_name: "Dark Wizard",
		
		// Stats
		_hp: 60,		// Current HP
		_mp: 100,		// Current MP

		_max_hp: 60,    // Health
		_max_mp: 100,    // Mana
		_spd: 7,		// Speed
		_str: 0,		// Strength
		_dex: 0,		// Dexterity
		_int: 12,        // Intelligence
		_agi: 10,		// Agility

		// Movesets
		_spells: [global.spells.fireball],
		_prayers: [global.prayers.chill],
		
		// Equipment
		_weapon: noone,
		_magic_weapon: global.magic_weapons.staff,
		_prayer_book: global.prayer_books.scroll,
		
		_armor_head: global.armor.mage_hood,
		_armor_chest: global.armor.mage_robes,
		_armor_legs: global.armor.leather_boots,
			
		// Misc
		_sprites: {idle: spr_sorcerer},
		_effects: [],
		_effects_remaining_turns: [],
		_is_dead: false,
		_xp_val: 50
	},
	dark_knight:
	{
		_name: "Dark Knight",
		
		// Stats
		_hp: 90,		// Current HP
		_mp: 0,		// Current MP

		_max_hp: 90,    // Health
		_max_mp: 0,     // Mana
		_spd: 6,		// Speed
		_str: 10,		// Strength
		_dex: 0,		// Dexterity
		_int: 0,        // Intelligence
		_agi: 5,		// Agility
		
		// Movesets
		_spells: [],
		_prayers: [global.prayers.chill],
		
		// Equipment
		_weapon: global.weapons.sword,
		_magic_weapon: noone,
		_prayer_book: global.prayer_books.scroll,
		
		_armor_head: global.armor.knightly_plumed_helmet,
		_armor_chest: global.armor.steel_plate_armor,
		_armor_legs: global.armor.steel_plate_greaves,
			
		// Misc
		_sprites: {idle: spr_knight_og},
		_effects: [],
		_effects_remaining_turns: [],
		_is_dead: false,
		_xp_val: 65
	},
	mercenary:
	{
		_name: "Mercenary Archer",
		
		//Stats
		_hp: 75,
		_mp: 0,

		_max_hp: 75,    // Health
		_max_mp: 0,     // Mana
		_spd: 6,		// Speed
		_str: 0,		// Strength
		_dex: 10,		// Dexterity
		_int: 0,        // Intelligence
		_agi: 15,		// Agility
		
		// Movesets
		_spells: [],
		_prayers: [],
		
		// Equipment
		_weapon: global.weapons.bow,
		_magic_weapon: noone,
		_prayer_book: noone,
		
		_armor_head: global.armor.steel_kettle_hat,
		_armor_chest: global.armor.leather_gambeson,
		_armor_legs: global.armor.leather_boots,
		
		// Misc
		_sprites: { idle: spr_archer },
		_effects: [],
		_effects_remaining_turns: [],
		_is_dead: false,
		_xp_val: 40
	},
}
}
