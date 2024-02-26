
// Continually check to ensure status effect's index is up to date
_effect_index = array_find_index(_caller._effects, _find);
if (_effect_index == -1) {
	_effect_index = 0;
}

// Destroy object when caller's status effect is gone
if(is_undefined(_caller._effects)
|| array_length(_caller._effects) <= 0 
|| is_undefined(_caller._effects_remaining_turns)
|| array_length(_caller._effects_remaining_turns) <= 0 
|| _caller._effects_remaining_turns[_effect_index] <= 0) {
	instance_destroy();	
}