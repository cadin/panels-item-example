-- custom behavior

-- global variable that we'll update and read in our custom functions
hasKey = false

-- repurposing the `advanceFunction` here
-- this is normally used to determine whether a panel should advance,
-- but since this function runs every frame, we can use it to check for input
-- without needing to render the panel ourself
local function checkForInput() 
	if playdate.buttonJustPressed(Panels.Input.A) then
		hasKey = true
	end
end

-- the `targetSequenceFunction` returns the next sequence to advance to
-- we can use our global var to determine if they should go to sequence 2 or 3
local function getTargetSequence() 
	if hasKey then
		return 3
	else
		return 2
	end
end



-- comic data for the SEQUENCE
s01 = { 
	title = "A key and a door",
	panels = {
		{ -- panel 1
			layers = {
				{ text = "Press A", x = 50, y = 100 },
				{ text = "To pick up key", x = 50, y = 130 }
			},
			
			advanceFunction = checkForInput
		},
		{ -- panel 6
			layers = {
				{ text = "A locked door...", x = 50, y = 100 }
			},
			targetSequenceFunction = getTargetSequence
		}
	}
}