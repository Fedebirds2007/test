-- I hate this fucking code of fake susie it didn't work properly but I fully re-made it and now at least works just fine but it took to work like 5 days of full coding, now I need to do 3 more; thrashed, hyperlink and smile-award, now I hate my life to .-Fedebirds2007 (and yes it's 2007 because I have 16)

--Fake Susie
		invisible = false
		foreground = true
		playablecharacter = false
		doIdle = true

		function onCreate()
			makeAnimatedLuaSprite('susie', 'characters/susie',  -550, -180);
			addAnimationByPrefix('susie', 'idle', 'susie idle1', 12, false);
			addAnimationByPrefix('susie', 'singLEFT', 'susie left', 12, false);
			addAnimationByPrefix('susie', 'singDOWN', 'susie down', 12, false);
			addAnimationByPrefix('susie', 'singUP', 'susie up', 12, false);
			addAnimationByPrefix('susie', 'singRIGHT', 'susie right', 12, false);
			addAnimationByPrefix('susie', 'atk','susie atk', 12, false);
			
			--background
			makeLuaSprite('boinger', 'boinger', -500, -650);
			setScrollFactor('boinger', 0.6, 0.6);
			scaleObject('boinger', 0.8, 0.8);
			addLuaSprite('boinger');
			----------------------------------------------------
---Fake Susie Again
			if playablecharacter == true then
				setPropertyLuaSprite('susie', 'flipX', true);
			else
				setPropertyLuaSprite('susie', 'flipX', false);
			end

			scaleObject('susie', 0.78, 0.78);


			objectPlayAnimation('susie', 'idle');
			addLuaSprite('susie', foreground);

			if invisible == true then
				setPropertyLuaSprite('susie', 'alpha', 0)
			end
		end

		local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
		function opponentNoteHit(id, direction, noteType, isSustainNote)
			if noteType == 'Susie Sing' then
				doIdle = false
				objectPlayAnimation('susie', singAnims[direction + 1], false);

				if direction == 0 then
					setProperty('susie', '.offset.x', 150, 122);
					setProperty('susie', '.offset.y', 150, 122);

					if isSustainNote then
						objectPlayAnimation('susie', singAnims[direction + 1], true);
					end
				elseif direction == 1 then
					setProperty('susie', '.offset.x', 145, 115);
					setProperty('susie', '.offset.y', 145, 115);

					if isSustainNote then
						objectPlayAnimation('susie', singAnims[direction + 1], true);
					end
				elseif direction == 2 then
					setProperty('susie', '.offset.x', 147, 122);
					setProperty('susie', '.offset.y', 147, 122);

					if isSustainNote then
						objectPlayAnimation('susie', singAnims[direction + 1], true);
					end
				elseif direction == 3 then
					setProperty('susie', '.offset.x', 147, 123);
					setProperty('susie', '.offset.y', 147, 123);

					if isSustainNote then
						objectPlayAnimation('susie', singAnims[direction + 1], true);
					end
				end
			end
		end

		local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
		function goodNoteHit(id, direction, noteType, isSustainNote)
			if noteType == 'Susie Sing' then
				doIdle = false
				objectPlayAnimation('susie', singAnims[direction + 1], false);

				if direction == 0 then
					setProperty('susie', '.offset.x', 150, 122);
					setProperty('susie', '.offset.y', 150, 122);
				elseif direction == 1 then
					setProperty('susie', '.offset.x', 145, 115);
					setProperty('susie', '.offset.y', 145, 115);
				elseif direction == 2 then
					setProperty('susie', '.offset.x', 147, 122);
					setProperty('susie', '.offset.y', 147, 122);
				elseif direction == 3 then
					setProperty('susie', '.offset.x', 147, 123);
					setProperty('susie', '.offset.y', 147, 123);
				end
			end
		end

		function onBeatHit()
			if curBeat % 2 == 0  and doIdle then
				objectPlayAnimation('susie', 'idle');
				setProperty('susie', '.offset.x', 146, 122);
				setProperty('susie', '.offset.y', 146, 122);
			end
			doIdle = true
		end

		function onCountdownTick(counter)
			if counter % 2 == 0 then
				if doIdle == true then
					objectPlayAnimation('susie', 'idle');
					setProperty('susie', '.offset.x', 146, 122);
					setProperty('susie', '.offset.y', 146, 122);
				end
			end
		end
	
--Holy fuck kill me please
--Please don't steal this code, just ask me and I would say yes :)