function onCreate()

    makeLuaSprite('bbg', 'beast/beastbg', -1040, 3)
	setLuaSpriteScrollFactor('bbg', 1, 1)
	scaleObject('bbg', 0.7, 0.7)

    addLuaSprite('bbg', false)

end

function onCreatePost()
    setProperty('boyfriend.visible', false)
    setProperty('gf.visible', false)

end



