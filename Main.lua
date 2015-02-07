require("AddAppDirectory")
AddAppDirectory()

runfile[[scripts/simpleLights.lua]]
runfile[[scripts/Drawing.lua]]
runfile[[scripts/Navigation.lua]]

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

local function CenterTransformAtPosition(xform, pos)
	local bound = xform:getBound()
	return Transform{
		position = -bound:center() + Vec(unpack(pos)),
		xform,
	}
end

local skydome = Transform{
	scale = .01,
	position = {0,-5,0},
	Model[[models/skydome.ive]],
}

local ground = CenterTransformAtPosition(Transform{
	scale = 10,
	Model[[models/grass.ive]],
},{0,-.09,0})

enableDrawing()

RelativeTo.World:addChild(skydome)
RelativeTo.World:addChild(ground)
RelativeTo.World:addChild(RoomModel)