up_key = keyboard_check_pressed(ord("W"))
down_key = keyboard_check_pressed(ord("S"));
left_key = keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(ord("D"));

/*
 When P is pressed as long as the current room is not the access menu or the world 
 map the player object will be unable to receive inputs and the stats screen will appear.
 If the world map is the current room the pointer object will be unable to receive inputs instead.
 If P is pressed again the stats screen will disappear and the respective object will be allowed 
 to receive inputs.
*/
if (keyboard_check_pressed(ord("P")) && room != rm_world_map && room != rm_access_menu) {
	show_stats = !show_stats;
	obj_player._disabled = !obj_player._disabled;
} else if (keyboard_check_pressed(ord("P")) && room == rm_world_map) {
	show_stats = !show_stats;
	obj_pointer._disabled = !obj_pointer._disabled;
} 


if (!show_stats) exit;

/*
 When the show stats variable switches from false to true the code below will run
*/
if (keyboard_check_pressed(ord("O"))) {
	pos2 += 1;
}
if (pos2 >= party_switch) {
	pos2 = 0;
}
if (pos2 < 0) {
	pos2 = party_switch - 1;
}

pos += down_key - up_key;

if (pos >= op_length) {
	pos = 0;
}

if (pos < 0) {
	pos = op_length - 1;
}


// adds a skill point to the respective stat and reduces the skill point number by 1
switch (pos2) {
	case 0:
		if (right_key && skill_points[0] > 0) {
		/*character[0].allocate_add(selection);
		character[0].stat_points -= 1;*/
		switch (pos) {
			case 0:
				hp += 1; // value to show the points in the hp stat
				new_hp = hp/10; // convets the stat into a percentage
				global.party[0]._max_hp += round(global.party[0]._max_hp * new_hp); // adds that percentage to the base hp stat
				//global.party[0]._max_hp += 1;
				global.party[0]._hp = global.party[0]._max_hp; // sets current health to the new max
				break;
			case 1:
				mp += 1;
				new_mp = mp/10;
				global.party[0]._max_mp += round(global.party[0]._max_mp * new_mp);
				//global.party[0]._max_mp += 1;
				global.party[0]._mp = global.party[0]._max_mp
				break;
			case 2:
				global.party[0]._str += 1;
				break;
			case 3:
				global.party[0]._agi += 1;
				break;
			case 4:
				global.party[0]._dex += 1;
				break;
			case 5:
				global.party[0]._int += 1;
				break;
			case 6:
				global.party[0]._spd += 1;
				break;
		}
		skill_points[0] -= 1;
	}

	// removes points from respective stat and increases skill points
	// Certain stats such as Hp, Mp, and Spd will be unable to be lower than 1 and as such will be
	// unable to grant a skill point when trying to go under 1
	if (left_key) {
		//character[0].allocate_minus(selection);
		switch (pos) {
			case 0:
				if ( hp > 0) {
					hp -= 1;
					new_hp = hp/10;
					global.party[0]._max_hp -= round(global.party[0]._max_hp * new_hp);
					//global.party[0]._max_hp -= 1;
					skill_points[0] += 1;
					global.party[0]._hp = global.party[0]._max_hp;
				} else {
					hp = 0;
				}
				break;
			case 1:
				if ( mp > 0) {
					mp -= 1;
					new_mp = mp/10;
					global.party[0]._max_mp -= round(global.party[0]._max_mp * new_mp);
					//global.party[0]._max_mp -= 1;
					skill_points[0] += 1;
					global.party[0]._mp = global.party[0]._max_mp;
				} else {
					mp = 0;
				}
				break;
			case 2:
				if ( global.party[0]._str > 0) {
					global.party[0]._str -= 1;
					skill_points[0] += 1;
				} else {
					global.party[0]._str = 0;
				}
				break;
			case 3:
				if ( global.party[0]._agi > 0) {
					global.party[0]._agi -= 1;
					skill_points[0] += 1;
				} else {
					global.party[0]._agi = 0;
				}
				break;
			case 4:
				if ( global.party[0]._dex > 0) {
					global.party[0]._dex -= 1;
					skill_points[0] += 1;
				} else {
					global.party[0]._dex = 0;
				}
				break;
			case 5:
				if ( global.party[0]._int > 0) {
					global.party[0]._int -= 1;
					skill_points[0] += 1;
				} else {
					global.party[0]._int = 0;
				}
				break;
			case 6:
				if ( global.party[0]._spd > 1) {
					global.party[0]._spd -= 1;
					skill_points[0] += 1;
				} else {
					global.party[0]._spd = 1;
				}
				break;
		}
	}
	break;
	case 1:
		if (right_key && skill_points[1] > 0) {
		/*character[0].allocate_add(selection);
		character[0].stat_points -= 1;*/
		switch (pos) {
			case 0:
				hp2 += 1; // value to show the points in the hp stat
				new_hp2 = hp2/10; // convets the stat into a percentage
				global.party[1]._max_hp += round(global.party[1]._max_hp * new_hp2); // adds that percentage to the base hp stat
				//global.party[0]._max_hp += 1;
				global.party[1]._hp = global.party[1]._max_hp; // sets current health to the new max
				break;
			case 1:
				mp2 += 1;
				new_mp2 = mp2/10;
				global.party[1]._max_mp += round(global.party[1]._max_mp * new_mp2);
				//global.party[0]._max_mp += 1;
				global.party[1]._mp = global.party[1]._max_mp
				break;
			case 2:
				global.party[1]._str += 1;
				break;
			case 3:
				global.party[1]._agi += 1;
				break;
			case 4:
				global.party[1]._dex += 1;
				break;
			case 5:
				global.party[1]._int += 1;
				break;
			case 6:
				global.party[1]._spd += 1;
				break;
		}
		skill_points[1] -= 1;
	}

	// removes points from respective stat and increases skill points
	// Certain stats such as Hp, Mp, and Spd will be unable to be lower than 1 and as such will be
	// unable to grant a skill point when trying to go under 1
	if (left_key) {
		//character[0].allocate_minus(selection);
		switch (pos) {
			case 0:
				if ( hp2 > 0) {
					hp2 -= 1;
					new_hp2 = hp2/10;
					global.party[1]._max_hp -= round(global.party[1]._max_hp * new_hp2);
					//global.party[0]._max_hp -= 1;
					skill_points[1] += 1;
					global.party[1]._hp = global.party[1]._max_hp;
				} else {
					hp2 = 0;
				}
				break;
			case 1:
				if ( mp2 > 0) {
					mp2 -= 1;
					new_mp2 = mp2/10;
					global.party[1]._max_mp -= round(global.party[1]._max_mp * new_mp2);
					//global.party[0]._max_mp -= 1;
					skill_points[1] += 1;
					global.party[1]._mp = global.party[1]._max_mp;
				} else {
					mp2 = 0;
				}
				break;
			case 2:
				if ( global.party[1]._str > 0) {
					global.party[1]._str -= 1;
					skill_points[1] += 1;
				} else {
					global.party[1]._str = 0;
				}
				break;
			case 3:
				if ( global.party[1]._agi > 0) {
					global.party[1]._agi -= 1;
					skill_points[1] += 1;
				} else {
					global.party[1]._agi = 0;
				}
				break;
			case 4:
				if ( global.party[1]._dex > 0) {
					global.party[1]._dex -= 1;
					skill_points[1] += 1;
				} else {
					global.party[1]._dex = 0;
				}
				break;
			case 5:
				if ( global.party[1]._int > 0) {
					global.party[1]._int -= 1;
					skill_points[1] += 1;
				} else {
					global.party[1]._int = 0;
				}
				break;
			case 6:
				if ( global.party[1]._spd > 1) {
					global.party[1]._spd -= 1;
					skill_points[1] += 1;
				} else {
					global.party[1]._spd = 1;
				}
				break;
		}
	}
	break;
	case 2:
		if (right_key && skill_points[2] > 0) {
		/*character[0].allocate_add(selection);
		character[0].stat_points -= 1;*/
		switch (pos) {
			case 0:
				hp3 += 1; // value to show the points in the hp stat
				new_hp3 = hp3/10; // convets the stat into a percentage
				global.party[2]._max_hp += round(global.party[2]._max_hp * new_hp3); // adds that percentage to the base hp stat
				//global.party[0]._max_hp += 1;
				global.party[2]._hp = global.party[2]._max_hp; // sets current health to the new max
				break;
			case 1:
				mp3 += 1;
				new_mp3 = mp3/10;
				global.party[2]._max_mp += round(global.party[2]._max_mp * new_mp3);
				//global.party[0]._max_mp += 1;
				global.party[2]._mp = global.party[2]._max_mp
				break;
			case 2:
				global.party[2]._str += 1;
				break;
			case 3:
				global.party[2]._agi += 1;
				break;
			case 4:
				global.party[2]._dex += 1;
				break;
			case 5:
				global.party[2]._int += 1;
				break;
			case 6:
				global.party[2]._spd += 1;
				break;
		}
		skill_points[2] -= 1;
	}

	// removes points from respective stat and increases skill points
	// Certain stats such as Hp, Mp, and Spd will be unable to be lower than 1 and as such will be
	// unable to grant a skill point when trying to go under 1
	if (left_key) {
		//character[0].allocate_minus(selection);
		switch (pos) {
			case 0:
				if ( hp3 > 0) {
					hp3 -= 1;
					new_hp3 = hp3/10;
					global.party[2]._max_hp -= round(global.party[2]._max_hp * new_hp3);
					//global.party[0]._max_hp -= 1;
					skill_points[2] += 1;
					global.party[2]._hp = global.party[2]._max_hp;
				} else {
					hp3 = 0;
				}
				break;
			case 1:
				if ( mp3 > 0) {
					mp3 -= 1;
					new_mp3 = mp3/10;
					global.party[2]._max_mp -= round(global.party[2]._max_mp * new_mp3);
					//global.party[0]._max_mp -= 1;
					skill_points[2] += 1;
					global.party[2]._mp = global.party[2]._max_mp;
				} else {
					mp3 = 0;
				}
				break;
			case 2:
				if ( global.party[2]._str > 0) {
					global.party[2]._str -= 1;
					skill_points[2] += 1;
				} else {
					global.party[2]._str = 0;
				}
				break;
			case 3:
				if ( global.party[2]._agi > 0) {
					global.party[2]._agi -= 1;
					skill_points[2] += 1;
				} else {
					global.party[2]._agi = 0;
				}
				break;
			case 4:
				if ( global.party[2]._dex > 0) {
					global.party[2]._dex -= 1;
					skill_points[2] += 1;
				} else {
					global.party[2]._dex = 0;
				}
				break;
			case 5:
				if ( global.party[2]._int > 0) {
					global.party[2]._int -= 1;
					skill_points[2] += 1;
				} else {
					global.party[2]._int = 0;
				}
				break;
			case 6:
				if ( global.party[2]._spd > 1) {
					global.party[2]._spd -= 1;
					skill_points[2] += 1;
				} else {
					global.party[2]._spd = 1;
				}
				break;
		}
	}
	break;
	case 3:
		if (right_key && skill_points[3] > 0) {
		/*character[0].allocate_add(selection);
		character[0].stat_points -= 1;*/
		switch (pos) {
			case 0:
				hp4 += 1; // value to show the points in the hp stat
				new_hp4 = hp4/10; // convets the stat into a percentage
				global.party[3]._max_hp += round(global.party[3]._max_hp * new_hp4); // adds that percentage to the base hp stat
				//global.party[0]._max_hp += 1;
				global.party[3]._hp = global.party[3]._max_hp; // sets current health to the new max
				break;
			case 1:
				mp4 += 1;
				new_mp4 = mp4/10;
				global.party[3]._max_mp += round(global.party[3]._max_mp * new_mp4);
				//global.party[0]._max_mp += 1;
				global.party[3]._mp = global.party[3]._max_mp
				break;
			case 2:
				global.party[3]._str += 1;
				break;
			case 3:
				global.party[3]._agi += 1;
				break;
			case 4:
				global.party[3]._dex += 1;
				break;
			case 5:
				global.party[3]._int += 1;
				break;
			case 6:
				global.party[3]._spd += 1;
				break;
		}
		skill_points[3] -= 1;
	}

	// removes points from respective stat and increases skill points
	// Certain stats such as Hp, Mp, and Spd will be unable to be lower than 1 and as such will be
	// unable to grant a skill point when trying to go under 1
	if (left_key) {
		//character[0].allocate_minus(selection);
		switch (pos) {
			case 0:
				if ( hp4 > 0) {
					hp4 -= 1;
					new_hp4 = hp4/10;
					global.party[3]._max_hp -= round(global.party[3]._max_hp * new_hp4);
					//global.party[0]._max_hp -= 1;
					skill_points[3] += 1;
					global.party[3]._hp = global.party[3]._max_hp;
				} else {
					hp4 = 0;
				}
				break;
			case 1:
				if ( mp4 > 0) {
					mp4 -= 1;
					new_mp4 = mp4/10;
					global.party[3]._max_mp -= round(global.party[3]._max_mp * new_mp4);
					//global.party[0]._max_mp -= 1;
					skill_points[3] += 1;
					global.party[3]._mp = global.party[3]._max_mp;
				} else {
					mp4 = 0;
				}
				break;
			case 2:
				if ( global.party[3]._str > 0) {
					global.party[3]._str -= 1;
					skill_points[3] += 1;
				} else {
					global.party[3]._str = 0;
				}
				break;
			case 3:
				if ( global.party[3]._agi > 0) {
					global.party[3]._agi -= 1;
					skill_points[3] += 1;
				} else {
					global.party[3]._agi = 0;
				}
				break;
			case 4:
				if ( global.party[3]._dex > 0) {
					global.party[3]._dex -= 1;
					skill_points[3] += 1;
				} else {
					global.party[3]._dex = 0;
				}
				break;
			case 5:
				if ( global.party[3]._int > 0) {
					global.party[3]._int -= 1;
					skill_points[3] += 1;
				} else {
					global.party[3]._int = 0;
				}
				break;
			case 6:
				if ( global.party[3]._spd > 1) {
					global.party[3]._spd -= 1;
					skill_points[3] += 1;
				} else {
					global.party[3]._spd = 1;
				}
				break;
		}
	}
	break;
}



for (var i = 0; i < array_length(global.party); i++) {
	if (global.party[i]._xp >= global.party[i]._max_xp) {
		global.party[i]._lvl += 1;
		global.party[i]._xp -= global.party[0]._max_xp;
		global.party[i]._max_xp = global.party[i]._max_xp*1.5;
		skill_points[i] += 5;
	}
}






