local InvincibleTime = 0;
local DamageEnable = false;
local DamageEnable2 = false;
local RandomAngle = 0;
local FlipX = 0
local FlipX2 = false
local SansAttack = false

local posX1 = 0
local posX2 = 0
local posY1 = 0
local posY2 = 0

local hitboxOffset = 180

function onCreate()
	
	makeAnimatedLuaSprite('ray','sans/Gaster_blasterss',-2500,400);
	addAnimationByPrefix('ray','Attack1','fefe instance 1',24,false)
	objectPlayAnimation('ray','Attack1',false)

	makeAnimatedLuaSprite('ray2','sans/Gaster_blasterss',-2500,400);
	addAnimationByPrefix('ray2','Attack1','fefe instance 1',24,false)
	objectPlayAnimation('ray2','Attack1',false)

	makeLuaSprite('HeartSans','sans/heart',990,850)
	precacheImage('sans/Gaster_blasterss')
	precacheImage('sans/heart')

end

function onUpdate()
	if FlipX == 0 then
		FlipX2 = false
	else
		FlipX2 = true
	end
	if SansAttack == true then

		triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 340,getProperty('boyfriend.y'))

		if getProperty('HeartSans.alpha') < 1 then
			setProperty('HeartSans.alpha',getProperty('HeartSans.alpha') + 0.02)
		end

		if getProperty('boyfriend.alpha') > 0.5 then
			setProperty('boyfriend.alpha',getProperty('boyfriend.alpha') - 0.02)
		end


		if keyPressed('left') and getProperty('HeartSans.x') > 220 then
			setProperty('HeartSans.x',getProperty('HeartSans.x') - 10)
		end

		if keyPressed('right') and getProperty('HeartSans.x') < 1660 then
			setProperty('HeartSans.x',getProperty('HeartSans.x') + 10)
		end

		if keyPressed('up') and getProperty('HeartSans.y') > 440 then
			setProperty('HeartSans.y',getProperty('HeartSans.y') - 10)
		end

		if keyPressed('down') and getProperty('HeartSans.y') < 1110 then
			setProperty('HeartSans.y',getProperty('HeartSans.y') + 10)
		end
			
		if InvincibleTime == 0  then
			if DamageEnable == true then
				if (getProperty('HeartSans.y') > posY1 - hitboxOffset and getProperty('HeartSans.y') < posY1 + hitboxOffset and getProperty('HeartSans.x') > posX1 - hitboxOffset and getProperty('HeartSans.x') < posX1 + hitboxOffset) then
					InvincibleTime = 200
					playSound('sans/hearthurt')
					setProperty('health',getProperty('health') - 1)
				end
			end
			if DamageEnable2 == true then
				if (getProperty('HeartSans.y') > posY2 - hitboxOffset and getProperty('HeartSans.y') < posY2 + hitboxOffset and getProperty('HeartSans.x') > posX2 - hitboxOffset and getProperty('HeartSans.x') < posX2 + hitboxOffset) then
					InvincibleTime = 200
					playSound('sans/hearthurt')
					setProperty('health',getProperty('health') - 1)
				end
			end
		end
    end
	if InvincibleTime > 0 then
		InvincibleTime = InvincibleTime - 1
	end
	if SansAttack == false then
		if getProperty('HeartSans.alpha') > 0 then
			setProperty('HeartSans.alpha',getProperty('HeartSans.alpha') - 0.02)
		end
		if getProperty('boyfriend.alpha') < 1 then
			setProperty('boyfriend.alpha', getProperty('boyfriend.alpha') + 0.02)
		end
	end

	if getProperty('ray.animation.curAnim.finished') == true then
		removeLuaSprite('ray',false)
		
	end

	if getProperty('ray2.animation.curAnim.finished') == true then
		removeLuaSprite('ray2',false)
	end

	if curStep == 408 or curStep == 662 then
		SansAttack = true
		runTimer('SansAttack1',1)
		addLuaSprite('HeartSans',true)
		setProperty('HeartSans.alpha',0)
		
	end

	if curStep == 508 or curStep == 761 then
		SansAttack = false
		triggerEvent('Camera Follow Pos','','')
	end
end

function onTimerCompleted(tag)
	if SansAttack == true then
		if tag == 'SansAttack1' then
			runTimer('gasSound',1.1)
			addLuaSprite('ray',true)
			objectPlayAnimation('ray','Attack1',true)
			setProperty('ray.flipX',FlipX2)
			setProperty('ray.y',getProperty('HeartSans.y')- 250)
			setProperty('ray.angle',math.random(0,30))
			updateHitbox('ray')
			playSound('sans/readygas')
			runTimer('SansAttack2',1)
			runTimer('SansHitBox',1.3)
			
			if posX1 == 0 then
				posX1 = getProperty('HeartSans.x')
				posY1 = getProperty('HeartSans.y')
			end
		end

		if tag == 'SansAttack2' then
			runTimer('gasSound2',1.1)
			addLuaSprite('ray2',true)
			objectPlayAnimation('ray2','Attack1',true)
			setProperty('ray2.flipX',FlipX2)
			setProperty('ray2.y',getProperty('HeartSans.y')- 250)
			setProperty('ray2.angle',math.random(0,30))
			updateHitbox('ray2')
			playSound('sans/readygas')
			runTimer('SansAttack1',2)
			runTimer('SansHitBox2',1.3)

			if posX2 == 0 then
				posX2 = getProperty('HeartSans.x')
				posY2 = getProperty('HeartSans.y')
			end
		end
    end

	if tag == 'gasSound' or tag == 'gasSound2' then
		playSound('sans/shootgas')
		sansShake()
	end

	if tag == 'SansHitBox' then
		DamageEnable = true
		runTimer('DisableHitBox',0.3)
	end
	
	if tag == 'SansHitBox2' then
		DamageEnable2 = true
		runTimer('DisableHitBox2',0.3)
	end
	if tag == 'DisableHitBox'then
		DamageEnable = false
		posX1 = 0
		posY1 = 0
	end
	if tag == 'DisableHitBox2'then
		DamageEnable2 = false
		posX2 = 0
		posY2 = 0
	end
end

function onStepHit()
	FlipX = math.random(0,1)
end

function sansShake()
	cameraShake('camGame',0.05,0.3)
	cameraShake('camHUD',0.005,0.3)
	local lol = 0
	for strumLineNotes = 0,7 do
		lol = math.random(0,4)
		local randomX = 0
		local randomY = 0
		local randomAngle = 0
		if lol % 2 == 0 then
			randomX = math.random(-30,-15)
			randomY = math.random(-30,-15)
			randomAngle = math.random(-45,-15)
			lol = 1
		else
			randomX = math.random(30,15)
			randomY = math.random(30,15)
			randomAngle = math.random(45,15)
			lol = 0
		end
		local strumX = getPropertyFromGroup('strumLineNotes',strumLineNotes,'x')
		local strumY = getPropertyFromGroup('strumLineNotes',strumLineNotes,'y')
		local strumAngle = getPropertyFromGroup('strumLineNotes',strumLineNotes,'angle')
		setPropertyFromGroup('strumLineNotes', strumLineNotes,'x', strumX + randomX)
		setPropertyFromGroup('strumLineNotes', strumLineNotes,'y', strumY + randomY)
		setPropertyFromGroup('strumLineNotes', strumLineNotes,'angle', strumAngle + randomAngle)
		noteTweenX('ShakeBackX'..strumLineNotes, strumLineNotes, strumX,0.3,'backOut')
		noteTweenY('ShakeBackY'..strumLineNotes, strumLineNotes, strumY,0.3,'backOut')
		noteTweenAngle('ShakeBackAngle'..strumLineNotes, strumLineNotes, strumAngle,0.3,'backOut')
	end
end