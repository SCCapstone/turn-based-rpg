// This alarm transitions between battle states
// i.e., changes whether the player team or enemy team is moving

// Call alarm 1 to update status effect icons
alarm[1] = 1;

// Call state transition function
state = resolve_state_transition(state, p_num, e_num, party_units, enemy_units);

// Reset misc. variables
moved = false;
