function onCreate()
	-- background shit

	makeAnimatedLuaSprite('SammyBG','bendy/images/third/SammyBg',670,580)
	addAnimationByPrefix('SammyBG','dance','Sam instance 1',24,false)
	objectPlayAnimation('SammyBG','dance',false)
	scaleObject('SammyBG',1.1,1.1)

	makeAnimatedLuaSprite('JzBoy','bendy/images/third/JzBoy',100,580)
	addAnimationByPrefix('JzBoy','dance','Jack Copper Walk by instance 1',24,false)
	objectPlayAnimation('JzBoy','dance',false)
	
	makeLuaSprite('BendyBG', 'bendy/images/BACKBACKgROUND',-220, -100);
	scaleObject('BendyBG',1,1)
    
	makeLuaSprite('BendyBG2', 'bendy/images/BackgroundwhereDEEZNUTSfitINYOmOUTH', -600, -150);
	scaleObject('BendyBG2',1,1)

	makeLuaSprite('BendyGround', 'bendy/images/MidGrounUTS', -600, -150);

	scaleObject('BendyGround',1,1)

	makeLuaSprite('Pillar', 'bendy/images/ForegroundEEZNUTS', 1700, -200);
	setScrollFactor('Pillar',1.2,1)




	addLuaSprite('BendyBG', false);
    addLuaSprite('BendyBG2', false);
	addLuaSprite('SammyBG',false)
	addLuaSprite('BendyGround', false);
	addLuaSprite('Pillar', true);
	setObjectOrder('Pillar',getObjectOrder('boyfriend') + 5)
	
	makeAnimatedLuaSprite('ButcherGang','bendy/images/third/Butchergang_Bg',-600,1200)
	addAnimationByPrefix('ButcherGang','dance','Symbol 1 instance 1',24,false)
	setScrollFactor('ButcherGang',1.2,1)
	scaleObject('ButcherGang',2.6,2.6)
	addLuaSprite('ButcherGang',true)
	setObjectOrder('ButcherGang',getObjectOrder('boyfriend') + 10)

	
end

function onUpdate(elapsed)
	if getProperty('JzBoy.animation.curAnim.finished') then
		removeLuaSprite('JzBoy',true)
	end
	if getProperty('dad.curCharacter') ~= 'bendy-ic' then
		setProperty('dad.color',getColorFromHex('FFE97F'))
	end
	if getProperty('boyfriend.curCharacter') ~= 'bf-bendy-ic' and
	getProperty('boyfriend.curCharacter') ~= 'bf-bendy-ic-phase2' and
	getProperty('boyfriend.curCharacter') ~= 'bf-bendy-ic-phase3' and
	getProperty('boyfriend.curCharacter') ~= 'bf-bendy-ic-run' then
		setProperty('boyfriend.color',getColorFromHex('FFE97F'))
	end
end

function onStepHit()
	
	if curStep == 986 then
		addLuaSprite('JzBoy', false);
		setObjectOrder('JzBoy',getObjectOrder('BendyBG2'))
	end

	if curStep % 2 == 0 then
		objectPlayAnimation('ButcherGang','dance',false)				
	 	objectPlayAnimation('SammyBG','dance',false)
	end
end