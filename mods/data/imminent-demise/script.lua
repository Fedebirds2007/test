function onCreate()
	makeLuaSprite('BendyBG', 'bendy/images/BACKBACKgROUND',-220, -100);
	makeLuaSprite('BendyBG2', 'bendy/images/BackgroundwhereDEEZNUTSfitINYOmOUTH', -600, -150);

	makeLuaSprite('BendyGround', 'bendy/images/MidGrounUTS', -600, -150);
    makeLuaSprite('Pillar2', 'bendy/images/ForegroundEEZNUTS', 1700, -200);
    setScrollFactor('Pillar2',1.2,1)

end

function onStepHit()
    if curStep == 1000 then
        addLuaSprite('BendyBG',false)
        setProperty('inCutscene',false)
        addLuaSprite('BendyBG2',false)
        addLuaSprite('BendyGround',false)
        removeLuaSprite('BG',true)
        removeLuaSprite('BendySprite',true)
        removeLuaSprite('Pillar',true)
        addLuaSprite('Pillar2',true)
        setProperty('defaultCamZoom',0.5)
        removeLuaSprite('Light',true)
        setProperty('boyfriend.x',1150 + getProperty('boyfriend.positionArray[0]'))
        setProperty('boyfriend.y',800 + getProperty('boyfriend.positionArray[1]'))
        setProperty('dad.x',0 + getProperty('dad.positionArray[0]'))
        setProperty('dad.y',800 + getProperty('dad.positionArray[1]'))
        setProperty('dad.visible',true)
        setProperty('defaultCamZoom',0.5)
    end
end