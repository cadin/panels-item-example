-- custom behavior

-- this function runs every frame, so we can use it to check for input
-- without needing to take over rendering the panel 
local function checkForInput() 
	if playdate.buttonJustPressed(Panels.Input.A) then
		Panels.vars.hasKey = true
	end
	return true
end

-- the `targetSequenceFunction` returns the next sequence to advance to
-- we can use our global var to determine if they should go to sequence 2 or 3
local function getTargetSequence() 
	if Panels.vars.hasKey then
		return 3
	else
		return 2
	end
end


-- Note: 
-- you _can_ use any global variable to store these values
-- putting them in Panels.vars ensures that they'll be saved to disk
-- and restored when the user comes back


-- comic data for the SEQUENCE
s01 = { 
	title = "A key and a door",
	panels = {
		{ -- panel 1
			layers = {
				{ text = "*Press A*", x = 50, y = 150 },
				{ text = "To pick up key", x = 50, y = 180 },
				
				{ image = "key", 
					animate = { -- animate the key image away when the user presses A
						opacity = 0,
						duration = 0,
						trigger = Panels.Input.A, 
						audio=  {file = "beep"}
					} 
				}
			},
			
			updateFunction = checkForInput
		},
		
		{ -- panel 2
			layers = {
				{ text = "A locked door...", x = 50, y = 100 },
			},
			targetSequenceFunction = getTargetSequence
		}
	}
}