function onCreate()
	-- background shit
	makeLuaSprite('jokeback', 'jokeback', -600, -300);
	setScrollFactor('jokeback', 0.9, 0.9);
	
	makeLuaSprite('jokefront', 'jokefront', -650, 600);
	setScrollFactor('jokefront', 0.9, 0.9);
	scaleObject('jokefront', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('nothing', 'nothing', -125, -100);
		setScrollFactor('nothing', 0.9, 0.9);
		scaleObject('nothing', 1.1, 1.1);
		
		makeLuaSprite('nothing', 'nothing', 1225, -100);
		setScrollFactor('nothing', 0.9, 0.9);
		scaleObject('nothing', 1.1, 1.1);
		setProperty('nothing.flipX', true); --mirror sprite horizontally

		makeLuaSprite('jokecurtains', 'jokecurtains', -500, -300);
		setScrollFactor('jokecurtains', 1.3, 1.3);
		scaleObject('jokecurtains', 0.9, 0.9);
	end

	addLuaSprite('jokeback', false);
	addLuaSprite('jokefront', false);
	addLuaSprite('jokecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end