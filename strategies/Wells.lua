enablezz = false
enablesrc = false
bethigh = false

minibet = 0.00000010
basebet = minibet
chance = 49.5
wintarget = 0
stoploss  = 0
wells = 5
nextbet = minibet * wells

function dobet ()
	wells = wells + win
	nextbet = basebet * wells
end
