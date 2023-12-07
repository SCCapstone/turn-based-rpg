global.enemies = 
{
	archer: 
	{
		_name: "Archer",
		_hp: 60,
		_mp: 20,
		_speed: 10,
		_max_hp: 60,
		_max_mp: 20,
		_is_dead: false,
		_attacks: [global.attacks.bow_shoot],
		_sprites: { idle: spr_archer_still }
	}, knightEnemy:
	{
		_name: "Dark Knight",
		_hp: 60,
		_mp: 20,
		_speed: 4,
		_max_mp: 20,
		_max_hp: 60,
		_is_dead: false,
		_attacks: [global.attacks.sword_slash],
		_sprites: { idle: spr_knight_still }
	}
}