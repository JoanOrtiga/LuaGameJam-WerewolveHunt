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
  love.graphics.setColor(0,0,0,100)
  love.graphics.print(sceneItems.gameController.player1Score, 10,5)
  love.graphics.print(sceneItems.gameController.player2Score, 750,5)
  love.graphics.setColor(255,255,255,100)



  xx = 150
  ox = self.origin.x
  yy = 40
  oy = self.origin.y
  sx = 1
  sy = 1
  rr = self.rot
  
  
  
   if (life == 3) then 
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
   
 
  


end

return Score
