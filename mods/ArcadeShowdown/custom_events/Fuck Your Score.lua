-- Event notes hooks
function onEvent(name, value1, value2)
    local var hideme = tonumber(value1)
    local var aughgh = tonumber(value2)
    if name == "Fuck Your Score" then
        if hideme == 1 then
            doTweenAlpha('fuckYourScoreTween','scoreTxt', 0, 0.3, 'linear')
        end
        if hideme == 0 then
            doTweenAlpha('fuckYourScoreTween','scoreTxt', 1, 0.3, 'linear')        
        end
    end
end

-- For some ungodly reason this doesn't work unless opponent hits a note?
-- why please ugh