-- Whack the mole in love2D 
-- Author : DK Lee 
-- 2016. 3. 17. 


Moles = {} 
mole1 = {x = 70, y = 50, image = love.graphics.newImage("whack-a-mole.png"), isAlive = false, await = math.random(100, 200), life = math.random(100, 200) } 
mole2 = {x = 320, y = 50, image = love.graphics.newImage("whack-a-mole.png"), isAlive = false, await = math.random(300, 500), life = math.random(100, 200) } 
mole3 = {x = 570, y = 50, image = love.graphics.newImage("whack-a-mole.png"), isAlive = false, await = math.random(200, 500), life = math.random(100, 200) } 
mole4 = {x = 70, y = 300, image = love.graphics.newImage("whack-a-mole.png"), isAlive = false, await = math.random(100, 600), life = math.random(100, 200) } 
mole5 = {x = 320, y = 300, image = love.graphics.newImage("whack-a-mole.png"), isAlive = false, await = math.random(200, 300), life = math.random(100, 200) }
mole6 = {x = 570, y = 300, image = love.graphics.newImage("whack-a-mole.png"), isAlive = false, await = math.random(150, 600), life = math.random(100, 200) }

score = 0 

snd_Hit = {} 
for i=1, 8 do 
  local snd_source = i..".mp3"
  snd_Hit[i] = love.audio.newSource(snd_source)
end 
-- await setting
await_min = 350
await_max = 600


function love.load()
  
  cursor = love.mouse.newCursor("mole_hammer.png", 0, 0)
  love.mouse.setCursor(cursor)
  bgImage = love.graphics.newImage("background.png")
  hole = love.graphics.newImage("hole.png") 
  
  table.insert(Moles, mole1)
  table.insert(Moles, mole2) 
  table.insert(Moles, mole3)
  table.insert(Moles, mole4)
  table.insert(Moles, mole5)
  table.insert(Moles, mole6)
  
end


function love.update(dt) 
  for i, m in ipairs(Moles) do 
    if m.isAlive == false then 
     m.await = m.await - 1 
    elseif m.isAlive == true then 
      m.life = m.life - 1  
    end 
    
    if m.await <= 0 then 
      m.isAlive = true 
    end 
    
    if m.life <= 0 then 
      score = score - 1
      m.isAlive = false  
      m.life = math.random(150, 200)
      m.await = math.random(await_min, await_max)
    end
    
  end
  
  if await_min > 50 then 
   await_min = await_min - score
  end
  
  if await_min > 100 then 
   await_max = await_max - score 
  end
   
end


function love.mousepressed(x, y, button) 
  for i, m in ipairs(Moles) do 
    if m.isAlive == true then 
      if (x >= m.x)  and x < (m.x + m.image:getWidth()) and (y >= m.y) and y < (m.y + m.image:getHeight()) then 
        m.isAlive = false   
        m.await = math.random(await_min, await_max)
        m.life = math.random(150, 200)
        score = score + 1
        local iSound = math.random(1, 5)
        love.audio.play(snd_Hit[iSound])
      end
    end 
  end  
end


function love.draw()
  
  -- background drawing 
  love.graphics.draw(bgImage, 0, 0)
  
  -- hole drawing 
  love.graphics.draw(hole, 50, 100)
  love.graphics.draw(hole, 300, 100)
  love.graphics.draw(hole, 550, 100)
  love.graphics.draw(hole, 50, 400)  
  love.graphics.draw(hole, 300, 400)   
  love.graphics.draw(hole, 550, 400)
  
  -- popuping the moles 
  for i, m in ipairs(Moles) do     
    if m.isAlive == true then 
      love.graphics.draw(m.image, m.x, m.y)
    end  
  end 
  
  love.graphics.print("Score : "..score, 600, 30)
end


