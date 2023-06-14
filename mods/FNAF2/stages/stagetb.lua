function onCreate()
	makeLuaSprite('tbstage', 'tbstage', -800, -600);
	setLuaSpriteScrollFactor('tbstage', 1, 1);
	scaleObject('tbstage', 0.7, 0.7);

	makeLuaSprite('presents', 'presents', 1770, 450);
	setLuaSpriteScrollFactor('presents', 1.2, 1.2);
	scaleObject('presents', 0.6, 0.6);

	addLuaSprite('tbstage', false);
	addLuaSprite('presents', true);

end

function onStepHit()

	if curStep == 816 then
      removeLuaSprite('tbstage', false);
	  removeLuaSprite('table', false);
      
      makeLuaSprite('tbstage2', 'tbstage2', -800, -600);
	  setLuaSpriteScrollFactor('tbstage', 1, 1);
      scaleObject('tbstage2', 0.7, 0.7);

	  makeAnimatedLuaSprite('tbpossesed', 'tbpossesed', 100, -100);
	  setLuaSpriteScrollFactor('tbpossesed', 1, 1);
	  scaleObject('tbpossesed', 1.26, 1.26);

	  addAnimationByPrefix('tbpossesed','tbpossesed','idle',24,true);

      addLuaSprite('tbstage2', false);
	  addLuaSprite('tbpossesed', false);

  	end

   if curStep == 1520 then
   		removeLuaSprite('tbstage2', false);
		removeLuaSprite('tbpossesed', false);

    	makeLuaSprite('tbstage', 'tbstage', -800, -600);
		setLuaSpriteScrollFactor('tbstage', 1, 1);
		scaleObject('tbstage', 0.7, 0.7);

		addLuaSprite('tbstage', false);
	end
end