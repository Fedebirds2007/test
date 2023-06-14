local DodgeSans = 0
local Color = nil
local characterSansDodgeFound = true
local BfDodge = false
local InstaKillSans = false

local disableBfAnim = 0
local boneTexture = 'sans/Bone'


function onCreate()
    makeAnimatedLuaSprite('DodgeAlert2','sans/Sans_Shit_NM',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') - 50)

    addAnimationByPrefix('DodgeAlert2','alertBlue','AlarmBlue instance 1',24,false)
    addAnimationByPrefix('DodgeAlert2','alertOrange','AlarmOrange instance 1',24,false)

    addAnimationByPrefix('DodgeAlert2','attackBlue','Bones boi instance 1',24,false)
    addAnimationByPrefix('DodgeAlert2','attackOrange','Bones Orange instance 1',24,false)
    setBlendMode('DodgeAlert2','add')
    
    scaleObject('DodgeAlert2',0.8,0.8)
    if getProperty('boyfriend.curCharacter') ~= 'UT-bf-Chara' and getProperty('boyfriend.curCharacter') ~= 'bf-sans-ic' then
        makeAnimatedLuaSprite('DodgeAlert','sans/Bone',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') + 50)
        addAnimationByPrefix('DodgeAlert','alert','Alarm instance 1',24,false)
        addAnimationByPrefix('DodgeAlert','attack','Bones boi instance 1',24,false)
        precacheImage('sans/Bone')
        scaleObject('DodgeAlert',0.8,0.8)
    end

    makeAnimatedLuaSprite('DodgeAlert','sans/DodgeMechs',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') - 50)
    addAnimationByPrefix('DodgeAlert','alert','Alarm instance 1',24,false)
    addAnimationByPrefix('DodgeAlert','attack','Bones boi instance 1',24,false)
    scaleObject('DodgeAlert',0.8,0.8)


end
function onCreatePost()
    if getProperty('boyfriend.curCharacter') == 'bf-chara-ic' then
        makeAnimatedLuaSprite('BFSansDodge','sans/Cardodge',getProperty('boyfriend.x') + 5,getProperty('boyfriend.y') + 50)
        addAnimationByPrefix('BFSansDodge','dodge','Dodge instance 1',24,false)
        precacheImage('sans/Cardodge')

    elseif getProperty('boyfriend.curCharacter') == 'bf-sans-ic' then
        makeAnimatedLuaSprite('BFSansDodge','sans/DodgeMechs',getProperty('boyfriend.x') - 5,getProperty('boyfriend.y') - 28)
        addAnimationByPrefix('BFSansDodge','dodge','Dodge instance 1',24,false)
        precacheImage('sans/DodgeMechs')
    else

        characterSansDodgeFound = false
    end
end

function onUpdate()

    if DodgeSans == 2 then
        if keyJustPressed('space') and not botPlay or botPlay and (Color == 'Orange' or Color == nil) then
            playSound('sans/dodge')
            DodgeSans = 1;
        end
    end
    if getProperty('DodgeAlert.animation.curAnim.finished') and getProperty('DodgeAlert.animation.curAnim.name') == 'attack' then
         triggerEvent('Camera Follow Pos','','')
        removeLuaSprite('DodgeAlert',false)
        objectPlayAnimation('DodgeAlert','alert',false)
    end

    if getProperty('DodgeAlert2.animation.curAnim.finished') and getProperty('DodgeAlert2.animation.curAnim.name') == 'attackOrange' or getProperty('DodgeAlert2.animation.curAnim.finished') and getProperty('DodgeAlert2.animation.curAnim.name') == 'attackBlue' then
        triggerEvent('Camera Follow Pos','','')
        removeLuaSprite('DodgeAlert2',false)
        objectPlayAnimation('DodgeAlert2','alert2',false)
        Color = 0
    end

    if getProperty('BFSansDodge.animation.curAnim.finished') and BfDodge == true and characterSansDodgeFound == true then
        removeLuaSprite('BFSansDodge',false)
        setProperty('boyfriend.visible',true)
        BfDodge = false
    end

    if disableBfAnim == 2 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end
        if getProperty('boyfriend.animation.curAnim.finished') == true and getProperty('boyfriend.animation.curAnim.name') == 'dodge' or getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' then
            disableBfAnim = 1
        end
    end
    if disableBfAnim == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
               setPropertyFromGroup('notes', i, 'noAnimation', false)
           end
       end
       disableBfAnim = 0
    end
end

function onEvent(name,value1,value2)
    if name == "SansDodge" then
        runTimer('SansAttack',0.8)
        playSound('sans/notice')
        setProperty('DodgeAlert.y',getProperty('boyfriend.y') - 50)
        setProperty('DodgeAlert2.y',getProperty('boyfriend.y') - 50)
        triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 50,getProperty('boyfriend.y'))
        DodgeSans = 2

        if value1 ~= '' then
            addLuaSprite('DodgeAlert2',true)
            Color = 1
        else
            addLuaSprite('DodgeAlert',true)
            objectPlayAnimation('DodgeAlert','alert')
            Color = nil
        end

        if value2 ~= '' then
                InstaKillSans = true
        else
                InstaKillSans = false
        end
        
        if Color == 1 then
            local RandomColor = math.random(3,4)
            if RandomColor == 3 then
                Color = 'Blue'
                objectPlayAnimation('DodgeAlert2','alertBlue')
            elseif RandomColor == 4 then

                Color = 'Orange'
                objectPlayAnimation('DodgeAlert2','alertOrange')
            end
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'SansAttack' then
      playSound('sans/sansattack')
      setProperty('DodgeAlert.y',getProperty('DodgeAlert.y') + 50)
      setProperty('DodgeAlert2.y',getProperty('DodgeAlert2.y') + 50)
      cameraShake('game',0.01,0.2)

 
        if Color ~= nil then
            objectPlayAnimation('DodgeAlert2','attack'..Color,false)


            if DodgeSans == 1 and Color == 'Orange' then
                if characterSansDodgeFound == true then
                    setProperty('BF_Attack.visible',false)
                    setProperty('BFSansDodge.visible',true)
                    BfDodge = true
                    setProperty('boyfriend.visible',false)
                    addLuaSprite('BFSansDodge',true)
                    objectPlayAnimation('BFSansDodge','dodge')
                else
                   characterPlayAnim('boyfriend','dodge',true)
                   setProperty('boyfriend.specialAnim',true)
                   disableBfAnim = 2
                end
                Color = 0
            end
            if DodgeSans == 2 and Color == 'Orange' or DodgeSans == 1 and Color == 'Blue' then
                characterPlayAnim('boyfriend','hurt',true)
                setProperty('boyfriend.specialAnim',true);
                if (getProperty('health') - 1) > -0.01 and not InstaKillSans then
                    setProperty('health',getProperty('health') - 1)
                elseif (getProperty('health') - 1) <= -0.05 or InstaKillSans then
                    runTimer('GameOverSans',0.35)
                end

            end
        end
        if Color == nil then
            objectPlayAnimation('DodgeAlert','attack')
            if characterSansDodgeFound == true and DodgeSans == 1 then
                setProperty('BF_Attack.visible',false)
                setProperty('BFSansDodge.visible',true)
                BfDodge = true
                setProperty('boyfriend.visible',false)
                addLuaSprite('BFSansDodge',true)
                objectPlayAnimation('BFSansDodge','dodge')
             elseif DodgeSans == 1 and characterSansDodgeFound == false  then
                characterPlayAnim('boyfriend','dodge',true)
                setProperty('boyfriend.specialAnim',true)
                disableBfAnim = 2
             end
 
             if DodgeSans == 2 then
                characterPlayAnim('boyfriend','hurt',true)
                setProperty('boyfriend.specialAnim',true);

                if characterSansDodgeFound then
                    characterPlayAnim('boyfriend','singUPmiss',true)
                    setProperty('boyfriend.specialAnim',true)
                end

                if (getProperty('health') - 1) > -0.01 and not InstaKillSans then
                    setProperty('health',getProperty('health') - 1)
                elseif (getProperty('health') - 1) <= -0.01 or InstaKillSans then
                    runTimer('GameOverSans',0.35)
                end
            end
        end
        DodgeSans = 0
    end
    if tag == 'GameOverSans' then
        setProperty('health',0)
    end
end


