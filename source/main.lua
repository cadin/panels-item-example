-- IMPORT:
-- Panels is included as a submodule in this repo
-- if you don't see any files in libraries/panels  
-- you may need to initialize the submodule
import "libraries/panels/Panels"

-- CREDITS:
-- edit the table inside `credits.lua`
-- to create your game credits
import "gameCredits.lua"
Panels.credits = gameCredits

-- COMIC DATA:
-- add data to the table in this file to create your comic
import "comicData/s01.lua"
import "comicData/s02.lua"
-- import "comicData/s03a.lua"
import "comicData/s03b.lua"
import "comicData/s04.lua"

local comicData = {
	s01,
	s02,
	s03,
	s04
}

-- SETTINGS:
-- change any settings before calling `start()`
Panels.Settings.showMenuOnLaunch = true

-- set this to false to retain global vars after user completes the game (default is true)
-- Panels.Settings.resetVarsOnGameOver = false


-- START:
-- send the data table of your comic (or an example above) to the `start()` command
Panels.start(comicData)