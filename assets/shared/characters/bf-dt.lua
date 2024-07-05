function onCreate()-- custom gameover music and the animated icon from DustTale 2.0.
setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dt');

		makeAnimatedLuaSprite('dustbficon', 'icons/dust/bf_icons', getProperty('iconP1.x'), getProperty('iconP1.y'))
		addAnimationByPrefix('dustbficon', 'normal', 'normal_bf', 24, false)
		addAnimationByPrefix('dustbficon', 'losing', 'loosing_bf', 24, false)
		addAnimationByPrefix('dustbficon', 'winning', 'winning_bf', 24, false)
		setScrollFactor('dustbficon', 0, 0)
		setObjectCamera('dustbficon', 'other') -- either is under the health bar or nothing
		setProperty('dustbficon.flipX', true);
		addLuaSprite('dustbficon', true)
		playAnim('dustbficon', 'normal', false)

		makeAnimatedLuaSprite('dustbficonKR', 'icons/dust/iconsKR', getProperty('iconP1.x'), getProperty('iconP1.y'))
		addAnimationByPrefix('dustbficonKR', 'normal', 'normal_bf_KR', 24, false)
		addAnimationByPrefix('dustbficonKR', 'losing', 'loosing_bf_KR', 24, false)
		addAnimationByPrefix('dustbficonKR', 'winning', 'winning_bf_KR', 24, false)
		setScrollFactor('dustbficonKR', 0, 0)
		setObjectCamera('dustbficonKR', 'other') -- either is under the health bar or nothing
		setProperty('dustbficonKR.flipX', true);
		addLuaSprite('dustbficonKR', true)
		playAnim('dustbficonKR', 'normal', false)
		setProperty('dustbficonKR.alpha', 0)

end

function onUpdate(elapsed)
	setProperty('iconP1.alpha', 0)
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('dustbficon.x', getProperty('iconP1.x')- 100)
	setProperty('dustbficon.angle', getProperty('iconP1.angle'))
	setProperty('dustbficon.y', getProperty('iconP1.y')- 45)
	setProperty('dustbficon.scale.x', getProperty('iconP1.scale.x') - 0.6)
	setProperty('dustbficon.scale.y', getProperty('iconP1.scale.y') - 0.6)

	setProperty('dustbficonKR.x', getProperty('iconP1.x')- 100)
	setProperty('dustbficonKR.angle', getProperty('iconP1.angle'))
	setProperty('dustbficonKR.y', getProperty('iconP1.y')- 45)
	setProperty('dustbficonKR.scale.x', getProperty('iconP1.scale.x') - 0.6)
	setProperty('dustbficonKR.scale.y', getProperty('iconP1.scale.y') - 0.6)
end

function onBeatHit()
if curBeat % 2 == 0 then
	if getProperty('health') > 1.6 then
		playAnim('dustbficon', 'winning', false)
		playAnim('dustbficonKR', 'winning', false)
	elseif getProperty('health') < 0.5 then
		playAnim('dustbficon', 'losing', false)
		playAnim('dustbficonKR', 'losing', false)
	else
		playAnim('dustbficon', 'normal', false)
		playAnim('dustbficonKR', 'normal', false)
	end
end
end