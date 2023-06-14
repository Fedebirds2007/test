local cupheadFont = {'Snake-Eyes','Technicol-Tussle','Knockout','Devils-Gambit','Satanic-Funkin'}
local bendyFont = {'imminent-demise','Terrible-Sin','Last-Reel','Nightmare-Run','Despair','Ritual','Freaky-Machine','build-our-freaky-machine'}
local sansFont = {'Whoopee','Sansational','Burning-In-Hell','Final-Stretch','Bad-Time','Bonedoggle','Bad-To-The-Bone' }
local papyrusFont = {}
function onCreatePost()
    for cupLength = 1,#cupheadFont do
        if songName == cupheadFont[cupLength] then
            setTextFont('scoreTxt', 'CupheadICFont.ttf')
            setTextFont('timeTxt','CupheadICFont.ttf')
        end
    end
    for bendyLength = 1,#bendyFont do
        if songName == bendyFont[bendyLength] then
            setTextFont('scoreTxt', 'BendyICFont.ttf')
            setTextFont('timeTxt','BendyICFont.ttf')
        end
    end
    for sansLength = 1,#sansFont do
        if songName == sansFont[sansLength]  then
            setTextFont('scoreTxt', 'SansICFont.ttf')
            setTextFont('timeTxt','SansICFont.ttf')
        end
    end
    if songName == 'Bad-To-The-Bone' then
        setTextFont('scoreTxt', 'PapyrusICFont.ttf')
        setTextFont('timeTxt','PapyrusICFont.ttf')
    end
end