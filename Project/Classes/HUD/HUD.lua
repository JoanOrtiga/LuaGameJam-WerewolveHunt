local Score = object:extend()

function Score:new(points, life, increasingPoints)
  points = Points
  life = Life
  increasingPoints = IncreasingPoints
end

function Score:update(dt)
  if (Collision()) then
    Points = Points + IncreasingPoints
  end
end

function Score:draw()
  love.graphics.print(points, pointsW, pointH)
end