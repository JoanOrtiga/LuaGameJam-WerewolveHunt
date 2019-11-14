local Actor = Actor or require "Lib/actor"
local GameController = Actor:extend()

local Human = Human or require "Classes/humans"
local Timer = Timer or require "Lib/timer"

enemiesSpawned = 0

function GameController:new()
  self.phase = 2
  self.timer = 10
  
  self.player1Score = 0
  self.player2Score = 0
  
  self.player1Hp = 0
  self.player2Hp = 0
  
  self.enemiesToSpawn = 4
  
  self.spawner = Timer(1, enemySpawn, true, self.enemiesToSpawn)
end

function GameController:update(dt)
  self.timer = self.timer - dt
  
  if(self.timer < 0) then
    enemiesSpawned = 0
    self.spawner = Timer(1, enemySpawn, true, self.enemiesToSpawn)
    self.timer = 10
    if(self.phase == 1) then
      self.phase = 2
    elseif(self.phase == 2) then
      self.enemiesToSpawn = self.enemiesToSpawn + 2
      self.phase = 1
    end
  end
  
  if(not(self.spawner == nil)) then
    self.spawner:update(dt)
  end
  
  if(self.player1Hp < 0 or self.player2Hp < 0) then
        GameManager:changeState("scoreScreen")
  end
end

function enemySpawn(enemiesToSpawn)
  if(enemiesSpawned < enemiesToSpawn) then
    enemiesSpawned = enemiesSpawned + 1
    local human = Human()
    table.insert(enemies, human)
  end
end

function GameController:draw()
end 
  
  
return GameController