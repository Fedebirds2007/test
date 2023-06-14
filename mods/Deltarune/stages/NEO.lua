
-- Re-Made by Fedebirds2007 for FNFOnline (Leon's mod) and my FP's Repo in that mod

--Fake Susie
invisible = false
foreground = false
playablecharacter = false
doIdle = true

function onCreate()
	-- bg shit
	makeLuaSprite('neobg','neobg', -420, -160);
	setScrollFactor('neobg', 0.2, 1);
	addLuaSprite('neobg', false);

	makeLuaSprite('neo_amongus','neo_amongus', -1100, -100);
	setScrollFactor('neo_amongus', 0.1, 0.8);
	addLuaSprite('neo_amongus', false);

	makeLuaSprite('neo_amongus2','neo_amongus', -1100-2191, -100);
	setScrollFactor('neo_amongus2', 0.1, 0.8);
	addLuaSprite('neo_amongus2', false);

	makeLuaSprite('neo_city','neo_city', -1000, -170);
	setScrollFactor('neo_city', 0.2, 1);
	addLuaSprite('neo_city', false);

	makeLuaSprite('neo_city2','neo_city', -1000-2191, -170);
	setScrollFactor('neo_city2', 0.2, 1);
	addLuaSprite('neo_city2', false);

	makeLuaSprite('TUNNELTCHOOTCHOO', '', -1000, 0)
	makeGraphic('TUNNELTCHOOTCHOO', 4000, 2000, '000000')
	addLuaSprite('TUNNELTCHOOTCHOO',false)

	makeAnimatedLuaSprite('rail3','rail', -410, 570);
		addAnimationByPrefix('rail3','move','rail',24);
	addLuaSprite('rail3', false);
	scaleObject('rail3', 1.25, 0.6);

	makeAnimatedLuaSprite('rail2','rail', -410, 610);
		addAnimationByPrefix('rail2','move','rail',24);
	addLuaSprite('rail2', false);
	scaleObject('rail2', 1.25, 0.7);

	makeAnimatedLuaSprite('rail1','rail', -410, 666);
		addAnimationByPrefix('rail1','move','rail',24);
	addLuaSprite('rail1', false);
	scaleObject('rail1', 1.25, 0.8);

	makeLuaSprite('dangle','dangle', -730, -150);
	setScrollFactor('dangle', 1, 1);
	addLuaSprite('dangle', false);

	doIdle = true
	makeAnimatedLuaSprite('susie_neo', 'susie_neo',  950, 270);
	addAnimationByPrefix('susie_neo', 'idle', 'susie_neo idle', 9, true);
	addAnimationByPrefix('susie_neo', 'singLEFT', 'susie_neo left', 10, false);
	addAnimationByPrefix('susie_neo', 'singDOWN', 'susie_neo down', 10, false);
	addAnimationByPrefix('susie_neo', 'singUP', 'susie_neo up', 10, false);
	addAnimationByPrefix('susie_neo', 'singRIGHT', 'susie_neo right', 10, false);
	
	if playablecharacter == true then
		setPropertyLuaSprite('susie_neo', 'flipX', true);
	else
		setPropertyLuaSprite('susie_neo', 'flipX', false);
	end

	scaleObject('susie_neo', 0.7, 0.7);


	objectPlayAnimation('susie_neo', 'idle');
	addLuaSprite('susie_neo', foreground);

	if invisible == true then
		setPropertyLuaSprite('susie_neo', 'alpha', 0)
	end
end
-------------------------------------------------------

--Fake Susie Again

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	doIdle = true
	if noteType == 'Susie Sing neo' then
		doIdle = false
		objectPlayAnimation('susie_neo', singAnims[direction + 1], false);
		if direction == 0 then
			setProperty('susie_neo', '.offset.x', 150, 102);
			setProperty('susie_neo', '.offset.y', 150, 102);

			if isSustainNote then
				objectPlayAnimation('susie_neo', singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty('susie_neo', '.offset.x', 145, 115);
			setProperty('susie_neo', '.offset.y', 145, 115);

			if isSustainNote then
				objectPlayAnimation('susie_neo', singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty('susie_neo', '.offset.x', 147, 102);
			setProperty('susie_neo', '.offset.y', 147, 102);

			if isSustainNote then
				objectPlayAnimation('susie_neo', singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty('susie_neo', '.offset.x', 147, 103);
			setProperty('susie_neo', '.offset.y', 147, 103);

			if isSustainNote then
				objectPlayAnimation('susie_neo', singAnims[direction + 1], true);
			end
		end
		doIdle = true
	end
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	doIdle = true
	if noteType == 'Susie Sing neo' then
		doIdle = false
		objectPlayAnimation('susie_neo', singAnims[direction + 1], false);
		if direction == 0 then
			setProperty('susie_neo', '.offset.x', 150, 102);
			setProperty('susie_neo', '.offset.y', 150, 102);
		elseif direction == 1 then
			setProperty('susie_neo', '.offset.x', 145, 115);
			setProperty('susie_neo', '.offset.y', 145, 115);
		elseif direction == 2 then
			setProperty('susie_neo', '.offset.x', 147, 102);
			setProperty('susie_neo', '.offset.y', 147, 102);
		elseif direction == 3 then
			setProperty('susie_neo', '.offset.x', 147, 103);
			setProperty('susie_neo', '.offset.y', 147, 103);
		end
		doIdle = true
	end
end

function onBeatHit()
	doIdle = true
	objectPlayAnim('rail1', 'move', true);
	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation('susie_neo', 'idle');
		setProperty('susie_neo', '.offset.x', 146, 102);
		setProperty('susie_neo', '.offset.y', 146, 102);
	end
	doIdle = true
end

function onCountdownTick(counter)
	doIdle = true
	if counter % 2 == 0 then
		if doIdle == true then
			objectPlayAnimation('susie_neo', 'idle');
			setProperty('susie_neo', '.offset.x', 146, 102);
			setProperty('susie_neo', '.offset.y', 146, 102);
		end
	end
end
--Well this one was faster than bongo-doo, 40min :D
--Please don't steal this code, just ask me and I would say yes :)
	