up_key = keyboard_check_pressed(ord("W"))
down_key = keyboard_check_pressed(ord("S"));
left_key = keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(ord("D"));

if (up_key) {
	selection -= 1;
	if (selection < 0) {
		selection = 6;
	}
}
if (down_key) {
	selection += 1;
	if (selection > 6) {
		selection = 0;
	}
}

// adds a skill point to the respective stat and reduces the skill point number by 1
if (right_key && skill_points > 0) {
	switch (selection) {
		case 0:
			character[0].stats.hp += 1;
			break;
		case 1:
			character[0].stats.mp += 1;
			break;
		case 2:
			character[0].stats.str += 1;
			break;
		case 3:
			character[0].stats.agil += 1;
			break;
		case 4:
			character[0].stats.endu += 1;
			break;
		case 5:
			character[0].stats.cc += 1;
			break;
		case 6:
			character[0].stats.spd += 1;
			break;
	}
	skill_points -= 1;
}

// removes points from respective stat and increases skill points
if (left_key) {
	switch (selection) {
		case 0:
			character[0].stats.hp -= 1;
			break;
		case 1:
			character[0].stats.mp -= 1;
			break;
		case 2:
			character[0].stats.str -= 1;
			break;
		case 3:
			character[0].stats.agil -= 1;
			break;
		case 4:
			character[0].stats.endu -= 1;
			break;
		case 5:
			character[0].stats.cc -= 1;
			break;
		case 6:
			character[0].stats.spd -= 1;
			break;
	}
	skill_points += 1;
}

function getUpdatedStats() {  // Supposed to update the chararcter stats 
	                          // so the new stats can be called in PartyData
							  // currently not working
	return character[0].stats;
}

if keyboard_check_pressed(ord("P")) {
    instance_destroy(obj_stats_screen); // Close the stats screen when "P" is pressed
}





