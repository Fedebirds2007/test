local IndieCrossCountDownStyle = ''
local scaleEffect = 1
local alphaEffect = 0
local alphaEffectDisable = false
local cupSongStyle = 'normal'
local cupRandomSongs = 0
local cupLimitedSongs = 4



function onCreate()
    if songName == 'Snake-Eyes' or songName == 'Knockout' or songName == 'Technicolor-Tussle' or songName == 'Devils-Gambit' or songName == 'Satanic-Funkin' then
        IndieCrossCountDownStyle = 'Cuphead'
        setProperty('introSoundsSuffix','-silence')
        makeAnimatedLuaSprite('CupTitle','cup/ready_wallop',-600,-100)
        addAnimationByPrefix('CupTitle','Ready?','Ready? WALLOP!',24,false)
        objectPlayAnimation('CupTitle','Ready?',false)
        setObjectCamera('CupTitle','hud')
        
        makeAnimatedLuaSprite('CupThing','cup/the_thing2.0',-10,0)
        setLuaSpriteScrollFactor('CupThing',0,0)
        addAnimationByPrefix('CupThing','BOOAppear','BOO instance 1',1,false)
        addAnimationByPrefix('CupThing','BOOBye','BOOBye instance 1',22,false)
        objectPlayAnimation('CupThing','BOOAppear',false)
        scaleObject('CupThing',1.031,1.025)
        addLuaSprite('CupThing',true)
        setObjectCamera('CupThing', 'hud');
        runTimer('CupReady',getPropertyFromClass('Conductor','crochet')/ 1200 + 0.1)
        runTimer('CupThingBye',getPropertyFromClass('Conductor','crochet')/ 1200 + 0.1)
        precacheImage('cup/ready_wallop')
        precacheImage('cup/the_thing2.0')
        if songName == 'Knockout' then
            cupSongStyle = 'angry'
            cupLimitedSongs = 1
        end

    elseif songName == 'Whoopee' or songName == 'Sansational' or songName == 'Final-Stretch' or songName == 'Burning-In-Hell' or songName == 'Bad-Time' or songName == 'Bad-To-The-Bone' or songName == 'Bonedoggle' then
        setProperty('introSoundsSuffix','Sans')
    elseif songName == 'imminent-demise' or songName == 'Terrible-Sin' or songName == 'Last-Reel' or songName == 'Last-Reel' or songName == 'Nightmare-Run' or songName == 'Ritual' or songName == 'Despair' or songName == 'Freaky-Machine' or songName == 'build-our-freaky-machine'then
        setProperty('introSoundsSuffix','Sans')
        IndieCrossCountDownStyle = 'Bendy'
    end

    if songName == 'imminent-demise' then
        makeLuaSprite('TextIntro','bendy/images/introductionsong1',360,300)
        scaleEffect = 0.8;
        
    elseif songName == 'Terrible-Sin' then
        makeLuaSprite('TextIntro','bendy/images/introductionsong2',320,280)
        scaleEffect = 0.8;

    elseif songName == 'Last-Reel' then
        makeLuaSprite('TextIntro','bendy/images/introductionsong3',380,300)
        scaleEffect = 0.8;

    elseif songName == 'Nightmare-Run' then
        makeLuaSprite('TextIntro','bendy/images/introductionsong4',400,300)
        scaleEffect = 0.8;

    elseif songName == 'Ritual' then
        makeLuaSprite('TextIntro','bendy/images/introductionbonus2',360,300)
        scaleEffect = 0.75;

    elseif songName == 'Freaky-Machine' or songName == 'build-our-freaky-machine' then
        makeLuaSprite('TextIntro','bendy/images/introductionbonus',340,300) 
        scaleEffect = 0.8;

    elseif songName == 'Despair' then
        makeLuaSprite('TextIntro','bendy/images/introductiondespair',400,320)
        scaleEffect = 0.8;

    end
    if IndieCrossCountDownStyle == 'Bendy' then
        makeLuaSprite('BlackFadeBendy','',0,0)
        makeGraphic('BlackFadeBendy',screenWidth,screenHeight,'000000')
        setObjectCamera('BlackFadeBendy','other')
        addLuaSprite('BlackFadeBendy',true)
        doTweenColor('WhiteToBlack','BlackFadeBendy','000000',0.01,'LinearOut')
        setProperty('skipCountdown',true)
        CountTextCompleted = false
        runTimer('textSongDestroy',2)
        setObjectCamera('TextIntro','other')
        addLuaSprite('TextIntro',true)
        runTimer('playBendySongCountDown',0.2)
    end
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and IndieCrossCountDownStyle == 'Bendy' then
		return Function_Stop;
	end
    return Function_Continue;
end
function onCountdownTick(counter)
    if IndieCrossCountDownStyle == 'Bendy' or IndieCrossCountDownStyle == 'Cuphead' then
        if counter > 0 then
            if counter == 1 then
                setProperty('countdownReady.visible',false)
            elseif counter == 2 then
                setProperty('countdownSet.visible',false)
            elseif counter == 3 then
                setProperty('countdownGo.visible',false)
            end
        end
    end
end
function onEndSong()
    if allowEnd == false then
        addLuaSprite('CupThing',true)
        objectPlayAnimation('CupThing','BOOBye',true)
    end
end
function onUpdate()
    if IndieCrossCountDownStyle == 'Bendy' then
        scaleEffect = scaleEffect + 0.0005
        scaleObject('TextIntro',scaleEffect,scaleEffect)
        setProperty('TextIntro.x',getProperty('TextIntro.x') - 0.20)
        setProperty('TextIntro.y',getProperty('TextIntro.y') - 0.05)

        if alphaEffectDisable then
            setProperty('BlackFadeBendy.alpha',alphaEffect)
            alphaEffect = alphaEffect - 0.01
        end
        if alphaEffect < -1 and alphaEffectDisable then
            removeLuaSprite('TextIntro',true)
            removeLuaSprite('BlackFadeBendy',true)
            alphaEffect = null
        end

        if not alphaEffectDisable and alphaEffect < 1 then
            alphaEffect = alphaEffect + 0.01
        end
        setProperty('TextIntro.alpha',alphaEffect * 2)
    elseif IndieCrossCountDownStyle == 'Cuphead' then
        if cupRandomSongs ~= -1 then
            cupRandomSongs = math.random(0,cupLimitedSongs)
        end
        if getProperty('CupTitle.animation.curAnim.finished') == true then
            removeLuaSprite('CupTitle',true)
        end
        if getProperty('CupThing.animation.curAnim.finished') == true then
            if getProperty('CupThing.animation.curAnim.name') == 'BOOBye' then
                allowEnd = true
                endSong(true)
            end
            if getProperty('CupThing.animation.curAnim.name') == 'BOOAppear' then
                removeLuaSprite('CupThing',false)
                
            end 
        end
    
    end
end


function onTimerCompleted(tag)
	if tag == 'textSongDestroy' then
		CountTextCompleted = true
		alphaEffectDisable = true
        allowCountdown = true
        startCountdown()
	end
    if tag == 'playBendySongCountDown' then
        playSound('bendy/whoosh')
	end
    if tag == 'CupReady' then
        playSound('Cup/intros/'..cupSongStyle..'/'..cupRandomSongs)
        addLuaSprite('CupTitle',true)
        cupRandomSongs = -1
        addLuaSprite('CupTitle',true)
		runTimer('CupTitleDestroy',4)
    end
    if tag == 'CupThingBye' then
        setProperty('CupThing.animation.curAnim.frameRate',22)
    end
end
