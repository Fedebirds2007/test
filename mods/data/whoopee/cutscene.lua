local allowCountdown = false
local cut = 0
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then

    if cut == 0 then
        startVideo('Sans/1');
    end

    if cut == 1 then
        setProperty('healthBar.visible', false)
        setProperty('healthBarBG.visible', false)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
        setProperty('scoreTxt.visible', false)
        runTimer('dialogue', 1)
    end

    if cut == 2 then
        setProperty('healthBar.visible', true)
        setProperty('healthBarBG.visible', true)
        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('scoreTxt.visible', true)
        allowCountdown = true;
        startCountdown()
    end
        cut = cut + 1
		return Function_Stop;
	end
	return Function_Continue;
end

local allowEndSong = false
function onEndSong()
	if not allowEndSong and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('Sans/2');
		allowEndSong = true;
		return Function_Stop;
	end
	return Function_Continue;
end



function onTimerCompleted(tag)
	if tag == 'dialogue' then
		triggerEvent('startDialogue', 'dialogue', '');
	end
end
