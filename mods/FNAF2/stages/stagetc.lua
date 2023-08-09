function onCreate()
    
	precacheImage('ah');
	precacheImage('chicken');
	precacheImage('tcstage2');
	precacheImage('bbappear');
	precacheImage('characters/bf7');
	precacheImage('characters/epchica');
	
	-----------------------------------------------------------------------
	
	makeLuaSprite('tcstage', 'tcstage', 200, -450);
	setLuaSpriteScrollFactor('tcstage', 1, 1);
	scaleObject('tcstage', 0.6, 0.6);

	makeLuaSprite('wire', 'wire', 1800, -150);
	setLuaSpriteScrollFactor('wire', 1.25, 1.25);
	scaleObject('wire', 0.9, 0.9);

	addLuaSprite('tcstage', false);
	addLuaSprite('wire', true);
	
end

function onStepHit()

	if curStep == 860 then
		makeAnimatedLuaSprite('bbappear','bbappear', 400, 100);
		addAnimationByPrefix('bbappear','bbappear','idle',24,true);
		addLuaSprite('bbappear', false);

	end

	if curStep == 896 then
	 removeLuaSprite('tcstage1', false);
	 removeLuaSprite('wire', false);
	 removeLuaSprite('bbappear', false);
 
	 makeLuaSprite('tcstage2', 'tcstage2', -800, -1000);
	 setLuaSpriteScrollFactor('tcstage2', 1, 1);
	 scaleObject('tcstage2', 0.8, 0.8);
 
 
	 addLuaSprite('tcstage2', false);
 
	end
 
	if curStep == 1488 then
 
		makeLuaText('Text',"You won't get tired of my voice...",1000,140,550)
		setTextSize('Text',25)
		addLuaText("Text")
	 
	end
	 
	if curStep == 1500 then
	 
		removeLuaText("Text")
		makeLuaText('Text2',"Will you ?",1000,140,550)
		setTextSize('Text2',25)
		addLuaText("Text2")
		 
	end
	 
	if curStep == 1504 then
	 
		removeLuaText("Text2")
			 
	end

end
