local Actor = Actor or require "Lib/actor"
local Human = Actor:extend()


function Human:new(player)
  Human.super.new(self, "Resources/man01.png", -10, -10, 180, 0,0, nil, nil, 1.4,1.4)
   Human.randomSpawn(self)
  
  self.timer = 3
end

function Human:update(dt)
  if(sceneItems.gameController.phase == 1) then
    Human.super.update(self,dt)
    Human.chasing(self)
  elseif(sceneItems.gameController.phase == 2) then
    Human.super.update(self,dt)
    Human.scaping(self,dt)
  end
end

function Human:write()
  Human.super.draw(self)
end 

function Human:randomSpawn()
  local sentit = math.random(1,2)
  
  if(sentit == 1)then
    local dreta_esquerra = math.random (1,2)
    
    if(dreta_esquerra == 1) then
      self.forward.x = -1
      self.forward.y = 0

      self.position.x = 800
      self.position.y = math.random(210,990)
    elseif(dreta_esquerra == 2) then
      self.forward.x = 1
      self.forward.y = 0
      
      self.position.x = 0
      self.position.y = math.random(210,990)
    end
  elseif(sentit == 2) then
      --self.forward.x = 0
      self.forward.y = -1
      
      self.position.x = math.random(10,790)
      self.position.y = 1000
    
    
  end
end

function Human:scaping(dt)
  self.timer = self.timer - dt

  if(self.timer < 0) then
    self.rot = math.random(360)
    self.forward.x = math.cos(self.rot)
    self.forward.y = math.sin(self.rot)
    self.timer = 2
  end
  
  
  self.rot = math.acos(self.forward.x)
  
  if(self.timer < 2) then
  if(self.position.x > love.graphics.getWidth())then
    self.position.x = 4
  elseif(self.position.x < 0) then
    self.position.x = love.graphics.getWidth() - 4
  elseif(self.position.y < 200) then
    self.position.y = love.graphics.getHeight() -4
  elseif(self.position.y > love.graphics.getHeight()) then
    self.position.y = 204
  end
  end
end

function Human:chasing()
  local dist1 = sceneItems.char1.position.distance(sceneItems.char1.position, self.position)
  local dist2 = sceneItems.char2.position.distance(sceneItems.char2.position, self.position)

  if(dist1 <= dist2) then
    Human.chaseEnemy(self, sceneItems.char1.position)
  elseif(dist2 < dist1) then
    Human.chaseEnemy(self, sceneItems.char2.position)
  end
  
  if(Human.super.intersect(self,sceneItems.char1)) then
    sceneItems.gameController.player1Hp = sceneItems.gameController.player1Hp - 5
    self.delete = true
  elseif(Human .super.intersect(self, sceneItems.char2)) then
    self.delete = true
        sceneItems.gameController.player2Hp =     sceneItems.gameController.player2Hp - 5


  end  
end


function Human:chaseEnemy(b)
  local angle = math.atan2((b.x - self.position.x), (b.y - self.position.y)) 
  
    self.rot = -(angle)
		self.forward.x = math.sin(angle)
		self.forward.y = math.cos(angle)
end

return Human


