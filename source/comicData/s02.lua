-- COMIC DATA 
-- user ends up here if they progress past the locked door with no key

s02 = { 
	-- sequence 1
	title = "Dead End",	
	id = "dead-end",  -- we use this id to specify this sequence as a target from other sequences
	endSequence = true,
	
	panels = {
		{ -- panel 1 
			advanceControl = Panels.Input.A,
			layers = {
				{ text = "The door is locked.", x = 50, y = 70 },
				{ text = "Too bad you don't have a key...", x = 50, y = 100 },
			}
		},
		{ -- panel 2
			layers = {
				{ text = "The end", x = 50, y = 100 }
			}
		}

	}
}
