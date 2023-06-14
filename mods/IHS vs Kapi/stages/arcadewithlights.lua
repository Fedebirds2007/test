function onCreate()
	-- background shit
	makeLuaSprite('arcade', 'arcade', -600, -300);
	setScrollFactor('arcade', 0.9, 0.9);
	
	makeLuaSprite('floor-arcade', 'floor-arcade', -640, 600);
	setScrollFactor('floor-arcade', 0.9, 0.9);
	scaleObject('floor-arcade', 1.1, 1.1);
	


	
	makeAnimatedLuaSprite('lightBlink','lights',-600,-300)addAnimationByPrefix('lightBlink','dance','lightblink',3,true)
    objectPlayAnimation('lightBlink','dance',false)
    setScrollFactor('lightBlink', 0.9, 0.9);

	addLuaSprite('arcade', false);
	addLuaSprite('floor-arcade', false);
	addLuaSprite('lightBlink', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end