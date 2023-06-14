-- Made by Fedebirds2007 Holy sht, It took me 3 days cause I need to define what is value1 (and I didn't know it), now do 1 by 1.
function onEvent(name, value1, value2)
	if name == 'addanimimage' then

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

		if value1 == 'chicjump' then

			if value2 == 'delete' then 
				removeLuaSprite('chicjump', true)
			end

			if value2 ~= 'delete' then
				makeAnimatedLuaSprite('chicjump', 'chicjump', 0, 0)
				addAnimationByPrefix('chicjump', 'idle', 'idle', 24, true);
				setScrollFactor(1, 1);
				setObjectCamera('chicjump', 'hud');
				addLuaSprite('chicjump', true)
			end

		end

		if value1 == 'shadowstageglitch' then

			if value2 == 'delete' then 
				removeLuaSprite('shadowstageglitch', true)
			end

			if value2 ~= 'delete' then
				makeAnimatedLuaSprite('shadowstageglitch', 'shadowstageglitch', 0, 0)
				addAnimationByPrefix('shadowstageglitch', 'idle', 'idle', 24, true);
				setScrollFactor(1, 1);
				setObjectCamera('shadowstageglitch', 'hud');
				addLuaSprite('shadowstageglitch', true)
			end

		end

		if value1 == 'sparkleeffect' then

			if value2 == 'delete' then 
				removeLuaSprite('sparkleeffect', true)
			end

			if value2 ~= 'delete' then
				makeAnimatedLuaSprite('sparkleeffect', 'sparkleeffect', 0, 0)
				addAnimationByPrefix('sparkleeffect', 'idle', 'idle', 24, true);
				setScrollFactor(1, 1);
				setObjectCamera('sparkleeffect', 'hud');
				addLuaSprite('sparkleeffect', true)
			end

		end

		if value1 == 'staticpurp' then

			if value2 == 'delete' then 
				removeLuaSprite('staticpurp', true)
			end

			if value2 ~= 'delete' then
				makeAnimatedLuaSprite('staticpurp', 'staticpurp', 0, 0)
				addAnimationByPrefix('staticpurp', 'idle', 'idle', 24, true);
				setScrollFactor(1, 1);
				setObjectCamera('staticpurp', 'hud');
				addLuaSprite('staticpurp', true)
			end

		end

		if value1 == 'static' then

			if value2 == 'delete' then 
				removeLuaSprite('static', true)
			end

			if value2 ~= 'delete' then
				makeAnimatedLuaSprite('static', 'static', 0, 0)
				addAnimationByPrefix('static', 'idle', 'idle', 24, true);
				setScrollFactor(1, 1);
				setObjectCamera('static', 'hud');
				addLuaSprite('static', true)
			end

		end

		if value1 == 'rain' then

			if value2 == 'delete' then 
				removeLuaSprite('rain', true)
			end

			if value2 ~= 'delete' then
				makeAnimatedLuaSprite('rain', 'rain', 0, 0)
				addAnimationByPrefix('rain', 'idle', 'idle', 24, true);
				setScrollFactor(1, 1);
				setObjectCamera('rain', 'hud');
				addLuaSprite('rain', true)
			end

		end

	end

end