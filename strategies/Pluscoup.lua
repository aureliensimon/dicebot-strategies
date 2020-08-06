-- SETUP
enablezz = false
enablesrc = false
bethigh = false

-- BETTING SETTING
basebet = 0.00000010 -- Choose bet
chance = 49.5
leprofit = 0
maxbet = 0.000001

-- STRATEGY
wintarget = 0	-- Stop if reach this value (0 if no limit)
stoploss  = 0 -- Stop if reach this value(0 if no limit)
nextbet = basebet

-- START
function dobet()

	-- Check de la balance
	if balance >= wintarget and wintarget ~= 0 then
		print("\n\nWinTarget Atteint\n\n")
		stop()
	end
	if balance <= stoploss and stoploss ~= 0 then
		print("\n\nStoploss Atteint\n\n")
		stop()
	end

	-- Update profit
	leprofit += currentprofit

	if win then

		if nextbet >= maxbet then
			nextbet = basebet
		end

		if leprofit < 0 then
			nextbet = previousbet + basebet
		else
			nextbet = basebet
			leprofit = 0
		end
		print("Win !")

	else

		nextbet = previousbet
		print("Lose !")

	end

	print("Bet : "..nextbet)
	print("profit :"..leprofit.."\n")
end
