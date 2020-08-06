-- SETUP
enablezz = false
enablesrc = false
bethigh = false

-- BETTING SETTING
basebet = 0.001 -- Choose bet
percent = 10
chance = 49.5

-- STRATEGY
wintarget = 0	-- Stop if reach this value (0 if no limit)
stoploss  = 0 -- Stop if reach this value(0 if no limit)
nextbet = basebet*(percent/100)

-- START
function dobet()

	-- Check Balance
	if balance >= wintarget and wintarget ~= 0 then
			print("\n\nWinTarget Reach\n\n")
			stop()
	end
	if balance <= stoploss and stoploss ~= 0 then
			print("\n\nStoploss Reach\n\n")
			stop()
	end

	if win then
		basebet *= (1+(percent/100))
	else
		basebet *= (1-(percent/100))
	end

	print("\nBet : "..basebet)

	nextbet = basebet*(percent/100)

end
