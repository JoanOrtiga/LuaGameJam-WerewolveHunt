local Object = Object or require "Lib/object"
local Vector = Vector or require "Lib/vector"
local Actor = Object:extend()
Actor.position = Vector.new()

function Actor:new(image,x,y,speed,fx,fy, ox, oy, sx,sy)
    self.position = Vector.new(x or 0, y or 0)
    self.scale = Vector.new(sx or 1,sy or 1)
    self.forward = Vector.new(fx or 1,fy or 0)
    self.speed = speed or 30
    self.rot = 0
    self.image = love.graphics.newImage(image)
    self.origin = Vector.new(ox or self.image:getWidth()/2  , oy or self.image:getHeight()/2)
    self.height = self.image:getHeight()
    self.width  = self.image:getWidth()
    self.delete = false
end

function Actor:update(dt)
    self.position = self.position + self.forward * self.speed * dt
end

function Actor:draw()
    xx = self.position.x 
    ox = self.origin.x
    yy = self.position.y
    oy = self.origin.y
    sx = self.scale.x
    sy = self.scale.y
    rr = self.rot
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
    
end

function Actor.intersect(a, b)
    --With locals it's common usage to use underscores instead of camelCasing
    local ax = a.position.x - a.origin.x
    local ay = a.position.y - a.origin.y
    local aw = a.width
    local ah = a.height

    local bx = b.position.x
    local by = b.position.y
    local bw = b.width
    local bh = b.height

   if ax+aw > bx and ax < bx+bw and ay+ah > by and ay < by+bh then
        return true
    else
        return false
    end
end

 function Actor:keyPressed(key)
end

return Actor