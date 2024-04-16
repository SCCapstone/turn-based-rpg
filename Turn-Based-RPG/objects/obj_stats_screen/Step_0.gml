up_key = keyboard_check_pressed(ord("W"))
down_key = keyboard_check_pressed(ord("S"));
left_key = keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(ord("D"));
accept_key = keyboard_check_pressed(ord("E"));


/*if (keyboard_check_pressed(ord("P")) && room != rm_world_map && room != rm_access_menu) {
	show_stats = !show_stats;
	//obj_player._disabled = !obj_player._disabled;
} else if (keyboard_check_pressed(ord("P")) && room == rm_world_map) {
	show_stats = !show_stats;
	obj_pointer._disabled = !obj_pointer._disabled;
}*/

// drawing and removal of the stats screen will be handled by the pause menu


if (!show_stats) exit;



/*
 When the show stats variable switches from false to true the code below will run
*/
if (!party_disable) {
	partypos += down_key - up_key;
      if (partypos >= ds_list_size(global.party)) {
         partypos = 0;
      }
      if (partypos < 0) {
      partypos = ds_list_size(global.party) - 1;
    }
}
    //show_debug_message(party_switch);

// Check if party operations should be disabled
if (accept_key) {
    party_disable = !party_disable;
}

// Execute statpos operations if party operations are disabled
if (party_disable) {
    statpos += down_key - up_key;

    if (statpos >= op_length) {
        statpos = 0;
    }

    if (statpos < 0) {
        statpos = op_length - 1;
    }
}


// adds a skill point to the respective stat and reduces the skill point number by 1
switch (partypos) {
	case 0:
		if (right_key && global.skill_points[0] > 0 && party_disable) {
		/*character[0].allocate_add(selection);
		character[0].stat_points -= 1;*/
		switch (statpos) {
			case 0:
				global.hp[0] += 1; // value to show the points in the hp stat
				ds_list_find_value(global.party,0)._max_hp += (10 * ds_list_find_value(global.party,0)._lvl); // Now adds 10 health * the characters level
				ds_list_find_value(global.party,0)._hp = ds_list_find_value(global.party,0)._max_hp; // sets current health to the new max
				break;
			case 1:
				global.mp[0] += 1;
				ds_list_find_value(global.party,0)._max_mp += (10 * ds_list_find_value(global.party,0)._lvl);
				ds_list_find_value(global.party,0)._mp = ds_list_find_value(global.party,0)._max_mp
				break;
			case 2:
				ds_list_find_value(global.party,0)._str += 1;
				break;
			case 3:
				ds_list_find_value(global.party,0)._agi += 1;
				break;
			case 4:
				ds_list_find_value(global.party,0)._dex += 1;
				break;
			case 5:
				ds_list_find_value(global.party,0)._int += 1;
				break;
			case 6:
				ds_list_find_value(global.party,0)._fai += 1;
				break;
			case 7:
				ds_list_find_value(global.party,0)._spd += 1;
				break;	
		}
		global.skill_points[0] -= 1;
	}

	// removes points from respective stat and increases skill points
	// Certain stats such as Hp, Mp, and Spd will be unable to be lower than 1 and as such will be
	// unable to grant a skill point when trying to go under 1
	if (left_key && party_disable) {
		//character[0].allocate_minus(selection);
		switch (statpos) {
			case 0:
				if ( global.hp[0] > 0) {
					global.hp[0] -= 1;
					ds_list_find_value(global.party,0)._max_hp -= (10 * ds_list_find_value(global.party,0)._lvl); //round(ds_list_find_value(global.party,0)._max_hp * new_hp);
					global.skill_points[0] += 1;
					ds_list_find_value(global.party,0)._hp = ds_list_find_value(global.party,0)._max_hp;
				} else {
					global.hp[0] = 0;
				}
				break;
			case 1:
				if ( global.mp[0] > 0) {
					global.mp[0] -= 1;
					ds_list_find_value(global.party,0)._max_mp -= (10 * ds_list_find_value(global.party,0)._lvl); //round(ds_list_find_value(global.party,0)._max_mp * new_mp);
					global.skill_points[0] += 1;
					ds_list_find_value(global.party,0)._mp = ds_list_find_value(global.party,0)._max_mp;
				} else {
					global.mp[0] = 0;
				}
				break;
			case 2:
				if ( ds_list_find_value(global.party,0)._str > 0) {
					ds_list_find_value(global.party,0)._str -= 1;
					global.skill_points[0] += 1;
				} else {
					ds_list_find_value(global.party,0)._str = 0;
				}
				break;
			case 3:
				if ( ds_list_find_value(global.party,0)._agi > 0) {
					ds_list_find_value(global.party,0)._agi -= 1;
					global.skill_points[0] += 1;
				} else {
					ds_list_find_value(global.party,0)._agi = 0;
				}
				break;
			case 4:
				if ( ds_list_find_value(global.party,0)._dex > 0) {
					ds_list_find_value(global.party,0)._dex -= 1;
					global.skill_points[0] += 1;
				} else {
					ds_list_find_value(global.party,0)._dex = 0;
				}
				break;
			case 5:
				if ( ds_list_find_value(global.party,0)._int > 0) {
					ds_list_find_value(global.party,0)._int -= 1;
					global.skill_points[0] += 1;
				} else {
					ds_list_find_value(global.party,0)._int = 0;
				}
				break;
			case 6:
				if ( ds_list_find_value(global.party,0)._fai > 1) {
					ds_list_find_value(global.party,0)._fai-= 1;
					global.skill_points[0] += 1;
				} else {
					ds_list_find_value(global.party,0)._fai = 0;
				}
				break;
			case 7:
				if ( ds_list_find_value(global.party,0)._spd > 1) {
					ds_list_find_value(global.party,0)._spd -= 1;
					global.skill_points[0] += 1;
				} else {
					ds_list_find_value(global.party,0)._spd = 1;
				}
				break;
		}
	}
	break;
	case 1:
		if (right_key && global.skill_points[1] > 0 && party_disable) {
		switch (statpos) {
			case 0:
				global.hp[1] += 1; // value to show the points in the hp stat
				ds_list_find_value(global.party,1)._max_hp += (10 * ds_list_find_value(global.party,1)._lvl);
				ds_list_find_value(global.party,1)._hp = ds_list_find_value(global.party,1)._max_hp; // sets current health to the new max
				break;
			case 1:
				global.mp[1] += 1;
				ds_list_find_value(global.party,1)._max_mp += (10 * ds_list_find_value(global.party,1)._lvl);
				ds_list_find_value(global.party,1)._mp = ds_list_find_value(global.party,1)._max_mp
				break;
			case 2:
				ds_list_find_value(global.party,1)._str += 1;
				break;
			case 3:
				ds_list_find_value(global.party,1)._agi += 1;
				break;
			case 4:
				ds_list_find_value(global.party,1)._dex += 1;
				break;
			case 5:
				ds_list_find_value(global.party,1)._int += 1;
				break;
			case 6:
				ds_list_find_value(global.party,1)._fai += 1;
				break;
			case 7:
				ds_list_find_value(global.party,1)._spd += 1;
				break;
		}
		global.skill_points[1] -= 1;
	}

	// removes points from respective stat and increases skill points
	// Certain stats such as Hp, Mp, and Spd will be unable to be lower than 1 and as such will be
	// unable to grant a skill point when trying to go under 1
	if (left_key && party_disable) {
		//character[0].allocate_minus(selection);
		switch (statpos) {
			case 0:
				if ( global.hp[1] > 0) {
					global.hp[1] -= 1;
					ds_list_find_value(global.party,1)._max_hp -= (10 * ds_list_find_value(global.party,1)._lvl);
					global.skill_points[1] += 1;
					ds_list_find_value(global.party,1)._hp = ds_list_find_value(global.party,1)._max_hp;
				} else {
					global.hp[1] = 0;
				}
				break;
			case 1:
				if ( global.mp[1] > 0) {
					global.mp[1] -= 1;
					ds_list_find_value(global.party,1)._max_mp -= (10 * ds_list_find_value(global.party,1)._lvl);
					global.skill_points[1] += 1;
					ds_list_find_value(global.party,1)._mp = ds_list_find_value(global.party,1)._max_mp;
				} else {
					global.mp[1] = 0;
				}
				break;
			case 2:
				if ( ds_list_find_value(global.party,1)._str > 0) {
					ds_list_find_value(global.party,1)._str -= 1;
					global.skill_points[1] += 1;
				} else {
					ds_list_find_value(global.party,1)._str = 0;
				}
				break;
			case 3:
				if ( ds_list_find_value(global.party,1)._agi > 0) {
					ds_list_find_value(global.party,1)._agi -= 1;
					global.skill_points[1] += 1;
				} else {
					ds_list_find_value(global.party,1)._agi = 0;
				}
				break;
			case 4:
				if ( ds_list_find_value(global.party,1)._dex > 0) {
					ds_list_find_value(global.party,1)._dex -= 1;
					global.skill_points[1] += 1;
				} else {
					ds_list_find_value(global.party,1)._dex = 0;
				}
				break;
			case 5:
				if ( ds_list_find_value(global.party,1)._int > 0) {
					ds_list_find_value(global.party,1)._int -= 1;
					global.skill_points[1] += 1;
				} else {
					ds_list_find_value(global.party,1)._int = 0;
				}
				break;
			case 6:
				if ( ds_list_find_value(global.party,1)._fai > 1) {
					ds_list_find_value(global.party,1)._fai-= 1;
					global.skill_points[1] += 1;
				} else {
					ds_list_find_value(global.party,1)._fai = 0;
				}
				break;
			case 7:
				if ( ds_list_find_value(global.party,1)._spd > 1) {
					ds_list_find_value(global.party,1)._spd -= 1;
					global.skill_points[1] += 1;
				} else {
					ds_list_find_value(global.party,1)._spd = 1;
				}
				break;
		}
	}
	break;
	case 2:
		if (right_key && global.skill_points[2] > 0 && party_disable) {
		switch (statpos) {
			case 0:
				global.hp[2] += 1; // value to show the points in the hp stat
				ds_list_find_value(global.party,2)._max_hp += (10 * ds_list_find_value(global.party,2)._lvl);
				ds_list_find_value(global.party,2)._hp = ds_list_find_value(global.party,2)._max_hp; // sets current health to the new max
				break;
			case 1:
				global.mp[2] += 1;
				ds_list_find_value(global.party,2)._max_mp += (10 * ds_list_find_value(global.party,2)._lvl);
				ds_list_find_value(global.party,2)._mp = ds_list_find_value(global.party,2)._max_mp
				break;
			case 2:
				ds_list_find_value(global.party,2)._str += 1;
				break;
			case 3:
				ds_list_find_value(global.party,2)._agi += 1;
				break;
			case 4:
				ds_list_find_value(global.party,2)._dex += 1;
				break;
			case 5:
				ds_list_find_value(global.party,2)._int += 1;
				break;
			case 6:
				ds_list_find_value(global.party,2)._fai += 1;
				break;
			case 7:
				ds_list_find_value(global.party,2)._spd += 1;
				break;
		}
		global.skill_points[2] -= 1;
	}

	// removes points from respective stat and increases skill points
	// Certain stats such as Hp, Mp, and Spd will be unable to be lower than 1 and as such will be
	// unable to grant a skill point when trying to go under 1
	if (left_key && party_disable) {
		//character[0].allocate_minus(selection);
		switch (statpos) {
			case 0:
				if ( global.hp[2] > 0) {
					global.hp[2] -= 1;
					ds_list_find_value(global.party,2)._max_hp -= (10 * ds_list_find_value(global.party,2)._lvl);
					global.skill_points[2] += 1;
					ds_list_find_value(global.party,2)._hp = ds_list_find_value(global.party,2)._max_hp;
				} else {
					global.hp[2] = 0;
				}
				break;
			case 1:
				if ( global.mp[2] > 0) {
					global.mp[2] -= 1;
					ds_list_find_value(global.party,2)._max_mp -= (10 * ds_list_find_value(global.party,2)._lvl);
					global.skill_points[2] += 1;
					ds_list_find_value(global.party,2)._mp = ds_list_find_value(global.party,2)._max_mp;
				} else {
					global.mp[2] = 0;
				}
				break;
			case 2:
				if ( ds_list_find_value(global.party,2)._str > 0) {
					ds_list_find_value(global.party,2)._str -= 1;
					global.skill_points[2] += 1;
				} else {
					ds_list_find_value(global.party,2)._str = 0;
				}
				break;
			case 3:
				if ( ds_list_find_value(global.party,2)._agi > 0) {
					ds_list_find_value(global.party,2)._agi -= 1;
					global.skill_points[2] += 1;
				} else {
					ds_list_find_value(global.party,2)._agi = 0;
				}
				break;
			case 4:
				if ( ds_list_find_value(global.party,2)._dex > 0) {
					ds_list_find_value(global.party,2)._dex -= 1;
					global.skill_points[2] += 1;
				} else {
					ds_list_find_value(global.party,2)._dex = 0;
				}
				break;
			case 5:
				if ( ds_list_find_value(global.party,2)._int > 0) {
					ds_list_find_value(global.party,2)._int -= 1;
					global.skill_points[2] += 1;
				} else {
					ds_list_find_value(global.party,2)._int = 0;
				}
				break;
			case 6:
				if ( ds_list_find_value(global.party,2)._fai > 1) {
					ds_list_find_value(global.party,2)._fai-= 1;
					global.skill_points[2] += 1;
				} else {
					ds_list_find_value(global.party,2)._fai = 0;
				}
				break;
			case 7:
				if ( ds_list_find_value(global.party,2)._spd > 1) {
					ds_list_find_value(global.party,2)._spd -= 1;
					global.skill_points[2] += 1;
				} else {
					ds_list_find_value(global.party,2)._spd = 1;
				}
				break;
		}
	}
	break;
	case 3:
		if (right_key && global.skill_points[3] > 0 && party_disable) {
		switch (statpos) {
			case 0:
				global.hp[3] += 1; // value to show the points in the hp stat
				ds_list_find_value(global.party,3)._max_hp += (10 * ds_list_find_value(global.party,3)._lvl);
				ds_list_find_value(global.party,3)._hp = ds_list_find_value(global.party,3)._max_hp; // sets current health to the new max
				break;
			case 1:
				global.mp[3] += 1;
				ds_list_find_value(global.party,3)._max_mp += (10 * ds_list_find_value(global.party,3)._lvl);
				ds_list_find_value(global.party,3)._mp = ds_list_find_value(global.party,3)._max_mp
				break;
			case 2:
				ds_list_find_value(global.party,3)._str += 1;
				break;
			case 3:
				ds_list_find_value(global.party,3)._agi += 1;
				break;
			case 4:
				ds_list_find_value(global.party,3)._dex += 1;
				break;
			case 5:
				ds_list_find_value(global.party,3)._int += 1;
				break;
			case 6:
				ds_list_find_value(global.party,3)._fai += 1;
				break;
			case 7:
				ds_list_find_value(global.party,3)._spd += 1;
				break;
		}
		global.skill_points[3] -= 1;
	}

	// removes points from respective stat and increases skill points
	// Certain stats such as Hp, Mp, and Spd will be unable to be lower than 1 and as such will be
	// unable to grant a skill point when trying to go under 1
	if (left_key && party_disable) {
		//character[0].allocate_minus(selection);
		switch (statpos) {
			case 0:
				if ( global.hp[3] > 0) {
					global.hp[3] -= 1;
					ds_list_find_value(global.party,3)._max_hp -= (10 * ds_list_find_value(global.party,3)._lvl);
					global.skill_points[3] += 1;
					ds_list_find_value(global.party,3)._hp = ds_list_find_value(global.party,3)._max_hp;
				} else {
					global.hp[3] = 0;
				}
				break;
			case 1:
				if ( global.mp[3] > 0) {
					global.mp[3] -= 1;
					ds_list_find_value(global.party,3)._max_mp -= (10 * ds_list_find_value(global.party,3)._lvl);
					global.skill_points[3] += 1;
					ds_list_find_value(global.party,3)._mp = ds_list_find_value(global.party,3)._max_mp;
				} else {
					global.mp[3] = 0;
				}
				break;
			case 2:
				if ( ds_list_find_value(global.party,3)._str > 0) {
					ds_list_find_value(global.party,3)._str -= 1;
					global.skill_points[3] += 1;
				} else {
					ds_list_find_value(global.party,3)._str = 0;
				}
				break;
			case 3:
				if ( ds_list_find_value(global.party,3)._agi > 0) {
					ds_list_find_value(global.party,3)._agi -= 1;
					global.skill_points[3] += 1;
				} else {
					ds_list_find_value(global.party,3)._agi = 0;
				}
				break;
			case 4:
				if ( ds_list_find_value(global.party,3)._dex > 0) {
					ds_list_find_value(global.party,3)._dex -= 1;
					global.skill_points[3] += 1;
				} else {
					ds_list_find_value(global.party,3)._dex = 0;
				}
				break;
			case 5:
				if ( ds_list_find_value(global.party,3)._int > 0) {
					ds_list_find_value(global.party,3)._int -= 1;
					global.skill_points[3] += 1;
				} else {
					ds_list_find_value(global.party,3)._int = 0;
				}
				break;
			case 6:
				if ( ds_list_find_value(global.party,3)._fai > 1) {
					ds_list_find_value(global.party,3)._fai-= 1;
					global.skill_points[3] += 1;
				} else {
					ds_list_find_value(global.party,3)._fai = 0;
				}
				break;
			case 7:
				if ( ds_list_find_value(global.party,3)._spd > 1) {
					ds_list_find_value(global.party,3)._spd -= 1;
					global.skill_points[3] += 1;
				} else {
					ds_list_find_value(global.party,3)._spd = 1;
				}
				break;
		}
	}
	break;
}



for (var i = 0; i < ds_list_size(global.party); i++) {
	if (ds_list_find_value(global.party,i)._xp >= ds_list_find_value(global.party,i)._max_xp) {
		ds_list_find_value(global.party,i)._lvl += 1;
		ds_list_find_value(global.party,i)._xp -= ds_list_find_value(global.party,0)._max_xp;
		ds_list_find_value(global.party,i)._max_xp = ds_list_find_value(global.party,i)._max_xp*1.5;
		global.skill_points[i] += 5;
	}
}






