function status_effects(){
global.status_effects =
	{
	frosty:
	{
		_name: "Freeze",
		_dmgtype: "ice",
		_duration_min: 2,
		_duration_max: 3,
		_dmg_min: 0,
		_dmg_max: 0,
		_sprite: spr_frozen,
		_txt_color: c_aqua,
		_duration: 0,
		_txt: ""
	},
	burn:
	{
		_name: "Burn",
		_dmgtype: "fire",
		_duration_min: 2,
		_duration_max: 2,
		_dmg_min: 12,
		_dmg_max: 17,
		_sprite: spr_burn,
		_txt_color: c_orange,
		_duration: 0,
		_txt: ""
	},
	poison:
	{
		_name: "Poison",
		_dmgtype: "poison",
		_duration_min: 3,
		_duration_max: 4,
		_dmg_min: 7,
		_dmg_max: 11,
		_sprite: spr_poison,
		_txt_color: c_green,
		_duration: 0,
		_txt: ""
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
		_duration: 0,
		_txt: ""
	},
	heal:
	{
		_name: "Heal",
		_dmgtype: "nothing",
		_duration_min: 1,
		_duration_max: 1,
		_dmg_min: -50,
		_dmg_max: -50,
		_sprite: spr_heal,
		_txt_color: c_white,
		_duration: 0,
		_txt: ""
	},
	attack_up:
	{
		_name: "Attack Up",
		_dmgtype: "nothing",
		_duration_min: 3,
		_duration_max: 4,
		_dmg_min: 0,
		_dmg_max: 0,
		_sprite: spr_attack_up,
		_txt_color: c_white,
		_duration: 0,
		_txt: "+ATK!"
	},
	defense_up:
	{
		_name: "Defense Up",
		_dmgtype: "nothing",
		_duration_min: 3,
		_duration_max: 4,
		_dmg_min: 0,
		_dmg_max: 0,
		_sprite: spr_defense_up,
		_txt_color: c_white,
		_duration: 0,
		_txt: "+DEF!"
	},
}
}
