require ("logicgame")

whichButton = 0

--bomb = love.graphics.newImage("1.jpg")

function DrawMainPole(  )
	love.graphics.setColor(130, 130, 130)

	--разделение на две части (ввод данных и вывод результатов)
	love.graphics.rectangle("fill", 50, 50, 320, 500)
	love.graphics.rectangle("fill", 430, 50, 320, 500)

	--love.graphics.draw(bomb, 50, 100)
	-- отрисовка игровых кнопок
	love.graphics.setColor(130, 0, 130)
	--вверхние кнопки
	if whichButton == 1 then love.graphics.setColor(130, 130, 0) else love.graphics.setColor(130, 0, 130) end
	love.graphics.rectangle("fill", 60, 150, 60, 20)
	if whichButton == 1 then love.graphics.setColor(0, 130, 0) else love.graphics.setColor(130, 0, 0) end
	love.graphics.polygon( "fill", 60, 170, 120, 170, 90, 150 )

	if whichButton == 2 then love.graphics.setColor(130, 130, 0) else love.graphics.setColor(130, 0, 130) end
	love.graphics.rectangle("fill", 140, 150, 60, 20)
	if whichButton == 2 then love.graphics.setColor(0, 130, 0) else love.graphics.setColor(130, 0, 0) end
	love.graphics.polygon( "fill", 140, 170, 200, 170, 170, 150 )

	if whichButton == 3 then love.graphics.setColor(130, 130, 0) else love.graphics.setColor(130, 0, 130) end
	love.graphics.rectangle("fill", 220, 150, 60, 20)
	if whichButton == 3 then love.graphics.setColor(0, 130, 0) else love.graphics.setColor(130, 0, 0) end
	love.graphics.polygon( "fill", 220, 170, 280, 170, 250, 150 )

	if whichButton == 4 then love.graphics.setColor(130, 130, 0) else love.graphics.setColor(130, 0, 130) end
	love.graphics.rectangle("fill", 300, 150, 60, 20)
	if whichButton == 4 then love.graphics.setColor(0, 130, 0) else love.graphics.setColor(130, 0, 0) end
	love.graphics.polygon( "fill", 300, 170, 360, 170, 330, 150 )

	--числа
	love.graphics.setColor(130, 0, 130)
	love.graphics.rectangle("fill", 60, 190, 60, 60)
	love.graphics.rectangle("fill", 140, 190, 60, 60)
	love.graphics.rectangle("fill", 220, 190, 60, 60)
	love.graphics.rectangle("fill", 300, 190, 60, 60)

	--нижние кнопки
	if whichButton == 5 then love.graphics.setColor(130, 130, 0) else love.graphics.setColor(130, 0, 130) end
	love.graphics.rectangle("fill", 60, 270, 60, 20)
	if whichButton == 5 then love.graphics.setColor(0, 130, 0) else love.graphics.setColor(130, 0, 0) end
	love.graphics.polygon( "fill", 60, 270, 120, 270, 90, 290 )

	if whichButton == 6 then love.graphics.setColor(130, 130, 0) else love.graphics.setColor(130, 0, 130) end
	love.graphics.rectangle("fill", 140, 270, 60, 20)
	if whichButton == 6 then love.graphics.setColor(0, 130, 0) else love.graphics.setColor(130, 0, 0) end
	love.graphics.polygon( "fill", 140, 270, 200, 270, 170, 290 )

	if whichButton == 7 then love.graphics.setColor(130, 130, 0) else love.graphics.setColor(130, 0, 130) end
	love.graphics.rectangle("fill", 220, 270, 60, 20)
	if whichButton == 7 then love.graphics.setColor(0, 130, 0) else love.graphics.setColor(130, 0, 0) end
	love.graphics.polygon( "fill", 220, 270, 280, 270, 250, 290 )

	if whichButton == 8 then love.graphics.setColor(130, 130, 0) else love.graphics.setColor(130, 0, 130) end
	love.graphics.rectangle("fill", 300, 270, 60, 20)
	if whichButton == 8 then love.graphics.setColor(0, 130, 0) else love.graphics.setColor(130, 0, 0) end
	love.graphics.polygon( "fill", 300, 270, 360, 270, 330, 290 )

	--кнопка ввода
	mainFont = love.graphics.newFont(40);
	love.graphics.setFont(mainFont);
	if CheckPlayerNumbers(  ) == true and whichButton == 9 and FinishGame == false then
		love.graphics.setColor(130, 130, 0)
	elseif CheckPlayerNumbers(  ) == true and FinishGame == false then
		love.graphics.setColor(130, 0, 130)
	else
		love.graphics.setColor(0, 0, 0)
	end
	love.graphics.rectangle("fill", 80, 350, 260, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print( "Enter", 160, 353)
	love.graphics.print( "Attempt: " .. Attempt, 70, 60)
	--love.graphics.print( number1 .. number2 .. number3 .. number4, 70, 460)

	--отрисовка таблицы
	love.graphics.setColor(180, 220, 120)
	love.graphics.rectangle("fill", 440, 60, 300, 480)

	love.graphics.setColor(220, 220, 220)
	love.graphics.rectangle("fill", 440, 60, 300, 30)

	love.graphics.setColor(0, 0, 0)
	--периметр
	love.graphics.line(440, 60, 440, 540)
	love.graphics.line(740, 60, 740, 540)
	--love.graphics.line(440, 60, 740, 60)
	--love.graphics.line(440, 540, 740, 540)

	love.graphics.line(540, 60, 540, 540)
	love.graphics.line(640, 60, 640, 540)

	for i=1,17 do
		love.graphics.line(440, 60+30*(i-1), 740, 60+30*(i-1))
	end


	mainFont2 = love.graphics.newFont(20);
	love.graphics.setFont(mainFont2);
	love.graphics.print( "Key", 470, 65)
	love.graphics.print( "Bulls", 565, 65)
	love.graphics.print( "Cows", 665, 65)
end

function UpdateButtons( x, y )
	if x > 60 and x < 120 and y > 150 and y < 170 then whichButton = 1 
	elseif x > 140 and x < 200 and y > 150 and y < 170 then whichButton = 2 
	elseif x > 220 and x < 280 and y > 150 and y < 170 then whichButton = 3
	elseif x > 300 and x < 360 and y > 150 and y < 170 then whichButton = 4
	elseif x > 60  and x < 120 and y > 270 and y < 290 then whichButton = 5 
	elseif x > 140 and x < 200 and y > 270 and y < 290 then whichButton = 6 
	elseif x > 220 and x < 280 and y > 270 and y < 290 then whichButton = 7
	elseif x > 300 and x < 360 and y > 270 and y < 290 then whichButton = 8
	elseif x > 80 and x < 340 and y > 350 and y < 400 then whichButton = 9
		else whichButton = 0
	end
end

function DrawGame( )
	love.graphics.setColor(0, 0, 0)
	mainFont3 = love.graphics.newFont(50);
	love.graphics.setFont(mainFont3);
	love.graphics.print( PlayerNumber1, 77, 195)
	love.graphics.print( PlayerNumber2, 157, 195)
	love.graphics.print( PlayerNumber3, 237, 195)
	love.graphics.print( PlayerNumber4, 317, 195)
end

function ClickButtons( x, y )
	if x > 60 and x < 120 and y > 150 and y < 170 then PlayerNumber1 = PlusToNumber( PlayerNumber1 )
	elseif x > 140 and x < 200 and y > 150 and y < 170 then PlayerNumber2 = PlusToNumber( PlayerNumber2 )
	elseif x > 220 and x < 280 and y > 150 and y < 170 then PlayerNumber3 = PlusToNumber( PlayerNumber3 )
	elseif x > 300 and x < 360 and y > 150 and y < 170 then PlayerNumber4 = PlusToNumber( PlayerNumber4 )
	elseif x > 60  and x < 120 and y > 270 and y < 290 then PlayerNumber1 = MinusToNumber( PlayerNumber1 )
	elseif x > 140 and x < 200 and y > 270 and y < 290 then PlayerNumber2 = MinusToNumber( PlayerNumber2 )
	elseif x > 220 and x < 280 and y > 270 and y < 290 then PlayerNumber3 = MinusToNumber( PlayerNumber3 )
	elseif x > 300 and x < 360 and y > 270 and y < 290 then PlayerNumber4 = MinusToNumber( PlayerNumber4 )
	elseif x > 80 and x < 340 and y > 350 and y < 400 and CheckPlayerNumbers(  ) == true and FinishGame == false then EnterKey( )
		else whichButton = 0
	end
end

function DrawTable( )
	love.graphics.setColor(0, 0, 0)
	love.graphics.setFont(mainFont2);
	for i=1,CountSizeTable do
		love.graphics.print( Table[i].keyTable, 465, 65+30*i)
		love.graphics.print( Table[i].bullTable, 575, 65+30*i)
		love.graphics.print( Table[i].cowTable, 675, 65+30*i)
	end
end