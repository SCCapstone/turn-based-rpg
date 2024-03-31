// This script contains all persistent information regarding 
// members of the player party, including stats, health, mp, etc.
function party_data() {
global.party = ds_list_create();
effects = ds_list_create();
knight =
	{
		_name: "Knight",
		
		// Stats
		_hp: 300,		// Current HP
		_mp: 100,		// Current MP
		
		_lvl: 1,		// Level
		_xp: 0,			// Experience/XP
		_max_xp: 100,	// Max XP

	    _max_hp: 300,    // Health
		_max_mp: 100,     // Mana
		_spd: 9,		// Speed
		_str: 10,		// Strength
		_dex: 5,		// Dexterity
		_int: 0,        // Intelligence
		_agi: 8,		// Agility
		_fai: 3,		// Faith
		  
		// Movesets
		_spells: [global.spells.magic_knife],
		_prayers: [global.prayers.chill, global.prayers.poison],
		
		// Equipment
		_weapon: global.weapons.greatsword,
		_magic_weapon: noone,
		_prayer_book: global.prayer_books.scroll,
		
		_armor_head: global.armor.knightly_plumed_helmet,
		_armor_chest: global.armor.steel_plate_armor,
		_armor_legs: global.armor.steel_plate_greaves,
			
		// Misc
		_sprites: {idle: spr_knight},
		_is_dead: false,
	}
	ds_list_add(global.party, knight);
cleric =
	{
		_name: "Cleric",
		
		// Stats
		_hp: 150,		// Current HP
		_mp: 200,		// Current MP
		
		_lvl: 1,		// Level
		_xp: 0,			// Experience/XP
		_max_xp: 100,	// Max XP

		_max_hp: 150,    // Health
		_max_mp: 200,    // Mana
		_spd: 8,		// Speed
		_str: 0,		// Strength
		_dex: 0,		// Dexterity
		_int: 15,        // Intelligence
		_agi: 11,		// Agility
		_fai: 10,

		// Movesets
		_spells: [global.spells.fireball, global.spells.ice_spike],
		_prayers: [global.prayers.heal, global.prayers.defense_up, global.prayers.attack_up],
		
		// Equipment
		_weapon: global.weapons.warhammer,
		_magic_weapon: global.magic_weapons.amulet,
		_prayer_book: global.prayer_books.book,
		
		_armor_head: global.armor.mage_hood,
		_armor_chest: global.armor.mage_robes,
		_armor_legs: global.armor.leather_boots,
			
		// Misc
		_sprites: {idle: spr_cleric},
		_is_dead: false,
	}
	ds_list_add(global.party, cleric);
}
