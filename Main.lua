require("Actions")
require("getScriptFilename")
vrjLua.appendToModelSearchPath(getScriptFilename())
dofile(vrjLua.findInModelSearchPath([[scripts/simpleLights.lua]]))
dofile(vrjLua.findInModelSearchPath([[scripts/Drawing.lua]]))

dofile(vrjLua.findInModelSearchPath[[scripts/Navigation.lua]])
myNav = FlyOrWalkNavigation{
	start = "walking",
	switchButton = gadget.DigitalInterface("WMButtonPlus"),
	initiateRotationButton1 = gadget.DigitalInterface("WMButtonRight"),
	initiateRotationButton2 = gadget.DigitalInterface("WMButtonLeft"),
}


local function enableDrawing()
	mydraw = DrawingTool{metal=true}
	mydraw.metal = false
	mydraw:startDrawing()
end

local RoomModel = Transform{
	position = {-5,0,2.5},
	Model([[models/room.ive]])
}

local scale = 100
local Skybox = Transform{
	scale = scale,
	position = {-5*scale,-5*scale,5*scale},
	Transform{
		Model([[models/skybox.ive]]),
	}
}


enableDrawing()

RelativeTo.World:addChild(Skybox)

RelativeTo.World:addChild(RoomModel)