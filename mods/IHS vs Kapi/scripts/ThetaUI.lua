--ThetaUI by SameTheta on GameBanana!
--Additional coding from SaraHUD made by Novikond!

--You are welcome to use this UI mod on your own mods, as long as you credit me!

function onCreatePost()
    scaleNum = 1
    ratingFCActivate = false
--edit original hud assets
    setProperty('timeBar.scale.x', 0.44)
    setProperty('timeBarBG.scale.x', 0.45)
    setProperty('timeBar.y', getProperty('timeBar.y') + 40)
    setProperty('timeBarBG.y', getProperty('timeBarBG.y') + 40)
    setProperty('timeTxt.visible', true)
    setProperty('scoreTxt.visible', true)

--make the ratings
    makeLuaText('ratings', ' ', 600, 335, 20)
    setTextAlignment('ratings', 'Center')
    setTextSize('ratings', 16)
    setProperty('ratings.alpha', 0)
    addLuaText('ratings')

--make score and acc
    makeLuaText('score-n-acc', '', 500, 375, 615)
    setTextAlignment('score-n-acc', 'right')
    setTextSize('score-n-acc', 18)
    addLuaText('score-n-acc')

  --theres absolutely nothing lmao what do you want, this is a modified version of ThetaUI (kind of).
      setProperty('timeTxt.x',  50)

    --downscroll
    if (downscroll) then
      setProperty('songTitle.y', 50)
    end

end

function onSongStart()
    doTweenAlpha('ratingFadeIn', 'ratings', 1, 0.25, circIn)
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
  ratingFCActivate = true

    if isSustainNote == false then
        scaleNum = 1.1
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
  ratingFCActivate = true
end

function onUpdatePost()
--rating counter
    setTextString('ratings', 'Sicks: ' .. getProperty('sicks') .. ' | ' .. 'Goods: ' .. getProperty('goods') .. ' | ' .. 'Bads: ' .. getProperty('bads') .. ' | ' .. 'Shits: ' .. getProperty('shits'))


    --botplay
    if (botPlay and downscroll) then
      setProperty('ratings.visible', true)
      setProperty('botplayTxt.y' + -500)
     elseif (botPlay) then
      setProperty('ratings.visible', true)
      setProperty('botplayTxt.y' - -500)
     else
      setProperty('ratings.visible', true)
     end
end