local RemoveInkEffect = false

local inkPos = {520,-240,-1000}
function onCreate()
    if (not lowQuality) then
        precacheImage('bendy/images/third/Ink_Shit')
        for inkShit = 1,3 do
            makeLuaSprite('InkedShit'..inkShit,'bendy/images/third/Ink_Shit',inkPos[inkShit],0)
            setObjectCamera('InkedShit'..inkShit,'hud')
            setProperty('InkedShit'..inkShit..'.alpha',0)
        end
        makeAnimatedLuaSprite('Inked-Rain','bendy/images/third/InkRain',0,0)
        addAnimationByPrefix('Inked-Rain','Rain','erteyd instance 1',24,true)
        setObjectCamera('Inked-Rain','hud')
    end
end
function onUpdate()
    if (not lowQuality) then
        for inkShit = 1,3 do
            setProperty('InkedShit..'..inkShit..'.x',getProperty('InkedShit..'..inkShit..'.x') + 2)
        end 
        if (getProperty('InkedShit2.x') >= 520) then
            setProperty('InkedShit.x',520)
            setProperty('InkedShit2.x',-240)
            setProperty('InkedShit3.x',-1000)
        end
        if (curStep > 1664 and curStep < 1792) then

            if (getProperty('health') > 0.05 and curStep < 1792) then
                setProperty('health',getProperty('health') - 0.005)
            end
        end
        if (RemoveInkEffect and not lowQuality) then
            for inkShit = 1,3 do
                if getProperty('InkedShit'..inkShit..'.alpha') == 0 then
                    removeLuaSprite('InkedShit'..inkShit,true)
                end
            end
        end
    end
end

function onStepHit()
    if (not lowQuality) then
        if (curStep == 1664) then
            for inkShit = 1,3 do
                addLuaSprite('InkedShit'..inkShit,false)
                doTweenAlpha('heyInk'..inkShit,'InkedShit'..inkShit,0.6,1,'linear')
            end
            addLuaSprite('Inked-Rain', true)
            doTweenAlpha('heyInkRain','Inked-Rain',1,1,'linear')
        elseif (curStep == 1792) then
            RemoveInkEffect = true
            for inkShit = 1,3 do
                doTweenAlpha('byeInk'..inkShit,'InkedShit'..inkShit,0,1,'linear')
            end
            doTweenAlpha('byeInkRain','Inked-Rain',0,1,'linear')
        end
    end
end

function opponentNoteHit()
    cameraShake('camGame', 0.005, 0.5);
    cameraShake('camHud', 0.0005, 0.01);
end