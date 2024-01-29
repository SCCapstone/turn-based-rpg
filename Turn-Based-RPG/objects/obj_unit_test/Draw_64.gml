draw_set_font(fnt_pixeloid);

draw_text_relative("Function:          " + funct, c_white, .2, 1)
draw_text_relative("Parameters:     " + param, c_white, .2, 3)

draw_text_relative("Test Case 1:     calculate_damage(Archer, dmg_slash, 100): ", c_white, .2, 6)
print_test_result(calculate_damage(global.enemies.archer, "slash", 100), 57, .2, 8)

draw_text_relative("Test Case 2:     calculate_damage(Dark Knight, dmg_slash, 100): ", c_white, .2, 11)
print_test_result(calculate_damage(global.enemies.knightEnemy, "slash", 100), 48, .2, 13)

draw_text_relative("Test Case 3:     calculate_damage(Archer, dmg_pierce, 100): ", c_white, .2, 16)
print_test_result(calculate_damage(global.enemies.archer, "pierce", 100), 74, .2, 18)

draw_text_relative("Test Case 4:     calculate_damage(Dark Knight, dmg_pierce, 100): ", c_white, .2, 21)
print_test_result(calculate_damage(global.enemies.knightEnemy, "pierce", 100), 68, .2, 23)

draw_text_relative("Test Case 5:     calculate_damage(Archer, dmg_null, 100): ", c_white, .2, 26)
print_test_result(calculate_damage(global.enemies.archer, "null", 100), 0, .2, 28)

draw_text_relative("Test Case 6:     calculate_damage(Dark Knight, dmg_null, 100): ", c_white, .2, 31)
print_test_result(calculate_damage(global.enemies.knightEnemy, "null", 100), 0, .2, 33)

draw_text_relative("Test Case 7:     calculate_damage(Archer, dmg_slash, 0): ", c_white, .2, 36)
print_test_result(calculate_damage(global.enemies.archer, "slash", 0), 0, .2, 38)

draw_text_relative("Test Case 8:     calculate_damage(Dark Knight, dmg_pierce, 0): ", c_white, .2, 41)
print_test_result(calculate_damage(global.enemies.knightEnemy, "pierce", 0), 0, .2, 43)
