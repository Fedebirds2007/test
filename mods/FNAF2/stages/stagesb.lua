function onCreate()

	precacheImage('shadowstage2');
	precacheImage('cursedfan');
	precacheImage('characters/shadowbonnie2');

	-------------------------------------------------------------------------

	makeLuaSprite('sbstage', 'sbstage', -1500, -450);
	setLuaSpriteScrollFactor('sbstage', 1, 1);
	scaleObject('sbstage', 0.7, 0.7);

	makeAnimatedLuaSprite('wfstage5', 'wfstage5', 250, 250);
	setLuaSpriteScrollFactor('wfstage5', 1.3, 1.3);
	scaleObject('wfstage5', 0.7, 0.7);

	addAnimationByPrefix('wfstage5','wfstage5','idle',24,true);

	makeLuaSprite('black','black', 0, 0);
    setObjectCamera('black', 'hud')

	addLuaSprite('sbstage', false);
	addLuaSprite('wfstage5', true);
	addLuaSprite('black', true);

end

function onStepHit()
	if curStep == 1204 then
		removeLuaSprite('sbstage', false);
		removeLuaSprite('wfstage5', false);
 
		makeLuaSprite('sbstage2', 'sbstage2', -1500, -450);
		setLuaSpriteScrollFactor('sbstage2', 0.8, 0.8);
		scaleObject('sbstage2', 0.7, 0.7);
 
		makeAnimatedLuaSprite('cursedfan', 'cursedfan', 250, 250);
		setLuaSpriteScrollFactor('cursedfan', 1.2, 1.2);
		scaleObject('cursedfan', 0.7, 0.7);
 
		addAnimationByPrefix('cursedfan','cursedfan','idle',24,true);
 
		addLuaSprite('sbstage2', false);
		addLuaSprite('cursedfan', true);
 
	end
end