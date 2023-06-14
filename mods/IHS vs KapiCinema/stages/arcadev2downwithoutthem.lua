function onCreate()
	-- background shit
	makeLuaSprite('arcadev2bgdownwithoutthem', 'arcadev2bgdownwithoutthem', -600, -200);
	setLuaSpriteScrollFactor('arcadev2bgdownwithoutthem', 0.9, 0.9);
	
	makeLuaSprite('arcadev2ground', 'arcadev2ground', -640, 600);
	setLuaSpriteScrollFactor('arcadev2ground', 0.9, 0.9);
	scaleObject('arcadev2ground', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('nothing', 'nothing', -125, -100);
		setLuaSpriteScrollFactor('nothing', 0.9, 0.9);
		scaleObject('stagelight_left', 1.1, 1.1);
		
		makeLuaSprite('nothing', 'nothing', 1225, -100);
		setLuaSpriteScrollFactor('nothing', 0.9, 0.9);
		scaleObject('nothing', 1.1, 1.1);
		setPropertyLuaSprite('nothing', 'flipX', true); --mirror sprite horizontally

		makeLuaSprite('nothing', 'nothing', -500, -300);
		setLuaSpriteScrollFactor('nothing', 1.3, 1.3);
		scaleObject('stagecurtains', 0.9, 0.9); --couldnt find out how to remove stuff :troll:
	end

	addLuaSprite('arcadev2bgdownwithoutthem', false);
	addLuaSprite('arcadev2ground', false);
	addLuaSprite('nothing', false);
	addLuaSprite('nothing', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end