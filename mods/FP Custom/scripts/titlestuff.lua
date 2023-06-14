songended = false
overfilledsymbols = {
    checkmark = ':)',
    die = '>:(',
    plus = '+',
    minus = '-'
}
accuracy = 0
curOverFilledSymbol = '>:('

function onUpdatePost()
    if getProperty('ratingFC') == "Clear" or getProperty('ratingFC') == "SDCB" then
        curOverFilledSymbol = overfilledsymbols.die
    elseif getProperty('ratingFC') == "FC" then
        curOverFilledSymbol = overfilledsymbols.minus
    elseif getProperty('ratingFC') == "GFC" then
        curOverFilledSymbol = overfilledsymbols.plus
    elseif getProperty('ratingFC') == "SFC" then
        curOverFilledSymbol = overfilledsymbols.checkmark
    end
    accuracy = round(getProperty('ratingPercent') * 100, 2)
end

function onGameOver()
    songended = true
    setPropertyFromClass('lime.app.Application', 'current.window.title', 'Kapi - Arcade Showdown vs iiHS'..' | Song: '..getProperty('curSong')..' | lol imagine dying /j')
    return Function_Continue
end

function round(num, numDecimalPlaces)
    -- http://lua-users.org/wiki/SimpleRound
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end