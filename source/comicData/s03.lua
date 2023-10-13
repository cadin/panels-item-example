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
		return 4
	else 
		return 2
	end
end


-- `renderFunction` is responsible for drawing every layer in the panel
-- we can make that slightly easier by using `Panels.renderLayerInPanel`
-- to do the heavy lifting
local function renderPanel2(panel, offset)
	-- loop through every layer in the panel
	for i, layer in ipairs(panel.layers) do
		
		-- update the text on the "instructions" layer
		if layer.name == "instructions" then
			if Panels.vars.hasKey then
				layer.text = "To drop your key"
			else
				layer.text = "To pick up key"
			end
		end
		
		-- conditionally render the "key" layer
		if layer.name == "key" and Panels.vars.hasKey == true then 
			-- don't render the key layer if the user has the key
		else
			-- render the layer with parallax etc.
			Panels.renderLayerInPanel(layer, panel, offset)
		end
	end
	
end

s03 = { 
	title = "Secret room",
	panels = {
		{ -- panel 1
			layers = {
				{ text = "You found a secret room...", x = 50, y = 100 },
			},
		},
		{ -- panel 2
			layers = {
				{ text = "*Press B*", x = 50, y = 150 },
				{ name="instructions", text = "To drop your key", x = 50, y = 180 },
				
				-- note the "name" properties here
				-- I use those to figure out which layer I'm dealing with in my renderFunction
				{ name="key", image = "key" },
			},
			renderFunction = renderPanel2,
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