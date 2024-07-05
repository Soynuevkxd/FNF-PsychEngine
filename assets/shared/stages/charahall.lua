function onCreate()

	makeLuaSprite('bg', 'judgementhall/chara', -267.35, -370.7);
	scaleObject('bg', 1, 1);
	setScrollFactor('bg', 1, 1);

	makeLuaSprite('bgi', 'judgementhall/ilumination', -267.35, -370.7);
	scaleObject('bgi', 1, 1);
	setScrollFactor('bgi', 1, 1);
	
	addLuaSprite('bg', false);
	addLuaSprite('bgi', true);
	precacheSound('slash_effect');
end
function onCreatePost()
	--triggerEvent('Camera Follow Pos', 750, 350)
	forceMiddlescroll()
end
function onCountdownTick(tick)
	if tick == 0 then
		updateLaneUnderlay()
		setProperty('laneunderlayOpponent.visible', false)
	end
end

function forceMiddlescroll() -- working with more than 4 keys!
	for i = 0, getProperty('opponentStrums.length') do
		setPropertyFromGroup('opponentStrums', i, 'visible', false);
	end
	if not middlescroll then
		for i = 0, getProperty('playerStrums.length') do
			setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x') - 320);
		end
	end
end

function slash()
	--characterPlayAnim('dad', 'slash'); -- not forced lol
	triggerEvent('Play Animation', 'slash', 'dad');

	runTimer('slashtime', 0.05);
	triggerEvent('Screen Shake', '0.35, 0.01', '0.35, 0.01');
	setProperty('health', getProperty('health') - 0.30);
	playSound('slash_effect', 1, 'slash'); -- - 99999999999999999999999999999999999999999 HP lol
end

function onUpdate()
	if getProperty('health') > 0.3 then
		setProperty('health', getProperty('health') - 0.0003);
	end
end

function onBeatHit()
	if curBeat >= 64 and curBeat % 20 == 0 then
		slash();
	end
end