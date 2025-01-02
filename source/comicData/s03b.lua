-- This example uses the renderCondition property to show how vars
-- can be used to conditionally render layers

-- see s03a for an example of using vars with a custom render function


local beepSound = playdate.sound.sampleplayer.new("audio/beep")
local dropSound = playdate.sound.sampleplayer.new("audio/drop")

-- `updateFunction` runs every frame
-- while the panel is on screen
local function checkForInput() 
	if playdate.buttonJustPressed(Panels.Input.B) then
		if Panels.vars.hasKey then
			-- drop the key
			dropSound:play()
			Panels.vars.hasKey = false
		else
			-- pick up the key
			beepSound:play()
			Panels.vars.hasKey = true
		end
	end
end

-- `targetSequenceFunction` runs when the sequence ends 
-- to determine which sequence to go to next
local function getTargetSequence() 
	if Panels.vars.hasKey then
		return "game-won"
	else 
		return "dead-end"
	end
end



s03 = { 
	title = "Secret room",
	id = "secret-room",
	panels = {
		{ -- panel 1
			layers = {
				{ text = "You found a secret room...", x = 50, y = 100 },
			},
		},
		{ -- panel 2
			layers = {
				{ text = "*Press B*", x = 50, y = 150 },
				
				-- use the renderCondition to draw different text layers \
				-- depending on the value of "hasKey"
				{ text = "To drop your key", x = 50, y = 180, renderCondition = { var = "hasKey", value = true } },
				{ text = "To pick up key", x = 50, y = 180, renderCondition = { var = "hasKey", value = false } },
				
				-- use the renderCondition to only draw this layer if "hasKey" is false
				{ image = "key", renderCondition = { var = "hasKey", value = false } },
			},
			updateFunction = checkForInput
		},
		{ -- panel 3
			layers = {
				{ text = "Another locked door...", x = 50, y = 100 }
			},
			targetSequenceFunction = getTargetSequence
		}
	}
}