sceneItems = {}

function love.load()  
  
end
 
function love.update(dt)
  for  k,v in pairs(sceneItems) do
    v:update(dt)
    if(v.delete) then
        table.remove(sceneItems, k)
    end
 end
end
 
function love.draw()
  for  k,v in pairs(sceneItems) do
  v:draw()
 end
end