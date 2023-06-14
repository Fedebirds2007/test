local healthBarStyle = ''
local barOffsetX = 0
local barOffsetY = 0

local barImage = ''
local changeHealthBar = true
function onCreatePost()
    if songName == 'Burning-In-Hell' or songName == 'Final-Stretch' or songName == 'Bad-Time' or songName == 'Whoopee' or songName == 'Sansational' then
		healthBarStyle = 'Sans'

		barImage = 'healthbar-ic/sanshealthbar'
		barOffsetX = 55
		barOffsetY = 6.6

		makeLuaSprite('SansHealthBarP1','',getProperty('healthBar.x'),getProperty('healthBar.y') - 6.6)
		setObjectCamera('SansHealthBarP1','hud')
		makeGraphic('SansHealthBarP1',getProperty('healthBar.width')/2,getProperty('healthBar.height'),'FFFF00')
		addLuaSprite('SansHealthBarP1',true)
		setObjectOrder('SansHealthBarP1',5)


		makeLuaSprite('SansHealthBarP2','',getProperty('healthBar.x'),getProperty('healthBar.y') - 6.6)
		setObjectCamera('SansHealthBarP2','hud')
		makeGraphic('SansHealthBarP2',getProperty('healthBar.width'),getProperty('healthBar.height'),'FF0000')
		addLuaSprite('SansHealthBarP2',true)
		setObjectOrder('SansHealthBarP2',4)

		makeLuaSprite('SansHealthBar','',getProperty('healthBar.x'),getProperty('healthBar.y') - 6.6)
		setObjectCamera('SansHealthBar','hud')
		makeGraphic('SansHealthBar',getProperty('healthBar.width'),getProperty('healthBar.height'),'FF0000')
		addLuaSprite('SansHealthBar',true)
		setObjectOrder('SansHealthBar',4)

	elseif songName == 'Despair' or
			songName == 'Nightmare-Run' or
			songName == 'Last-Reel' or
			songName == 'Terrible-Sin' or
			songName == 'imminent-demise' or
			songName == 'build-our-freaky-machine' or
			songName == 'Ritual' or
			songName == 'Freaky-Machine' then

			healthBarStyle = 'Bendy'

			barImage = 'healthbar-ic/bendyhealthbar'
			barOffsetX = 50
			barOffsetY = 87

		if songName == 'build-our-freaky-machine' then
			precacheImage('healthbar-ic/bendyhealthbar - grey')
		end
	elseif songName == 'Snake-Eyes' or songName == 'Technicolor-Tussle' or songName == 'Knockout' or songName == 'Devils-Gambit' or songName == 'Satanic-Funkin' then
	    healthBarStyle = 'Cuphead'
		barImage = 'healthbar-ic/cuphealthbar'

		barOffsetX = 25
		barOffsetY = 18
	else
		changeHealthBar = false
	end
	if changeHealthBar == true then
		makeLuaSprite('customHealthBar', barImage, 0, 0)
		setObjectCamera('customHealthBar', 'hud')
		setProperty('customHealthBar.offset.x',barOffsetX)
		setProperty('customHealthBar.offset.y',barOffsetY)
		setObjectOrder('customHealthBar',4)
		addLuaSprite('customHealthBar', true)
	end
end

function onUpdate()
	if healthBarStyle == 'Sans' then
		

		setProperty('SansHealthBarP1.x',getProperty('healthBar.x'))
		setProperty('SansHealthBarP1.y',getProperty('healthBar.y') - 6.6)
		
		setProperty('SansHealthBarP1.width',getProperty('healthBar.width')/2)
		setProperty('SansHealthBarP1.height',getProperty('healthBarBG.height'))

		setProperty('SansHealthBarP2.x',getProperty('healthBar.x'))
		setProperty('SansHealthBarP2.y',getProperty('healthBar.y') - 6.6)

		if getProperty('health') <= 2 then
			scaleObject('SansHealthBarP1',getProperty('health') + 0.01,getProperty('healthBar.scale.y'))
			scaleObject('SansHealthBarP2',getProperty('healthBar.scale.x'),getProperty('healthBar.scale.y'))
		end
	   
		setProperty('SansHealthBarP2.width',getProperty('healthBar.width'))
		setProperty('SansHealthBarP2.height',getProperty('healthBar.height'))
	   
		setProperty('iconP1.alpha', 0)
		setProperty('iconP2.alpha', 0)
		setProperty('healthBar.flipX', true)
	end

	setProperty('customHealthBar.x', getProperty('healthBar.x'))
	setProperty('customHealthBar.y', getProperty('healthBar.y'))
	setProperty('customHealthBar.alpha', getProperty('healthBar.alpha'))
	setProperty('customHealthBar.angle', getProperty('healthBar.angle'))

	if healthBarStyle ~= '' then

		setProperty('healthBarBG.visible', false)
		setProperty('healthBar.scale.y', 2.2)
		setObjectOrder('healthBar', 3)
		setObjectOrder('healthBarBG', 2)
	end
end
function onStepHit()
	if songName == 'build-our-freaky-machine' then
		if curStep == 1280 then
			makeLuaSprite('customHealthBar','healthbar-ic/bendyhealthbar - grey',getProperty('healthbar.x'),getProperty('healthbar.y'))
			setObjectCamera('customHealthBar','hud')
		elseif curStep == 1536 then
			makeLuaSprite('customHealthBar',barImage,getProperty('healthbar.x'),getProperty('healthbar.y'))
			setObjectCamera('customHealthBar','hud')
		end
	end
end