local CupheadShotting = false;
local BfAttacking = false

local attack = 0;
local CardAnimation = 0;
local DisableBfNotes = 0;

local ShottingStyle = nil -- lua uses nil instead of null 

local CardCrapY = 520

local PeaShootCounter = 1
local PeaShotHurt = 0

local ChaserShotNumber = 0
local ChaserShotHurt = 0
local ChaserShotSound = 0

local BulletTimer = 0
local StartTimer = false

local changeHealthNotes = 0

local bulletsLength = 3
local bulletsTexture = 'cup/bull/Cupheadshoot'

local CupheadShotAnimations = {"pewLEFT","pewDOWN","pewUP","pewRIGHT"}

function onCreate()
    makeAnimatedLuaSprite('Cardcrap', 'cup/Cardcrap',1000,CardCrapY + 100);
    addAnimationByPrefix('Cardcrap','Filled','Card Filled instance 1',24,false);
    addAnimationByPrefix('Cardcrap','Parry','PARRY Card Pop out  instance 1',24,false);
    addAnimationByPrefix('Cardcrap','Normal','Card Normal Pop out instance 1',24,false);
    addAnimationByPrefix('Cardcrap','Used','Card Used instance 1',24,false);
    addAnimationByPrefix('Cardcrap','Flipped','Card but flipped instance 1',1,true)
    objectPlayAnimation('Cardcrap','Flipped',true)
    setProperty('Cardcrap.scale.y',0)
    setObjectCamera('Cardcrap','hud')
    if downscroll then
        CardCrapY = -30
        setProperty('Cardcrap.y',CardCrapY - 100)
        setProperty('Cardcrap.angle',180)
    end
    addLuaSprite('Cardcrap',true)
        
    if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
        --Load Green Shot
        makeAnimatedLuaSprite('FlashShot','cup/bull/Cupheadshoot',getProperty('dad.x') + 320,getProperty('dad.y') + 100)
        addAnimationByPrefix('FlashShot','Flash','BulletFlashFX instance 1',24,false);

    else
        bulletsTexture = 'cup/bull/NMcupheadBull'
        bulletsLength = 5
    end
    -- cuphead blue shot
    for BulletsLength = 1, bulletsLength do
        makeAnimatedLuaSprite('Peashoot' ..BulletsLength, bulletsTexture, getProperty('dad.x') + 400, getProperty('dad.y') - 105 - (25 * (BulletsLength - 1)));
    
        for bulletsAnimations = 1,bulletsLength do
            addAnimationByPrefix('Peashoot' ..BulletsLength, 'H-Tween'..bulletsAnimations, 'Shot0'..bulletsAnimations..' instance 1', 25, false);
        end
    end
    for greenBullets = 0, 7 do
        makeAnimatedLuaSprite('GreenShit' ..greenBullets, 'cup/bull/GreenShit', getProperty('dad.x') + 360, getProperty('dad.y') + 60);
        for greenAnimations = 1,3 do
            addAnimationByPrefix('GreenShit'..greenBullets,'ChaserShot'..greenAnimations, 'GreenShit0'..greenAnimations, 24,false);
        end
        setBlendMode('GreenShit' ..greenBullets,'add')
    end
end

function onEvent(name,value1,value2)
    if (name == 'CupheadShotting') then
        if (string.lower(value2) ~= 'false') then
            CupheadShotting = true;
            changeHealthNotes = 2
            if tonumber(value1) ~= 1 then
                StartTimer = true
                BulletTimer = 10
    
                ShottingStyle = nil
            else
                ShottingStyle = 1
            end
        else
            CupheadShotting = false
            ShottingStyle = nil
        end
    end
end



function onUpdate()
    if changeHealthNotes == 2 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'noteType') == '' and getPropertyFromGroup('notes', notesLength, 'hitHealth') > 0 then
                setPropertyFromGroup('notes', notesLength, 'hitHealth',getPropertyFromGroup('notes', notesLength, 'hitHealth') - 0.023);
            end
        end
    elseif changeHealthNotes == 1 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'noteType') == '' and getPropertyFromGroup('notes', notesLength, 'hitHealth') > -0.023 then
                setPropertyFromGroup('notes', notesLength, 'hitHealth',getPropertyFromGroup('notes', notesLength, 'hitHealth') + 0.023);
            end
        end
        changeHealthNotes = 0
    end

    if (getProperty('Cardcrap.animation.curAnim.finished') == true) then
        if (getProperty('Cardcrap.animation.curAnim.name') == 'Used') then
            objectPlayAnimation('Cardcrap','Flipped',true)
            if (not downscroll) then
                setProperty('Cardcrap.y', CardCrapY + 100)
            else
                setProperty('Cardcrap.y', CardCrapY - 100)
            end
            setProperty('Cardcrap.scale.y',0)
            CardAnimation = -1
        elseif (getProperty('Cardcrap.animation.curAnim.name') == 'Parry') then
            objectPlayAnimation('Cardcrap', 'Filled', false)
        end
    end

    if CardAnimation == 0 then -- Add Card's sprite 
        objectPlayAnimation('Cardcrap','Parry',false)
        CardAnimation = 2
    end
        
    if attack == 1 then
        if BfAttacking == false then
            if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') or botPlay and CupheadShotting == true and ShottingStyle ~= 1 then -- If press Shift, BF will attack
                objectPlayAnimation('Cardcrap','Used',false)
                characterPlayAnim('boyfriend','attack',false)
                setProperty('boyfriend.specialAnim',true)
                DisableBfNotes = 2
                runTimer('CupheadHurt',0.3)
                playSound('IC/Throw'..(math.random(1,3)))
                attack = 0
                CardAnimation = -1
                BfAttacking = true
            end
        end
    end

    if DisableBfNotes == 2 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == true then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', true)
            end
        end
        if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'attack' or getProperty('boyfriend.animation.curAnim.name') ~= 'attack' then
            DisableBfNotes = 1
            BfAttacking = false
        end
    elseif DisableBfNotes == 1 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength, 'mustPress') == true then
                setPropertyFromGroup('notes', notesLength, 'noAnimation', false)
            end
        end
        DisableBfNotes = 0
    end

    if ChaserShotNumber > 7 then
        ChaserShotNumber = 0
    end

    if ChaserShotSound > 3 then
        ChaserShotSound = 0
    end

    if (PeaShootCounter > bulletsLength) then
        PeaShootCounter = 1
    end
    
    if getProperty('Cardcrap.scale.y') >= 1 and CardAnimation == -1 and getProperty('Cardcrap.animation.curAnim.name') == 'Flipped' then
        CardAnimation = 1
        attack = 1
        setProperty('Cardcrap.scale.y',1)
        objectPlayAnimation('Cardcrap','Normal',true)
        setProperty('Cardcrap.y',CardCrapY)
    end

    for ChaserShotCount = 1,7 do
        if getProperty('GreenShit'..ChaserShotCount..'.animation.curAnim.finished') == true then
            removeLuaSprite('GreenShit'..ChaserShotCount,false)
        end
        while (getProperty('GreenShit'..ChaserShotCount..'.animation.curAnim.curFrame') == 10 and ChaserShotHurt ~= ChaserShotCount and getProperty('health') > 0.05) do
            setProperty('health', getProperty('health')-0.023)
            ChaserShotHurt = ChaserShotCount
        end
    end

    if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
        if getProperty('FlashShot.animation.curAnim.finished') == true then
            removeLuaSprite('FlashShot',false)
        end
    end

    for PeaShotC = 1, bulletsLength do
        if (getProperty('Peashoot'..PeaShotC..'.animation.curAnim.finished')) then
            removeLuaSprite('Peashoot'..PeaShotC, false)
        end
        while (getProperty('Peashoot'..PeaShotC..'.animation.curAnim.curFrame') == 6 and PeaShotHurt ~= PeaShotC) do
            setProperty('health', getProperty('health') - 0.06)
            PeaShotHurt = PeaShotC
        end
    end

    if (CupheadShotting == true and StartTimer == true and ShottingStyle == nil) then
        if (BulletTimer > 0) then
            BulletTimer = BulletTimer - 1
        elseif (BulletTimer <= 0) then
            BulletTimer = 10
            PeaShootCounter = PeaShootCounter + 1

            characterPlayAnim('dad','shotting', true)
            setProperty('dad.specialAnim', true);
            addLuaSprite('Peashoot' ..PeaShootCounter-1, true)
            objectPlayAnimation('Peashoot' ..PeaShootCounter-1, 'H-Tween' ..(math.random(0,bulletsLength)), true)
            playSound('Cup/pea'..(math.random(0, 5)))
            if (getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead') then
                addLuaSprite('FlashShot', true)
                objectPlayAnimation('FlashShot', 'Flash', true)
            end
        end
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Parry Note' then
		-- put something here if you want
		attack = 1
        setProperty('Cardcrap.y', CardCrapY)
        setProperty('Cardcrap.scale.y', 1)
        if CardAnimation == -1 then
            CardAnimation = 0
        end
	else

        if getProperty('Cardcrap.animation.curAnim.name') == 'Flipped' and getProperty('Cardcrap.scale.y') < 1 then
            setProperty('Cardcrap.scale.y',getProperty('Cardcrap.scale.y') + 0.01)
            if not downscroll then
              setProperty('Cardcrap.y',getProperty('Cardcrap.y') - 1)
            else
                setProperty('Cardcrap.y',getProperty('Cardcrap.y') + 1)
            end
        elseif getProperty('Cardcrap.scale.y') == 1 and getProperty('Cardcrap.animation.curAnim.name') == 'Flipped' then
            attack = 1
            if CardAnimation == -1 then
                CardAnimation = 0
            end
            setProperty('Cardcrap.y', CardCrapY)
        end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if not isSustainNote and CupheadShotting == true then
        if ShottingStyle == 1 then
            characterPlayAnim('dad',CupheadShotAnimations[noteData + 1],true)
            setProperty('dad.specialAnim',true)
            addLuaSprite('GreenShit'..ChaserShotNumber,true)
            setProperty('GreenShit'..ChaserShotNumber..'.x',getProperty('dad.x') + 400)
            setProperty('GreenShit'..ChaserShotNumber..'.y',getProperty('dad.y') + 100)
            objectPlayAnimation('GreenShit'..ChaserShotNumber,'ChaserShot'..(math.random(1,3)), false)
            playSound('cup/chaser'..ChaserShotSound)
            ChaserShotNumber  = ChaserShotNumber + 1
            ChaserShotSound  = ChaserShotSound + 1
        else
            CupheadShotting = false;
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'CupheadHurt' then
        if CupheadShotting == true then
            setProperty('health',getProperty('health') + 1)
            if changeHealthNotes == 2 then
                changeHealthNotes = 1
            end

            if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then

                characterPlayAnim('dad','hurt',true)
                setProperty('dad.specialAnim',true);
                playSound('cup/CupHurt')

            else
                characterPlayAnim('dad','dodge',true)
                setProperty('dad.specialAnim',true);
                playSound('cup/CupDodge')
            end
            CupheadShotting = false
        elseif CupheadShotting == false or getProperty('dad.curCharacter') == 'Nightmare-Cuphead' then

            characterPlayAnim('dad','dodge',true)
            setProperty('dad.specialAnim',true);
            playSound('cup/CupDodge')
        end
    end
end
