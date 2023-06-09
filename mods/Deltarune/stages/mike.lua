
function onCreate()
    precacheImage('mikelings');
end

function onBeatHit()

    if curBeat == 28 then
        makeAnimatedLuaSprite('mikelings','mikelings', -2000, 80);
        addAnimationByPrefix('mikelings','vroom','mikelings', 6, true);--true or false to loop
        objectPlayAnimation('mikelings','vroom', true);
        scaleObject('mikelings', 0.7, 0.7);
        addLuaSprite('mikelings', false);
    end

    if curBeat == 30 then
        doTweenX('mikelingsTween01', 'mikelings', 2000, 5, CircInOut);
    end

    if curBeat == 38 then
        removeLuaSprite('carousel');
    end

    if curBeat == 126 then
        makeAnimatedLuaSprite('mikelings','mikelings', -2000, 80);
        addAnimationByPrefix('mikelings','vroom','mikelings', 8, true);--true or false to loop
        objectPlayAnimation('mikelings','vroom', true);
        scaleObject('mikelings', 0.7, 0.7);
        addLuaSprite('mikelings', false);
    end

    if curBeat == 127 then
        doTweenX('mikelingsTween02', 'mikelings', 2000, 6, CircInOut);
    end

end


function onCreate()
	-- background shit
	
	makeLuaSprite('mike_lights','mike_lights', -200, -400);
	setScrollFactor('mike_lights', 0, 0);
	addLuaSprite('mike_lights', false);

	makeLuaSprite('mike_bg','mike_bg', -200, -160);
	setScrollFactor('mike_bg', 0, 0);
	addLuaSprite('mike_bg', false);

	makeLuaSprite('mike_clouds','mike_clouds', -350, -300);
	setScrollFactor('mike_clouds', 0.2, 0.2);
	addLuaSprite('mike_clouds', false);

	makeLuaSprite('mike_city_2','mike_city_2', -250, -300);
	setScrollFactor('mike_city_2', 0.1, 0.1);
	scaleObject('mike_city_2', 0.85, 0.85);
	addLuaSprite('mike_city_2', false);

	if not lowQuality then

		makeLuaSprite('mike_lights2','mike_lights', -270, -300);
		setScrollFactor('mike_lights2', 0, 0);
		setBlendMode('mike_lights2','add');
		setProperty('mike_lights2.alpha', 0);
		addLuaSprite('mike_lights2', true);
	end

	makeLuaSprite('mike_city','mike_city', -350, -250);
	setScrollFactor('mike_city', 0.2, 0.2);
	addLuaSprite('mike_city', false);

	makeAnimatedLuaSprite('fountain','fountain', -100, -100);
		addAnimationByPrefix('fountain','loop','fountain',10);
	addLuaSprite('fountain', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onBeatHit()
	objectPlayAnim('fountain', 'loop', true);

end

