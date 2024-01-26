width = 0;
height = 0;

// The margins around all text in the object
op_border = 8;
// The space between each line of text
op_space = 16;
// The longest a line of text can be before wrapping around
op_margin = 1280;

// The text that is displayed. Note: Text wrap is not a thing.
// Each line of text must be defined separately and each object must be resized manually
option[0] = "Map menu";
option[1] = "Battle";
option[2] = "Quit game";

// The length of the array, stored for ease of access
op_length = array_length(option);

pos = 0;