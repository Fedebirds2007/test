
local BfStopAnim = 0
local StopAnimName = ''

local BFBendyAttack = false

local CameraEffect = false

local PiperX = false
local StrikerX = false
local PiperSpawn = 100
local StrikerSpawn = 200
local PiperAttack = 0
local StrikerAttack = 0
local PiperAttackTimeMax = 400
local StrikerAttackTimeMax = 400

local PiperOffsetX = 0
local StrikerOffsetX = 0

local PiperOffsetY = 0
local StrikerOffsetY = 0

local PiperBFX = 500
local StrikerBFX = -300


local PiperAttacking = false
local Dodge1 = 0

local StrikerAttacking = false
local Dodge2 = 0


local PiperHP = 3
local StrikerHP = 3

local enableAttack = false
local AttackEnable = false

local piperTexture = 'bendy/images/third/Piper'
local strikerTexture = 'bendy/images/third/Striker'

local SplashDamage = 0
local RemoveSplashEffect = true

local StrikerAnimOffset = {{'Idle',0,40},{'Walking',0,40},{'Attack',0,40},{'Pre-Attack',20,47},{'Hurt',150,120},{'Dead',120,120}}
local PiperAnimOffset = {{'Idle',0,40},{'Walking',100,40},{'Attack',350,250},{'Pre-Attack',70,90},{'Hurt',120,200},{'Dead',120,180}}

function onCreatePost()
    if difficulty ~= 0 then
        if songName == 'Last-Reel' then
            PiperOffsetY = 70
            StrikerOffsetY = 80

            PiperOffsetX = 1220
            StrikerOffsetX = -750

            AttackEnable = true
        elseif songName == 'Despair' then
            piperTexture = 'bendy/images/third/PiperDespair'
            strikerTexture = 'bendy/images/third/StrikerDespair'
            PiperOffsetY = 70
            StrikerOffsetY = 80

            PiperBFX = 550
            StrikerBFX = -200

            PiperOffsetX = 2000
            StrikerOffsetX = 0

        end
        if songName == 'Last-Reel' or songName == 'Despair' then

            makeAnimatedLuaSprite('Piper',piperTexture,screenWidth + PiperOffsetX,getProperty('boyfriend.y') + PiperOffsetY)
            addAnimationByPrefix('Piper','Walking','pip walk instance 1',24,true)
            addAnimationByPrefix('Piper','Idle','Piperr instance 1',24,false)
            addAnimationByPrefix('Piper','Hurt','Piper gets Hit instance 1',24,false)
            addAnimationByPrefix('Piper','Dead','Piper ded instance 1',24,false)
            addAnimationByPrefix('Piper','Attack','PeepAttack instance 1',24,false)
            addAnimationByPrefix('Piper','Pre-Attack','PipAttack instance 1',24,false)
            scaleObject('Piper',1.8,1.8)
            
            makeAnimatedLuaSprite('Striker',strikerTexture,0 + StrikerOffsetX,getProperty('boyfriend.y') + StrikerOffsetY)
            addAnimationByPrefix('Striker','Walking','Str walk instance 1',24,true)
            addAnimationByPrefix('Striker','Hurt','Sticker  instance 1',24,false)
            addAnimationByPrefix('Striker','Dead','I ded instance 1',24,false)
            addAnimationByPrefix('Striker','Pre-Attack','PunchAttack_container instance 1',24,false)
            addAnimationByPrefix('Striker','Attack','regeg instance 1',24,false)
            addAnimationByPrefix('Striker','Idle','strrr instance 1',24,false)
            scaleObject('Striker',1.8,1.8)

            makeAnimatedLuaSprite('AttackButton','IC_Buttons',50,300)
            addAnimationByPrefix('AttackButton','Static','Attack instance 1',24,true)
            addAnimationByPrefix('AttackButton','NA','AttackNA instance 1',30,false)
            objectPlayAnimation('AttackButton','Static',true)
            setObjectCamera('AttackButton','hud')
            addLuaSprite('AttackButton',false)
            scaleObject('AttackButton',0.6,0.6)
            setProperty('AttackButton.alpha',0.5)
            
            enableAttack = true
            for bendySplash = 1,4 do
                makeLuaSprite('SplashScreen'..bendySplash,'bendy/images/Damage0'..bendySplash,0,0)
                scaleObject('SplashScreen'..bendySplash,0.7,0.7)
                setObjectCamera('SplashScreen'..bendySplash,'other')
                precacheImage('bendy/images/Damage0'..bendySplash)
            end
        end
    end
end

function onUpdate()
    if enableAttack then
        if BfStopAnim == 2 then
            for notesLength = 0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', notesLength,'mustPress') == true then
                    setPropertyFromGroup('notes', notesLength, 'noAnimation',true)
                end
            end
            if getProperty('boyfriend.animation.curAnim.name') ~= StopAnimName or getProperty('boyfriend.animation.curAnim.name') == StopAnimName and getProperty('boyfriend.animation.curAnim.finished') == true then
                if StopAnimName == 'attack' or StopAnimName == 'attack2' then
                    BFBendyAttack = false
                end
                StopAnimName = ''
                BFBendyAttack = false
                BfStopAnim = 1
            end
        elseif BfStopAnim == 1 then
            for notesLength2 = 0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', notesLength2,'mustPress') == true then
                    setPropertyFromGroup('notes', notesLength2, 'noAnimation',false)
                end
            end
            BfStopAnim = 0
        end

        if getProperty('Piper.animation.curAnim.finished') == true then
            if getProperty('Piper.animation.curAnim.name') == 'Dead' then
                removeLuaSprite('Piper', false)
                if PiperSpawn == -1 then
                    PiperSpawn = math.random(600,800)
                end
            end
        end
        if getProperty('Striker.animation.curAnim.finished') == true then
            if getProperty('Striker.animation.curAnim.name') == 'Dead' then
                removeLuaSprite('Striker', false)
                if StrikerSpawn == -1 then
                    StrikerSpawn = math.random(600,800)
                end
            end
        end
        --Animation fix



        if AttackEnable == true then
            if PiperHP == 0 then
                playSound('bendy/butcherSounds/Dead')
                PiperPlayAnim('Dead')
                PiperX = false
                PiperHP = -1
            end

            if StrikerHP == 0 then
                playSound('bendy/butcherSounds/Dead')
                StrikerPlayAnim('Dead')
                StrikerX = false
                StrikerHP = -1
            end
            if (PiperSpawn > 0) then
                PiperSpawn = PiperSpawn - 1
            end
            if (StrikerSpawn > 0) then
                StrikerSpawn = StrikerSpawn - 1
            end

            if (PiperSpawn == 0) then
                setProperty('Piper.x', screenWidth + PiperOffsetX)
                setProperty('Piper.y', getProperty('boyfriend.y') + PiperOffsetY)
                PiperHP = 3
                addLuaSprite('Piper', false)
                setObjectOrder('Piper', 14)
                PiperX = false
                PiperSpawn = -1
            end

            if (StrikerSpawn == 0) then
                addLuaSprite('Striker', false)
                setProperty('Striker.x', 0 + StrikerOffsetX)
                setProperty('Striker.y', getProperty('boyfriend.y') + StrikerOffsetY)
                setObjectOrder('Striker', 14)
                StrikerHP = 3
                StrikerX = false
                StrikerSpawn = -1
            end

            if (StrikerHP > 0 and StrikerX == true) then
                if (StrikerAttack < StrikerAttackTimeMax) then
                    StrikerAttack = StrikerAttack + 1
                end
                if (StrikerAttack == StrikerAttackTimeMax and StrikerAttacking == false) then
                    Dodge2 = 2
                    StrikerPlayAnim('Pre-Attack')

                    StrikerAttacking = true
                end
            end

            if (PiperHP > 0 and PiperX == true and PiperAttacking == false) then
                if (PiperAttack < PiperAttackTimeMax) then
                    PiperAttack = PiperAttack + 1
                end
                if (PiperAttack == PiperAttackTimeMax) then
                    Dodge1 = 2
                    PiperPlayAnim('Pre-Attack')
                    PiperAttacking = true
                end
            end
            if PiperHP > 1 then
                if getProperty('Piper.x') > getProperty('boyfriend.x') + PiperBFX and PiperX == false and PiperHP > 0 then
                    PiperPlayAnim('Walking')
                    setProperty('Piper.x',getProperty('Piper.x') - 1)
                end

                if getProperty('Piper.x') <= getProperty('boyfriend.x') + PiperBFX and PiperX == false and PiperHP > 0 then
                    PiperX = true
                    PiperPlayAnim('Idle')
                    PiperAttack = PiperAttackTimeMax
                end
            end
            if StrikerHP > 1 then
                if getProperty('Striker.x') < getProperty('boyfriend.x') + StrikerBFX and StrikerX == false and StrikerHP > 0 then
                    StrikerPlayAnim('Walking')
                    setProperty('Striker.x',getProperty('Striker.x') + 3)
                end

                if getProperty('Striker.x') >= getProperty('boyfriend.x') + StrikerBFX and StrikerX == false and StrikerHP > 0 then
                    StrikerX = true
                    StrikerPlayAnim('Idle')
                    StrikerAttack = StrikerAttackTimeMax
                end
            end



            if (getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') and getProperty('AttackButton.animation.curAnim.name') == 'Static' and BFBendyAttack == false) then

                if (keyPressed('left') or not keyPressed('right') and not keyPressed('left') and (PiperX == false and StrikerX == true))  then

                    objectPlayAnimation('AttackButton','NA',false)
                    setProperty('AttackButton.y',getProperty('AttackButton.y') - 35)

                    

                    characterPlayAnim('boyfriend','attack',true)
                    setProperty('boyfriend.specialAnim',true)
                    StopAnimName = 'attack'
                    BfStopAnim = 2

                    BFBendyAttack = true

                    if (StrikerX == true) then
                        StrikerPlayAnim('Hurt')
                        StrikerAttacking = false
                        Dodge2 = 0

                        StrikerAttack = StrikerAttack - 100
                        StrikerHP = StrikerHP - 1
                        
                        playSound('bendy/butcherSounds/Hurt0' ..math.random(1,2))
                    end
                
                elseif (keyPressed('right') or not keyPressed('right') and not keyPressed('left') and (StrikerX == false and PiperX == true)) then

                    objectPlayAnimation('AttackButton','NA',false)
                    setProperty('AttackButton.y',getProperty('AttackButton.y') - 35)

                    characterPlayAnim('boyfriend','attack2',true)
                    setProperty('boyfriend.specialAnim',true)
                    StopAnimName = 'attack2'
                    BfStopAnim = 2

                    
                    
                    BFBendyAttack = true

                    if (PiperX == true) then
                        PiperAttacking = false
                        Dodge1 = 0

                        PiperAttack = PiperAttack - 100
                        PiperHP = PiperHP - 1

                        PiperPlayAnim('Hurt')
                        playSound('bendy/butcherSounds/Hurt0' ..math.random(1,2), 50)
                    end
                end
            end


            if keyJustPressed('space') and Dodge1 == 2 or Dodge1 == 2 and botPlay then
                Dodge1 = 1
            end

            
            if keyJustPressed('space') and Dodge2 == 2 or Dodge2 == 2 and botPlay then
                Dodge2 = 1
            end


            if getProperty('Piper.animation.curAnim.finished') == true then

                if getProperty('Piper.animation.curAnim.name') == 'Dead' then
                    removeLuaSprite('Piper', false)
                    if (AttackEnable) then
                        if PiperSpawn == -1 then
                            PiperSpawn = math.random(600,800)
                        end
                    end
                end
            
                if getProperty('Piper.animation.curAnim.name') == 'Attack' then
                    PiperAttacking = false
                    PiperPlayAnim('Idle')
                end

                if  getProperty('Piper.animation.curAnim.name') == 'Hurt' then
                    PiperPlayAnim('Idle')
                end

                if (getProperty('Piper.animation.curAnim.name') == 'Pre-Attack') then
                    PiperAttack = 0
                    PiperPlayAnim('Attack')

                    if (Dodge1 == 2) then
                        addInk()
                        characterPlayAnim('boyfriend','hurt',true)
                        setProperty('boyfriend.specialAnim',true)
                    
                    elseif (Dodge1 == 1) then
                        Dodge1 = 0

                        characterPlayAnim('boyfriend', 'dodge', true)
                        setProperty('boyfriend.specialAnim',true)
                        StopAnimName = 'dodge'
                        BfStopAnim = 2
                    end
                end
            end

            if getProperty('Striker.animation.curAnim.finished') == true then
            
                if getProperty('Striker.animation.curAnim.name') == 'Attack' then
                    StrikerAttacking = false
                    StrikerPlayAnim('Idle')
                end

                if  getProperty('Striker.animation.curAnim.name') == 'Hurt' then
                    StrikerPlayAnim('Idle')
                end

                if getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' then
                    StrikerAttack = 0
                    StrikerPlayAnim('Attack')
                    if (Dodge2 == 2) then

                        addInk()
                        characterPlayAnim('boyfriend','hurt',true)
                        setProperty('boyfriend.specialAnim',true)

                    elseif (Dodge2 == 1) then
                        Dodge2 = 0
                        characterPlayAnim('boyfriend', 'dodge', true)
                        setProperty('boyfriend.specialAnim',true)
                        StopAnimName = 'dodge'
                        BfStopAnim = 2
                        
                    end
                end
            end
            --CameraEffect
            if getProperty('Piper.animation.curAnim.name') == 'Pre-Attack' or getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' and BFBendyAttack == false or getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' or getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' and BFBendyAttack == false then

                doTweenZoom('AttackZoom', 'camGame', '0.8', '1.5', 'QuintOut')
                cameraSetTarget('bf')
                CameraEffect = true
            end
            if CameraEffect then
                if getProperty('Striker.animation.curAnim.name') ~= 'Pre-Attack' and getProperty('Piper.animation.curAnim.name') ~= 'Pre-Attack' or not AttackEnable then
                    CameraEffect = false
                    doTweenZoom('AttackZoom', 'camGame', getProperty('defaultCamZoom'), '1.5', 'QuintOut')
                    if not mustHitSection and not gfSection then
                        cameraSetTarget('dad')
                    end
                end
            end
            --Attack Button Animation
            if getProperty('AttackButton.animation.curAnim.finished') == true then
                attackTimer = 0
                objectPlayAnimation('AttackButton','Static',true)
                setProperty('AttackButton.y',getProperty('AttackButton.y') + 35)
            end
        end
        --SplashNote
        if SplashDamage >= 5 then
            setProperty('health',-1)
        end
        if SplashDamage > 0 then
            if getProperty('SplashScreen'..SplashDamage..'.alpha') <= 0 and RemoveSplashEffect == true then
                removeLuaSprite('SplashScreen'..SplashDamage,false)
                SplashDamage = 0
            end
        end
    end

end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if enableAttack == true then
        if noteType == 'BendySplashNote' then
            addInk()
        end
    end
end

function onTimerCompleted(tag)
	if tag == 'SplashDestroy' and enableAttack == true then
        RemoveSplashEffect = true
		doTweenAlpha('byeSplash','SplashScreen'..SplashDamage,0,2,'linear')
	end
end
function onStepHit()
    if enableAttack == true and difficulty ~= 0 then
        if (curStep % 2 == 0) then
            if PiperHP > 0 then
                if getProperty('Piper.animation.curAnim.name') == 'Idle' then
                    PiperPlayAnim('Idle')
                end
            end
            if StrikerHP > 0 then
                if getProperty('Striker.animation.curAnim.name') == 'Idle' then
                    StrikerPlayAnim('Idle')
                end
            end
        end
        if (curStep == 1664 and songName == 'Last-Reel') then
            PiperHP = 0
            StrikerHP = 0
            AttackEnable = false
            PiperPlayAnim('Dead')
            StrikerPlayAnim('Dead')
        end
        if songName == 'Despair' then
            if curStep == 1355 or curStep == 2064 or curStep == 3215 then
                AttackEnable = true
                PiperHP = 3
                StrikerHP = 3
            elseif curStep == 1680 or curStep == 3023 or curStep == 3912 then
                PiperHP = 0
                StrikerHP = 0
                PiperPlayAnim('Dead')
                StrikerPlayAnim('Dead')
                AttackEnable = false
            end
        end
    end
end
function addInk()
    playSound('bendy/inked')
    SplashDamage = SplashDamage + 1
    RemoveSplashEffect = false
    setProperty('SplashScreen'..SplashDamage..'.alpha',1)
    addLuaSprite('SplashScreen'..SplashDamage,true)
    if SplashDamage > 1 then
        removeLuaSprite('SplashScreen'..(SplashDamage - 1),false)
    end
    runTimer('SplashDestroy',3)
end
function PiperPlayAnim(anim)

    objectPlayAnimation('Piper',anim,false)
    for piperAnim = 1,#StrikerAnimOffset do
        if anim == PiperAnimOffset[piperAnim][1] then
            setProperty('Piper.offset.x',PiperAnimOffset[piperAnim][2])
            setProperty('Piper.offset.y',PiperAnimOffset[piperAnim][3])
        end
    end
    if getProperty('Piper.animation.curAnim.name') == 'Idle' then
        setProperty('Piper.offset.x',0)
        setProperty('Piper.offset.y',40)
    end

    if getProperty('Piper.animation.curAnim.name') == 'Walking' then
        setProperty('Piper.offset.x',100)
        setProperty('Piper.offset.y',40)
    end

    if getProperty('Piper.animation.curAnim.name') == 'Attack' then
        setProperty('Piper.offset.x',350)
        setProperty('Piper.offset.y',250)
    end
    
    if getProperty('Piper.animation.curAnim.name') == 'Pre-Attack' then
        setProperty('Piper.offset.x',70)
        setProperty('Piper.offset.y',90)
    end

    if getProperty('Piper.animation.curAnim.name') == 'Hurt' then
        setProperty('Piper.offset.x',120)
        setProperty('Piper.offset.y',200)
    end
    if getProperty('Piper.animation.curAnim.name') == 'Dead' then
        setProperty('Piper.offset.x',120)
        setProperty('Piper.offset.y',180)
    end
end
function StrikerPlayAnim(anim)

    objectPlayAnimation('Striker',anim,false)
    for strikerAnim = 1,#StrikerAnimOffset do
        if anim == StrikerAnimOffset[strikerAnim][1] then
            setProperty('Striker.offset.x',StrikerAnimOffset[strikerAnim][2])
            setProperty('Striker.offset.y',StrikerAnimOffset[strikerAnim][3])
        end
    end
    --[[if getProperty('Striker.animation.curAnim.name') == 'Idle' then
        setProperty('Striker.offset.x',0)
        setProperty('Striker.offset.y',40)
    end

    if getProperty('Striker.animation.curAnim.name') == 'Walking' then
        setProperty('Striker.offset.x',0)
        setProperty('Striker.offset.y',40)
    end

    if getProperty('Striker.animation.curAnim.name') == 'Attack' then
        setProperty('Striker.offset.x',0)
        setProperty('Striker.offset.y',40)
    end
    
    if getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' then
        setProperty('Striker.offset.x',20)
        setProperty('Striker.offset.y',47)
    end

    if getProperty('Striker.animation.curAnim.name') == 'Hurt' then
        setProperty('Striker.offset.x',150)
        setProperty('Striker.offset.y',120)
    end

    if getProperty('Striker.animation.curAnim.name') == 'Dead' then
        setProperty('Striker.offset.x',120)
        setProperty('Striker.offset.y',120)
    end]]--
end