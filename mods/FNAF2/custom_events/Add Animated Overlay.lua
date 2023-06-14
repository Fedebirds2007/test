-- Made by Fedebirds2007 Holy sht, It took me 3 days cause I need to define what is value1 (and I didn't know it), now do 1 by 1.
function onEvent(name, value1, value2)
	if name == 'Add Animated Overlay' then

		if value1 == 'static2' then

			if value2 == 'delete' then 
				removeLuaSprite('static2', true)
			end

			if value2 ~= 'delete' then
				makeAnimatedLuaSprite('static2', 'static2', 0, 0)
				addAnimationByPrefix('static2', 'idle', 'idle', 24, true);
				setScrollFactor(1, 1);
				setObjectCamera('static2', 'hud');
				addLuaSprite('static2', true)
			end

		end

		if value1 == 'manglej' then

			if value2 == 'delete' then 
				removeLuaSprite('manglej', true)
			end

			if value2 ~= 'delete' then
				makeAnimatedLuaSprite('manglej', 'manglej', 0, 0)
				addAnimationByPrefix('manglej', 'idle', 'idle', 24, true);
				setScrollFactor(1, 1);
				setObjectCamera('manglej', 'hud');
				addLuaSprite('manglej', true)
			end

		end
	end

end