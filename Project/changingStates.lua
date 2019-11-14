local HUD = HUD or require ("Classes/HUD/HUD")
local Char = Char or require("Classes/Character")
local Human = Human or require("Classes/Humans")
local GameController = GameController or require("Classes/GameController")
local Background = Background or require ("Classes/Background")
local MenuBackground = MenuBackground or require ("Classes/MenuBackground")
local ScoreHUD = ScoreHUD or require ("Classes/HUD/HUD")
local PlayButton = PlayButton or require ("Classes/PlayButton")
local ExitButton = ExitButton or require ("Classes/ExitButton")
local ScoreScreen = ScoreScreen or require ("Classes/scoreScreen")


function onMenuEnter()
  local playButton = PlayButton()
  table.insert(sceneItems, playButton)
  
  local exitButton = ExitButton()
  table.insert(sceneItems, exitButton)
  
   local background = MenuBackground()
  BackGround = background
end

function onMenuExit()
  for k,v in pairs(sceneItems) do
    table.remove(sceneItems, k)
  end
  
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
  
   for k,v in ipairs(enemies) do
    table.remove(enemies, k)
  end
  
  for k,v in pairs(HUD) do
    table.remove(HUD, k)
  end
  
  scores = {}
  scores[1] = sceneItems.gameController.player1Score
  scores[2] = sceneItems.gameController.player2Score
  
  if(sceneItems.gameController.player1Hp < sceneItems.gameController.player2Hp) then
    scores[3] = 1
  else
    scores[3] = 2
  end
  
  sceneItems.char1 = nil
  sceneItems.char2 = nil
  sceneItems.gameController = nil
end

function onScoreEnter()
  local background = MenuBackground()
  BackGround = background
  
  local scoreScreen = ScoreScreen()
  table.insert(sceneItems, scoreScreen)
end

function onScoreExit()
   for k,v in pairs(sceneItems) do
    table.remove(sceneItems, k)
  end
end