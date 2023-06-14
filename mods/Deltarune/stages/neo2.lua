function onCreate()
    makeLuaSprite('escuro', '', -1000, -200)
    makeGraphic('escuro', 4000, 2000, '000000')
    addLuaSprite('escuro', true);
	setProperty('escuro.alpha', 1);
    precacheImage('ass')
end

function onBeatHit()
    if curBeat == 28 then
        makeAnimatedLuaSprite('ass','ass', 0, 0);
		addAnimationByPrefix('ass','ass','ass ass', 15, false);--true or false to loop
		objectPlayAnimation('ass','ass', true);
		setObjectCamera('ass', 'camHUD', false);
		addLuaSprite('ass', false);
    end

    if curBeat == 31 then
        doTweenAlpha('escuro', 'escuro', 0, 0.5);
    end
end

function onCreate()
	-- background shit
	makeLuaSprite('neobg','neobg', -800, -100);
	setScrollFactor('neobg', 0, 0);
	addLuaSprite('neobg', false);

	makeAnimatedLuaSprite('fountain','fountain', 0, -100);
	setScrollFactor('fountain', 1, 0);
	addAnimationByPrefix('fountain','loop','fountain',10);
	addLuaSprite('fountain', false);

	makeLuaSprite('dangle','dangle', -1000, -200);
	setScrollFactor('dangle', 1, 1);
	addLuaSprite('dangle', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onBeatHit()
	objectPlayAnim('fountain', 'loop', true);
end

