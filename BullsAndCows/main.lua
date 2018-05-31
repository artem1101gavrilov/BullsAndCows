
function love.load()
	math.randomseed( os.time() )
	love.window.setMode(800, 600)
	love.graphics.setBackgroundColor( 43, 77, 168 )

	require ("drawscena")
	require ("logicgame")
	require("buttonStart")
	GenerationKey(  )

	isStartMenu = true
	isGame = false

end
 
function love.update(dt)
	local x, y = love.mouse.getPosition() -- get the position of the mouse
	if FinishGame == false and isGame == true then UpdateButtons( x, y ) end
	if isStartMenu == true then UpdateMenuButton( x, y ) end
end
 

function love.keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
	if key == "r" then
		Obnulenie(  )
		love.load()
	end
end 

function love.mousepressed(x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
   if button == 1 then
   		if FinishGame == false and isGame == true then ClickButtons( x, y ) end
   		if isStartMenu == true then 
   			local click = MousePressedButtons( x, y )
   			if click == true then 
   				isStartMenu = false
				isGame = true
   			end
   		end
   end
end

function love.draw()
	if isStartMenu == true then DrawAllButtons( rezhim1, rezhim2, rezhim3 ) end
	if isGame == true then 
		DrawMainPole(  )
		DrawGame( )
		DrawTable( )
	end
end