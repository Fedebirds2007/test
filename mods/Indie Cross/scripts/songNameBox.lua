IntroTextSize = 35 --Size of the text for the Now Playing thing.
IntroSubTextSize = 35 --size of the text for the Song Name.
IntroTagColor = '808080' --Color of the tag at the end of the box.
IntroTagWidth = 0 --Width of the box's tag thingy.
SongDetectedIC = true
SongText = ''
SongTextFont = ''
SongTextBorder = 0

--easy script configs

--actual script
function onCreate()
    --the tag at the end of the box
    --the box


    --the text for the "Now Playing" bit

    if songName == 'Knockout' then
        SongText = 'Orenji Music -'
        SongTextFont = 'CupheadICFont.ttf'
        

    elseif songName == 'Snake-Eyes' then
        SongText = 'Mike Geno -'
        SongTextFont = 'CupheadICFont.ttf'
        

    elseif songName == 'Technicolor-Tussle' then
        SongText = 'BLVKAROT -'
        SongTextFont = 'CupheadICFont.ttf'
        
        
    elseif songName == 'Devils-Gambit' then
        SongText = 'Saru & TheInnuend0 -'
        SongTextFont = 'CupheadICFont.ttf'
        
    elseif songName == 'Satanic-Funkin' then
        SongText =  'TheInnuend0 -'
        SongText =  'Saru & TheInnuend0 -'
        SongTextFont = 'CupheadICFont.ttf'
        
    
    elseif songName == 'Bad-Time' then
        SongText = 'Tenzubushi -'
        SongTextFont = 'CupheadICFont.ttf'
        
        
    elseif songName == 'Despair' then
        SongText = 'CDMusic, Joan Atlas and Rozebud -'
        SongTextFont = 'BendyICFont.ttf'
        
    elseif songName == 'Whoopee' then
        SongText = 'yingyang48 & Saster -'
        SongTextFont = 'SansICFont.ttf'

    elseif songName == 'Sansational' then
        SongText = 'Tenzubushi -'
        SongTextFont = 'SansICFont.ttf'

    elseif songName == 'Final-Stretch' then
        SongText = 'Saru -'
        SongTextFont = 'SansICFont.ttf'

    elseif songName == 'Burning-In-Hell' then
        SongText = 'TheInnuenedo & Saster -'
        SongTextFont = 'SansICFont.ttf'

    elseif songName == 'imminent-demise' then
        SongText = 'Saur & CDMusic -'
        SongTextFont = 'BendyICFont.ttf'
        
    elseif songName == 'Last-Reel' then
        SongText = 'Joan Atlas -'
        SongTextFont = 'BendyICFont.ttf'

    elseif songName == 'Nightmare-Run' then
        SongText = 'Orenji Music & Rozebud -'
        SongTextFont = 'BendyICFont.ttf'


    elseif songName == 'Terrible-Sin' then
        SongText = 'CDMusic & Rozebud -'
        SongTextFont = 'BendyICFont.ttf'

    elseif songName == 'Ritual' then
        SongText = 'BBPanzu and Brandxns -'
        SongTextFont = 'BendyICFont.ttf'

    elseif songName == 'Freaky-Machine' then
        SongText = 'DAGames and Saster -'
        SongTextFont = 'BendyICFont.ttf'

    elseif songName == 'build-our-freaky-machine' then
        SongText = 'Astro Galaxy -'
        SongTextFont = 'BendyICFont.ttf'

    elseif songName == 'Bonedoggle' then
        SongText = 'Saster -'
        SongTextFont = 'BendyICFont.ttf'

    elseif songName == 'Bad-To-The-Bone' then
        SongText = 'Yamahearted -'
        SongTextFont = 'BendyICFont.ttf'

    elseif songName == 'Saness' or songName == 'Gose' then
        SongText = 'CrystalSlime -'
        SongTextFont = 'BendyICFont.ttf'

    else
        SongDetectedIC = false
        
    end
    if SongDetectedIC == true then
        makeLuaSprite('JukeBox', 'ICImages/musicBar', 1280, 500)
        setProperty('JukeBox.alpha', 0.7)
        setObjectCamera('JukeBox', 'other')
        addLuaSprite('JukeBox', true)
        
        makeLuaText('JukeBoxText',SongText, 1000, 0, 515)
        setTextFont('JukeBoxText',SongTextFont)
        setTextColor('JukeBoxSubText','A8AAAF')
        setTextBorder('JukeBoxText',SongTextBorder)
        setTextAlignment('JukeBoxText', 'left')
        setObjectCamera('JukeBoxText', 'other')
        setTextSize('JukeBoxText', IntroTextSize)
        addLuaText('JukeBoxText',true)

        local songNameText = string.gsub(songName,'-',' ')
        makeLuaText('JukeBoxSubText', songNameText, 1000, -300, 515)
        setTextAlignment('JukeBoxSubText', 'left')
        setTextBorder('JukeBoxSubText',SongTextBorder)
        setObjectCamera('JukeBoxSubText', 'other')
        setTextSize('JukeBoxSubText', IntroTextSize)
        setTextFont('JukeBoxSubText',SongTextFont)

        setTextColor('JukeBoxText','A8AAAF')
        setTextColor('JukeBoxSubText','A8AAAF')
        addLuaText('JukeBoxText')
        addLuaText('JukeBoxSubText')
    end
end
function onUpdate()
    setProperty('JukeBoxText.x', getProperty('JukeBox.x') + 50)
    setProperty('JukeBoxSubText.x', getProperty('JukeBoxText.x') + (IntroSubTextSize/3) + ((IntroTextSize/2) * string.len(getTextString('JukeBoxText'))))
end
--motion functions
function onSongStart()
--Inst and Vocals start playing, songPosition = 0
    doTweenX('heyBoxText', 'JukeBox', 550, 0.5, 'CircOut')
    --[[if songName == 'Whoopee' or songName == 'Terrible-Sin' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 620,1,'CircInOut')

    elseif songName == 'Sansational' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 480,1,'CircInOut')


    elseif songName == 'Final-Stretch' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 370,1,'CircInOut')

    elseif songName == 'Burning-In-Hell' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 670,1,'CircInOut')
        
    elseif songName == 'imminent-demise' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 560,1,'CircInOut')

    elseif songName == 'Nightmare-Run' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 630,1,'CircInOut')

    elseif songName == 'Last-Reel' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 450,1,'CircInOut')

    elseif songName == 'Ritual' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 650,1,'CircInOut')

    elseif songName == 'Bonedoggle' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 390,1,'CircInOut')

    elseif songName == 'Freaky-Machine' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 610,1,'CircInOut')


    elseif songName == 'Devils-Gambit' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 620,1,'CircInOut')

    elseif songName == 'Bad-Time' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 480,1,'CircInOut')

    elseif songName == 'Despair' then
        doTweenX('MoveInFour', 'JukeBoxSubText', 800,1,'CircInOut')
    else
        doTweenX('MoveInFour', 'JukeBoxSubText', 500, 1, 'CircInOut')
    end]]--


    runTimer('JukeBoxWait', 3, 1)
    end

    function onTimerCompleted(tag, loops, loopsLeft)
    --A loop from a timer you called has been completed, value "tag" is it's tag
    --loops = how many loops it will have done when it ends completely
    --loopsLeft = how many are remaining
    if tag == 'JukeBoxWait' then
        doTweenX('MoveInTwo2', 'JukeBox', 3333, 1, 'CircInOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'MoveInFour2' then
        removeLuaSprite('JukeBox',true)
        removeLuaText('JukeBoxText',true)
        removeLuaText('JukeBoxSubText',true)
    end
end