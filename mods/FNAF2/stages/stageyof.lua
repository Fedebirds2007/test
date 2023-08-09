local dadPos = {}
local bfPos = {}
local dadPos2 = {}
local bfPos2 = {}

function onCreate()

	precacheImage('characters/yofchica');
	precacheImage('characters/yofbonnie');
	precacheImage('characters/yoffoxy');
	precacheImage('characters/yoffreddy');
	precacheImage('characters/yoffreddy2');
	precacheImage('characters/yoffreddy3');
	precacheImage('leftnotes');
	precacheImage('rightnotes');
	precacheImage('yofbstage');
	precacheImage('yofcstage');
	precacheImage('yoffoxstage');
	precacheImage('yoffreddystage');
	precacheImage('yoffstage');
	precacheImage('wfj');
	precacheImage('wfj2');
	precacheImage('golden');
	precacheImage('characters/bf11');
	precacheImage('characters/bf12');
	precacheImage('characters/bf2');
	

	-------------------------------------------------------------------------------------

	makeLuaSprite('yofbstage', 'yofbstage', -1400, -350);
	setLuaSpriteScrollFactor('yofbstage', 0.8, 0.8);
	scaleObject('yofbstage', 0.6, 0.6);

	makeLuaSprite('black','black', -500, -500);
	setLuaSpriteScrollFactor('black', 0, 0);
	scaleObject('black', 10, 10);
	addLuaSprite('black', true);

	addLuaSprite('yofbstage', false);
	
end

function onStepHit()


	if curStep == 800 and not middlescroll then
        for i=0,3 do 
            table.insert(dadPos, getPropertyFromGroup('opponentStrums', i, 'x'))
            table.insert(bfPos, getPropertyFromGroup('playerStrums', i, 'x'))
        end

        for i=1,4 do
            setPropertyFromGroup('opponentStrums', i - 1, 'x', bfPos[i])
            setPropertyFromGroup('playerStrums', i - 1, 'x', dadPos[i])
        end
    end

    if curStep == 1568 and not middlescroll then
        for i=0,3 do 
            table.insert(bfPos2, getPropertyFromGroup('playerStrums', i, 'x'))
            table.insert(dadPos2, getPropertyFromGroup('opponentStrums', i, 'x'))
        end

        for i=1,4 do
            setPropertyFromGroup('playerStrums', i - 1, 'x', dadPos2[i])
            setPropertyFromGroup('opponentStrums', i - 1, 'x', bfPos2[i])
        end
    end

    if curStep == 768 then

		makeLuaText('Text',"I never thought i'd make it through that vent.",1000,140,550)
		setTextSize('Text',25)
		addLuaText("Text")
	
	end

	if curStep == 800 then

		removeLuaText("Text")
		
	end

	if curStep == 800 then

		removeLuaSprite('yofbstage', false);

		makeLuaSprite('yofcstage', 'yofcstage', -1400, -350);
		setLuaSpriteScrollFactor('yofcstage', 0.8, 0.8);
		scaleObject('yofcstage', 0.6, 0.6);
	
		addLuaSprite('yofcstage', false);
	
	end

	if curStep == 1538 then

		makeLuaText('Text',"Argh... you scurvy land lubber!",1000,140,550)
		setTextSize('Text',25)
		addLuaText("Text")
	
	end
	
	if curStep == 1568 then
	
		removeLuaText("Text")

		makeLuaText('Text',"Never stood a chance!",1000,140,550)
		setTextSize('Text',25)
		addLuaText("Text")
	
	end


	if curStep == 1584 then

		removeLuaText("Text")

		removeLuaSprite('yofcstage', false);
	
		makeLuaSprite('yoffoxstage', 'yoffoxstage', -1400, -350);
		setLuaSpriteScrollFactor('yoffoxstage', 0.8, 0.8);
		scaleObject('yoffoxstage', 0.6, 0.6);

		addLuaSprite('yoffoxstage', false);

	end

	if curStep == 2224 then

		makeLuaText('Text',"We---",1000,140,550)
		setTextSize('Text',25)
		addLuaText("Text")
	
	end

	if curStep == 2229 then

		makeLuaText('Text',"Welcome to the Fazbear family...",1000,140,550)
		setTextSize('Text',25)
		addLuaText("Text")
	
	end
	
	
	if curStep == 2256 then

		removeLuaText("Text")

		removeLuaSprite('yoffoxstage', false);

		makeLuaSprite('yoffstage', 'yoffstage', -1400, -350);
		setLuaSpriteScrollFactor('yoffstage', 0.8, 0.8);
		scaleObject('yoffstage', 0.6, 0.6);

		addLuaSprite('yoffstage', false);

	end	

	if curStep == 2816 then

		makeLuaText('Text',"You'll never be alone again...",1000,140,550)
		setTextSize('Text',25)
		addLuaText("Text")
	
	end
	
	if curStep == 2864 then
	
		removeLuaText("Text")
	
	end
		
	if curStep == 2896 then

		removeLuaSprite('yoffstage', false);
	
		makeLuaSprite('yoffreddystage', 'yoffreddystage', -1900, -480);
		setLuaSpriteScrollFactor('yoffreddystage', 1, 1);
		scaleObject('yoffreddystage', 0.8, 0.8);

		addLuaSprite('yoffreddystage', false);
	
	end		

end
