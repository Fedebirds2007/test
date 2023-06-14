-- Re-Made by Fedebirds2007 for FNFOnline (Leon's mod) and my FP's Repo in that mod

--Fake Susie
invisible = false
foreground = false
playablecharacter = false
doIdle = true

function onCreate()
	-- background shit

	makeLuaSprite('smile_bg','smile_bg', -200, -160);
	setScrollFactor('smile_bg', 0, 0);
	addLuaSprite('smile_bg', false);

	makeLuaSprite('backchairs','backchairs', -400, -160);
	scaleObject('backchairs', 0.6, 0.6);
	setScrollFactor('backchairs', 0.2, 0.1);
	addLuaSprite('backchairs', false);

	makeLuaSprite('smile_heaven','smile_heaven', -550, -350);
	scaleObject('smile_heaven', 0.8, 0.8);
	setScrollFactor('smile_heaven', 0.5, 0.5);
	addLuaSprite('smile_heaven', false);

	makeLuaSprite('forechairs','forechairs', -1900, -180);
	scaleObject('forechairs', 1.2, 1.2);
	setScrollFactor('forechairs', 1.3, 1.2);
	addLuaSprite('forechairs', true);

	if not lowQuality then

		makeLuaSprite('smile_light','smile_light', -500, -1200);
		setScrollFactor('smile_light', 0, 0);
		setBlendMode('smile_light','add');
		addLuaSprite('smile_light', true);

	end

	doIdle = true
	makeAnimatedLuaSprite('Susie_smile', 'Susie_smile',  950, 100);
	addAnimationByPrefix('Susie_smile', 'idle', 'Susie_smile idle', 9, true);
	addAnimationByPrefix('Susie_smile', 'singLEFT', 'Susie_smile left', 10, false);
	addAnimationByPrefix('Susie_smile', 'singDOWN', 'Susie_smile down', 10, false);
	addAnimationByPrefix('Susie_smile', 'singUP', 'Susie_smile up', 10, false);
	addAnimationByPrefix('Susie_smile', 'singRIGHT', 'Susie_smile right', 10, false);
	
	if playablecharacter == true then
		setPropertyLuaSprite('Susie_smile', 'flipX', true);
	else
		setPropertyLuaSprite('Susie_smile', 'flipX', false);
	end

	scaleObject('Susie_smile', 1, 1);


	objectPlayAnimation('Susie_smile', 'idle');
	addLuaSprite('Susie_smile', foreground);

	if invisible == true then
		setPropertyLuaSprite('Susie_smile', 'alpha', 0)
	end
end
-------------------------------------------------------

--Fake Susie Again

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	doIdle = true
	if noteType == 'Susie Sing' then
		doIdle = false
		objectPlayAnimation('Susie_smile', singAnims[direction + 1], false);
		if direction == 0 then
			setProperty('Susie_smile', '.offset.x', 150, 102);
			setProperty('Susie_smile', '.offset.y', 150, 102);

			if isSustainNote then
				objectPlayAnimation('Susie_smile', singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty('Susie_smile', '.offset.x', 145, 115);
			setProperty('Susie_smile', '.offset.y', 145, 115);

			if isSustainNote then
				objectPlayAnimation('Susie_smile', singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty('Susie_smile', '.offset.x', 147, 102);
			setProperty('Susie_smile', '.offset.y', 147, 102);

			if isSustainNote then
				objectPlayAnimation('Susie_smile', singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty('Susie_smile', '.offset.x', 147, 103);
			setProperty('Susie_smile', '.offset.y', 147, 103);

			if isSustainNote then
				objectPlayAnimation('Susie_smile', singAnims[direction + 1], true);
			end
		end
		doIdle = true
	end
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	doIdle = true
	if noteType == 'Susie Sing' then
		doIdle = false
		objectPlayAnimation('Susie_smile', singAnims[direction + 1], false);
		if direction == 0 then
			setProperty('Susie_smile', '.offset.x', 150, 102);
			setProperty('Susie_smile', '.offset.y', 150, 102);
		elseif direction == 1 then
			setProperty('Susie_smile', '.offset.x', 145, 115);
			setProperty('Susie_smile', '.offset.y', 145, 115);
		elseif direction == 2 then
			setProperty('Susie_smile', '.offset.x', 147, 102);
			setProperty('Susie_smile', '.offset.y', 147, 102);
		elseif direction == 3 then
			setProperty('Susie_smile', '.offset.x', 147, 103);
			setProperty('Susie_smile', '.offset.y', 147, 103);
		end
		doIdle = true
	end
end

function onBeatHit()
	doIdle = true
	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation('Susie_smile', 'idle');
		setProperty('Susie_smile', '.offset.x', 146, 102);
		setProperty('Susie_smile', '.offset.y', 146, 102);
	end
	doIdle = true
end

function onCountdownTick(counter)
	doIdle = true
	if counter % 2 == 0 then
		if doIdle == true then
			objectPlayAnimation('Susie_smile', 'idle');
			setProperty('Susie_smile', '.offset.x', 146, 102);
			setProperty('Susie_smile', '.offset.y', 146, 102);
		end
	end
end
--Please don't steal this code, just ask me and I would say yes :)

