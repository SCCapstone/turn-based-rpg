// Enumeration of battle states (turns)
enum turn {
	player,
	enemy,
	gameover,
}

// Enumeration of items/magic to display on screen
enum display {
	weapon,
	magic_weapon,
	spell,
	prayer_book,
	prayer,
}

// Different damage sources, mainly for 
// attacks damage scaling with character stats
enum damage_source {
	melee,
	ranged,
	prayer,
	spell,
	misc
}

// Call this function to start a battle with a 
// defined set of enemies and a chosen background
function battle_start(enemies, background) {
	instance_create_depth (
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		0,
		obj_battle,
		{enemies: enemies, trigger: id, battle_background: background}
	);
}

function resolve_state_transition(state, p_turn, e_turn, party_units, enemy_units) {
	// Randomize seed regardless of which party moves
	randomize();
		
	// Switch to player turn
	if (state == turn.enemy) {
		// Update status effects before turn begins
		update_status_effects(party_units);
		// Save the position of the character that previously moved
		var p_select = p_turn;
		// Find the next living character to give the turn to
		while (true) {
			if (p_select+1 < array_length(party_units)) {
				// If p_select less than party array length,
				// check next character in party
				p_select++; 
			} else {
				// Otherwise, wrap around to beginning of party array
				p_select = 0; 
			}

			// Check to see if this character is alive
			// Otherwise, continue while() loop
			if (party_units[p_select]._is_dead == false) {
				// Give this character and their party the next turn
				p_num = p_select;
				show_debug_message("Beginning player " + string(p_select) + "'s turn")
				return turn.player;
			}
			
			show_debug_message("Player " + string(p_select) + " is dead, skipping...");
			
			// If the entire array has been searched, no characters in 
			// this party are left alive, so the game is over.
			if(p_select == p_turn) {
				state = turn.gameover;
				show_debug_message("Enemy team is victorious. [BATTLE OVER]");
				game_end();
				break;
			} 
		}
	}
	
	// Switch to enemy turn
	if (state == turn.player) {
		// Update status effects before turn begins
		update_status_effects(enemy_units);
		// Save the position of the character that previously moved
		var e_select = e_turn;
		// Find the next living character to give the turn to
		while (true) {
			if (e_select+1 < array_length(enemy_units)) {
				// If p_select less than party array length,
				// check next character in party
				e_select++; 
			} else {
				// Otherwise, wrap around to beginning of party array
				e_select = 0; 
			}

			// Check to see if this character is alive
			// Otherwise, continue while() loop
			if (enemy_units[e_select]._is_dead == false) {
				// Give this character and their party the next turn
				e_num = e_select;
				show_debug_message("Beginning enemy " + string(e_select) + "'s turn")
				return turn.enemy;
			}
			
			show_debug_message("Enemy " + string(e_select) + " is dead, skipping...");
			
			// If the entire array has been searched, no characters in 
			// this party are left alive, so the game is over.
			if(e_select == e_turn) {
				state = turn.gameover;
				show_debug_message("Player team is victorious. [BATTLE OVER]");
				break;
			} 
		}
	}
	
	// If either party is defeated, destroy battle instance
	if (state == turn.gameover) {
		instance_destroy();
	}
}

// Call this function to change a character's hp, 
// either positively or negatively, while factoring in
// the attacker's stats and the defender's damage resistances
// and dodge chance.
// Takes the attacking character, defending character,
// amount of damage dealt, type of damage, and source of damage
function change_hp(attacker, defender, _dmg, dmg_type, dmg_source) {
	if(_dmg > 0) {
		// Roll dodge chance
		if (roll_dodge(attacker, defender, dmg_source)) {
			instance_create_depth(defender.x, defender.y, defender.depth-1,
			obj_battle_text, {color: c_white, text: "Dodge"});
			return 0;	
		}
		// Factor in the attacker's stats to increase damage
		_dmg = calculate_damage_scaling(attacker, _dmg, dmg_source);
		// Factor in the defender's resistances to reduce damage
		_dmg = calculate_resistance(defender, _dmg, dmg_type);
		// Show damage text
		instance_create_depth(defender.x, defender.y, defender.depth-1,
		obj_battle_text, {color: c_white, text: "-" + string(_dmg)})
		// Change defender HP
		defender._hp -= _dmg;
		// Check to see if this killed the selected character
		if(defender._hp <= 0) { 
			kill_target(defender);
		}
		// Check if character was killed
	} else {
		// Show HP change
		instance_create_depth(defender.x, defender.y, defender.depth-1,
		obj_battle_text, {color: c_green, text: "+" + string(_dmg)})
		// If _dmg <= 0, simply add HP
		defender._hp -= _dmg;
	}
}

// Rolls the defender's dodge chance, determining if an attack lands or not.
// Returns false if attacker lands the hit, returns true if defender dodges.
function roll_dodge(attacker, defender, dmg_source) {
	// Difference between defender's AGI*3
	// and attacker's relevant attack stat*2
	var dodge = 0;
	var attacker_stat = "";
	switch (dmg_source) {
		// Miscellaneous sources of damage never miss
		case damage_source.misc:
			return false;
		// Prayers never miss (for now)
		case damage_source.prayer:
			return false;
		case damage_source.melee:
			attacker_stat = string(attacker._str) + " STR";
			dodge = 3*defender._agi - 2*attacker._str;
			break;
		case damage_source.ranged:
			attacker_stat = string(attacker._dex) + " DEX"
			dodge = 3*defender._agi - 2*attacker._dex;
			break;
		case damage_source.spell:
			attacker_stat = string(attacker._int) + " INT";
			dodge = 3*defender._agi - 2*attacker._int;
			break;
	}
	// Min dodge capped at 3%, because why not?
	if (dodge < 3) {
		dodge = 3;	
	}
	// Max dodge capped at 85%
	else if (dodge > 85) {
		dodge = 85;	
	}
	
	show_debug_message(string(defender._name) + " has " + string(defender._agi) 
	+ " AGI compared to " + string(attacker._name) + "'s " + attacker_stat
	+ ", resulting in a " + string(dodge) + "% chance to dodge.");
		
	// If accuracy < dodge, attack misses
	var accuracy = irandom_range(1, 100);
	show_debug_message("Roll: " + string(accuracy));
	if (accuracy <= dodge) {
		show_debug_message("MISS!"); 
		return true;
	} else {
		show_debug_message("HIT!"); 
		return false;	
	}
}

// Scales damage up with appropriate stats
function calculate_damage_scaling(attacker, _dmg, dmg_source) {
	var attacker_stat = "";
	var increase;
	switch (dmg_source) {
		case damage_source.misc:
			return _dmg;
		case damage_source.prayer:
			return _dmg;
		case damage_source.melee:
			attacker_stat = string(attacker._str) + " STR";
			increase = (attacker._str / 20);
			break;
		case damage_source.ranged:
			attacker_stat = string(attacker._dex) + " DEX"
			increase = (attacker._dex / 20);
			break;
		case damage_source.spell:
			attacker_stat = string(attacker._int) + " INT";
			increase = (attacker._int / 20);
			break;
	}
	show_debug_message("Attack power increased by " + string(increase*100)
	+ "% due to " + string(attacker._name) + "'s " + attacker_stat);
	return round(_dmg + (_dmg*increase));
}

// Call this function to factor in a character's damage 
// resistance before dealing damage to them
// Takes defending character, amount of damage dealt, and
// the type of damage
function calculate_resistance(character, dmg, type) {
	var res = 0; // Target's armor resistance
	
	if (type == "slash") {
		res = (character._armor_head._prot_slash 
		+ character._armor_chest._prot_slash
		+ character._armor_legs._prot_slash);
	} else if (type == "pierce") {
		res = (character._armor_head._prot_pierce
		+ character._armor_chest._prot_pierce
		+ character._armor_legs._prot_pierce);
	} else if (type == "blunt") {
		res = (character._armor_head._prot_blunt
		+ character._armor_chest._prot_blunt
		+ character._armor_legs._prot_blunt);
	} else if (type == "magic") {
		res = (character._armor_head._prot_magic
		+ character._armor_chest._prot_magic
		+ character._armor_legs._prot_magic);
	} else if (type == "fire") {
		res = (character._armor_head._prot_fire
		+ character._armor_chest._prot_fire
		+ character._armor_legs._prot_fire);
	} else if (type == "ice") {
		res = (character._armor_head._prot_ice
		+ character._armor_chest._prot_ice
		+ character._armor_legs._prot_ice);
	}
	else {
		return 0;
	}
	
	new_dmg = ceil(dmg * ((100 - res) / 100));
	
	show_debug_message(character._name + " blocked " + string(dmg - new_dmg) 
	+ " damage due to " + string(res) + " " + string(type) 
	+ " resistance. Damage taken: " + string(new_dmg) + ".")
	
	return new_dmg;
}

// Update the targeted party's status effects
function update_status_effects(party) {
	// Check each living character in the party
	for (var i = 0; i < array_length(party); i++) {
		if (party[i]._is_dead == false) {
			// Check if character has any status effects
			if (ds_list_size(party[i]._effects) != 0) {
				// If so, update each one
				for (var j = 0; j < ds_list_size(party[i]._effects); j++) {
					var effect = ds_list_find_value(party[i]._effects, j);
					// Inflict random damage
					var temp = irandom_range(effect[0]._dmg_min, effect[0]._dmg_max);
					// Prayers ignore armor, so no need to call change_hp()
					party[i]._hp -= temp;
					// Show damage text
					instance_create_depth(party[i].x, party[i].y-(i*10), party[i].depth-1,
					obj_battle_text, {color: effect[0]._txt_color, text: "-" + string(temp)})
					// Check to see if damage tick killed character
					if(party[i]._hp <= 0) { 
						kill_target(party[i]);
						// Clear status effect list
						ds_list_clear(party[i]._effects);
					}
					
					// Reduce duration of effect by 1
					if (party[i]._effects[| j][1] > 1) {
						party[i]._effects[| j][1] -= 1;
						show_debug_message(string(effect[0]._name) + " dealt "
						+ string(temp) + " damage to " + string(party[i]._name) + "! "+
						"Remaining duration: " + string(party[i]._effects[| j][1]));
					} else {
					// If duration has run out, remove the effect
					ds_list_delete(party[i]._effects, j);
					show_debug_message(string(effect[0]._name) + " dealt "
						+ string(temp) + " damage to " + string(party[i]._name) + "! "+
						"The effect has run its course.");
					// Compensate for ds_list size decreasing by 1
					j--;
					}
				}
			}
		}
	}
}

// Kill the targeted character
function kill_target(_target) {
	// Set hp to 0 and _is_dead to true
	_target._hp = 0;
	_target._is_dead = true;
	// Make the target's shadow invisible
	if (state == turn.enemy) {
		party_shadows[target].visible = false;
	} else {
		enemy_shadows[target].visible = false;
	}
	// Make target invisible, can't 
	// destroy it or it messes things up
	_target.visible = false; 
}

// Code for showing move-related sprites
function flash_item(type) {
	if (state == turn.player) {
		if (type == display.weapon) { // Flash player weapon
			var temp = instance_create_depth(party_units[p_num].x+13, party_units[p_num].y+24, party_units[p_num].depth-1,
			obj_sprite)
			temp._sprite = party_units[p_num]._weapon._sprite;
			temp._scale = 1;
			temp._time = 1000;
		}

		if (type == display.magic_weapon) { // Flash player magic weapon
			var temp = instance_create_depth(party_units[p_num].x+13, party_units[p_num].y+24, party_units[p_num].depth-1,
			obj_sprite);
			temp._sprite = party_units[p_num]._magic_weapon._sprite;
			temp._scale = 1;
		}

		if (type == display.spell) { // Flash player spell
			var temp = instance_create_depth(party_units[p_num].x+42, party_units[p_num].y-2, party_units[p_num].depth-1,
			obj_projectile2);
			temp._sprite = party_units[p_num]._spells[move_num]._sprite;
			temp._scale = 1;
			_show_spell = false;
		}

		if (type == display.prayer_book) { // Flash player prayer book
			var temp = instance_create_depth(party_units[p_num].x+13, party_units[p_num].y+24, party_units[p_num].depth-1,
			obj_sprite);
			temp._sprite = party_units[p_num]._prayer_book._sprite;
			temp._scale = 1;
			_show_prayer_book = false;
		}

		if (type == display.prayer) { // Flash player prayer
			var temp = instance_create_depth(party_units[p_num].x+42, party_units[p_num].y-2, party_units[p_num].depth-1,
			obj_projectile2);
			temp._sprite = party_units[p_num]._prayers[move_num]._sprite;
			temp._scale = 1;
			_show_prayer_book = false
		}
	}
	
	if (state == turn.enemy) {
		if (type == display.weapon) { // Flash enemy weapon
			var temp = instance_create_depth(enemy_units[e_num].x-13, enemy_units[e_num].y+24, enemy_units[e_num].depth-1,
			obj_sprite, enemies[e_num])
			temp._sprite = enemy_units[e_num]._weapon._sprite;
			temp._scale = -1;
		}

		if (type == display.spell) { // Flash enemy spell
			var temp = instance_create_depth(enemy_units[e_num].x-42, enemy_units[e_num].y-2, enemy_units[e_num].depth-1,
			obj_enemy_projectile2, enemies[e_num])
			temp._sprite = enemy_units[e_num]._spells[move_num]._sprite;
			temp._scale = -1;
		}

		if (type == display.magic_weapon) { // Flash enemy magic weapon
			var temp = instance_create_depth(enemy_units[e_num].x-13, enemy_units[e_num].y+24, enemy_units[e_num].depth-1,
			obj_sprite, enemies[e_num])
			temp._sprite = enemy_units[e_num]._magic_weapon._sprite;
			temp._scale = -1;
		}

		if (type == display.prayer_book) { // Flash enemy prayer book
			var temp = instance_create_depth(enemy_units[e_num].x-13, enemy_units[e_num].y+24, enemy_units[e_num].depth-1,
			obj_sprite, enemies[e_num])
			temp._sprite = enemy_units[e_num]._prayer_book._sprite;
			temp._scale = -1;
		}

		if (type == display.prayer) { // Flash enemy prayer
			var temp = instance_create_depth(enemy_units[e_num].x-42, enemy_units[e_num].y-2, enemy_units[e_num].depth-1,
			obj_enemy_projectile2, enemies[e_num])
			temp._sprite = enemy_units[e_num]._prayers[move_num]._sprite;
			temp._scale = -1;
		}
	}
}

// This function is run at a battle's end, and
// primarily concerns giving the party members XP
function battle_end(party_units, xp_gained) {
	// Increase XP for each party member
	for (var i = 0; i < array_length(party_units); i++) {
		if (xp_gained[i] > 0) {
			ds_list_find_value(global.party,i)._xp += xp_gained[i];
			show_debug_message(string(ds_list_find_value(global.party,i)._name) + " gained "
			+ string(xp_gained[i]) + " XP!");
		}
	}
}

// TODO fix this buggy mess
function show_status_effect(_character, _status) {
}