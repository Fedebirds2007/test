function onEvent(n,v1,v2) --Made by bbpanzu


	if n == 'Flash Camera Black' then

	  makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'000000')
	  addLuaSprite('flash', true);
        setObjectCamera('flash', 'other');
	  setLuaSpriteScrollFactor('flash',0,0)
	  setProperty('flash.scale.x',2)
	  setProperty('flash.scale.y',2)
	  setProperty('flash.alpha',0)
	  setProperty('flash.alpha',1)
	  doTweenAlpha('flTw','flash',0,v1,'linear')
	end



end

--I find it funny how bbpanzu's Flash is more optimized than other flash events