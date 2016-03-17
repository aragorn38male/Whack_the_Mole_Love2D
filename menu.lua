ingame_menu = {}
ingame_menu.selection = 1
menu = {} 
snd_blip = love.audio.newSource("blip.wav")   

lg = love.graphics

function menu:update() 
  -- keyboard input 
	local down = love.keyboard.isDown
	if down("up")	  then 
      if ingame_menu.selection > 1 then 
      ingame_menu.selection = ingame_menu.selection-1
		  love.audio.play(snd_blip)
      end 
  end
	if down("down")	then 
    if ingame_menu.selection < 2 then 
      ingame_menu.selection = ingame_menu.selection+1
		  love.audio.play(snd_blip)
      end  
  end
	if down("escape") then state = "game" end
  if down("return") then 
       if ingame_menu.selection == 1 then
            state = "game"
           --  playSound("confirm")
          elseif ingame_menu.selection == 2 then
            love.event.quit()
       end       
  end
  
end 



-- Menu Window 
function menu:draw()

	-- ingame.draw()
  -- love.graphics.pop()

	lg.setColor(0,0,0,238)
	lg.rectangle("fill", winW/2 - 150, winH/2 - 150, 300, 300)
	lg.setColor(255,255,255,255)
	lg.printf("PAUSED", winW/2 - 50, winH/2 - 100, 92, "center")
	lg.print("RESUME", winW/2 - 50, winH/2 - 50)
	lg.print("QUIT", winW/2 - 50, winH/2)
	lg.print(">", winW/2 - 100, winH/2 - 100 + ingame_menu.selection*50)
  
	-- love.graphics.push()
end