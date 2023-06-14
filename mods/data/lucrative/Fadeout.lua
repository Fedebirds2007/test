-- fade out
function onCreatePost()
	-- end of "create"
	
	makeLuaSprite('fade', 'Black', -1000, -100)
	   scaleObject('fade', 4, 4)
	addLuaSprite('fade', true)
end

function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenAlpha('fadeout', 'fade', 0, 3, 'linear')
end

function onStepHit()
	if curStep == 1472 then

		doTweenAlpha('fadeout', 'fade', 1, 1.33, 'linear')
	end
end