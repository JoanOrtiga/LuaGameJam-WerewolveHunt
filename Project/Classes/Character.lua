local Actor = Actor or require "Lib/actor"
local Character = Actor:extend()

local control = {{up = "up", down = "down", left = "left", right = "right"}, { up = "w", down = "s", right = "d", left = "a"}}

function Character:new(player, posX, posY,fx,fy)
  Character.super.new(self, "Resources/charSample.png", posX, posY, 0,fx,fy)
  self.player = player or 1
self.angleSpeed = 3
self.maxSpeed = 250
end

function Character:update(dt)
  if(love.keyboard.isDown(control[self.player].up)) then
           self.speed = self.speed + 10;
           if(self.speed >= self.maxSpeed) then
              self.speed = self.maxSpeed
          end
  elseif love.keyboard.isDown(control[self.player].down) then

    self.speed = self.speed - 10;
  else
    
     self.speed = self.speed - 200 * dt
  end
  
     if(self.speed <= 0) then
      self.speed = 0
    end

  Character.super.update(self,dt)

  
  if love.keyboard.isDown(control[self.player].left) then
    self.rot = self.rot - self.angleSpeed * dt
    self.forward.x = math.cos(self.rot)
    self.forward.y = math.sin(self.rot)
  elseif love.keyboard.isDown(control[self.player].right) then
    self.rot = self.rot + self.angleSpeed * dt
    self.forward.x = math.cos(self.rot)
    self.forward.y = math.sin(self.rot)
  end
end

function Character:write()
  Character.super.draw(self)
end 
  
  
return Character