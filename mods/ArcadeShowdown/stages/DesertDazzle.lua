function onCreate()
	-- background shit
	makeLuaSprite('desertdazzlebg', 'desertdazzlebg', -1000, -700)
	scaleObject('desertdazzlebg', 8, 8)
	setLuaSpriteScrollFactor('desertdazzlebg', 0.2, 0.2);
	
	makeLuaSprite('desertdazzleground', 'desertdazzleground', -1000, -700)
	scaleObject('desertdazzleground', 8, 8)
	
	addLuaSprite('desertdazzlebg', false)
	setProperty('desertdazzlebg.antialiasing',false)
	addLuaSprite('desertdazzleground', false)
	setProperty('desertdazzleground.antialiasing',false)
end

function onCreatePost()

	setProperty('gf.visible',false)
end