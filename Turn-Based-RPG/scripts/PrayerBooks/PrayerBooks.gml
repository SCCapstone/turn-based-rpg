function prayer_books(){
global.prayer_books =
	{
		scroll: 
		{
			_name: "Prayer Scroll",
			_luck: 25, // Chance in % that an extra turn will be added to a prayer's duration
			_sprite: spr_prayer_slip,
			_description: "A scroll containing holy sacraments. Has a small chance to increase a casted prayer's duration.",
			_item_type: item_type.prayer_book
		},
		book: 
		{
			_name: "Holy Book",
			_luck: 50,
			_sprite: spr_prayer_book,
			_description: "A holy text, hand-copied by monks from centuries ago. Has a modest chance to increase a casted prayer's duration.",
			_item_type: item_type.prayer_book
		}
	}
}
