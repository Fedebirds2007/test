local enableDadShake = false
local enableBfShake = false
local forceStopShake = false
local charactersShake =
{
    'Nightmare-Cuphead',
    'Nightmare-Sans',
    'Nightmare-Bendy'
}
local dadfounded = false
--local bfFounded = false

--local bfShakeintensity = 0.005
--local bfShakeDuration = 0.1

local dadShakeintensity = 0.005
local dadShakeDuration = 0.1
function opponentNoteHit(id,data,type,sus)
    if forceStopShake == false and getPropertyFromGroup('notes',id,'hitHealth') > 0 then
        if enableDadShake == true then
            cameraShake('camGame',dadShakeintensity,dadShakeDuration)
            cameraShake('camHUD',dadShakeintensity,dadShakeDuration)
        end
    end
end
function onUpdate()
    --[[for bfLength = 1,#charactersShake do
        if getProperty('boyfriend.curCharacter') == charactersShake[bfLength] then
            bfFounded = true
            enableBfShake = true
        end
        if bfLength == #charactersShake and getProperty('boyfriend.curCharacter') ~= charactersShake[bfLength] and bfFounded == false then
            enableBfShake = false
        end
    end]]--
    for dadLength = 1,#charactersShake do
        if getProperty('dad.curCharacter') == charactersShake[dadLength] then
            dadfounded = true
            enableDadShake = true
        end
        if dadLength == #charactersShake and getProperty('dad.curCharacter') ~= charactersShake[dadLength] and dadfounded == false then
            enableDadShake = false
        end
    end
end
--[[function goodNoteHit(id,data,type,sus)
    if enableBfShake == true and getPropertyFromGroup('notes',id,'hitHealth') > 0 and forceStopShake == false then
        if enableBfShake == true then
            cameraShake('camGame',bfShakeintensity,bfShakeDuration)
            cameraShake('camHUD',bfShakeintensity,bfShakeDuration)
        end
    end
end]]--
function onEvent(name,v1,v2)
    if name == 'Change Character' then
        if enableDadShake == true then
            dadfounded = false
            enableDadShake = false
        end
        --[[if enableBfShake == true then
            bfFounded = false
            enableBfShake = false
        end]]--
    end
end