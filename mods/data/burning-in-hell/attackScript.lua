local RandomSound = 0
local AttackEnable = true


local DadStopAnim = 0
local BFStopAnim = 0

local dadOrder = 0
local boneTexture = 'sans/Cardodge'
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

   makeAnimatedLuaSprite('DodgeAlert','sans/DodgeMechs',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') - 50)
   addAnimationByPrefix('DodgeAlert','alert','Alarm instance 1',24,false)
   addAnimationByPrefix('DodgeAlert','attack','Bones boi instance 1',24,false)
   scaleObject('DodgeAlert',0.8,0.8)

end

function onUpdate()

    RandomSound = math.random(1,3)


    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and AttackEnable == true and getProperty('AttackButton.animation.curAnim.name') == 'Static' then
        characterPlayAnim('boyfriend','attack',false)
        setProperty('boyfriend.specialAnim',true)
        objectPlayAnimation('BF_Attack','attack',false)
        playSound('IC/Throw'..RandomSound)
        runTimer('SansDodge',0.3)
        objectPlayAnimation('AttackButton','NA',false)
        setProperty('AttackButton.y',getProperty('AttackButton.y') - 20)
        BFStopAnim = 2
    end
    if BFStopAnim == 2 then
        if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'attack' then
            BFStopAnim = 1
        end
        for StopAnim = 0,getProperty('notes.length')-1 do
            setPropertyFromGroup('notes', StopAnim, 'noAnimation', true)
        end
    end
    if BFStopAnim == 1 then
        for StopAnim = 0,getProperty('notes.length')-1 do
            setPropertyFromGroup('notes', StopAnim, 'noAnimation', false)
        end
        BFStopAnim = 0
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

    if AttackEnable == false and getProperty('AttackButton.alpha') > 0 then
        setProperty('AttackButton.alpha',getProperty('AttackButton.alpha') - 0.01)
    end
    if AttackEnable == true and getProperty('AttackButton.alpha') < 0.5 then
        setProperty('AttackButton.alpha',getProperty('AttackButton.alpha') + 0.01)
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

function onStepHit()
    if curStep >=  379 and curStep < 896 or curStep >= 1146 and curStep < 1408 then
        AttackEnable = false
    end
    if curStep ==  896 or curStep == 1408 then
        AttackEnable = true
    end
end