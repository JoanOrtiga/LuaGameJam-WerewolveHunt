local Actor = Actor or require "Lib/actor"
local ScoreScreen = Actor:extend()

function ScoreScreen:new()
  ScoreScreen.super.new(self,"Resources/menu/exit.png",love.graphics.getWidth()/2, 700)
end

local change = false

function ScoreScreen:update(dt)
  local z = {}
  z.position = {}
  z.position.x = love.mouse.getX()
  z.position.y = love.mouse.getY()
  z.width = 1
  z.height = 1
  
  if(love.mouse.isDown(1) and ScoreScreen.super.intersect(self, z))then
    change = true
  end
  
  if(love.mouse.isDown(1) == false and change == true) then
    change = false
        GameManager:changeState("menu")

  end
end

function ScoreScreen:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  
  if(scores[3] == 1) then
    love.graphics.print("Player 2 WINS", love.graphics.getWidth() / 2/2, 100)
  elseif(scores[3] == 2) then
    love.graphics.print("Player 1 WINS",  love.graphics.getWidth() / 2 / 2, 100)
  end
  
  love.graphics.print("Player 1", 100, 400)
  love.graphics.print("Player 2", 600, 400, nil, nil, nil, font04:getWidth("Score: "))
  
   love.graphics.print("Score: " .. scores[1], 100, 450)
  love.graphics.print("Score: "  .. scores[2], 630, 450, nil, nil, nil, font04:getWidth("Score: " .. scores[2]))
end

return ScoreScreen