local widget = require("widget")

--I like to create a table of border diemensions at the beginning to help with code repitition
local screen = {
	left = display.screenOriginX,
	top = display.screenOriginY,
	right = display.contentWidth - display.screenOriginX,
	bottom = display.contentHeight - display.screenOriginY,
	middleX = display.contentWidth * 0.5,
	middleY = display.contentHeight * 0.5,
    width = display.contentWidth,
    height = display.contentHeight,
}

--list of names to choose from
local names = {
	"randomname1",
	"randomname2",
	"randomname3",
	"randomname4",
	"randomname5",
}


--create the name text object
local name = display.newText("", 0, 0, native.systemFont, 40)
name.x = screen.middleX
name.y = screen.middleY
name.isVisible = false


--[[
--requires ParticleCandy library
--
Particles = require("lib_particle_candy")
Properties = {}
Properties.imagePath = "star-particle.png" --explosion
Properties.imageWidth		= 20	
Properties.imageHeight		= 20	
Properties.velocityStart	= 100	
Properties.velocityVariation	= 30
Properties.velocityChange	= 0
Properties.directionVariation	= 360
Properties.alphaStart		= 1		
Properties.alphaVariation	= 0		
Properties.fadeInSpeed		= 0	
Properties.fadeOutSpeed		= -.4
Properties.fadeOutDelay		= .5	
Properties.scaleStart		= 1
Properties.scaleVariation	= 0
Properties.scaleInSpeed		= 0
Properties.weight		= 0	
Properties.autoOrientation 	= true	
Properties.rotationVariation	= 360
Properties.killOutsideScreen	= true	
Properties.lifeTime		= 4000  
Properties.useEmitterRotation	= true
Properties.emissionShape	= 0
Properties.emissionRadius	= 25
Properties.blendMode		= "add"
Properties.colorChange		= {-100,-100,-100}
Particles.CreateParticleType("ExplosionDust", Properties)        
Particles.CreateEmitter("Explosion", display.contentWidth * 0.5, display.contentHeight * 0.5, 0, false, false)
Particles.AttachParticleType("Explosion", "ExplosionDust", 50, 0, 0) --20 --50
Particles.SetEmitterTarget("exp", name, true, 0, 0, 0)
--]]
--
local function explode()
   --requires ParticleCandy library
	--	Particles.StartEmitter("Explosion", true)
end

--generates a random name and assigns it to the name object.
local function generateRandomName()
	local val = names[math.random(#names)]
	name.text = val
	explode()
	name.isVisible = true
end

--event handler for button
local function handleButtonEvent(event)
	if(event.phase == "ended") then
		generateRandomName()
	end
	return true
end

local button = widget.newButton({
    width = 200,
    height = 50,
    id = "button_1",
    label = "Random Name",
    onEvent = handleButtonEvent,
})
button.x = screen.middleX
button.y = screen.bottom - 75

local function updateParts()
	--requires ParticleCandy library
	--Particles.Update()
end

Runtime:addEventListener("enterFrame", updateParts)

