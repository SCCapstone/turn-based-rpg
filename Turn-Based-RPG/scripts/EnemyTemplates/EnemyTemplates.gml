function enemy_templates() {
global.enemies = 
{
	archer: 
	{
		_name: "Archer",
		
		//Stats
		_hp: 60,
		_mp: 20,
		_spd: 6,
		_max_hp: 60,
		_max_mp: 20,
		
		// Movesets
		
		// Equipment
		_weapon: global.weapons.bow,
		
		_armor_head: global.armor.steel_kettle_hat,
		_armor_chest: global.armor.leather_gambeson,
		_armor_legs: global.armor.leather_boots,
		
		// Misc
		_sprites: { idle: spr_archer },
		_effects: [],
		_effects_remaining_turns: [],
		_is_dead: false
	}, 
	knightEnemy:
	{
		_name: "Dark Knight",
		
		// Stats
		_hp: 60,
		_mp: 20,
		_spd: 4,
		_max_mp: 20,
		_max_hp: 60,
		
		// Movesets
		
		// Equipment
		_weapon: global.weapons.sword,
		
		_armor_head: global.armor.knightly_plumed_helmet,
		_armor_chest: global.armor.steel_plate_armor,
		_armor_legs: global.armor.steel_plate_greaves,
		
		// Misc
		_sprites: { idle: spr_knight },
		_effects: [],
		_effects_remaining_turns: [],
		_is_dead: false
	}
}
}
