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
		_attacks: [global.attacks.bow_shoot],
		
		// Equipment
		// _weapon TODO
		_armor_head: global.armor.steel_kettle_hat,
		_armor_chest: global.armor.leather_gambeson,
		_armor_legs: global.armor.leather_boots,
		
		// Misc
		_sprites: { idle: spr_archer },
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
		_attacks: [global.attacks.sword_slash],
		
		// Equipment
		// _weapon TODO
		_armor_head: global.armor.knightly_plumed_helmet,
		_armor_chest: global.armor.steel_plate_armor,
		_armor_legs: global.armor.steel_plate_greaves,
		
		// Misc
		_sprites: { idle: spr_knight },
		_is_dead: false
	}
}
}