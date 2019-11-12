local Actor = Actor or require "Lib/actor"
local GameController = Actor:extend()


function GameController:new()
  self.phase = 2
end

function GameController:update(dt)
  
end

function GameController:draw()
end 
  
  
return GameController