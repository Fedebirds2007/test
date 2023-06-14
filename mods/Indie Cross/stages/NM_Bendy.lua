function onCreate()
	-- background shit
	makeLuaSprite('NM-BG', 'bendy/images/inky depths',-150, -500);
	scaleObject('NM-BG',1.8,1.8)
	precacheImage('bendy/images/inky depths')
	addLuaSprite('NM-BG',false)
	if songName == 'Despair' then
		setProperty('NM-BG.alpha',0.01)
	end
	makeAnimatedLuaSprite('BendyFire','bendy/images/Fyre',500,800)
	addAnimationByPrefix('BendyFire','FireDance','Penis instance 1',24,true)
	objectPlayAnimation('BendyFire','FireDance',false)
	precacheImage('bendy/images/Fyre')
	scaleObject('BendyFire',1.9,1.9)
	addLuaSprite('BendyFire',false)


	makeLuaSprite('BendyGround', 'bendy/images/nightmareBendy_foreground',-220, -100);
	precacheImage('bendy/images/nightmareBendy_foreground')
	scaleObject('BendyGround',2,2)




	addLuaSprite('BendyGround', false);
end
function onUpdate()
	if getProperty('dad.curCharacter') ~= 'Nightmare-Bendy' then
		setProperty('dad.color',getColorFromHex('FFE97F'))
	end
	if getProperty('boyfriend.curCharacter') ~= 'bf-bendy-nm' then
		setProperty('boyfriend.color',getColorFromHex('FFE97F'))
	end
end
function onStepHit()
	if songName == 'Despair' then
		if curStep == 1297 or curStep == 2064 then
			doTweenAlpha('BendyBG','NM-BG',1,3,'linear')

		elseif curStep == 1860 then
			doTweenAlpha('BendyBG','NM-BG',0,1,'linear')

		elseif curStep == 3216 then
			doTweenY('FireUp', 'BendyFire',-100, 10, 'QuartOut')

		end
	end
end