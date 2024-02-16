// This script contains all persistent information regarding 
// members of the player party, including stats, health, mp, etc.
function party_data() {
global.party =
[
	{
		_name: "Sorcerer",
		
		// Stats
		_hp: 50,		// Current HP
		_mp: 50,		// Current MP
		
		_lvl: 1,		// Level
		_xp: 0,			// Experience/XP
		_max_xp: 100,	// Max XP

		_max_hp: 50,    // Health
		_max_mp: 50,    // Mana
		_spd: 8,		// Speed
		_str: 0,		// Strength
		_dex: 0,		// Dexterity
		_int: 0,        // Intelligence
		_agi: 0,		// Agility

		// Movesets
		_attacks: [global.attacks.fireball],
		
		// Equipment
		// _weapon TODO
		_armor_head: global.armor.knightly_plumed_helmet,
		_armor_chest: global.armor.steel_plate_armor,
		_armor_legs: global.armor.steel_plate_greaves,
		
		// Inventory 
		// TODO
			
		// Misc
		_sprites: {idle: spr_sorcerer},
		_is_dead: false,
		_is_player: false  // TODO
	},
	{
		_name: "Knight",
		
		// Stats
		_hp: 70,		// Current HP
		_mp: 20,		// Current MP
		
		_lvl: 1,		// Level
		_xp: 0,			// Experience/XP
		_max_xp: 100,	// Max XP

		_max_hp: 70,    // Health
		_max_mp: 20,    // Mana
		_spd: 7,		// Speed
		_str: 0,		// Strength
		_dex: 0,		// Dexterity
		_int: 0,        // Intelligence
		_agi: 0,		// Agility
		
		// Movesets
		_attacks: [global.attacks.scythe_slash],
		
		// Equipment
		// _weapon TODO
		_armor_head: global.armor.knightly_plumed_helmet,
		_armor_chest: global.armor.steel_plate_armor,
		_armor_legs: global.armor.steel_plate_greaves,
		
		// Inventory 
		// TODO
			
		// Misc
		_sprites: {idle: spr_knight},
		_is_dead: false,
		_is_player: true  // TODO
	}
]
}
