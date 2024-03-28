function status_effects(){
global.status_effects =
	{
	frosty:
	{
		_name: "Freeze",
		_dmgtype: "ice",
		_duration_min: 2,
		_duration_max: 4,
		_dmg_min: 5,
		_dmg_max: 9,
		_sprite: spr_frozen,
		_txt_color: c_aqua,
		_duration: 0
	},
	burn:
	{
		_name: "Burn",
		_dmgtype: "fire",
		_duration_min: 1,
		_duration_max: 2,
		_dmg_min: 7,
		_dmg_max: 11,
		_sprite: spr_burn,
		_txt_color: c_orange,
		_duration: 0
	},
	poison:
	{
		_name: "Poison",
		_dmgtype: "poison",
		_duration_min: 1,
		_duration_max: 2,
		_dmg_min: 7,
		_dmg_max: 11,
		_sprite: spr_poison,
		_txt_color: c_green,
		_duration: 0
	},
	shock:
	{
		_name: "Shock",
		_dmgtype: "lightning",
		_duration_min: 1,
		_duration_max: 2,
		_dmg_min: 7,
		_dmg_max: 11,
		_sprite: spr_stun,
		_txt_color: c_yellow,
		_duration: 0
	}
}
}
