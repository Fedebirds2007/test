local BeatPorcent = {0}
local BeatCustomPorcent = {0}

local cannotBeat = {0}
local cannotBeatCustom = {0}

local cannotBeatInverted = {0}
local cannotBeatCustomInverted = {0}

local invertedBeat = {0}
local invertedCustomBeat = {0}


local Section = 0
local InvertedSection = 0
local cannotBeatSection = 0

local cannotBeatInt = false
local cannotBeatIntInverted = false

local BeatStrentghGame = 0.015
local BeatStrentghHUD = 0.03

local BeatStrentghCustomGame = 0.015
local BeatStrentghCustomHUD = 0.03


local BeatStrentghInvertedGame = 0.015
local BeatStrentghInvertedHUD = 0.03


local BeatStrentghInvertedCustomGame = 0.015
local BeatStrentghInvertedCustomHUD = 0.03

local Beated = false
local BeatedCustom = false
local BeatedInverted = false
local BeatedCustomInverted = false

local enabledBeat = true
local enableCustomBeat = true
local enableInverted = true
local enableCustomInverted = true

function onStepHit()
    for cannotBeatLength = 1,#cannotBeat do
        if cannotBeat[cannotBeatLength] ~= nil then
            if cannotBeatInt == true and curBeat % cannotBeat[cannotBeatLength] == 0 or cannotBeatInt == false and (curStep/4) % cannotBeat[cannotBeatLength] == 0 then
                enabledBeat = false
            else
                enabledBeat = true
            end
        else
            enabledBeat = true
        end
    end
    for cannotBeatCustomLength = 1,#cannotBeatCustom do
        if cannotBeatCustom[cannotBeatCustomLength] ~= nil then
            if (curStep/4) % cannotBeatSection == cannotBeatCustom[cannotBeatCustomLength] then
                enableCustomBeat = false
            else
                enableCustomBeat = true
            end
        else
            enableCustomBeat = true
        end
    end
    for cannotBeatInverLength = 1,#cannotBeatInverted do
        if cannotBeatInverted[cannotBeatInverLength] ~= nil then
            if cannotBeatIntInverted == true and curBeat % cannotBeatInverted[cannotBeatInverLength] == 0 or cannotBeatIntInverted == false and (curStep/4) % cannotBeatInverted[cannotBeatInverLength] == 0 then
                enableInverted = false
            else
                enableInverted = true
            end
        else
            enableInverted = true
        end
    end
    for cannotBeatCustomInvertedLength = 1,#cannotBeatInverted do
        if cannotBeatCustomInverted[cannotBeatCustomInvertedLength] ~= nil then
            if cannotBeatIntInverted == true and curBeat % cannotBeatSection == cannotBeatCustomInverted[cannotBeatCustomInvertedLength] or cannotBeatIntInverted == false and (curStep/4) % cannotBeatSection == cannotBeatCustomInverted[cannotBeatCustomInvertedLength] then
                enableCustomInverted = false
            else
                enableCustomInverted = true
            end
        else
            enableCustomInverted = true
        end
    end
    if enabledBeat == true then
        for BeatsHit = 1,#BeatPorcent do
            if BeatPorcent[BeatsHit] ~= nil and Beated == false then
                if (curStep/4) % BeatPorcent[BeatsHit] == 0 then
                    runTimer('enabledBeat',0.01)
                    triggerEvent('Add Camera Zoom',BeatStrentghGame,BeatStrentghHUD)
                    Beated = true
                else
                    Beated = false
                end
            else
                Beated = false
            end
        end
    end
    if enableCustomBeat == true then
        for BeatsCustomHit = 1,#BeatCustomPorcent do
            if BeatCustomPorcent[BeatsCustomHit] ~= nil and BeatedCustom == false then
                if (curStep/4) % Section == BeatCustomPorcent[BeatsCustomHit] then
                    runTimer('enableBeatCustom',0.01)
                    triggerEvent('Add Camera Zoom',BeatStrentghCustomGame,BeatStrentghCustomHUD)
                    BeatedCustom = true
                else
                    BeatedCustom = false
                end
            else
                BeatedCustom = false
            end
        end
    end
    if enableInverted == true then
        for invertedHit = 1,#invertedBeat do
            if invertedBeat[invertedHit] ~= nil and BeatedInverted == false then
                if (curStep/4) % invertedBeat[invertedHit] == 0 then
                    runTimer('enableInverted',0.01)
                    triggerEvent('Add Camera Zoom',BeatStrentghInvertedGame * -1,BeatStrentghInvertedHUD * -1)
                    BeatedInverted = true
                else
                    BeatedInverted = false
                end
            else
                BeatedInverted = false
            end
        end
    end
    if enableCustomInverted == true then
        for invertedCustomHit = 1,#invertedCustomBeat do
            if invertedCustomBeat[invertedCustomHit] ~= nil then
                if BeatedCustomInverted == false then
                    if (curStep/4) % InvertedSection == invertedCustomBeat[invertedCustomHit] then
                        runTimer('enableCustomInverted',0.01)
                        triggerEvent('Add Camera Zoom',BeatStrentghInvertedCustomGame * -1,BeatStrentghInvertedCustomHUD * -1)
                        BeatedCustomInverted = true
                    else
                        BeatedCustomInverted = false
                    end
                end
            else
                BeatedCustomInverted = false
            end
        end
    end
    --songs
    if songName == 'Technicolor-Tussle' then
        if curStep == 128 then
            replaceArrayBeat(1,1)
            replaceArrayCannotBeat(1,4)
        elseif curStep == 1376 then
            clearBeat()
            clearCannotBeat()
        end
    elseif songName == 'Knockout' then
        if curStep == 143 or curStep == 528 or curStep == 1215 or curStep == 1535 then
            replaceArrayBeat(1,1)
        elseif curStep == 512 or curStep == 1168 or curStep == 1520 or curStep == 1600 then
            clearBeat()
        end
    elseif songName == 'build-our-freaky-machine' then
        if curStep == 224 or curStep == 607 or curStep == 768 or curStep == 894 or curStep == 1600 then
            replaceArrayBeat(1,1)
        end
        if curStep == 320 or curStep == 400 or curStep == 482 or curStep == 623 or curStep == 642 or curStep == 1072 or curStep == 1098 or curStep == 1520 or curStep == 1712 or curStep == 1840 then
            replaceArrayBeat(1,2)
        end
        if curStep == 342 or curStep == 350 or curStep == 464 or curStep == 634 or curStep == 1008 or curStep == 1088 or curStep == 1502 or curStep == 1646 or curStep == 1776 or curStep == 2048 then
            clearBeat()
        end
    elseif songName == 'Ritual' then
        if curStep == 384 or curStep == 768 then
            replaceArrayBeat(1,1)
            replaceArrayCannotBeat(1,4)
        elseif curStep == 512 then
            clearBeat()
            clearCannotBeat()
            Section = 8
            replaceArrayCustomBeat(1,1.5)
            replaceArrayCustomInvertedBeat(1,2)
            replaceArrayBeat(1,4)
            replaceArrayCustomBeat(2,7)

        elseif curStep == 896 then
            replaceArrayBeat(1,1)
            replaceArrayCustomInvertedBeat(1,2)
            replaceArrayCustomInvertedBeat(2,2)
            replaceArrayCannotBeat(1,4)
        elseif curStep == 669 or curStep == 1022 then
            clearBeat()
            clearCustomBeat()
            clearInvertedCustomBeat()
        end
    elseif songName == 'Gose' then
        if curStep == 128 or curStep == 256 or curStep == 1124 or curStep == 1152 then
            replaceArrayBeat(1,1)
        elseif curStep == 192 or curStep == 1088 then
            replaceArrayBeat(1,0.5)
        elseif curStep == 224 or curStep == 1120 then
            replaceArrayBeat(1,0.25)
        elseif curStep == 240 or curStep == 768 or curStep == 1136 or curStepp == 1662 then
            clearBeat()
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'enableBeat' then
        Beated = false
    end
    if tag == 'enableBeatCustom' then
        BeatedCustom = false
    end
    if tag == 'enableInverted' then
        BeatedInverted = false
    end
    if tag == 'enableCustomInverted' then
        BeatedCustomInverted = false
    end
end
function replaceArrayCannotBeat(pos,number)
    if pos == nil then
        table.insert(cannotBeat,#cannotBeat + 1,number)
    else
        if cannotBeat[pos] ~= nil then
            table.remove(cannotBeat,pos)
        end
        table.insert(cannotBeat,pos,number)
    end
end
function clearCannotBeat()
    for clearBeatCannot = 1,#cannotBeat do
        if cannotBeat[clearBeatCannot] ~= nil then
            table.remove(cannotBeat,clearBeatCannot)
        end
        table.insert(cannotBeat,clearBeatCannot,nil)
    end
end

function replaceArrayCustomCannotBeat(pos,number)
    if cannotBeatSection == 0 then
        cannotBeatSection = 4
    end
    if pos == nil then
        table.insert(cannotBeatCustom,#cannotBeatCustom + 1,number)
    else
        if cannotBeatCustom[pos] ~= nil then
            table.remove(cannotBeatCustom,pos)
        end
        if number == cannotBeatSection then
            number = 0
        end
        table.insert(cannotBeatCustom,pos,number)
    end
end
function removeArrayCustomCannotBeat(pos)
    table.remove(cannotBeatCustom,pos)
end
function clearCustomCannotBeat()
    cannotBeatSection = 0
    for clearBeatCustomCannot = 1,#cannotBeatCustom do
        if cannotBeatCustom[clearBeatCustomCannot] ~= nil then
            table.remove(cannotBeatCustom,clearBeatCustomCannot)
        end
        table.insert(cannotBeatCustom,clearBeatCustomCannot,nil)
    end
end
function replaceArrayBeat(pos,number)
    if pos == nil then
        table.insert(BeatPorcent,#BeatPorcent + 1,number)
    else
        if BeatPorcent[pos] ~= nil then
            table.remove(BeatPorcent,pos)
        end
        table.insert(BeatPorcent,pos,number)
    end
end
function clearBeat()
    for clearCanBeat = 1,#BeatPorcent do
        table.remove(BeatPorcent,clearCanBeat)
        table.insert(BeatPorcent,clearCanBeat,nil)
    end
end
function replaceArrayCustomBeat(pos,number)
    if Section == 0 then
        Section = 4
    end
    if pos == nil then
        table.insert(BeatCustomPorcent,#BeatCustomPorcent + 1,number)
    else
        if BeatCustomPorcent[pos] ~= nil then
            table.remove(BeatCustomPorcent,pos)
        end
        if number == Section then
            number = 0
        end
        table.insert(BeatCustomPorcent,pos,number)
    end
end
function clearCustomBeat()
    Section = 0
    for clearCanBeatCustom = 1,#BeatCustomPorcent do
        table.remove(BeatCustomPorcent,clearCanBeatCustom)
        table.insert(BeatCustomPorcent,clearCanBeatCustom,nil)
    end
end

function replaceArrayInvertedBeat(pos,number)
    if pos == nil then
        table.insert(invertedBeat,#invertedBeat + 1,number)
    else
        if invertedBeat[pos] ~= nil then
            table.remove(invertedBeat,pos)
        end
        table.insert(invertedBeat,pos,number)
    end
end
function clearInvertedBeat()
    for clearCanBeatInveted = 1,#invertedBeat do
        if invertedBeat[clearCanBeatInveted] ~= nil then
            table.remove(invertedBeat,clearCanBeatInveted)
        end
        table.insert(invertedBeat,clearCanBeatInveted,nil)
    end
end
function replaceArrayInvertedCannotBeat(pos,number)
    if pos == nil then
        table.insert(cannotBeatInverted,#cannotBeatInverted + 1,number)
    else
        if cannotBeatInverted[pos] ~= nil then
            table.remove(cannotBeatInverted,pos)
        end
        table.insert(cannotBeatInverted,pos,number)
    end
end
function clearInvertedCannotBeat()
    for clearBeatCannotCustom = 1,#cannotBeatInverted do
        if cannotBeatInverted[clearBeatCannotCustom] ~= nil then
            table.remove(cannotBeatInverted,clearBeatCannotCustom)
        end
        table.insert(cannotBeatInverted,clearBeatCannotCustom,nil)
    end
end

function replaceArrayCustomInvertedBeat(pos,number)
    if InvertedSection == 0 then
        InvertedSection = 4
    end
    if pos == nil then
        table.insert(invertedCustomBeat,#invertedCustomBeat + 1,number)
    else
        if invertedCustomBeat[pos] ~= nil then
            table.remove(invertedCustomBeat,pos)
        end
        if number == InvertedSection then
            number = 0
        end
        table.insert(invertedCustomBeat,pos,number)
    end
end
function replaceArrayInvertedCustomCannotBeat(pos,number)
    if pos == nil then
        table.insert(cannotBeatCustomInverted,#cannotBeatCustomInverted + 1,number)
    else
        if cannotBeatCustomInverted[pos] ~= nil then
            table.remove(cannotBeatCustomInverted,pos)
        end
        table.insert(cannotBeatCustomInverted,pos,number)
    end
end
function clearInvertedCustomBeat()
    InvertedSection = 4
    for clearCustomInverted = 1,#invertedCustomBeat do
        if invertedCustomBeat[clearCustomInverted] ~= nil then
            table.remove(invertedCustomBeat,clearCustomInverted)
        end
        table.insert(invertedCustomBeat,clearCustomInverted,nil)
    end
end
function backBeat()
    BeatStrentghGame = 0.015
    BeatStrentghHUD = 0.03
end
function backInvertedBeat()
    BeatStrentghInvertedGame = 0.015
    BeatStrentghInvertedHUD = 0.03
end
function clearAllArrays()
    clearCannotBeat()
    clearCustomCannotBeat()
    clearInvertedCannotBeat()
    clearBeat()
    clearCustomBeat()
    clearInvertedBeat()
    clearInvertedCustomBeat()
end