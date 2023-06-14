local BfFly = false
function onCreate()
	-- background shit
	precacheImage('sans/battle')
	makeLuaSprite('SansBG','sans/hall',0,100)
	scaleObject('SansBG',1.55,1.5)
	addLuaSprite('SansBG', false);
	makeAnimatedLuaSprite('DodgeAlert','sans/DodgeMechs',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') - 50)
	addAnimationByPrefix('DodgeAlert','alert','Alarm instance 1',24,false)
	addAnimationByPrefix('DodgeAlert','attack','Bones boi instance 1',24,false)
	scaleObject('DodgeAlert',0.8,0.8)	 
end
function onUpdate()
    if BfFly == true then
        doTweenY('boyfriendTweenY', 'boyfriend', 700 + 300 *math.sin((curBeat *1) * math.pi),10)
    end
end
