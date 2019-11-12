local Actor = Actor or require "Lib/actor"
local GameController = Actor:extend()


function GameController:new()
  self.phase = 2
  self.timer = 4
  
  self.player1Score = 0
  self.player2Score = 0
end

function GameController:update(dt)
  self.timer = self.timer - dt
  
  if(self.timer < 0) then
    self.timer = 4
    if(self.phase == 1) then
      self.phase = 2
    elseif(self.phase == 2) then
      self.phase = 1
    end
  end
end

function GameController:draw()
end 
  
  
return GameController