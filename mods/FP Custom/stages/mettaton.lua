

local health = 0
local xx = 650;
local yy = 500;
local xx2 = 1000;
local yy2 = 550;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreatePost()
	makeLuaSprite('1background', 'mettaton', -1200, 600)
	addLuaSprite('1background', false)
	setScrollFactor('1background', 1, 1)
	scaleObject('1background', 1.1, 1.1);

    makeLuaSprite('fogB', 'dbg/fog_back', 520, 645)
    addLuaSprite('fogB', false)
    setScrollFactor('fogB', 1, 1)
    scaleObject('fogB', 1.3, 1.3)
    setProperty('fogB.alpha', 0.6)
    
    makeLuaSprite('fogM', 'dbg/fog_mid', -222, 600)
    addLuaSprite('fogM', false)
    setScrollFactor('fogM', 1, 1)
    scaleObject('fogM', 1.3, 1.3)
    setProperty('fogM.alpha', 0.6)
    
    makeLuaSprite('spotlights', 'dbg/DBGlights', -169, -166)
    addLuaSprite('spotlights', true)
    setScrollFactor('spotlights', 1, 1)
    scaleObject('spotlights', 1.3, 1.3)
    setProperty('spotlights.alpha', 0.5)
    
    makeAnimatedLuaSprite('pulse', 'dbg/DBGpulse', -737, 264)
    addLuaSprite('pulse', true)
    setScrollFactor('pulse', 1, 1)
    scaleObject('pulse', 1.3, 1.3)
    addAnimationByPrefix('pulse', 'idle', 'animatedlight instance 1', 24, true)
    setProperty('pulse.alpha', 0.6)
    
    makeLuaSprite('fogF', 'dbg/fog_front', -1022, 750)
    addLuaSprite('fogF', true)
    setScrollFactor('fogF', 1, 1)
    scaleObject('fogF', 1.2, 1.2)
    setProperty('fogF.alpha', 0.6)

    makeAnimatedLuaSprite('simps', 'dbg/bunch_of_simps', -737, 869)
    addLuaSprite('simps', true)
    setScrollFactor('simps', 1, 1)
    scaleObject('simps', 2, 2)
    addAnimationByPrefix('simps', 'idle', 'Downer Crowd Bob', 24, true)

    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    
end

function onBeatHit()
	if not lowQuality then
		objectPlayAnimation('pulse', 'idle', true)

		if (curBeat % 1000 == 0) then
			setProperty("upperBoppersLEFT.animation.curAnim.curFrame", 15);
		end
	end
end
        
function onUpdate()
	setProperty('gf.alpha', 0);
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.4)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs-30,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs+30,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs-20)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs+30)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        else

            setProperty('defaultCamZoom',0.4)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs-30,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs+30,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs-20)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs+30)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

