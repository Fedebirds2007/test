function onCreate()

	precacheImage('mrhugsjump');
	precacheImage('characters/mrhugs');
	precacheImage('characters/gtfreddyrage');
	precacheImage('gamerstage');
	precacheImage('gamerstage2');
	precacheImage('gamerstage3');
	precacheImage('gamerstage4');

	-------------------------------------------------------------------

	makeLuaSprite('gamerstage3', 'gamerstage3', -1400, -350);
	setLuaSpriteScrollFactor('gamerstage3', 1, 1);
	scaleObject('gamerstage3', 0.45, 0.45);

	addLuaSprite('gamerstage3', false);

	makeAnimatedLuaSprite('mrhugsjump', 'mrhugsjump', -700, -50);
	setLuaSpriteScrollFactor('mrhugsjump', 1, 1);
	scaleObject('mrhugsjump', 0.5, 0.5);

	addAnimationByPrefix('mrhugsjump','mrhugsjump','idle',26,true);

	addLuaSprite('mrhugsjump', false);

	makeLuaSprite('gamerstage2', 'gamerstage2', -1400, -350);
	setLuaSpriteScrollFactor('gamerstage2', 1, 1);
	scaleObject('gamerstage2', 0.45, 0.45);
	setObjectOrder('gamerstage2', getObjectOrder('dadGroup') + 1)

	addLuaSprite('gamerstage2', false);

	makeLuaSprite('gamerstage', 'gamerstage', -1400, -350);
	setLuaSpriteScrollFactor('gamerstage', 1, 1);
	scaleObject('gamerstage', 0.45, 0.45);
	setObjectOrder('gamerstage', getObjectOrder('dadGroup') + 1)

	addLuaSprite('gamerstage', false);
end

function onStepHit()



	if curStep == 384 then
      
		removeLuaSprite('gamerstage2', false);

  	end

 	if curStep == 400 then
		
		removeLuaSprite('mrhugsjump', false);

 	end

 	if curStep == 402 then

		makeLuaText('Text',"Mr. Hugs ...",1000,140,550)
    	setTextSize('Text',25)
		addLuaText("Text")

	end

	if curStep == 417 then

		removeLuaText("Text")
		makeLuaText('Text2',"Got me again!",1000,140,550)
		setTextSize('Text2',25)
		addLuaText("Text2")
	
	end

	if curStep == 432 then

		removeLuaText("Text2")
		
	end

	if curStep == 432 then
		makeLuaSprite('gamerstage2', 'gamerstage2', -1400, -350);
		setLuaSpriteScrollFactor('gamerstage2', 1, 1);
		scaleObject('gamerstage2', 0.45, 0.45);
		setObjectOrder('gamerstage2', getObjectOrder('dadGroup') + 1)

		addLuaSprite('gamerstage2', false);
			
			
	end

	if curStep == 832 then
		removeLuaSprite('gamerstage2', false);
		removeLuaSprite('gamerstage4', false);
				
	end

	if curStep == 1408 then
		makeAnimatedLuaSprite('mrhugsjump', 'mrhugsjump', -700, -50);
		setLuaSpriteScrollFactor('mrhugsjump', 1, 1);
		scaleObject('mrhugsjump', 0.5, 0.5);

		addAnimationByPrefix('mrhugsjump','mrhugsjump','idle',26,true);

		addLuaSprite('mrhugsjump', false);
	
	end

	if curStep == 1424 then
		makeLuaSprite('gamerstage4', 'gamerstage4', -1400, -350);
		setLuaSpriteScrollFactor('gamerstage4', 1, 1);
		scaleObject('gamerstage4', 0.45, 0.45);

		addLuaSprite('gamerstage4', false);
	
	end

	if curStep == 402 then

		makeLuaText('Text',"Mr. Hugs ...",1000,140,550)
		setTextSize('Text',25)
		addLuaText("Text")
	
	end
				
	if curStep == 417 then
				
		removeLuaText("Text")
		makeLuaText('Text2',"Got me again!",1000,140,550)
		setTextSize('Text2',25)
		addLuaText("Text2")
	
	end
				

end