local Object = Object or require("lib/object")
local HUD = Object:extend()

function HUD:new(points, life, increasingPoints)
  points = Points
  life = Life
  increasingPoints = IncreasingPoints
end

function HUD:update(dt)
  if (Collision()) then
    Points = Points + IncreasingPoints
  end
end

function HUD:draw()
  love.graphics.print(points, pointsW, pointH)
end