function onEvent(name, value1, value2)
	if name == 'addsign' and middlescroll then
		makeLuaSprite('bbsign2','bbsign2',300, -550)
        setObjectCamera('bbsign2','hud')
		scaleObject('bbsign2', 0.5, 0.5);
		addLuaSprite('bbsign2',true);
		doTweenY('in','bbsign2',-270,1,'sineOut')

end
	if name == 'addsign' and not middlescroll then
        makeLuaSprite('bbsign','bbsign',2000,-50)
        setObjectCamera('bbsign','hud')
		scaleObject('bbsign', 0.5, 0.5);
		addLuaSprite('bbsign',true);
		doTweenX('in','bbsign',750,0.5,'sineOut')
		runTimer('timer3', 10)

end
end
        function onTimerCompleted(tag, loops, loopsLeft)
            if tag == 'timer3' and not middlescroll then
				
			doTweenX('in','bbsign',2000,1,'sineIn')
	end
end