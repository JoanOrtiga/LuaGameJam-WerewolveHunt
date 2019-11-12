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
  love.graphics.print(points, pointsW, pointH)
end