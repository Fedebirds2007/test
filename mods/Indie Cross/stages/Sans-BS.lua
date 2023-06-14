local enableBeatEffect = false
function onCreate()
	-- background shit



	makeAnimatedLuaSprite('SansBS-BG', 'sans/Nightmare Sans Stage',300,500);
	addAnimationByPrefix('SansBS-BG','BG1','Normal instance 1',24,true);
	addAnimationByPrefix('SansBS-BG','BG2','sdfs instance 1',24,true);
	setProperty('SansBS-BG.animation.curAnim.frameRate',0)
	objectPlayAnimation('SansBS-BG','BG1',false)


	addLuaSprite('SansBS-BG', false);
    if songName == 'Bad-Time' then
		if flashingLights then
			makeAnimatedLuaSprite('BeatSans', 'sans/Nightmare Sans Stage',0,170);
			addAnimationByPrefix('BeatSans','Beat','dd instance 1',24,false);
			objectPlayAnimation('BeatSans','Beat',false)
			setObjectCamera('BeatSans','hud')
			setBlendMode('BeatSans','add')
			setProperty('BeatSans.alpha',0.8)
		end
	end
end
function onUpdate()
	if getProperty('dad.curCharacter') ~= 'Nightmare-Sans' then
		setProperty('dad.color',getColorFromHex('7F88FF'))
	end
	if getProperty('boyfriend.curCharacter') ~= 'bf-sans-nm' then
		setProperty('boyfriend.color',getColorFromHex('7F88FF'))
	end
	if songName == 'Bad-Time' then
		if curStep == 384 then
			setProperty('SansBS-BG.animation.curAnim.frameRate', 24)
		elseif curStep == 512 or curStep == 928 or curStep == 1440 then
			objectPlayAnimation('SansBS-BG','BG2')
		
			if flashingLights then
				enableBeatEffect = true
				addLuaSprite('BeatSans',true)
			end
		elseif curStep == 768 or curStep == 1184 then
			objectPlayAnimation('SansBS-BG','BG1')
			if flashingLights then
				enableBeatEffect = false
			 	removeLuaSprite('BeatSans',false)
			end
		end
	end
end

function onBeatHit()
	if curBeat % 2 == 0 and enableBeatEffect == true and flashingLights then
		objectPlayAnimation('BeatSans','Beat',true)
	end
end

