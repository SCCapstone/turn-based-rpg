//Character constructor to hold the name and level
function Character(_name, _lvl) constructor {
	name = _name;
	level = _lvl;
	
	stats = noone;
}

//Player constructor holds xp, starting stats, and max stats
function Player(_name, _lvl, _xp, _initial_stats, _ending_stats) : Character(_name, _lvl) constructor {
	xp = _xp;
	// Max xp placeholder value
	xp_max = 60;
	stat_points = 0;
	initial_stats = _initial_stats;
	ending_stats = _ending_stats;
	actor = noone;
	
	//Holds the starting stats and the change in stats
	static initialize_stats = function() {
		stats = new Stats(
			initial_stats[STAT.HP],
			initial_stats[STAT.MP],
			initial_stats[STAT.STR],
			initial_stats[STAT.AGIL],
			initial_stats[STAT.ENDU],
			initial_stats[STAT.CC],
			initial_stats[STAT.SPD]) 
	}
	initialize_stats();
	
	// Level up method and adds stat points
	if (xp >= xp_max) {
		xp = 0;
		xp_max = 60 * _lvl;
		stat_points += 2;
	}
	
	//Function for putting stat points into different stats
	/*function allocate_add(stat) {
		if (stat_points > 0) {
			switch (stat) {
				case STAT.HP:
					stats.hp += 1;
					break;
				case STAT.MP:
					stats.mp += 1;
					break;
				case STAT.STR:
                    stats.str += 1;
                    break;
                case STAT.AGIL:
                    stats.agil += 1;
                    break;
                case STAT.ENDU:
                    stats.endu += 1;
                    break;
                case STAT.CC:
                    stats.cc += 1;
                    break;
                case STAT.SPD:
                    stats.spd += 1;
                    break;
			}
			stat_points -= 1;
			return stats;
		}
	}
	function allocate_minus(stat) {
		switch (stat) {
			case STAT.HP:
				stats.hp -= 1;
				break;
			case STAT.MP:
				stats.mp -= 1;
				break;
			case STAT.STR:
                    stats.str -= 1;
                    break;
                case STAT.AGIL:
                    stats.agil -= 1;
                    break;
                case STAT.ENDU:
                    stats.endu -= 1;
                    break;
                case STAT.CC:
                    stats.cc -= 1;
                    break;
                case STAT.SPD:
                    stats.spd -= 1;
                    break;
			}
			stat_points += 1;
			return stats;
	}*/
}