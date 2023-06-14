function onEvent(name, value1, value2)
    if name == 'addjj' and not middlescroll then
        makeAnimatedLuaSprite('jjhead','jjhead', 750 ,200);
        setObjectCamera('jjhead', 'hud')
        addAnimationByPrefix('jjhead','jjhead','idle',24,true);
        addLuaSprite('jjhead', true);


        runTimer('timer', 7.7)
    end
end
        function onTimerCompleted(tag, loops, loopsLeft)
            if tag == 'timer' then

                removeLuaSprite('jjhead');

     end
    end
    

 