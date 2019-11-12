Object = Object or require "Lib/object"
Timer = Object:extend()

function Timer:new(time, fun, rp)
  self.f = fun
  self.tAct = time
  self.tFin = time
  self.rep = rp
end

function Timer:update(dt)
  self.tAct = self.tAct - dt
  
  if(self.tAct < 0) then 
    self.f()
    
    if self.rep == true then
      self.tAct = self.tFin
      
    else
      for k, v in pairs(actorList) do 
        if v == self then
          e = k
        end
      end 
      
      if(e~=nil) then
        table.remove(actorList,e)
      end
    end
  end
  
end

function Timer:draw()
  return
end

return Timer