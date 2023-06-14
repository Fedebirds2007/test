local BfFly = false
local BlackSansEffect = 0

function onCreate()
	-- background shit
	makeLuaSprite('SansBG','sans/hall',0,100)
	scaleObject('SansBG',1.55,1.5)
	addLuaSprite('SansBG', false);
	makeLuaSprite('SansBG-Alt','sans/Waterfall',-450,-100)
	scaleObject('SansBG-Alt',1.55,1.5)
	precacheImage('sans/Waterfall')
	makeLuaSprite('Black','',0,0)
    makeGraphic('Black',screenWidth,screenHeight,'000000')
    setObjectCamera('Black','hud')
end

function onUpdate()
    if BfFly == true then
        doTweenY('boyfriendTweenY', 'boyfriend', 700 + 300 *math.sin((curBeat *1) * math.pi),10)
    end
end

function onStepHit()
		if curStep == 768 then
			addLuaSprite('SansBG-Alt',false)
			removeLuaSprite('SansBG',false)
		elseif curStep == 1277 then
			addLuaSprite('SansBG',false)
			removeLuaSprite('SansBG-Alt',true)
		elseif curStep == 1791 then
			doTweenColor('bfColorTween', 'boyfriend', '000000', 1, 'linear')
			doTweenColor('dadColorTween', 'dad', '000000', 1, 'linear')
		elseif curStep == 2048 then
			setProperty('boyfriend.color',getColorFromHex('FFFFFF'))
			setProperty('dad.color',getColorFromHex('FFFFFF'))
		end

		if curStep == 767 or curStep == 1276 then
			playSound('sans/countdown')
			addLuaSprite('Black',false)
			BlackSansEffect = 1
		end
		  
		if curStep >= 769 and BlackSansEffect  == 1 and curStep < 1276  or curStep >= 1278 and BlackSansEffect == 1 then
		  playSound('sans/countdown')
		  removeLuaSprite('Black',false)
		  BlackSansEffect = 0
		end
		  
		if curStep == 900 or curStep == 1791 then
		  triggerEvent('Set Cam Zoom',1.1,2)
		end
		  
		if curStep == 1791 then
		  triggerEvent('Set Cam Zoom',1.1,2)
		end
		  
		if curStep == 2048 then
		  triggerEvent('Set Cam Zoom',0.9,'')
		end
end



