local Actor = Actor or require ("Lib/actor")
local Score = Actor:extend()

function Score:new(points, life)
  Score.super.new(self,"Resources/corazon.png")
  self.points = points
  self.life = 3
  self.increasingPoints = increasingPoints
end

function Score:update(dt)
end

function Score:draw()
  love.graphics.print(sceneItems.gameController.player1Score, 10,10)
  love.graphics.print(sceneItems.gameController.player2Score, 790,10,nil,nil,nil,font04:getWidth(sceneItems.gameController.player2Score))

  love.graphics.print(sceneItems.gameController.player1Hp, 10,130)
  love.graphics.print(sceneItems.gameController.player2Hp, 790,130,nil,nil,nil,font04:getWidth(sceneItems.gameController.player2Hp))

  xx = 150
  ox = self.origin.x
  yy = 40
  oy = self.origin.y
  sx = 1
  sy = 1
  rr = self.rot
  
  
  
 --[[  if (life == 3) then 
      love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
      xx = 210
      love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
      xx = 270
      love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
   end
   
    if (life == 2) then 
      love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
      xx = 210
      love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)

   end
   
    if (life == 1) then 
      love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
   end
   
   if(life ==0) then
     
   end
   ]]
 
  


end

return Score
