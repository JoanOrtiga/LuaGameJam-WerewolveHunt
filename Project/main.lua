sceneItems = {}

local HUD = HUD or require ("Classes/HUD/HUD")
local Char = Char or require("Classes/Character")
local Human = Human or require("Classes/Humans")
local GameController = GameController or require("Classes/GameController")

function love.load()  
  local gameController = GameController()
  sceneItems.gameController = gameController
  
  local hud = HUD(points, life)
  seceneItems.hud = hud
  
  local char1 = Char(1, 100, 100)
  sceneItems.char1 = char1
  
  local char2 = Char(2, 100, 700)
  sceneItems.char2 = char2
  
  local human = Human(1)
  table.insert(sceneItems, human)
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