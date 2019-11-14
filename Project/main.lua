sceneItems = {}
enemies = {}
HUD = {}

require "Lib/FSM/StateMachine"
require "changingStates"
require "Data/data"

math.randomseed(os.clock())

function love.load()  
  
  GameManager = StateMachine()
  
  GameManager:addState("null",{  });
	GameManager:addState("menu",{ enter= onMenuEnter, exit= onMenuExit, from="scoreScreen"});
	GameManager:addState("play",{ enter= onPlayEnter, exit= onPlayExit, from="menu"});
  GameManager:addState("scoreScreen",{ enter= onScoreEnter, exit= onScoreExit, from="play"});
  GameManager:setInitialState("menu");
end
 
function love.update(dt)
  BackGround:update(dt)
  
  if(GameManager:currentState() == "play") then
  
 
  for  k,v in pairs(enemies) do
    v:update(dt)
    if(v.delete) then
        table.remove(enemies, k)
    end
  end 
end

for  k,v in pairs(sceneItems) do
    v:update(dt)
    if(v.delete) then
        table.remove(sceneItems, k)
    end
  end
end
 
function love.draw()
   BackGround:draw()
  
  if(GameManager:currentState() == "play") then

 
  for  k,v in pairs(enemies) do
    v:draw()
  end
 end
 for  k,v in pairs(sceneItems) do
  v:draw()
 end
 
  
  for  k,v in pairs(HUD) do
  v:draw()
  end
end