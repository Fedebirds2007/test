function onEvent(name, value1, value2)
    if name == 'black' then
        makeLuaSprite('black','black', -500, -500);
        setLuaSpriteScrollFactor('black', 0, 0);
        scaleObject('black', 10, 10);
        addLuaSprite('black', true);
     
     end
 end