global.enemies = 
{
	archer: 
	{
		_name: "Archer",
		_hp: 60,
		_mp: 20,
		_speed: 5,
		_max_hp: 60,
		_max_mp: 20,
		_is_dead: false,
		_attacks: [global.attacks.bow_shoot],
		_sprites: { idle: spr_archer_still }
	}
}