local Actor = Actor or require "Lib/actor"
local PlayButton = Actor:extend()

function PlayButton:new()
  PlayButton.super.new(self,"Resources/menu/play.png",love.graphics.getWidth()/2,love.graphics.getHeight()/2)
end

function PlayButton:update(dt)
  local z = {}
  z.position = {}
  z.position.x = love.mouse.getX()
  z.position.y = love.mouse.getY()
  z.width = 1
  z.height = 1
  
  if(love.mouse.isDown(1) and PlayButton.super.intersect(self, z))then
    GameManager:changeState("play")
  end
end

function PlayButton:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return PlayButton