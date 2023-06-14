local BfFly = false

function onCreate()
	-- background shit
	makeLuaSprite('SansBG','sans/halldark',0,100)
	scaleObject('SansBG',1.55,1.5)
	addLuaSprite('SansBG', false);
	makeLuaSprite('SansBattle','sans/battle',0,-800)
	scaleObejct('SansBattle',1.55,1.5)
	precacheImage('sans/battle')

	makeLuaSprite('SansBG','sans/hall',0,100)
	scaleObject('SansBG',1.55,1.5)
	addLuaSprite('SansBG', false);
end
function onUpdate()
    if BfFly == true then
        doTweenY('boyfriendTweenY', 'boyfriend', 700 + 300 *math.sin((curBeat *1) * math.pi),10)
    end
	
		if curStep == 378 or curStep == 1146 then
			addLuaSprite('SansBattle',false)
			removeLuaSprite('SansBG',false)
			BfFly = true;
			setProperty('defaultCamZoom',0.4)
			setProperty('dad.y',50)
		end

		if curStep == 896 or curStep == 1408 then
			removeLuaSprite('SansBattle',false)
			addLuaSprite('SansBG',false)
			BfFly = false;
			cancelTween('boyfriendTweenY')
			setProperty('boyfriend.y',defaultBoyfriendY + getProperty('boyfriend.positionArray[1]'))
			setProperty('defaultCamZoom',0.9)
			--setProperty('dad.y',550)
		end
end
