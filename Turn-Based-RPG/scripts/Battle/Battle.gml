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
			if (instance_exists(party_units[p_select]) && party_units[p_select]._is_dead == false) {
				// Give this character and their party the next turn
				p_num = p_select;
				show_debug_message("Beginning player " + string(p_select) + "'s turn")
				
				// Update player team's status effects before turn begins
				for (var i = 0; i < array_length(party_units); i++) {
					update_status_effects(party_units[i], true);
				}
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
			if (instance_exists(enemy_units[e_select]) && enemy_units[e_select]._is_dead == false) {
				// Give this character and their party the next turn
				e_num = e_select;
				show_debug_message("Beginning enemy " + string(e_select) + "'s turn");
				
				// Update enemy team's status effects before turn begins
				for (var i = 0; i < array_length(enemy_units); i++) {
					update_status_effects(enemy_units[i], true);
				}
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
		
		// Factor in the attacker's magic weapon if applicable
		if (dmg_source == damage_source.spell && attacker._magic_weapon != noone) {
			_dmg *= attacker._magic_weapon._dmg_multiplier;
			show_debug_message("Magic damage multiplied by " + string(attacker._magic_weapon._dmg_multiplier))
		}
		
		// Factor in the defender's resistances to reduce damage
		//_dmg = calculate_resistance(defender, _dmg, dmg_type);
		
		// Factor in attacker's effects
		// Increase damage by 25% if defender has Attack Up
		if (check_has_effect(attacker, global.status_effects.attack_up)) {
			show_debug_message("Damage increased by 25% due to Attack Up!");
			_dmg *= 1.25;
		}
		
		// Factor in defender's effects
		// Reduce damage by 25% if defender has Defense Up
		if (check_has_effect(defender, global.status_effects.defense_up)) {
			show_debug_message("Damage decreased by 25% due to Defense Up!");
			_dmg *= .75;
		}
		
		// Round damage number
		_dmg = round(_dmg);
		
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
	// Difference between defender's AGI*2
	// and attacker's relevant attack stat
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
			dodge = 2*defender._agi - attacker._str;
			break;
		case damage_source.ranged:
			attacker_stat = string(attacker._dex) + " DEX"
			dodge = 2*defender._agi - attacker._dex;
			break;
		case damage_source.spell:
			attacker_stat = string(attacker._int) + " INT";
			dodge = 2*defender._agi - attacker._int;
			break;
	}
	// Min dodge capped at 3%, because why not?
	if (dodge < 3) {
		dodge = 3;
	}
	// Max dodge capped at 50%
	else if (dodge > 50) {
		dodge = 50;
	}
	
	show_debug_message(string(defender._name) + " has " + string(defender._agi) 
	+ " AGI compared to " + string(attacker._name) + "'s " + attacker_stat
	+ ", resulting in a " + string(dodge) + "% chance to dodge.");
		
	// If accuracy < dodge, attack misses
	var accuracy = irandom_range(1, 100);
	// Check if stunned, reduce accuracy by 50% if so
	if (check_has_effect(attacker, global.status_effects.shock)) {
		accuracy /= 2;	
	}
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
			/*if (attacker._str >= 10 && attacker._str <= 14) {
				_dmg += 2;
			}
			if (attacker._str >= 15 && attacker._str <= 19) {
				_dmg += 4;
			}*/
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
		// Getting rid of this for now. Armor isn't a part of the final game
		//res = (character._armor_head._prot_slash 
		//+ character._armor_chest._prot_slash
		//+ character._armor_legs._prot_slash);
	} else if (type == "pierce") {
		
	} else if (type == "blunt") {
		
	} else if (type == "magic") {
		
	} else if (type == "fire") {
		
	} else if (type == "ice") {
		
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
// _check_all == true: update all status effects
// _check_all == false: only update most recently added status effect
function update_status_effects(_character, _check_all) {
	if (instance_exists(_character) && _character._is_dead == false) {
		// Determine whether checking all or just most recent effect
		var start = 0;
		if (_check_all == false) {
			start = ds_list_size(_character._effects) - 1;
		} 
		// Check if character has any status effects
		if (ds_list_size(_character._effects) != 0) {
			// If so, update each one
			var temp_count = 0;
			for (var j = start; j < ds_list_size(_character._effects); j++) {
				temp_count++;
				var effect = ds_list_find_value(_character._effects, j);
				
				// Show optional effect activation text
				// if this is the first time it's being updated
				if (_character._effects[| j][2] == false) {
					instance_create_depth(_character.x-15+(temp_count*15), _character.y-10, _character.depth-1,
					obj_battle_text, {color: effect[0]._txt_color, text: effect[0]._txt})
					_character._effects[| j][2] = true; // Mark as activated
				}
				
				// Inflict random damage
				var temp = irandom_range(effect[0]._dmg_min, effect[0]._dmg_max);
				// Prayers ignore armor, so no need to call change_hp()
				var before = _character._hp;
				_character._hp -= temp;
					
				// Show effect text
				if (temp < 0) { // If character gains HP
					// Ensure hp doesn't rise above max
					if(_character._hp > _character._max_hp) {
						temp = _character._max_hp - before;
						_character._hp = _character._max_hp;
					}
					// Show health increase
					instance_create_depth(_character.x-15+(temp_count*15), _character.y-10, _character.depth-1,
					obj_battle_text, {color: c_white, text: "+" + string(temp)});
					// Reduce duration of effect by 1
					if (_character._effects[| j][1] > 1) {
						_character._effects[| j][1] -= 1;
						show_debug_message(string(effect[0]._name) + " increased " + string(_character._name)
						+ "'s HP by " + string(temp) + "! "+
						"Remaining duration: " + string(_character._effects[| j][1]));
					} else {
					// If duration has run out, remove the effect
						ds_list_delete(_character._effects, j);
						show_debug_message(string(effect[0]._name) + " increased " + string(_character._name)
						+ "'s HP by " + string(temp) + "! "+
						"The effect has run its course.");
						// Compensate for ds_list size decreasing by 1
						j--;
					}
				} else if (temp > 0) { // If character loses HP
					instance_create_depth(_character.x-15+(temp_count*15), _character.y-10, _character.depth-1,
					obj_battle_text, {color: effect[0]._txt_color, text: "-" + string(temp)})
					// Check to see if damage tick killed character
					if(_character._hp <= 0) { 
						if (state == turn.player) { // Give XP to player who originally cast the prayer
							var killer = _character._effects[| j][3];
							xp_gained[killer] += _character._xp_val
							show_debug_message(party_units[p_num]._name + " gained " + 
							string(enemy_units[target]._xp_val) + " XP.");
						}
						// Clear status effect list
						ds_list_clear(_character._effects);
						kill_target(_character);
						state = resolve_state_transition(state, p_num, e_num, party_units, enemy_units);
						return;
					} 
					// Reduce duration of effect by 1
					if (_character._effects[| j][1] > 1) {
						_character._effects[| j][1] -= 1;
						show_debug_message(string(effect[0]._name) + " dealt "
						+ string(temp) + " damage to " + string(_character._name) + "! "+
						"Remaining duration: " + string(_character._effects[| j][1]));
					} else {
						// If duration has run out, remove the effect
						ds_list_delete(_character._effects, j);
						show_debug_message(string(effect[0]._name) + " dealt "
						+ string(temp) + " damage to " + string(_character._name) + "! "+
						"The effect has run its course.");
						// Compensate for ds_list size decreasing by 1
						j--;
					}
				} else {
					// Reduce duration of effect by 1
					if (_character._effects[| j][1] > 1) {
						_character._effects[| j][1] -= 1;
						show_debug_message("Remaining duration of " + string(effect[0]._name)
						+ ": " + string(_character._effects[| j][1]));
					} else {
					// If duration has run out, remove the effect
						ds_list_delete(_character._effects, j);
						show_debug_message(string(effect[0]._name) + " increased " + string(_character._name)
						+ "'s HP by " + string(temp) + "! "+
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
		party_shadows[_target._num].visible = false;
	} else {
		enemy_shadows[_target._num].visible = false;
	}
	// Update status effects immediately
	ds_list_clear(_target._effects)
	instance_destroy(obj_status_effect);
	for (var i = 0; i < array_length(party_units); i++) {
		update_status_icons(party_units[i], 0);
	}
	for (var i = 0; i < array_length(enemy_units); i++) {
		update_status_icons(enemy_units[i], 1);
	}
	// Make target invisible, can't 
	// destroy it or it messes things up
	show_debug_message(_target._name + " was killed.");
	_target.visible = false; 
}

// Code for showing move-related sprites
function flash_item(type) {
	if (state == turn.player) {
		if (type == display.weapon) { // Flash player weapon
			var temp = instance_create_depth(party_units[p_num].x+5, party_units[p_num].y, party_units[p_num].depth-1,
			obj_sprite)
			temp._sprite = party_units[p_num]._weapon._sprite;
			temp._scale = 1;
			temp._time = 1000;
		}

		if (type == display.magic_weapon) { // Flash player magic weapon
			var temp = instance_create_depth(party_units[p_num].x+5, party_units[p_num].y, party_units[p_num].depth-1,
			obj_sprite);
			temp._sprite = party_units[p_num]._magic_weapon._sprite;
			temp._scale = 1;
		}

		if (type == display.spell) { // Flash player spell
			var temp = instance_create_depth(party_units[p_num].x+42, party_units[p_num].y-2, party_units[p_num].depth-1,
			obj_projectile2, {speed: 2.5});
			temp._sprite = party_units[p_num]._spells[move_num]._sprite;
			temp._scale = 1;
			_show_spell = false;
		}

		if (type == display.prayer_book) { // Flash player prayer book
			var temp = instance_create_depth(party_units[p_num].x+5, party_units[p_num].y+6, party_units[p_num].depth-1,
			obj_sprite);
			temp._sprite = party_units[p_num]._prayer_book._sprite;
			temp._scale = 1;
			_show_prayer_book = false;
		}

		if (type == display.prayer) { // Flash player prayer
			var temp = instance_create_depth(party_units[p_num].x+25, party_units[p_num].y-2, party_units[p_num].depth-1,
			obj_projectile2, {speed: 0});
			temp._sprite = party_units[p_num]._prayers[move_num]._sprite;
			temp._scale = 1;
			_show_prayer_book = false
		}
	}
	
	if (state == turn.enemy) {
		if (type == display.weapon) { // Flash enemy weapon
			var temp = instance_create_depth(enemy_units[e_num].x-5, enemy_units[e_num].y, enemy_units[e_num].depth-1,
			obj_sprite)
			temp._sprite = enemy_units[e_num]._weapon._sprite;
			temp._scale = -1;
		}

		if (type == display.spell) { // Flash enemy spell
			var temp = instance_create_depth(enemy_units[e_num].x-42, enemy_units[e_num].y-2, enemy_units[e_num].depth-1,
			obj_enemy_projectile2, {speed: 2.5})
			temp._sprite = enemy_units[e_num]._spells[move_num]._sprite;
			temp._scale = -1;
		}

		if (type == display.magic_weapon) { // Flash enemy magic weapon
			var temp = instance_create_depth(enemy_units[e_num].x-5, enemy_units[e_num].y, enemy_units[e_num].depth-1,
			obj_sprite)
			temp._sprite = enemy_units[e_num]._magic_weapon._sprite;
			temp._scale = -1;
		}

		if (type == display.prayer_book) { // Flash enemy prayer book
			var temp = instance_create_depth(enemy_units[e_num].x-5, enemy_units[e_num].y+6, enemy_units[e_num].depth-1,
			obj_sprite)
			temp._sprite = enemy_units[e_num]._prayer_book._sprite;
			temp._scale = -1;
		}

		if (type == display.prayer) { // Flash enemy prayer
			var temp = instance_create_depth(enemy_units[e_num].x-25, enemy_units[e_num].y-2, enemy_units[e_num].depth-1,
			obj_enemy_projectile2, {speed: 0})
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
			global.xp[i] = xp_gained[i];
		}
	}
}

// Shows status effect icons next to afflicted characters
// And ensures they are updated with each turn
// _team == 0: player turn, 1: enemy turn
function update_status_icons(_character, _team) {
	// Offset for player party
	if (_team == 0) {
		var x_offset = -14;
	} else { // Offset for enemy party
		var x_offset = 3
	}
	// Iterate through each status effect of this character
	for (var i = 0; i < ds_list_size(_character._effects); i++) {
		// Create new status icon
		instance_create_depth(_character.x + x_offset, _character.y+(i*11), _character.depth-1,
		obj_status_effect, {_sprite: _character._effects[| i][0]._sprite, _xscale: .5,
		_yscale: .5, _caller: _character});
	}
}
	
// Checks whether or not a character has a particular status effect.
// Returns true if yes, false if not.
function check_has_effect(_character, _effect) {
	// Check entire array of character's status effects
	for (var i = 0; i < ds_list_size(_character._effects); i++) {
		if (_character._effects[|i][0] == _effect) {
			return true; // Immediately return true if match is found
		}
		return false; // If no matches found, return false
	}
}

// Returns loot and gold gained after battle
// Takes in enemy party
function roll_loot_table(_enemies) {
	// Calculate loot drops and gold gain
	for (var i = 0; i < array_length(_enemies); i++) { // For each enemy
		// Roll gold amount and add to gold_gained temp variable
		var temp_gold = irandom_range(0, _enemies[i]._gold_range[1]);
		global.gold_gained += temp_gold;
		// TODO actually add gold
		// Roll loot table
		for (var j = 0; j < array_length(_enemies[i]._loot_table); j++) { // Check each loot roll
			var temp_loot = irandom_range(0, 100) // RNG roll out of 100
			// If roll is below this loot table's % to drop, drop the item
			if (temp_loot <= _enemies[i]._loot_table[j][1]) {
				// Push item to item_gained temp array and inventory
				array_push(global.item_gained, _enemies[i]._loot_table[j][0]);
				global.inventory.add_item(_enemies[i]._loot_table[j][0]);
			}
		}
	}
		show_debug_message("Player party gained " + string(global.gold_gained) + " gold!");
}
	