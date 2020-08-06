-- SETUP
enablezz = false
enablesrc = false
bethigh = false

-- BETTING SETTING
basebet = 0.00001 -- Choose bet
chance = 50
percent = 10
basechance = 50
limitchance = 90
maxchance = 95

-- STRATEGY
nextbet = basebet

-- START
function dobet()

	if win then
		chance = basechance
	else

		if chance <= limitchance/1.1 then
			chance *= (1+(percent/100))
		else
			if chance <= maxchance/1.1 then
				chance *= 1*(precent/1000)
			else
				chance = basechance
			end
		end

	end

	if profit <= 0 then
			nextbet = math.floor(100000000*((100/lastBet.Chance)*math.abs(currentprofit)))/100000000
		else
			nextbet = basebet
	end

	print("\nChance = "..chance)
	print("Bet = "..nextbet)
end
