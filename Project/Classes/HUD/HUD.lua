local Object = Object or require("lib/object")
local HUD = Object:extend()

function HUD:new(points, life)
  points = Points
  life = Life
end

function HUD:update(dt)

end

function HUD:draw()
  love.graphics.print(points, pointsW, pointH)
end
