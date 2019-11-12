--HUD
font01 = love.graphics.newFont("HUD/snow.ttf", 70)
font02 = love.graphics.newFont("HUD/frosty.ttf", 70)
font03 = love.graphics.newFont("HUD/snowflake.ttf", 70)
font04 = love.graphics.newFont("HUD/blocks.ttf", 70)
font05 = love.graphics.newFont("HUD/snowtt.ttf", 70)
font06 = love.graphics.newFont("HUD/SnowForSanta.ttf", 70)
font07 = love.graphics.newFont("HUD/BlackSanta.ttf", 70)
font08 = love.graphics.newFont("HUD/christmas.ttf", 70)

love.graphics.setFont(font01)

points = 0
increasingPoints = 1
pointsW, pointsH = w/10, h/5*4

life = 3
--heartFull = love.grahics.newImage(image or "")
--heartEmpty = love.grahics.newImage(image or "")