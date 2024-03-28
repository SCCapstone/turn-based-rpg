function consumables() {
	global.consumables = ds_map_create();
	
	// adds 50 HP
	var _item = ds_map_create();
	_item[? "_name"] = "Health Potion";
	_item[? "_sprite"] = spr_health_potion;
	_item[? "_func"] = function(_character) { 
			change_stat(_character, STAT.HP, 50)
		}
	_item[? "_description"] = "";
	global.consumables[? "_health_potion"] = _item;
	
	// adds 50 MP
	var _item = ds_map_create();
	_item[? "_name"] = "Mana Potion";
	_item[? "_sprite"] = spr_mana_potion;
	_item[? "_func"] = function(_character) { 
			change_stat(_character, STAT.MP, 50)
		}
	_item[? "_description"] = "";
	global.consumables[? "_mana_potion"] = _item;
	
	// removes poison effect
	var _item = ds_map_create();
	_item[? "_name"] = "Antidote";
	_item[? "_sprite"] = spr_antidote;
	_item[? "_func"] = function(_character) {
			remove_status_effect(_character, global.status_effects.poison)
		}
	_item[? "_description"] = "";
	global.consumables[? "_antidote"] = _item;
	
	// removes burn effect
	var _item = ds_map_create();
	_item[? "_name"] = "Ointment";
	_item[? "_sprite"] = spr_ointment;
	_item[? "_func"] = function(_character) {
			remove_status_effect(_character, global.status_effects.burn)
		}
	_item[? "_description"] = "";
	global.consumables[? "ointment"] = _item;
	
	// removes frosty effect
	var _item = ds_map_create();
	_item[? "_name"] = "Hot Tea";
	_item[? "_sprite"] = spr_hot_tea;
	_item[? "_func"] = function(_character) {
			remove_status_effect(_character, global.status_effects.frosty)
		}
	_item[? "_description"] = "";
	global.consumables[? "_hot_tea"] = _item;

}
	
// Functions for consumable items

// Consume an item and remove it from the inventory
function consume_item(_character, _inv_index) {
	// Run the item's specific member function
	show_debug_message("Consumed " + global.inventory._inventory[_inv_index].item._name);
	global.inventory._inventory[_inv_index].item._func(_character);
	// Delete it from the inventory array
	global.inventory.remove_item(_inv_index);
}

// Alter a character's stat (HP, MP, STR, etc.)
function change_stat(_character, _stat, _amount) {
	// Ensure HP and MP don't go over maximums
	if (_stat == STAT.HP && ((_character._hp + _amount) 
	>= _character._max_hp))  {
		_character._hp = _character._max_hp;
		show_debug_message("Increased " + _character._name
		+"'s HP to max");
		return;
	} else if (_stat == STAT.MP && ((_character._mp + _amount) 
	>= _character._max_mp))  {
		_character._mp = _character._max_mp;
		show_debug_message("Increased " + _character._name
		+"'s MP to max");
		return;
	}
	
	switch(_stat) {
		case STAT.HP:
			_character._hp += _amount;
			show_debug_message("Changed " + _character._name
			+"'s HP by " + string(_amount));
			return;
		case STAT.MP:
			_character._mp += _amount;
			show_debug_message("Changed " + _character._name
			+"'s MP by " + string(_amount));
			return;
		case STAT.STR:
			_character._str += _amount;
			show_debug_message("Changed " + _character._name
			+"'s STR by " + string(_amount));
			return;
		case STAT.AGIL:
			_character._agi += _amount;
			show_debug_message("Changed " + _character._name
			+"'s AGI by " + string(_amount));
			return;
		case STAT.DEX:
			_character._dex += _amount;
			show_debug_message("Changed " + _character._name
			+"'s DEX by " + string(_amount));
			return;
		case STAT.INT:
			_character._int += _amount;
			show_debug_message("Changed " + _character._name
			+"'s INT by " + string(_amount));
			return;
		case STAT.SPD:
			_character._spd += _amount;
			show_debug_message("Changed " + _character._name
			+"'s SPD by " + string(_amount));
			return;
		default:
			// Do nothing
			return;
	}
}

function remove_status_effect(_character, _effect) {
	var _match_found = false;
	for (var i = 0; i < array_length(_character._effects); i++) {
		// Check every current effect on the character, and
		// remove it if it matches the passed status effect
		if (_character._effects[i] == _effect) {
			array_delete(_character._effects, i, 1);
			array_delete(_character._effects_remaining_turns, i, 1);
			show_debug_message("Removed " + _effect._name 
			+ " effect from " + _character._name);
			_match_found = true;
		} 
	}
	if (!_match_found) {
		show_debug_message("No effect to remove from "
		+ _character._name + "!");
	}
	return;
}