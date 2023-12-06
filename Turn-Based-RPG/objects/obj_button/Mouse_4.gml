if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) {
    switch (button_text) {
        case "New Game":
            // Start a new game 
            break;

        case "Continue":
            // Continue game 
            break;

        case "Quit":
            game_end(); // Quit the game
            break;
    }
}




