local IndieCrossCountDownStyle = ''
local scaleEffect = 1
local alphaEffect = 0
local alphaEffectDisable = false
local cupSongStyle = 'normal'
local cupRandomSongs = 0
local cupLimitedSongs = 4

IntroTextSize = 35 --Size of the text for the Now Playing thing.
IntroSubTextSize = 35 --size of the text for the Song Name.
IntroTagColor = '808080' --Color of the tag at the end of the box.
IntroTagWidth = 0 --Width of the box's tag thingy.
SongDetectedIC = true
SongText = ''
SongTextFont = ''
SongTextBorder = 0

function onCreate()
	--song name box
	SongText = 'Orenji Music -'
	SongTextFont = 'CupheadICFont.ttf'


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

	----------------------------------------------------------------
	--bg and more sht already fixed
	IndieCrossCountDownStyle = 'Cuphead'
	setProperty('introSoundsSuffix','-silence')
	makeAnimatedLuaSprite('CupTitle','cup/ready_wallop',-600,-100)
	addAnimationByPrefix('CupTitle','Ready?','Ready? WALLOP!',24,false)
	objectPlayAnimation('CupTitle','Ready?',false)
	setObjectCamera('CupTitle','hud')
	
	makeAnimatedLuaSprite('CupThing','cup/the_thing2.0',-10,0)
	setLuaSpriteScrollFactor('CupThing',0,0)
	addAnimationByPrefix('CupThing','BOOAppear','BOO instance 1',12,false)
	addAnimationByPrefix('CupThing','BOOBye','BOOBye instance 1',12,false)
	objectPlayAnimation('CupThing','BOOAppear',false)
	scaleObject('CupThing',1.031,1.025)
	addLuaSprite('CupThing',true)
	setObjectCamera('CupThing', 'hud');
	runTimer('CupReady',getPropertyFromClass('Conductor','crochet')/ 1200 + 0.1)
	runTimer('CupThingBye',getPropertyFromClass('Conductor','crochet')/ 1200 + 0.1)
	precacheImage('cup/ready_wallop')
	precacheImage('cup/the_thing2.0')

	cupSongStyle = 'angry'
	cupLimitedSongs = 1

	makeLuaSprite('Cup-CH-RN-00', 'cup/rain/Cup-CH-RN-00', -600, -150);
	setLuaSpriteScrollFactor('Cup-CH-RN-00', 0.1, 0.1);
	scaleObject('Cup-CH-RN-00',3,3)
    
	makeLuaSprite('Cup-CH-RN-01', 'cup/rain/Cup-CH-RN-01', -850, -300);
	setLuaSpriteScrollFactor('Cup-CH-RN-01', 0.2, 0.2);
	scaleObject('Cup-CH-RN-01',3,3)

    makeLuaSprite('Cup-CH-RN-02','cup/rain/Cup-CH-RN-02', -600, -100);
	scaleObject('Cup-CH-RN-02',4,4)

	addLuaSprite('Cup-CH-RN-00', false);
    addLuaSprite('Cup-CH-RN-01', false);
    addLuaSprite('Cup-CH-RN-02', false);


	makeAnimatedLuaSprite('Cup-NewRAINLayer01', 'cup/rain/Cup-NewRAINLayer01',-350,-191);
	addAnimationByPrefix('Cup-NewRAINLayer01','dance','RainFirstlayer instance 1',24,true);
	objectPlayAnimation('Cup-NewRAINLayer01','RainFirstlayer instance 1',false)
	setLuaSpriteScrollFactor('Cup-NewRAINLayer01', 0, 0);
	scaleObject('Cup-NewRAINLayer01',1.2,1.2)
	
	makeAnimatedLuaSprite('Cup-NewRAINLayer02', 'cup/rain/Cup-NewRAINLayer02',-350,-191);
	addAnimationByPrefix('Cup-NewRAINLayer02','dance','RainFirstlayer instance 1',24,true);
	objectPlayAnimation('Cup-NewRAINLayer02','RainFirstlayer instance 1',false)
	setLuaSpriteScrollFactor('Cup-NewRAINLayer02', 0, 0);
	scaleObject('Cup-NewRAINLayer02',1.2,1.2)
		

	makeAnimatedLuaSprite('CupheqdShid', 'cup/CUpheqdshid',-350,-193);
	addAnimationByPrefix('CupheqdShid','dance','Cupheadshit_gif instance 1',24,true);
	objectPlayAnimation('CupheqdShid','Cupheadshit_gif instance',false)
	scaleObject('CupheqdShid',1.6,1.6)
	setLuaSpriteScrollFactor('CupheqdShid', 0, 0);

	makeAnimatedLuaSprite('Grain', 'cup/Grainshit',-350,-193);
	addAnimationByPrefix('Grain','dance','Geain instance 1',24,true);
	objectPlayAnimation('Grain','Geain instance 1',false)
	scaleObject('Grain',1.6,1.6)
	setLuaSpriteScrollFactor('Grain', 0, 0);

	addLuaSprite('CupheqdShid', true);
	addLuaSprite('Grain',true);
	addLuaSprite('Cup-NewRAINLayer01', true);
	addLuaSprite('Cup-NewRAINLayer02', true);
	
	makeAnimatedLuaSprite('MugMan','cup/Mugman Fucking dies',2000,1300)
	addAnimationByPrefix('MugMan','Walking','Mugman instance 1',24,false)
	addAnimationByPrefix('MugMan','Dead','MUGMANDEAD YES instance 1',24,false)

	makeAnimatedLuaSprite('KnockOutText','cup/knock',125,200)
	addAnimationByPrefix('KnockOutText','Knock','A KNOCKOUT!',28,false)
	setObjectCamera('KnockOutText','hud')
	scaleObject('KnockOutText',0.9,0.9)
end

function onCreatePost()
	healthBarStyle = 'Cuphead'
	barImage = 'healthbar-ic/cuphealthbar'

	barOffsetX = 25
	barOffsetY = 18

	if changeHealthBar == true then
		makeLuaSprite('customHealthBar', barImage, 0, 0)
		setObjectCamera('customHealthBar', 'hud')
		setProperty('customHealthBar.offset.x',barOffsetX)
		setProperty('customHealthBar.offset.y',barOffsetY)
		setObjectOrder('customHealthBar',4)
		addLuaSprite('customHealthBar', true)
	end
end
function onUpdate(elapsed)
	--song name sht
	setProperty('JukeBoxText.x', getProperty('JukeBox.x') + 50)
    setProperty('JukeBoxSubText.x', getProperty('JukeBoxText.x') + (IntroSubTextSize/3) + ((IntroTextSize/2) * string.len(getTextString('JukeBoxText'))))   
	--------------------------------------------
	--more sht
	Random = math.random(0,1)
	if getProperty('KnockOutText.animation.curAnim.finished') then
	  doTweenAlpha('KnockBye','KnockOutText',0,1,'LinearOut')
	end
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
   
function onStepHit()
	if curStep == 1150 then
		addLuaSprite('MugMan',true)
	end
	if curStep == 1174 then
		objectPlayAnimation('BigShotCuphead'..BigShotCurrent,'Hadolen',false)
		setProperty('BigShotCuphead'..BigShotCurrent..'.offset.y',500)
		objectPlayAnimation('MugMan','Dead',false)
		playSound('Cup/CupHurt')
		playSound('Cup/knockout')
		addLuaSprite('KnockOutText',true)
	end
end
function onSongStart()
	--Inst and Vocals start playing, songPosition = 0
	doTweenX('heyBoxText', 'JukeBox', 550, 0.5, 'CircOut')
	runTimer('JukeBoxWait', 3, 1)
end
	
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'JukeBoxWait' then
		doTweenX('MoveInTwo2', 'JukeBox', 3333, 1, 'CircInOut')
	end
end
function onCountdownTick(counter)
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
function onEndSong()
    if allowEnd == false then
        addLuaSprite('CupThing',true)
        objectPlayAnimation('CupThing','BOOBye',true)
    end
end

function onTimerCompleted(tag)
	if tag == 'textSongDestroy' then
		CountTextCompleted = true
		alphaEffectDisable = true
        allowCountdown = true
        startCountdown()
	end
    if tag == 'CupReady' then
        playSound('Cup/intros/angry/1')
        addLuaSprite('CupTitle',true)
        cupRandomSongs = -1
        addLuaSprite('CupTitle',true)
		runTimer('CupTitleDestroy',4)
    end
    if tag == 'CupThingBye' then
        setProperty('CupThing.animation.curAnim.frameRate',20)
    end
end
function onTweenCompleted(tag)
    if tag == 'MoveInFour2' then
        removeLuaSprite('JukeBox',true)
        removeLuaText('JukeBoxText',true)
        removeLuaText('JukeBoxSubText',true)
    end
end