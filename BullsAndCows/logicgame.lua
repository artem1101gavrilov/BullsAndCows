number1 = -1
number2 = -1
number3 = -1
number4 = -1

PlayerNumber1 = 0
PlayerNumber2 = 0
PlayerNumber3 = 0
PlayerNumber4 = 0

Attempt = 0

FinishGame = false

CountSizeTable = 0
Table = {}

hardmode = true

function GenerationKey(  )
	number1 = math.random(0,9)
	local numberBUF = math.random(0,9)
	while true do
		if numberBUF == number1 then
			numberBUF = math.random(0,9)
		else break
		end
	end
	number2 = numberBUF
	while true do
		if numberBUF == number1 or  numberBUF == number2 then
			numberBUF = math.random(0,9)
		else break
		end
	end
	number3 = numberBUF
	while true do
		if numberBUF == number1 or  numberBUF == number2 or  numberBUF == number3 then
			numberBUF = math.random(0,9)
		else break
		end
	end
	number4 = numberBUF
end

function CheckPlayerNumbers(  )
	if PlayerNumber1 == PlayerNumber2 or PlayerNumber1 == PlayerNumber3 or PlayerNumber1 == PlayerNumber4 then
		return false
	end
	if PlayerNumber2 == PlayerNumber3 or PlayerNumber2 == PlayerNumber4 then
		return false
	end
	if PlayerNumber3 == PlayerNumber4 then
		return false
	end
	return true
end

function PlusToNumber( PlayerNumber )
	local x = ((PlayerNumber + 1)%10)
	return x
end

function MinusToNumber( PlayerNumber )
	local x = PlayerNumber - 1
	if x == -1 then x = 9 end
	return x
end

function EnterKey( )
	Attempt = Attempt + 1
	local bull = 0
	local cow = 0
	if PlayerNumber1 == number1 then bull = bull + 1 end
	if PlayerNumber2 == number2 then bull = bull + 1 end
	if PlayerNumber3 == number3 then bull = bull + 1 end
	if PlayerNumber4 == number4 then bull = bull + 1 end
	if  bull == 4 then 
		FinishGame = true
	end
	if PlayerNumber1 == number2 or PlayerNumber1 == number3 or PlayerNumber1 == number4  then cow = cow + 1 end
	if PlayerNumber2 == number1 or PlayerNumber2 == number3 or PlayerNumber2 == number4  then cow = cow + 1 end
	if PlayerNumber3 == number2 or PlayerNumber3 == number1 or PlayerNumber3 == number4  then cow = cow + 1 end
	if PlayerNumber4 == number2 or PlayerNumber4 == number1 or PlayerNumber4 == number3  then cow = cow + 1 end

	

	if CountSizeTable == 15 then
		table.remove(Table, 1)
	end
	point = { keyTable = tostring( PlayerNumber1 .. PlayerNumber2 .. PlayerNumber3 .. PlayerNumber4 );					
			  bullTable = bull;
			  cowTable = cow }					
	table.insert(Table, point)

	if CountSizeTable < 15 then CountSizeTable = CountSizeTable + 1 end

	if FinishGame == false and hardmode == true then HardGame(  ) end
end

function Obnulenie(  )
	PlayerNumber1 = 0
	PlayerNumber2 = 0
	PlayerNumber3 = 0
	PlayerNumber4 = 0
	GenerationKey(  )

	for i=1,CountSizeTable do
		table.remove(Table, 1)
	end
	Attempt = 0

	FinishGame = false

	CountSizeTable = 0
end

function HardGame(  )
	while true do
		local x = math.random(1,4)
		local y = math.random(1,2)
		local bufer = -1 
		if x == 1 then
			if y == 1 then
				bufer = PlusToNumber( number1 )
				if bufer ~= number2 and bufer ~= number3 and bufer ~= number4 then
					number1 = bufer
					return true
				end
			else
				bufer = MinusToNumber( number1 )
				if bufer ~= number2 and bufer ~= number3 and bufer ~= number4 then
					number1 = bufer
					return true
				end
			end
		elseif x == 2 then
			if y == 1 then
				bufer = PlusToNumber( number2 )
				if bufer ~= number1 and bufer ~= number3 and bufer ~= number4 then
					number2 = bufer
					return true
				end
			else
				bufer = MinusToNumber( number2 )
				if bufer ~= number1 and bufer ~= number3 and bufer ~= number4 then
					number2 = bufer
					return true
				end
			end
		elseif x == 3 then
			if y == 1 then
				bufer = PlusToNumber( number3 )
				if bufer ~= number2 and bufer ~= number1 and bufer ~= number4 then
					number3 = bufer
					return true
				end
			else
				bufer = MinusToNumber( number3 )
				if bufer ~= number2 and bufer ~= number1 and bufer ~= number4 then
					number3 = bufer
					return true
				end
			end
		else
			if y == 1 then
				bufer = PlusToNumber( number4 )
				if bufer ~= number2 and bufer ~= number3 and bufer ~= number1 then
					number4 = bufer
					return true
				end
			else
				bufer = MinusToNumber( number4 )
				if bufer ~= number2 and bufer ~= number3 and bufer ~= number1 then
					number4 = bufer
					return true
				end
			end
		end
	end
end