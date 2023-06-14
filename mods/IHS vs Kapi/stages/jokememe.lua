function onCreate()
	-- background shit
	makeLuaSprite('kapiballer', 'kapiballer', 0, 0);
	setScrollFactor('kapiballer', 0.9, 0.9);
	scaleObject('kapiballer', 3, 3);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('nothing', 'nothing', -125, -100);
		setScrollFactor('nothing', 0.9, 0.9);
		scaleObject('nothing', 1.1, 1.1);
		
		makeLuaSprite('nothing', 'nothing', 1225, -100);
		setScrollFactor('nothing', 0.9, 0.9);
		scaleObject('nothing', 1.1, 1.1);
		setProperty('nothing.flipX', true); --mirror sprite horizontally

	end

	addLuaSprite('kapiballer', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end