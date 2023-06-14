function onCreate()
	makeLuaSprite('bbstage', 'bbstage', -800, -600);
	setLuaSpriteScrollFactor('bbstage', 1, 1);
	scaleObject('bbstage', 0.7, 0.7);

	makeLuaSprite('presents', 'presents', -400, 300);
	setLuaSpriteScrollFactor('presents', 1.25, 1.25);
	scaleObject('presents', 0.8, 0.8);

	makeLuaSprite('table', 'table', 1550, 450);
	setLuaSpriteScrollFactor('table', 1.05, 1.05);
	scaleObject('table', 0.9, 0.9);

	makeLuaSprite('stars', 'stars', -400, -650);
	setLuaSpriteScrollFactor('stars', 1.2, 1.2);
	scaleObject('stars', 1.5, 1.5);


	addLuaSprite('bbstage', false);
	addLuaSprite('presents', true);
	addLuaSprite('table', true);
	addLuaSprite('stars', true);

end

function onStepHit()


	if curStep == 378 then
      makeAnimatedLuaSprite('jj', 'jj', 150, 200);
      scaleObject('jj', 0.9, 0.9);

      addLuaSprite('jj', false);

	  addAnimationByPrefix('jj','jj','idle',24,true);

   end

	if curStep == 656 then

		removeLuaSprite('jj', false);

	end

	if curStep == 1164 then
		makeAnimatedLuaSprite('jj', 'jj', 150, 200);
		scaleObject('jj', 0.9, 0.9);
  
		addLuaSprite('jj', false);
  
		addAnimationByPrefix('jj','jj','idle',24,true);


	end
end
