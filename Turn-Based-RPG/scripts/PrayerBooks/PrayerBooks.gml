function prayer_books(){
global.prayer_books =
	{
		scroll: 
		{
			_name: "Prayer Scroll",
			_luck: 25, // Chance in % that an extra turn will be added to a prayer's duration
			_sprite: spr_prayer_slip
		},
		book: 
		{
			_name: "Holy Book",
			_luck: 50,
			_sprite: spr_prayer_book
		}
	}
}
