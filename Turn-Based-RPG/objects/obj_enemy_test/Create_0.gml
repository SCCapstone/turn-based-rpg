/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();
spr_move = spr_archer;

state = ENEMY_STATE.ROAM;

// script
enemy_script[ENEMY_STATE.ROAM] = enemy_roaming;
enemy_script[ENEMY_STATE.CHASE] = enemy_chase;