local AlphaEffect = -1
local Timer = 2
local MaxValueEffect = 0.5

local stages = {'Cuphead-Nightmare','BendyStage','BendyStage1','NM_Bendy','BS-Sans'}
function onCreatePost()
    for stageLength = 1,#stages do
        if getPropertyFromClass('PlayState','curStage') == stages[stageLength] then
            BendyEffect = 1
            makeLuaSprite('BlackSubEffectBendyIC','',0,0)
            makeGraphic('BlackSubEffectBendyIC',screenWidth,screenHeight,'646464')
            setObjectCamera('BlackSubEffectBendyIC','other')
            setProperty('BlackSubEffectBendyIC.alpha',0)
            addLuaSprite('BlackSubEffectBendyIC',true)
            setBlendMode('BlackSubEffectBendyIC','SUBTRACT')
            runTimer('BackToBlackBendy',Timer)
        end
    end
end
function onTimerCompleted(tag)
    if tag == 'BackToWhiteBendy' then
        doTweenAlpha('BlackLightEffect', 'BlackSubEffectBendyIC', 0, Timer,'linear')
        runTimer('BackToBlackBendy',Timer * 1.5)
    elseif tag == 'BackToBlackBendy' then
        doTweenAlpha('BlackLightEffect', 'BlackSubEffectBendyIC', MaxValueEffect, Timer,'linear')
        runTimer('BackToWhiteBendy',Timer * 1.5)
    end
end