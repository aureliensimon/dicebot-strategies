-- SETUP
enablezz = false
enablesrc = false
bethigh = false

-- BETTING SETTING
basebet = 0.00000001 -- Choose bet
chanceh = 90
chancel = 49.95

-- STRATEGY
chance = chanceh
nextbet = basebet
recover = 0
bb = basebet/10

-- START
function dobet()

	if win and chance == chanceh then
		nextbet = basebet
	elseif win and chance == chancel then
		nextbet = bb
		if recover >= basebet then
			chance = chanceh
			recover = 0
			nextbet = basebet
		else
			recover += bb
		end
	elseif !win and chance == chanceh then
		chance = chancel
		nextbet = bb
	else
		nextbet *= 2
	end

end
