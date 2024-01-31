function party_data() {
global.party =
[
	{
		_name: "Sorcerer",
		
		// Stats
		_hp: 40,
		_mp: 50,
		_speed: 8,
		_max_mp: 50,
		_max_hp: 40,
		
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
		_sprites: { idle: spr_sorcerer},
		_is_dead: false
	},
	{
		_name: "Knight",
		
		// Stats
		_hp: 60,
		_mp: 0,
		_speed: 7,
		_max_mp: 20,
		_max_hp: 60,
		
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
		_sprites: { idle: spr_knight },
		_is_dead: false
	}
]
}
