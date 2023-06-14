-- Re-Made by Fedebirds2007 for FNFOnline (Leon's mod) and my FP's Repo in that mod

--Fake Lancer
invisible = false
foreground = true
playablecharacter = false
doIdle = true

function onCreate()
	-- background shit

	makeLuaSprite('lancertree4','lancertree', -900, -150);
	scaleObject('lancertree4', 0.6, 0.6);
	setProperty('lancertree4.alpha', 0.5);
	setScrollFactor('lancertree4', 0.5, 0.5);
	addLuaSprite('lancertree4', false);

	makeLuaSprite('lancertree5','lancertree', 0, -150);
	scaleObject('lancertree5', 0.6, 0.6);
	setProperty('lancertree5.alpha', 0.5);
	setScrollFactor('lancertree5', 0.5, 0.5);
	addLuaSprite('lancertree5', false);

	makeLuaSprite('lancertree1','lancertree', -1500, -200);
	scaleObject('lancertree1', 0.8, 0.8);
	setScrollFactor('lancertree1', 0.8, 0.8);
	addLuaSprite('lancertree1', false);

	makeLuaSprite('lancertree2','lancertree', -800, -200);
	scaleObject('lancertree2', 0.8, 0.8);
	setScrollFactor('lancertree2', 0.8, 0.8);
	addLuaSprite('lancertree2', false);

	makeLuaSprite('lancertree3','lancertree', -100, -200);
	scaleObject('lancertree3', 0.8, 0.8);
	setScrollFactor('lancertree3', 0.8, 0.8);
	addLuaSprite('lancertree3', false);

	makeLuaSprite('lancerfloor','lancerfloor', -900, -200);
	setScrollFactor('lancerfloor', 1, 1);
	addLuaSprite('lancerfloor', false);


	doIdle = true
	makeAnimatedLuaSprite('throsh', 'characters/throsh',  -850, 120);
	addAnimationByPrefix('throsh', 'idle', 'throsh idle', 12, true);
	addAnimationByPrefix('throsh', 'singLEFT', 'throsh left', 12, false);
	addAnimationByPrefix('throsh', 'singDOWN', 'throsh down', 12, false);
	addAnimationByPrefix('throsh', 'singUP', 'throsh up', 12, false);
	addAnimationByPrefix('throsh', 'singRIGHT', 'throsh right', 12, false);
	
	if playablecharacter == true then
		setPropertyLuaSprite('throsh', 'flipX', true);
	else
		setPropertyLuaSprite('throsh', 'flipX', false);
	end

	scaleObject('throsh', 0.7, 0.7);


	objectPlayAnimation('throsh', 'idle');
	addLuaSprite('throsh', foreground);

	if invisible == true then
		setPropertyLuaSprite('throsh', 'alpha', 0)
	end
end
-------------------------------------------------------

--Fake Lancer Again

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	doIdle = true
	if noteType == 'Lancer Sing' then
		doIdle = false
		objectPlayAnimation('throsh', singAnims[direction + 1], false);
		if direction == 0 then
			setProperty('throsh', '.offset.x', 0, 0);
			setProperty('throsh', '.offset.y', 0, 0);

			if isSustainNote then
				objectPlayAnimation('throsh', singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty('throsh', '.offset.x', 0, 0);
			setProperty('throsh', '.offset.y', 0, 0);

			if isSustainNote then
				objectPlayAnimation('throsh', singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty('throsh', '.offset.x', 0, 0);
			setProperty('throsh', '.offset.y', 0, 0);

			if isSustainNote then
				objectPlayAnimation('throsh', singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty('throsh', '.offset.x', 0, 0);
			setProperty('throsh', '.offset.y', 0, 0);

			if isSustainNote then
				objectPlayAnimation('throsh', singAnims[direction + 1], true);
			end
		end
		doIdle = true
	end
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	doIdle = true
	if noteType == 'Lancer Sing' then
		doIdle = false
		objectPlayAnimation('throsh', singAnims[direction + 1], false);
		if direction == 0 then
			setProperty('throsh', '.offset.x', 0, 0);
			setProperty('throsh', '.offset.y', 0, 0);
		elseif direction == 1 then
			setProperty('throsh', '.offset.x', 0, 0);
			setProperty('throsh', '.offset.y', 0, 0);
		elseif direction == 2 then
			setProperty('throsh', '.offset.x', 0, 0);
			setProperty('throsh', '.offset.y', 0, 0);
		elseif direction == 3 then
			setProperty('throsh', '.offset.x', 0, 0);
			setProperty('throsh', '.offset.y', 0, 0);
		end
		doIdle = true
	end
end

function onBeatHit()
	doIdle = true
	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation('throsh', 'idle');
		setProperty('throsh', '.offset.x', 0, 0);
		setProperty('throsh', '.offset.y', 0, 0);
	end
	doIdle = true
end

function onCountdownTick(counter)
	doIdle = true
	if counter % 2 == 0 then
		if doIdle == true then
			objectPlayAnimation('throsh', 'idle');
			setProperty('throsh', '.offset.x', 0, 0);
			setProperty('throsh', '.offset.y', 0, 0);
		end
	end
end
--Please don't steal this code, just ask me and I would say yes :)

