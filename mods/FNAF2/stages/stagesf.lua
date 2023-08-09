function onCreate()

	precacheImage('shadowstageglitch');
	precacheImage('staticpurp');
	precacheImage('shadowstage2');
	precacheImage('characters/sfreddy');
	precacheImage('characters/sfreddy2');
	precacheImage('characters/sbonnie');

	---------------------------------------------------------------------------

	makeLuaSprite('shadowstage1', 'shadowstage1', -700, -500);
	setLuaSpriteScrollFactor('shadowstage1', 1, 1);
	scaleObject('shadowstage1', 0.7, 0.7);

	makeLuaSprite('black','black', -500, -500);
	setLuaSpriteScrollFactor('black', 0, 0);
	scaleObject('black', 10, 10);
	addLuaSprite('black', true);

	addLuaSprite('shadowstage1', false);

end

function onStepHit()

	if curStep == 928 then

      doTweenY('shadowstage1','shadowstage1',2000,4,'bounceOut')

   end

   if curStep == 956 then

      	removeLuaSprite('shadowstage1' ,true);

      	makeLuaSprite('shadowstage2', 'shadowstage2', -600, -420);
   		setLuaSpriteScrollFactor('shadowstage2', 1, 1);
   		scaleObject('shadowstage2', 2, 2);

    	addLuaSprite('shadowstage2', false);

   	end
end