local Dodge = 0;
local DisableBFNotes = 0
local DisableDadNotes = 0
local DodgeTimerCupDoubleAttack = 0
local InstaKillRoundabout = false

local currentDouble = 0
local doubleDestroyed = -1
local doubleOffsetY = 0
local doubleTexture = 'cup/bull/NMcupheadAttacks'
local doubleScale = 1.3

local currentEvent = -1

local attackAnim = 'attack'
function onCreate()
    
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
function onEvent(name,value1,value2)
    if name == "CupheadDoubleAttack" then
        makeAnimatedLuaSprite('Roundabout'..currentDouble, doubleTexture,getProperty('dad.x') + 420,getProperty('dad.x') + 270);
        addAnimationByPrefix('Roundabout'..currentDouble,'idle','Roundabout instance 1',24,true);
        scaleObject('Roundabout'..currentDouble,doubleScale,doubleScale)
        setProperty('Roundabout'..currentDouble..'.offset.y', doubleOffsetY)
        addLuaSprite('Roundabout'..currentDouble,true)
        setObjectOrder('Roundabout'..currentDouble,getObjectOrder('boyfriendGroup') - 1)
        setProperty('Roundabout'..currentDouble..'.x',getProperty('dad.x') + 420)
        setProperty('Roundabout'..currentDouble..'.y',getProperty('dad.y'))
        doTweenX('RoundaboutX'..currentDouble,'Roundabout'..currentDouble,getProperty('boyfriend.x') + 600, 1, 'QuadOut');
        runTimer('RoundaboutTime'..currentDouble,0.7);
        setBlendMode('Roundabout'..currentDouble,'add')
        runTimer('dodgeDoubleAttack'..currentDouble,DodgeTimerCupDoubleAttack)
        playSound('cup/CupShoot');
        currentDouble = currentDouble + 1
 
        if value2 ~= '' then
            InstaKillRoundabout = true
        else
            InstaKillRoundabout = false
        end
        currentEvent = -1
    end
end

function onUpdate()
    if getProperty('dad.curCharacter') ~= 'cuphead-pissed' and getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
        attackAnim = 'attack'
    else
        attackAnim = 'big shot'
    end
    DodgeTimerCupDoubleAttack = (getProperty('boyfriend.x') - getProperty('dad.x')) / 30000
    if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
        doubleTexture = 'cup/bull/Roundabout'
        doubleScale = 1.3
        doubleOffsetY = 0
    else
        doubleTexture = 'cup/bull/NMcupheadAttacks'
        doubleScale = 0.9
        doubleOffsetY = 100
    end
    for eventNotes = 0,getProperty('eventNotes.length')-1 do
        if (getPropertyFromGroup('eventNotes',eventNotes,'strumTime') - getSongPosition()) < 500 and getPropertyFromGroup('eventNotes',eventNotes,'event') == 'CupheadDoubleAttack' and currentEvent < eventNotes then
            runTimer('CupheadDoubleAttack',0.6)
            playSound('Cup/CupPre_shoot')
            local value1 = getPropertyFromGroup('eventNotes',eventNotes,'value1')
            if value1 ~= '' then
                addLuaSprite('CupAlert',true)
                playSound('Cup/fuckyoumoro')
                objectPlayAnimation('CupAlert','Alert',true)
            else
                Dodge = 3
            end
            if Dodge == 0 then
                Dodge = 2
            end
            runTimer('CupheadPreAttack',0.15)
            currentEvent = eventNotes
        end
    end
    if DisableDadNotes == 2 then
        if getProperty('dad.animation.curAnim.name') ~= 'big shot'  or getProperty('dad.animation.curAnim.name') == 'big shot' and getProperty('dad.animation.curAnim.finished') == true then
            DisableDadNotes = 1
        end
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == false then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', true)
            end
        end

    elseif DisableDadNotes == 1 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == false then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', false)
            end
        end
        DisableDadNotes = 0
    end

    if getProperty('CupAlert.animation.curAnim.finished') then
        removeLuaSprite('CupAlert',false)
    end

    if Dodge == 2 and (keyJustPressed('space') and not botPlay or botPlay) then
        Dodge = 1;
    end

    if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'dodge' and DisableBFNotes == 1 or DisableBFNotes == 1 and getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == true then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', false)
            end
        end
        DisableBFNotes = 0
    end

    if DisableBFNotes == 1 then

        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == true then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', true)
            end
        end
    end
    for doubleLength = doubleDestroyed,currentDouble do
        if getProperty('Roundabout'..doubleLength..'.x') <= getProperty('boyfriend.x') - (1280 * (2 + math.abs(1 - getProperty('defaultCamZoom')))) then
            removeLuaSprite('Roundabout'..doubleLength,true)
            doubleDestroyed = doubleDestroyed + 1
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'CupheadPreAttack' then
        characterPlayAnim('dad', attackAnim, false);
        setProperty('dad.specialAnim', true);
        DisableDadNotes = 2
        if Dodge == 3 then
            Dodge = 2
        end
    end
    
    if string.find(tag,'dodgeDoubleAttack',0,true) ~= nil then
        for doubleLength = doubleDestroyed,currentDouble do
            if tag == 'dodgeDoubleAttack'..doubleLength then
                if Dodge == 1 then
                    characterPlayAnim('boyfriend','dodge',true)
                    setProperty('boyfriend.specialAnim',true)
                    DisableBFNotes = 1
                    playSound('cup/CupDodge',1)
                elseif Dodge == 2 then
                    characterPlayAnim('boyfriend','hurt',false);
                    setProperty('boyfriend.specialAnim',true);
                    if getProperty('health') - 1.2 > 0 and not InstaKillRoundabout then
                        setProperty('health',getProperty('health') - 1.2)
                    elseif getProperty('health') - 1.2 <= 0 or InstaKillRoundabout then
                        runTimer('GameOver',0.3);
                    end
                    objectPlayAnimation('BigShotCuphead','Burst',false)
                    setProperty('BigShotCuphead.x','boyfriend.x' + 150)
                end
            end
        end
    end

    if tag == 'Dodge' then
        if Dodge == 1 then
            setObjectOrder('Roundabout',getObjectOrder('boyfriendGroup') + 1)
            characterPlayAnim('boyfriend','dodge',true)
            setProperty('boyfriend.specialAnim',true)
            DisableBFNotes = 1
            playSound('cup/CupDodge',1)
		elseif Dodge == 2 then
            characterPlayAnim('boyfriend','hurt',false);
            setProperty('boyfriend.specialAnim',true);
            if getProperty('health') - 1.2 > 0 and not InstaKillRoundabout then
                setProperty('health',getProperty('health') - 1.2)
            elseif getProperty('health') - 1.2 <= 0 or InstaKillRoundabout then
                runTimer('GameOver',0.3);
            end
        end
    end
    
    if string.find(tag,'RoundaboutTime',0,true) ~= nil then
        for doubleLength = doubleDestroyed,currentDouble do
            if tag == 'RoundaboutTime'..doubleLength then
                doTweenX('RoundaboutX'..doubleLength,'Roundabout'..doubleLength,getProperty('boyfriend.x') - (1280 * (2 + math.abs(1 - getProperty('defaultCamZoom')))), 1.5, 'QuadIn');
                runTimer('RoundaboutDestroy',2)
                Dodge = 2;
                runTimer('Dodge',0.5)
                setObjectOrder('Roundabout'..doubleLength,getObjectOrder('boyfriendGroup') + 1)
            end
        end
    end

end
