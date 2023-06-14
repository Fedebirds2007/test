function onEvent(name, value1, value2)
	if name == 'addballoon' and not middlescroll then
        makeLuaSprite( value1, value1, value2,1000)
        setObjectCamera( value1,'hud')
		scaleObject( value1, 0.8, 0.8);
		addLuaSprite( value1,true);
		doTweenY('in', value1,250,1,'sineOut')

end
end