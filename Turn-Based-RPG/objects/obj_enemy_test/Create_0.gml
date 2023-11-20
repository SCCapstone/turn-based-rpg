/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

state = ENEMY_STATE.WANDER;

// script
enemy_script[ENEMY_STATE.WANDER] = enemy_wander;
enemy_script[ENEMY_STATE.CHASE] = enemy_chase;