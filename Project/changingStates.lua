local HUD = HUD or require ("Classes/HUD/HUD")
local Char = Char or require("Classes/Character")
local Human = Human or require("Classes/Humans")
local GameController = GameController or require("Classes/GameController")
local Background = Background or require ("Classes/Background")
local ScoreHUD = ScoreHUD or require ("Classes/HUD/HUD")
local PlayButton = PlayButton or require ("Classes/PlayButton")


function onMenuEnter()
  local playButton = PlayButton()
  table.insert(sceneItems, playButton)
end

function onMenuExit()
  for k,v in pairs(sceneItems) do
    table.remove(sceneItems, k)
  end
end

function onPlayEnter()
  local background = Background()
  BackGround = background
  
  local gameController = GameController()
  sceneItems.gameController = gameController
  
  local char1 = Char(1, 400, 460)
  sceneItems.char1 = char1
  
  local char2 = Char(2, 400, 540)
  sceneItems.char2 = char2
  
  local human = Human(1)
  table.insert(enemies, human)
  
  local score = ScoreHUD()
  table.insert(HUD, score)
end

function onPlayExit()
   for k,v in ipairs(sceneItems) do
    table.remove(sceneItems, k)
  end
  
  for k,v in pairs(HUD) do
    table.remove(HUD, k)
  end
  
  sceneItems.char1 = nil
  sceneItems.char2 = nil
  sceneItems.gameController = nil
end

function onScoreEnter()
  --local score = ScoreHUD()
  --table.insert(sceneItems, score)
end

function onScoreExit()
   for k,v in pairs(sceneItems) do
    table.remove(sceneItems, k)
  end
end