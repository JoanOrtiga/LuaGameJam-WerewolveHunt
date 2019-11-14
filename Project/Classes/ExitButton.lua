local Actor = Actor or require "Lib/actor"
local ExitButton = Actor:extend()

function ExitButton:new()
  ExitButton.super.new(self,"Resources/menu/exit.png",love.graphics.getWidth()/2, 700)
end

function ExitButton:update(dt)
  local z = {}
  z.position = {}
  z.position.x = love.mouse.getX()
  z.position.y = love.mouse.getY()
  z.width = 1
  z.height = 1
  
  if(love.mouse.isDown(1) and ExitButton.super.intersect(self, z))then
    os.exit()
  end
end

function ExitButton:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return ExitButton