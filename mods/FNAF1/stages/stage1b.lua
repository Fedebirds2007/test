function onCreate()

	makeLuaSprite('bonnie1', 'bonnie1', -550, -400);
	setLuaSpriteScrollFactor('bonnie1', 1, 1);
	scaleObject('bonnie1', 1.1, 1.1)
	addLuaSprite('bonnie1', false);
	
	close(true);
end