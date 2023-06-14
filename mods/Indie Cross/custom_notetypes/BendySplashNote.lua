local SplashDamage = 0
local RemoveSplashEffect = true
function onCreate()
	--Iterate over all notes
	for unnotesLength = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', unnotesLength, 'noteType') == 'BendySplashNote' then
			setPropertyFromGroup('unspawnNotes', unnotesLength, 'texture', 'bendy/images/BendySplashNoteAssets');--Change texture
			setPropertyFromGroup('unspawnNotes', unnotesLength, 'hitHealth', '-0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', unnotesLength, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', unnotesLength, 'hitCausesMiss', false);
			setPropertyFromGroup('unspawnNotes', unnotesLength, 'ignoreNote', true);
		end
	end
	for bendySplash = 1,4 do
		makeLuaSprite('SplashScreen'..bendySplash,'bendy/images/Damage0'..bendySplash,0,0)
		scaleObject('SplashScreen'..bendySplash,0.7,0.7)
		setObjectCamera('SplashScreen'..bendySplash,'hud')
		precacheImage('bendy/images/Damage0'..bendySplash)
	end
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'BendySplashNote' and songName ~= 'Last-Reel' and songName ~= 'Despair' then
		-- put something here if you want
		playSound('bendy/inked')
		RemoveSplashEffect = false
		SplashDamage = SplashDamage + 1
		addLuaSprite('SplashScreen'..SplashDamage,true)
		setProperty('SplashScreen'..SplashDamage..'.alpha',1)
		if SplashDamage > 1 then
			removeLuaSprite('SplashScreen'..(SplashDamage - 1),false)
		end
		runTimer('SplashDestroy',3)
	end
end

function onUpdate(el)
	if SplashDamage > 0 then
		if getProperty('SplashScreen'..SplashDamage..'.alpha') <= 0 and RemoveSplashEffect == true then
			removeLuaSprite('SplashScreen'..SplashDamage,false)
			SplashDamage = 0
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'SplashDestroy' and songName ~= 'Last-Reel' and songName ~= 'Despair' then
		doTweenAlpha('byeSplash','SplashScreen'..SplashDamage,0,2,'linear')
        RemoveSplashEffect = true
	end
end