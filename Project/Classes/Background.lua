local Actor = Actor or require "Lib/actor"
local Background = Actor:extend()


function Background:new()
  Background.super.new(self, "Resources/map/map.png", 0, 0, nil, nil, nil, 0, 0)
  
  self.sun = Actor:extend()
  self.sun:new("Resources/map/sun.png", -100,50 , 100)
  
  self.moon = Actor:extend()
  self.moon:new("Resources/map/luna.png", -100,60 , 100)
  
  self.night = Actor:extend()
  self.night:new("Resources/map/fondoNoche.png", 0, 0, nil, nil, nil, 0, 0)
  
  self.day = Actor:extend()
  self.day:new("Resources/map/fondoDia.png", 0, 0, nil, nil, nil, 0, 0)
  
  self.dayBrightness = 0
  self.nightBrightness = 1
  
end

function Background:update(dt)
  print(self.dayBrightness .. "  " .. self.nightBrightness)
  
  if(sceneItems.gameController.phase == 1) then
    self.sun:update(dt)
    self.moon.position.x = -100
       
   self.dayBrightness = math.min(self.dayBrightness + dt /3, 1)
   self.nightBrightness = math.max(self.nightBrightness - dt /3, 0)
    
  elseif(sceneItems.gameController.phase == 2) then
    self.moon:update(dt)
    self.sun.position.x = -100
    
    self.dayBrightness = math.max(self.dayBrightness - dt /3, 0)
   self.nightBrightness = math.min(self.nightBrightness + dt /3, 1)
  end
end

function Background:draw()
  love.graphics.setColor(255,255,255,self.dayBrightness)
  self.day:draw()      
  love.graphics.setColor(255,255,255,self.nightBrightness)
  self.night:draw()
  love.graphics.setColor(255,255,255,1)
    
  if(sceneItems.gameController.phase == 1) then
    self.sun:draw()
  elseif(sceneItems.gameController.phase == 2)then
    self.moon:draw()
  end
  
  Background.super.draw(self)
end 
  
  
return Background