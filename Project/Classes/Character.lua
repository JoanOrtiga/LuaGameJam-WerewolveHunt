local Actor = Actor or require "Lib/actor"
local Character = Actor:extend()

local control = {{up = "up", down = "down", left = "left", right = "right"}, { up = "w", down = "s", right = "d", left = "a"}}
local sprite = {"Resources/W01.png", "Resources/W02.png"}

function Character:new(player, posX, posY,fx,fy)
  Character.super.new(self, sprite[player], posX, posY, 0,fx,fy,nil,nil, 1.3,1.3)
self.angleSpeed = 3
self.player = player
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
    
     self.speed = self.speed - 150 * dt
  end
  
     if(self.speed <= 0) then
      self.speed = 0
    end
    
  Character.limit(self)  

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
  
  
  if(sceneItems.gameController.phase == 2) then
  for k,v in pairs(enemies) do
    if(Character.super.intersect(self, v)) then
      if(self.player == 1) then
        sceneItems.gameController.player1Score = sceneItems.gameController.player1Score + 10
        sceneItems.gameController.player1Hp = sceneItems.gameController.player1Hp + 10
        v.delete = true
      elseif(self.player == 2) then
        sceneItems.gameController.player2Score = sceneItems.gameController.player2Score + 10
        sceneItems.gameController.player2Hp = sceneItems.gameController.player2Hp + 10
        v.delete = true
      end
    end
  end
  end
end

function Character:write()
  Character.super.draw(self)
end 
  
  
function Character:limit()
  if(self.position.x > love.graphics.getWidth() - (self.image:getWidth() / 2)) then
    self.position.x = love.graphics.getWidth()  - (self.image:getWidth() / 2)
  end
  if(self.position.x  < 0 + (self.image:getWidth() / 2)) then
    self.position.x = 0 + (self.image:getWidth() / 2)
  end
  
  if(self.position.y > love.graphics.getHeight() - (self.image:getHeight() / 2)) then
    self.position.y = love.graphics.getHeight() - (self.image:getHeight() / 2)
  end
  
  if(self.position.y < 200 + (self.image:getHeight() / 2)) then
    self.position.y = 200 + (self.image:getHeight() / 2)
  end
end
  
return Character