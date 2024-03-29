function spells(){
global.spells = {
	fireball:
	{
		_name: "Fireball",
		_dmgtype: "fire",
		_dmg_min: 10,
		_dmg_max: 30,
		_sound: snd_fireball,
		_sprite: spr_fireball,
		_mp_cost: 10,
		_description: "Conjure up a flame and hurl it at your enemy. Deals fire damage.",
		_item_type: item_type.spell
	},
	ice_spike:
	{
		_name: "Ice Spike",
		_dmgtype: "ice",
		_dmg_min: 10,
		_dmg_max: 30,
		_sound: snd_ice_spike,
		_sprite: spr_ice_spike,
		_mp_cost: 10,
		_description: "Form a large icicle in the air and launch it towards your enemy. Deals ice damage.",
		_item_type: item_type.spell
	},
	magic_knife:
	{
		_name: "Magic Knife",
		_dmgtype: "magic",
		_dmg_min: 10,
		_dmg_max: 30,
		_sound: snd_magic_knife,
		_sprite: spr_magic_knife,
		_mp_cost: 10,
		_description: "Summon a magical knife from the aether and send it hurtling towards your enemy. Deals magic damage.",
		_item_type: item_type.spell
	},
}
}
