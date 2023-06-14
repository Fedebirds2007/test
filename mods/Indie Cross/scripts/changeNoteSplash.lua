local splashCount = 0;
local splashDestroyed = 0

local specialSplashCount = 0
local specialSplashDestroyed = 0
local splashThing = 'note splash purple 1';

local sickTrack = 0;

local texture = 'IC_NoteSplash';


-- No longer messes with your ClientPrefs! Which means Note Splashes no longer randomly turn off!

-- function onCreate()
-- 	preCacheShit()
-- end

function onCreatePost()
	precacheImage(texture)
	makeAnimatedLuaSprite('noteSplashp', texture, 100, 100);
	addLuaSprite('noteSplashp',false);
	setProperty('noteSplashp.alpha',0.001)
    -- setProperty('noteSplashp.alpha', 0.0)
	if songName == 'build-our-freaky-machine' then
		precacheImage('IC_NoteSplash - grey')
	end
end

function goodNoteHit(note, direction, type, sus)
	if sickTrack < getProperty('sicks') then
		sickTrack = sickTrack + 1;

		if type == '' then
			spawnNormalSplash(note, direction, type, sus);
		else
			spawnCustomSplash(note, direction, type, sus);
		end
	end
end
function spawnCustomSplash(note, direction, type, sus)
	specialSplashCount = specialSplashCount + 1;

	if type == 'BlueBoneNote' then

		splashThing = 'note splash blue 1'


	elseif type == 'OrangeBoneNote' or type == 'PapyrusNote' then
		
		splashThing = 'note splash orange 1'

	elseif type == 'CupheadNote' then
		
		splashThing = 'note splash purple 1'

	elseif type == 'BendySplashNote' then

		splashThing = 'note splash purple 1'
	end
	if type ~= 'Parry Note' then
		makeAnimatedLuaSprite('noteSplashS'..specialSplashCount, texture, getPropertyFromGroup('playerStrums', direction, 'x'), getPropertyFromGroup('playerStrums', direction, 'y'));

		addAnimationByPrefix('noteSplashS'..specialSplashCount, 'anim', splashThing, 22, false);
		addLuaSprite('noteSplashS' .. specialSplashCount);
	else
		makeAnimatedLuaSprite('noteSplashS'..specialSplashCount, 'cup/NOTECup_assetsSplash', getPropertyFromGroup('playerStrums', direction, 'x') - 120, getPropertyFromGroup('playerStrums', direction, 'y') - 150);
		scaleObject('noteSplashS'..splashCount,0.8,0.8)
		addAnimationByPrefix('noteSplashS'..specialSplashCount, 'anim', 'ParryFX', 22, false);
		addLuaSprite('noteSplashS'..specialSplashCount);
	end
	if type == 'BendySplashNote' or type == 'Devil Note' then
		setProperty('noteSplashS'..specialSplashCount..'.color','000000')
	end

	setProperty('noteSplashS'..specialSplashCount..'.offset.x', 85);
	setProperty('noteSplashS'..specialSplashCount..'.offset.y', 85);
	setProperty('noteSplashS'..specialSplashCount..'.alpha', 0.6);
	setObjectCamera('noteSplashS' .. specialSplashCount, 'hud');
	setObjectOrder('noteSplashS'..specialSplashCount, 9999); -- this better make the splashes go in front-
end

function spawnNormalSplash(note, direction, type, sus)
	splashCount = splashCount + 1;

	if direction == 0 then
		splashThing = 'note splash purple 1';
	elseif direction == 1 then
		splashThing = 'note splash blue 1';
	elseif direction == 2 then
		splashThing = 'note splash green 1';
	else
		splashThing = 'note splash red 1';
	end

	makeAnimatedLuaSprite('noteSplash' .. splashCount, texture, getPropertyFromGroup('playerStrums', direction, 'x'), getPropertyFromGroup('playerStrums', direction, 'y'));
		
	addAnimationByPrefix('noteSplash' .. splashCount, 'anim', splashThing, 22, false);
	addLuaSprite('noteSplash' .. splashCount);

	setProperty('noteSplash' .. splashCount .. '.offset.x', 85);
	setProperty('noteSplash' .. splashCount .. '.offset.y', 85);
	setProperty('noteSplash' .. splashCount .. '.alpha', 0.6);

	setObjectCamera('noteSplash' .. splashCount, 'hud');
	setObjectOrder('noteSplash' .. splashCount, 9999); -- this better make the splashes go in front-
end

function onUpdate()
	for splashLength = splashDestroyed + 1, splashCount do
		if getProperty('noteSplash'..splashLength..'.animation.curAnim.finished') == true then
			removeLuaSprite('noteSplash'..splashLength,true);
			splashDestroyed = splashDestroyed + 1
		end
	end
	for splashSLength = specialSplashDestroyed + 1, specialSplashCount do
		if getProperty('noteSplashS'..splashSLength..'.animation.curAnim.finished') == true then
			removeLuaSprite('noteSplashS'..splashSLength,true);
			specialSplashDestroyed = specialSplashDestroyed + 1
		end
	end
	for noteSplashLength = 0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', noteSplashLength, 'visible', false);
	end
end
function onStepHit()
	if songName == 'build-our-freaky-machine' then
		if curStep == 1280 then
			texture = 'IC_NoteSplash - grey'
		elseif curStep == 1536 then
			texture = 'IC_NoteSplash'
		end
	end
end