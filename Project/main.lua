sceneItems = {}
enemies = {}
HUD = {}

local Char = Char or require("Classes/Character")
local Human = Human or require("Classes/Humans")
local GameController = GameController or require("Classes/GameController")
local Background = Background or require ("Classes/Background")
local ScoreHUD = ScoreHUD or require ("Classes/HUD/HUD")

function love.load()  
  require "Data/data"
  local background = Background()
  BackGround = background
  
  local gameController = GameController()
  sceneItems.gameController = gameController
  
  local char1 = Char(1, 100, 100)
  sceneItems.char1 = char1
  
  local char2 = Char(2, 100, 700)
  sceneItems.char2 = char2
  
  local human = Human(1)
  table.insert(enemies, human)
  
  local score = ScoreHUD()
  table.insert(HUD, score)
end
 
function love.update(dt)
  for  k,v in pairs(sceneItems) do
    v:update(dt)
    if(v.delete) then
        table.remove(sceneItems, k)
    end
 end
 
 for  k,v in pairs(enemies) do
    v:update(dt)
    if(v.delete) then
        table.remove(enemies, k)
    end
 end
end
 
function love.draw()
  BackGround:draw()
  
  for  k,v in pairs(sceneItems) do
  v:draw()
 end
 
 for  k,v in pairs(enemies) do
  v:draw()
 end
 
  for  k,v in pairs(HUD) do
  v:draw()
 end
end