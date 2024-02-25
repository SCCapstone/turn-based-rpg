// This script contains all persistent information regarding 
// members of the player party, including stats, health, mp, etc.
function party_data() {
global.party =
[
	{
		_name: "Sorcerer",
		
		// Stats
		_hp: 10,		// Current HP
		_mp: 50,		// Current MP
		
		_lvl: 1,		// Level
		_xp: 0,			// Experience/XP
		_max_xp: 100,	// Max XP

		_max_hp: 150,    // Health
		_max_mp: 100,    // Mana
		_spd: 10,		// Speed
		_str: 0,		// Strength
		_dex: 0,		// Dexterity
		_int: 15,        // Intelligence
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
	},
	{
		_name: "Knight",
		
		// Stats
		_hp: 220,		// Current HP
		_mp: 0,		// Current MP
		
		_lvl: 1,		// Level
		_xp: 0,			// Experience/XP
		_max_xp: 100,	// Max XP

		_max_hp: 220,    // Health
		_max_mp: 0,     // Mana
		_spd: 9,		// Speed
		_str: 10,		// Strength
		_dex: 5,		// Dexterity
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
	}
]
}
