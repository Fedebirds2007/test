local Dodge = 0;
local BigShotCurrent = 0
local BigShotDestroyed = 0
local BigShotTexture = 'cup/bull/Cuphead Hadoken'
local BigShotCreated = true

local DisableBFNotes = 0
local BigShotYOffset = 0
local InstaKillPeaBigShot = false
local DodgeTimerCupAttack = 0
local currentEvent = -1

local cupAlertCreated = false

local dadAttackAnim = 'attack'
local bfAnim = ''

function onCreate()
    precacheImage('cup/bull/Cuphead Hadoken')
    precacheImage('cup/bull/NMcupheadAttacks')
    if not downscroll then

        makeAnimatedLuaSprite('CupAlert','cup/mozo',500,340)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    else
        makeAnimatedLuaSprite('CupAlert','cup/gay',500,110)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    end
end
function onEvent(name,v1,v2)

    if name == "CupheadAttack" then
        if v2 ~= '' then
            InstaKillPeaBigShot = true
        else
            InstaKillPeaBigShot = false
        end
        BigShotY = getProperty('dad.y') + BigShotYOffset
        makeAnimatedLuaSprite('BigShotCuphead'..(BigShotCurrent + 1), BigShotTexture,getProperty('dad.x') - 200,getProperty('dad.y') - 50);
        if BigShotTexture ~= 'cup/bull/NMcupheadAttacks' then
            addAnimationByPrefix('BigShotCuphead'..(BigShotCurrent + 1),'Hadolen','Hadolen instance 1',24,false);
        end
        addAnimationByPrefix('BigShotCuphead'..(BigShotCurrent + 1),'Burst','BurstFX instance 1',24,true);
        setBlendMode('BigShotCuphead'..(BigShotCurrent + 1),'add')
        addLuaSprite('BigShotCuphead'..(BigShotCurrent + 1),true)
        setProperty('BigShotCuphead'..(BigShotCurrent + 1)..'.y',BigShotY)
       --setProperty('BigShotCuphead'..(BigShotCurrent + 1)..'offset.y',BigShotYOffset)
        objectPlayAnimation('BigShotCuphead'..(BigShotCurrent + 1),'Burst')
        playSound('cup/CupShoot')
        runTimer('dodgeCupAttack',DodgeTimerCupAttack)
        BigShotCurrent = BigShotCurrent + 1
        BigShotCreated = true
        currentEvent = -1
    end
end

function onUpdate()
    if getProperty('dad.curCharacter') ~= 'cuphead-pissed' and getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
        dadAttackAnim = 'attack'
    else
        dadAttackAnim = 'big shot'
    end
    if BigShotDestroyed == BigShotCurrent then
        BigShotCreated = false
    end
    if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
        BigShotTexture = 'cup/bull/Cuphead Hadoken'
        BigShotYOffset = -50
    else
        BigShotTexture = 'cup/bull/NMcupheadAttacks'
        BigShotYOffset = 150
    end
    if Dodge == 2 and keyJustPressed('space') and not botPlay or Dodge == 2 and botPlay then
        Dodge = 1;
    end
    if getProperty('boyfriend.x') > getProperty('dad.x') then
        DodgeTimerCupAttack = (getProperty('boyfriend.x') - getProperty('dad.x')) / 300000
    else
        DodgeTimerCupAttack = (getProperty('dad.x') - getProperty('boyfriend.x')) / 300000
    end
    for eventNotes = 0,getProperty('eventNotes.length')-1 do
        if (getPropertyFromGroup('eventNotes',eventNotes,'strumTime') - getSongPosition()) < 600 and getPropertyFromGroup('eventNotes',eventNotes,'event') == 'CupheadAttack' and currentEvent < eventNotes then
            local value1 = getPropertyFromGroup('eventNotes',eventNotes,'value1')
            if value1 ~= '' then
                addLuaSprite('CupAlert',true)
                cupAlertCreated = true
                playSound('Cup/fuckyoumoro')
                objectPlayAnimation('CupAlert','Alert',true)
                Dodge = 2
            else
                Dodge = 3
            end
            runTimer('CupheadPreAttack',0.15)
            currentEvent = eventNotes
        end
    end

    if DisableDadNotes == 2 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == false then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', true)
            end
        end
        if getProperty('dad.animation.curAnim.name') ~= dadAttackAnim or getProperty('dad.animation.curAnim.name') == dadAttackAnim and getProperty('dad.animation.curAnim.finished') == true then
            DisableDadNotes = 1
        end
    elseif DisableDadNotes == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == false then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
        DisableDadNotes = 0
    end
    if DisableBFNotes == 2 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == true then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', true)
            end
        end
        if getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' or getProperty('boyfriend.animation.curAnim.name') == 'dodge' and getProperty('boyfriend.animation.curAnim.finished') == true then
            DisableBFNotes = 1
        end
    elseif DisableBFNotes == 1 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == true then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', false)
            end
        end
        DisableBFNotes = 0
    end
    if cupAlertCreated == true then
        if getProperty('CupAlert.animation.curAnim.finished') then
            removeLuaSprite('CupAlert',false)
            objectPlayAnimation('CupAlert','Alert',true)
        end
    end
    if BigShotCreated == true then
        for bigShotLength = BigShotDestroyed + 1,BigShotCurrent do
            if getProperty('BigShotCuphead'..bigShotLength..'.animation.curAnim.name') ~= 'Hadolen' then
                setProperty('BigShotCuphead'..bigShotLength..'.x',getProperty('BigShotCuphead'..bigShotLength..'.x') + 45)

            else
                setProperty('BigShotCuphead'..bigShotLength..'.offset.y',400)
                if getProperty('BigShotCuphead'..bigShotLength..'.animation.curAnim.finished') == true then
                    removeLuaSprite('BigShotCuphead'..bigShotLength,true)
                    BigShotDestroyed = BigShotDestroyed + 1
                end
            end
            if getProperty('BigShotCuphead'..bigShotLength..'.x') > (getProperty('boyfriend.x') + (screenWidth * (1 + (1 - getProperty('defaultCamZoom')))) + getProperty('BigShotCuphead'..bigShotLength..'.width')) then
                BigShotDestroyed = BigShotDestroyed + 1
                removeLuaSprite('BigShotCuphead'..BigShotCurrent,true)
            end
        end
    end

end

function onTimerCompleted(tag)
    if tag == 'CupheadPreAttack' then
        playSound('Cup/CupPre_shoot')
        characterPlayAnim('dad', dadAttackAnim, false);
        setProperty('dad.specialAnim', true);
        DisableDadNotes = 2
        if Dodge == 3 then
            Dodge = 2
        end
    end

    if tag == 'dodgeCupAttack' then
        if Dodge == 1 then
            characterPlayAnim('boyfriend','dodge',false)
            setProperty('boyfriend.specialAnim',true)
            playSound('cup/CupDodge',1)
            DisableBFNotes = 2
            Dodge = 0
        end

        if Dodge == 2 then
            characterPlayAnim('boyfriend','hurt',false);
            setProperty('boyfriend.specialAnim',true);

            if getProperty('health') - 1.4 > 0 and not InstaKillPeaBigShot then
             setProperty('health',getProperty('health') - 1.4)

            elseif getProperty('health') - 1.4 <= 0 or InstaKillPeaBigShot then
             runTimer('GameOver',0.3);
            end

            if BigShotTexture ~= 'cup/bull/NMcupheadAttacks' then
                objectPlayAnimation('BigShotCuphead'..BigShotCurrent,'Hadolen',false)
                setProperty('BigShotCuphead'..BigShotCurrent..'offset.y',500)
            end
        end
    end

    if tag == 'GameOver' then

        setProperty('health', -0.1);
    end
end

function onStepHit()
    if curStep == 1174 and songName == 'Knockout' then
        objectPlayAnimation('BigShotCuphead'..BigShotCurrent,'Hadolen',false)
        setProperty('BigShotCuphead'..BigShotCurrent..'.offset.y',500)
    end
end