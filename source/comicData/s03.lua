local function checkForInput() 
	if playdate.buttonJustPressed(Panels.Input.B) then
		hasItem = false
	end
end

local function getTargetSequence() 
	if hasItem then
		return 4
	else 
		return 2
	end
end

s03 = { 
	title = "Secret room",
	panels = {
		{ -- panel 1
			layers = {
				{ text = "A secret room...", x = 50, y = 100 },
			},
			
			advanceFunction = checkForInput
		},
		{ -- panel 2
			layers = {
				{ text = "*Press B*", x = 50, y = 100 },
				{ text = "To drop your key", x = 50, y = 130 }
			},
			
			advanceFunction = checkForInput
		},
		{ -- panel 3
			layers = {
				{ text = "Another locked door...", x = 50, y = 100 }
			},
			targetSequenceFunction = getTargetSequence
		}
	}
}