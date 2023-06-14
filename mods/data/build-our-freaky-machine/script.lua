function opponentNoteHit(id,data,type,sus)
    if curStep >= 1645 and curStep <= 1664 and not sus then
        cameraShake('game',0.02,0.05)
        cameraShake('hud',0.01,0.05)
    end
end