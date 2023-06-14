local changedNotes = 0
local noteTexture = ''

function onCreatePost()
    if songName == 'Snake-Eyes' or songName == 'Knockout' or songName == 'Technicolor-Tussle' or songName == 'Devils-Gambit' or songName == 'Satanic-Funkin' then
        changedNotes = 1
        noteTexture = 'cup/Cuphead_NOTE_assets'
    end
    if changedNotes == 1 then
        for strumLineLength = 0,7 do
            setPropertyFromGroup('strumLineNotes', strumLineLength, 'texture',noteTexture)
        end
    end
    if changedNotes >= 1 then
        for notesLength = 0,getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', notesLength, 'noteType') == '' and getPropertyFromGroup('unspawnNotes', notesLength, 'texture') ~= noteTexture then
                setPropertyFromGroup('unspawnNotes', notesLength, 'texture', noteTexture);
            end
        end
    end

end