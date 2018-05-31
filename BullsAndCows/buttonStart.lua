require ("logicgame")

rezhim1 = false
rezhim2 = false
rezhim3 = false

function DrawAllButtons( rezhim1, rezhim2, rezhim3 )
	mainFontS = love.graphics.newFont(30);
	love.graphics.setFont(mainFontS);
	if rezhim1 == true then
		DrawButtonNewGame( true )
	else
		DrawButtonNewGame( false )
	end
	if rezhim2 == true then
		DrawButtonLoadGame( true )
	else
		DrawButtonLoadGame( false )
	end
	if rezhim3 == true then
		DrawButtonExitGame( true )
	else
		DrawButtonExitGame( false )
	end
end

function UpdateMenuButton( x, y )
	--for startgame
	if x > 50 and x < 750 and y > 300 and y < 350 then
		rezhim1 = true
	else
		rezhim1 = false
	end

	if x > 50 and x < 750 and y > 400 and y < 450 then
		rezhim2 = true
	else
		rezhim2 = false
	end

	if x > 50 and x < 750 and y > 500 and y < 550 then
		rezhim3 = true
	else
		rezhim3 = false
	end
end

function DrawButtonNewGame( rezhim )
	if rezhim == true then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 300, 700, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("EASY GAME", 320, 310) 
end

function DrawButtonLoadGame( rezhim )
	if rezhim == true then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 400, 700, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("HARD GAME", 320, 410) 
end

function DrawButtonExitGame( rezhim )
	if rezhim == true then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 500, 700, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("EXIT", 370, 510) 
end

function MousePressedButtons( x, y )
	if x > 50 and x < 750 and y > 300 and y < 350 then
		hardmode = false
		return true
	end

	if x > 50 and x < 750 and y > 400 and y < 450 then
		hardmode = true
		return true
	end

	if x > 50 and x < 750 and y > 500 and y < 550 then
		love.event.quit()
	end
	return false
end