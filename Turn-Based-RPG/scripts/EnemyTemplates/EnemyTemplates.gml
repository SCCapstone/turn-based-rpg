function enemy_templates() {
effects = ds_list_create();
effects2 = ds_list_create();
global.enemies = 
{
	dark_wizard:
	{
		_name: "Dark Wizard",
		
		// Stats
		_hp: 5,		// Current HP
		_mp: 100,		// Current MP

		_max_hp: 5,    // Health
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
		_is_dead: false,
		_xp_val: 50,
		
		// Loot
		_loot_table: [[global.consumables.mana_potion, 40], [global.magic_weapons.staff, 20]],
		_gold_range: [0, 75]
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
		_sprites: {idle: spr_knight},
		_is_dead: false,
		_xp_val: 65,
		
		// Loot
		_loot_table: [[global.consumables.health_potion, 60], [global.weapons.sword, 20],
		[global.weapons.scythe, 10], [global.weapons.greatsword, 5]],
		_gold_range: [0, 75]
	},
	mercenary:
	{
		_name: "Mercenary Archer",
		
		//Stats
		_hp: 5,
		_mp: 0,

		_max_hp: 5,    // Health
		_max_mp: 0,     // Mana
		_spd: 6,		// Speed
		_str: 0,		// Strength
		_dex: 10,		// Dexterity
		_int: 0,        // Intelligence
		_agi: 15,		// Agility
		
		// Movesets
		_spells: [],
		_prayers: [global.prayers.heal],
		
		// Equipment
		_weapon: global.weapons.bow,
		_magic_weapon: noone,
		_prayer_book: noone,
		
		_armor_head: global.armor.steel_kettle_hat,
		_armor_chest: global.armor.leather_gambeson,
		_armor_legs: global.armor.leather_boots,
		
		// Misc
		_sprites: { idle: spr_archer },
		_is_dead: false,
		_xp_val: 40,
		
		// Loot
		_loot_table: [[global.consumables.antidote, 30], [global.weapons.bow, 25]],
		_gold_range: [0, 75]
	},
	bandit:
	{
		_name: "Bandit",
		
		// Stats
		_hp: 60,		// Current HP
		_mp: 0,		// Current MP

		_max_hp: 60,    // Health
		_max_mp: 0,    // Mana
		_spd: 7,		// Speed
		_str: 8,		// Strength
		_dex: 8,		// Dexterity
		_int: 0,        // Intelligence
		_agi: 12,		// Agility

		// Movesets
		_spells: [],
		_prayers: [],
		
		// Equipment
		_weapon: global.weapons.scythe,
		_magic_weapon: noone,
		_prayer_book: noone,
		
		_armor_head: global.armor.mage_hood,
		_armor_chest: global.armor.mage_robes,
		_armor_legs: global.armor.leather_boots,
		
		// Misc
		_sprites: {idle: spr_bandit},
		_is_dead: false,
		_xp_val: 50,
		
		// Loot
		_loot_table: [[global.consumables.hot_tea, 35], [global.weapons.dagger, 20]],
		_gold_range: [0, 50]
	},
	scarecrow:
	{
		_name: "Scarecrow",
		
		// Stats
		_hp: 300,		// Current HP
		_mp: 0,		// Current MP

		_max_hp: 60,    // Health
		_max_mp: 0,    // Mana
		_spd: 7,		// Speed
		_str: 0,		// Strength
		_dex: 0,		// Dexterity
		_int: 0,        // Intelligence
		_agi: 12,		// Agility

		// Movesets
		_spells: [],
		_prayers: [],
		
		// Equipment
		_weapon: global.weapons.nothing,
		_magic_weapon: noone,
		_prayer_book: noone,
		
		_armor_head: global.armor.mage_hood,
		_armor_chest: global.armor.mage_robes,
		_armor_legs: global.armor.leather_boots,
		
		// Misc
		_sprites: {idle: spr_scarecrow},
		_is_dead: false,
		_xp_val: 50,
		
		// Loot
		_loot_table: [],
		_gold_range: [0, 10]
	},
	wolf:
	{
		_name: "Wolf",
		
		// Stats
		_hp: 40,		// Current HP
		_mp: 0,		// Current MP

		_max_hp: 40,    // Health
		_max_mp: 0,    // Mana
		_spd: 12,		// Speed
		_str: 5,		// Strength
		_dex: 5,		// Dexterity
		_int: 0,        // Intelligence
		_agi: 15,		// Agility

		// Movesets
		_spells: [],
		_prayers: [],
		
		// Equipment
		_weapon: global.weapons.fangs,
		_magic_weapon: noone,
		_prayer_book: noone,
		
		_armor_head: global.armor.mage_hood,
		_armor_chest: global.armor.mage_robes,
		_armor_legs: global.armor.leather_boots,
		
		// Misc
		_sprites: {idle: spr_wolf},
		_is_dead: false,
		_xp_val: 50,
		
		// Loot
		_loot_table: [[global.consumables.ointment, 25]],
		_gold_range: [0, 25]
	},
}
}
