function onCreate()
	-- background shit
	makeLuaSprite('CarnivalNightZone', 'CarnivalNightZone', -1000, -700)
	scaleObject('CarnivalNightZone', 8, 8)
	setLuaSpriteScrollFactor('CarnivalNightZone', 0.2, 0.2);
	
	makeLuaSprite('CarnivalNightZoneBarrelOfDoom', 'CarnivalNightZoneBarrelOfDoom', -1000, -700)
	scaleObject('CarnivalNightZoneBarrelOfDoom', 8, 8)
	
	addLuaSprite('CarnivalNightZone', false)
	setProperty('CarnivalNightZone.antialiasing',false)
	addLuaSprite('CarnivalNightZoneBarrelOfDoom', false)
	setProperty('CarnivalNightZoneBarrelOfDoom.antialiasing',false)
end

function onCreatePost()

	setProperty('gf.visible',false)
end