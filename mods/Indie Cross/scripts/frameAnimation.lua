local EnabledCharacters = {
    'bf-ic',
    'bf-ic-rain',
    'bf-bendy-ic',
    'bf-bendy-ic-phase2',
    'bf-bendy-ic-phase3',
    'bf-bendy-mn-Bendy',
    'bf-sammy',
    'bf-sans-bs',
    'bf-sans-chara',
    'bf-sans-ic',
    'bf-sans-wt',
    'bf-christmas-ic',
    'bf-da',
    'bf-da-b&w',
    'bf-NM',
    'UT-bf',
    'UT-bf-Chara',
    'UT-Sans',
    'bendy-da',
    'bendy-daphase2',
    'bendy-ic',
    'cuphead-pissed',
    'cuphead',
    'devil',
    'Nightmare-Bendy',
    'Nightmare-Cuphead',
    'Nightmare-Sans',
    'papyrus-ic',
    'sammy',
    'sans-ic',
    'sans-ic-wt',
    'sans-phase2-ic',
    'sans-phase3',
    'sans-tired'}
local anims = {'singLEFT','singDOWN','singUP','singRIGHT'}
function goodNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote then
        for Characters = 0,#EnabledCharacters do
            if getProperty('boyfriend.curCharacter') == EnabledCharacters[Characters] then
                if string.find(getProperty('boyfriend.animation.curAnim.name'),anims[direction + 1],0,true) ~= nil then
                    setProperty('boyfriend.animation.curAnim.curFrame',2)
                end
            end
        end

    end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote then
        for Characters = 0,#EnabledCharacters do
            if getProperty('dad.curCharacter') == EnabledCharacters[Characters] then
                if string.find(getProperty('dad.animation.curAnim.name'),anims[direction + 1],0,true) ~= nil then
                    setProperty('dad.animation.curAnim.curFrame',2)
                end
            end
        end

    end
end