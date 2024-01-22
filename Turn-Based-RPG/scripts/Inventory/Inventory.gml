// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// item types that can be in inventory 
enum Weapon {
	None,
	Sycthe,
	Sword,
	Hammer,
	Bow,
	Staff,
	Spear,
	Fists,
}

enum Armor {
	None,
	Light_Armor,
	Heavy_Armor,
	Mage_Robes,
}

enum Consumables {
	None,
	Healing_Potion,
	Mana_Potion,
	Antidote,
	Ointment,
	Hot_Tea	
}

function Inventory() constructor {
	_inventory = [6][10];
	_max_inventory = 60;
}