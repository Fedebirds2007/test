function onCreatePost()

	makeLuaSprite('fade','fade',-1000,-1000)
    makeGraphic('fade',10000,100000,'000000')
    addLuaSprite('fade',true)
    setScrollFactor('fade',0,0)
	setProperty('fade.alpha', 0);

	makeLuaSprite('line','line',-700,330)
    makeGraphic('line',2900,10,'FFFAFA')
    addLuaSprite('line',true)
    setScrollFactor('line',0,0)
	setProperty('line.alpha', 0.0001);
end

function onEvent(name, value1, value2)
	if name == 'Memory leak script' then
	
		Activate = tonumber(value1)

		if Activate <= 1 then

			runTimer("test",0.1,1)
			function onTimerCompleted(test)

			noteTweenAlpha('gauchefade', 0, 0, 1, 'ExpoIn')
			noteTweenAlpha('Hautfade', 1, 0, 1, 'ExpoIn')
			noteTweenAlpha('Basfade', 2, 0, 1, 'ExpoIn')
			noteTweenAlpha('droitefade', 3,0, 1, 'ExpoIn')
			
			noteTweenX('GaucheBfX', 4, 150, 0.001, 'ExpoIn')
			noteTweenX('HautBfX', 5, 400, 0.001, 'ExpoIn')
			noteTweenX('BasBfX', 6, 600, 0.001, 'ExpoIn')
			noteTweenX('DroiteBfX', 6, 850, 0.001, 'ExpoIn')
	
			noteTweenY('GaucheBfY', 4, 570, 0.001, 'ExpoIn')
			noteTweenY('HautBfY', 5, 425, 0.001, 'ExpoIn')
			noteTweenY('BasBfY', 6, 170, 0.001, 'ExpoIn')
			noteTweenY('DroiteBfY', 7, 50, 0.001, 'ExpoIn')

			noteTweenDirection('BfLeft',5, 270,0.3,  'ExpoIn')
			noteTweenDirection('BfUp',4, 270,0.3,  'ExpoIn')

			doTweenX('line', 'line.scale', 1, 1, 'QuadInOut');
			doTweenAlpha('line1', 'line', 1, 1, 'linear');
			doTweenAlpha('Fade', 'fade', 0.3, 1, 'linear');
			doTweenAngle('line2', 'line', -29, 1, 'QuadInOut');
			setProperty('defaultCamZoom',1)

			end
		end
		
		if Activate <= 2 then

		noteTweenX('GaucheBfX2', 4, 737, 0.001, 'ExpoIn')
		noteTweenX('HautBfX2', 5, 847, 0.001, 'ExpoIn')
		noteTweenX('BasBfX2', 6, 957, 0.001, 'ExpoIn')
		noteTweenX('DroiteBfX2', 7, 1067, 0.001, 'ExpoIn')
	
		noteTweenY('GaucheBfY', 4, 50, 0.001, 'ExpoIn')
		noteTweenY('HautBfY', 5, 50, 0.001, 'ExpoIn')
		noteTweenY('BasBfY', 6, 50, 0.001, 'ExpoIn')
		noteTweenY('DroiteBfY', 7, 50, 0.001, 'ExpoIn')

		noteTweenDirection('BfLeft',5, 90,0.1,  'ExpoIn')
		noteTweenDirection('BfUp',4, 90,0.1,  'ExpoIn')
		setProperty('defaultCamZoom',0.7)

		doTweenX('line', 'line.scale', 0, 1, 'QuadInOut');
		doTweenAlpha('line1', 'line', 0, 1, 'linear');
		doTweenAlpha('Fade', 'fade', 0, 1, 'linear');
		doTweenAngle('line2', 'line', 0, 1, 'QuadInOut');

		noteTweenAlpha('gaucheOC', 0, 1, 1, 'ExpoIn')
		noteTweenAlpha('HautOC', 1, 1, 1, 'ExpoIn')
		noteTweenAlpha('BasOC', 2, 1, 1, 'ExpoIn')
		noteTweenAlpha('droiteOC', 3, 1, 1, 'ExpoIn')

		noteTweenAlpha('gaucheBf', 4, 1, 1, 'ExpoIn')
		noteTweenAlpha('HautBf', 5, 1, 1, 'ExpoIn')
		noteTweenAlpha('BasBf', 6, 1, 1, 'ExpoIn')
		noteTweenAlpha('droiteBf', 7, 1, 1, 'ExpoIn')

		end		
	end
end








