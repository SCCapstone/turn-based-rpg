function party_data() {
global.party =
[
	{
		_name: "Knight 1",
		
		// Stats
		_hp: 60,
		_mp: 20,
		_speed: 8,
		_max_mp: 20,
		_max_hp: 60,
		
		// Movesets
		_attacks: [global.attacks.sword_slash],
		
		// Equipment
		// _weapon TODO
		_armor_head: global.armor.knightly_plumed_helmet,
		_armor_chest: global.armor.steel_plate_armor,
		_armor_legs: global.armor.steel_plate_greaves,
		
		// Inventory 
		// TODO
			
		// Misc
		_sprites: { idle: spr_knight},
		_is_dead: false
	},
	{
		_name: "Knight 2",
		
		// Stats
		_hp: 60,
		_mp: 20,
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
