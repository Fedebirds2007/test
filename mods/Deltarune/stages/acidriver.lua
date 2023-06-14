
function onCreate()
	precacheImage('bitch');
	precacheImage('queen');
	precacheImage('queen2');
end

function onCreate()
	-- background shit

	makeLuaSprite('bg','bg', -200, -160);
	setScrollFactor('bg', 0.5, 0);
	addLuaSprite('bg', false);

	makeLuaSprite('acid','acid', -200, -200);
	setScrollFactor('acid', 0.5, 0);
	addLuaSprite('acid', false);

	makeAnimatedLuaSprite('duck','duck', -230, 200);
		addAnimationByPrefix('duck','dance','duck',19);
	addLuaSprite('duck', true);

	makeLuaSprite('lighting','lighting', -230, -150);
	setScrollFactor('lighting', 0, 1);
	setProperty('lighting.alpha',0.39)
	setBlendMode('lighting','add');
	addLuaSprite('lighting', true);
	
	function onBeatHit()
	
		if curBeat == 70 then
			makeAnimatedLuaSprite('queen2','queen2', 300, 0);
			addAnimationByPrefix('queen2','lmao','queen2', 24, false);--true or false to loop
			objectPlayAnimation('queen2','lmao', true);
			addLuaSprite('queen2', false);
		end
	
		if curBeat == 186 then
			makeAnimatedLuaSprite('queen','queen', 270, 0);
			addAnimationByPrefix('queen','oh','queen', 24, false);--true or false to loop
			objectPlayAnimation('queen','oh', true);
			addLuaSprite('queen', false);
		end
	
		if curBeat == 30 then
			makeAnimatedLuaSprite('bitch','bitch', 500, -500);
			addAnimationByPrefix('bitch','pop','bitch', 20, false);--true or false to loop
			objectPlayAnimation('bitch','pop', true);
			addLuaSprite('bitch', true);
			setObjectCamera('bitch', 'camOther');
			setProperty('bitch.angle', 180);
		end
	
		if curBeat == 245 then
			makeAnimatedLuaSprite('bitch','bitch', 500, -500);
			addAnimationByPrefix('bitch','pop','bitch', 19, false);--true or false to loop
			objectPlayAnimation('bitch','pop', true);
			addLuaSprite('bitch', true);
			setObjectCamera('bitch', 'camOther');
			setProperty('bitch.angle', 180);
		end
	end

	--couldn't get Queen's sprites to work, pls help :(
		--fdzfhhgfdhfghgfdhdgfjgfjfhgjfghjhjhfghdfsahf	U	HFIUHUSH	lkfj


	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onBeatHit()
	objectPlayAnim('duck', 'dance', true);
end

