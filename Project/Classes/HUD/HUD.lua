local Actor = Actor or require ("Lib/actor")
local Score = Actor:extend()

function Score:new(points, life, increasingPoints)
  self.points = points
  self.life = life
  self.increasingPoints = increasingPoints
end

function Score:update(dt)
end

function Score:draw()
  love.graphics.setColor(0,0,0,100)
  love.graphics.print(sceneItems.gameController.player1Score, 10,5)
  love.graphics.print(sceneItems.gameController.player2Score, 750,5)
    love.graphics.setColor(255,255,255,100)

end

return Score
