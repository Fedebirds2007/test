local attack = 0
local SoundToPlay = 0.8;
local RandomSound = 0
local AttackEnable = true
local BfStopAnim = 0
local DadStopAnim = 0
local dadOrder = 0

function onCreate()
   makeAnimatedLuaSprite('AttackButton','IC_Buttons',50,300)
   addAnimationByPrefix('AttackButton','Static','Attack instance 1',24,true)
   addAnimationByPrefix('AttackButton','NA','AttackNA instance 1',30,false)
   objectPlayAnimation('AttackButton','Static',true)
   setObjectCamera('AttackButton','hud')
   addLuaSprite('AttackButton',false)
   scaleObject('AttackButton',0.7,0.7)
   setProperty('AttackButton.alpha',0.5)


   makeLuaSprite('SansBattle','sans/battle',0,-800)
   scaleObejct('SansBattle',1.55,1.5)
end

function onUpdate()
    RandomSound = math.random(1,3)

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and AttackEnable == true and getProperty('AttackButton.animation.curAnim.name') == 'Static'  then
        characterPlayAnim('boyfriend','attack',false)
        setProperty('boyfriend.specialAnim',true)
        objectPlayAnimation('BF_Attack','attack',false)
        playSound('IC/Throw'..RandomSound)
        runTimer('SansDodge',0.3)
        objectPlayAnimation('AttackButton','NA',false)
        setProperty('AttackButton.y',getProperty('AttackButton.y') - 20)
        BfStopAnim = 2
        attack = attack + 1
    end
    if BfStopAnim == 2 then
        if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'attack' or getProperty('boyfriend.animation.curAnim.name') ~= 'attack' then
            BfStopAnim = 1
        end
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == true then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', true)
            end
        end
    elseif BfStopAnim == 1 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == true then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', false)
            end
        end
        BfStopAnim = 0
    end
    if DadStopAnim == 2 then
        if getProperty('dad.animation.curAnim.finished') and getProperty('dad.animation.curAnim.name') == 'dodge' or getProperty('dad.animation.curAnim.name') ~= 'dodge' then
            DadStopAnim = 1
        end
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == false then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', true)
            end
        end
    elseif DadStopAnim == 1 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == false then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', false)
            end
        end
        setObjectOrder('dadGroup',dadOrder)
        DadStopAnim = 0
    end



    if getProperty('AttackButton.animation.curAnim.finished') == true then
        objectPlayAnimation('AttackButton','Static',true)
        setProperty('AttackButton.y',getProperty('AttackButton.y')+ 20)
    end

    if curStep >= 782 and attack < 3 then
        for noteLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes',noteLength,'noteType') == 'BlueBoneNote' then
                removeFromGroup('notes',noteLength,true)
            elseif getPropertyFromGroup('notes',noteLength,'noteType') == 'OrangeBoneNote' then
                setPropertyFromGroup('notes',noteLength,'noteType','')
                setPropertyFromGroup('notes',noteLength,'texture','')
            end
        end
    end
    if BfFly == true then
        doTweenY('bfTweenY', 'boyfriend', 700 + 300 *math.sin(curBeat * math.pi),10)
    end
end

function onStepHit()
    if attack >= 3 then
        if curStep == 775 then
            triggerEvent('Play Animation','snap','dad')
            triggerEvent('Camera Follow Pos',getProperty('dad.x') + 485,getProperty('dad.y') + 200)
            runTimer('eyeSound',0.1)
        end
        if curStep == 782 then
            removeLuaSprite('AttackButton',true)
            removeLuaSprite('SansBG',true)
            addLuaSprite('SansBattle',false)
            triggerEvent('Change Character','dad','UT-Sans')
            triggerEvent('Change Character','bf','UT-BF')
            triggerEvent('Add Camera Zoom',0.35,0.35)
            BfFly = true;
            setProperty('defaultCamZoom',0.4)
            setProperty('dad.y',50)
            setProperty('dadGroup.y',50)
            triggerEvent('Camera Follow Pos','','')
        end
    end
    if curStep > 782 and AttackEnable == true then
        AttackEnable = false
        doTweenAlpha('ByeAttackButton','AttackButton',0,1,'linear')
    end
end

function onTimerCompleted(tag)
    if tag == 'eyeSound' then
        playSound('sans/eye')
    end
    if tag == 'SansDodge' then
        dadOrder = getObjectOrder('dadGroup')
        setProperty('health',getProperty('health') + 0.25)
        playSound('sans/dodge')
        DadStopAnim = 2
        setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup') + 1)
        characterPlayAnim('dad','dodge',true)
        setProperty('dad.specialAnim',true)
        cameraShake('game','0.01','0.5')
    end
end