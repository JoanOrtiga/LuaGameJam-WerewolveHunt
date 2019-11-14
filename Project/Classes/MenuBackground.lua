local Actor = Actor or require "Lib/actor"
local Background = Actor:extend()

function Background:new()
  Background.super.new(self, "Resources/menu/MenuBack.png", 0, 0, nil, nil, nil, 0, 0)
end

function Background:update(dt)
end

function Background:draw()
  Background.super.draw(self)
  love.graphics.setFont(font05)
  
  love.graphics.print("Game Made by: Marina Chavarria, Joan Ortiga, Pol Serra, Julia Blasco", 175,780)
  
  love.graphics.setFont(font04)
end 
  
  
return Background