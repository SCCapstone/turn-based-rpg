up_key = keyboard_check_pressed(ord("W"))
down_key = keyboard_check_pressed(ord("S"));
left_key = keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(ord("D"));

if (keyboard_check_pressed(ord("P"))) {
	show_stats = !show_stats;
	obj_player._disabled = !obj_player._disabled;
}

if (!show_stats) exit;

pos += down_key - up_key;

if (pos >= op_length) {
	pos = 0;
}

if (pos < 0) {
	pos = op_length - 1;
}


// adds a skill point to the respective stat and reduces the skill point number by 1
if (right_key && skill_points > 0) {
	/*character[0].allocate_add(selection);
	character[0].stat_points -= 1;*/
	switch (pos) {
		case 0:
			global.party[0]._max_hp += 1;
			global.party[0]._hp = global.party[0]._max_hp;
			break;
		case 1:
			global.party[0]._max_mp += 1;
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
			global.party[0]._spd += 1;
			break;
	}
	skill_points -= 1;
}

// removes points from respective stat and increases skill points
if (left_key) {
	//character[0].allocate_minus(selection);
	switch (pos) {
		case 0:
			if ( global.party[0]._max_hp > 1) {
				global.party[0]._max_hp -= 1;
				skill_points += 1;
				global.party[0]._hp = global.party[0]._max_hp;
			} else {
				global.party[0]._max_hp = 1;
			}
			break;
		case 1:
			if ( global.party[0]._max_mp > 1) {
				global.party[0]._max_mp -= 1;
				skill_points += 1;
				global.party[0]._mp = global.party[0]._max_mp;
			} else {
				global.party[0]._max_mp = 1;
			}
			break;
		case 2:
			if ( global.party[0]._str > 0) {
				global.party[0]._str -= 1;
				skill_points += 1;
			} else {
				global.party[0]._str = 0;
			}
			break;
		case 3:
			if ( global.party[0]._agi > 0) {
				global.party[0]._agi -= 1;
				skill_points += 1;
			} else {
				global.party[0]._agi = 0;
			}
			break;
		case 4:
			if ( global.party[0]._dex > 0) {
				global.party[0]._dex -= 1;
				skill_points += 1;
			} else {
				global.party[0]._dex = 0;
			}
			break;
		case 5:
			if ( global.party[0]._spd > 0) {
				global.party[0]._spd -= 1;
				skill_points += 1;
			} else {
				global.party[0]._spd = 0;
			}
			break;
	}
}

if (global.party[0]._xp >= global.party[0]._max_xp) {
	global.party[0]._lvl++;
	global.party[0]._xp = 0;
	global.party[0]._max_xp = 100 * global.party[0]._lvl;
	skill_points += 10;
}






