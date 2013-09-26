require("Actions")
require("getScriptFilename")
vrjLua.appendToModelSearchPath(getScriptFilename())
dofile(vrjLua.findInModelSearchPath([[scripts/simpleLights.lua]]))
dofile(vrjLua.findInModelSearchPath([[scripts/Drawing.lua]]))

local function enableDrawing()
	mydraw = DrawingTool{}
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