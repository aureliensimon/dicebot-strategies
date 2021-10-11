-- SETUP
enablezz = false
enablesrc = false
bethigh = false
limite = 0 -- 1 if you want to use safe mode

-- A MODIFIER
minibet = 0.00000010 -- Minimum bet
safe = 0.00001 -- %, bust probability

-- BANKROLL
basebet = minibet

-- STRATEGY
chance = 33
wintarget = 0 -- Maximum balance ammount (0 = no limit)
stoploss = 0 -- Minimum balance ammount (0 = no limit)
numbet = 0
nextbet = minibet

-- FIBONACCI
a = 0
b = 1
c = 0
suite = {
    1,
    2,
    3,
    5,
    8,
    13,
    21,
    34,
    55,
    89,
    144,
    233,
    377,
    610,
    987,
    1597,
    2584,
    4181,
    6765,
    10946,
    17711,
    28657,
    46368,
    75025,
    121393,
    196418,
    317811,
    514229,
    832040,
    1346269,
    2178309,
    3524578,
    5702887,
    9227465,
    14930352,
    24157817,
    39088169
}
indice = 1

-- STRATEGY
function dobet()
    -- Find best Basebet
    function calculbet()
        probabust = 0
        basebet = minibet

        while probabust < safe do
            basebet = basebet + minibet
            loses = 0
            a = 0
            b = 1
            c = 0

            while basebet * c < balance do
                loses = loses + 1
                c = a + b
                if loses == 2 then
                    c = 1
                end
                a = b
                b = c
            end

            loses = loses - 1
            probabust = (1 - chance / 100) ^ loses
        end

        basebet = math.floor(100000000 * basebet) / 100000000 -- Round basebet to 10^-8

        if basebet <= minibet then
            basebet = minibet
        end

        print(
            "\nOptimal Basebet : " ..
                basebet .. "\nBust probability : " .. probabust .. "%\nMaximum lose streak : " .. loses .. "\n"
        )

        basebetopti = basebet
    end

    -- Count roll nummber
    if numbet == 0 and limite ~= 0 then
        rollslimit = math.floor(1 / (1 - (chance / 100)) ^ loses)
    end
    if numbet == rollslimit and limite ~= 0 then
        stop()
    end

    numbet = numbet + 1

    -- Reset seed every 1 000 rolls
    if numbet % 1000 == 0 then
        print("\n\n______________________\n")
        resetseed()
        print("\n______________________\n\n")
    end

    -- Check balance
    if balance >= wintarget and wintarget ~= 0 then
        print("\n\nWinTarget reached\n\n")
        stop()
    end
    if balance <= stoploss and stoploss ~= 0 then
        print("\n\nStoploss reached\n\n")
        stop()
    end

    if win then
        -- find new best basebet
        calculbet()
        indice = 1
    else
        basebet = basebetopti * suite[indice]

        indice = indice + 1
    end

    nextbet = basebet
end
