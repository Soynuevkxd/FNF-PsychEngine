function onCreate()-- custom gameover music and the animated icon from DustTale 2.0.
setPropertyFromClass('GameOverSubstate', 'characterName', 'picbo');

		makeAnimatedLuaSprite('dustpicoicon', 'icons/dust/pico_icons', getProperty('iconP1.x'), getProperty('iconP1.y'))
		addAnimationByPrefix('dustpicoicon', 'normal', 'normal_pico', 24, false)
		addAnimationByPrefix('dustpicoicon', 'losing', 'loosing_pico', 24, false)
		addAnimationByPrefix('dustpicoicon', 'winning', 'winning_pico', 24, false)
		setScrollFactor('dustpicoicon', 0, 0)
		setObjectCamera('dustpicoicon', 'other') -- either is under the health bar or nothing
		setProperty('dustpicoicon.flipX', true);
		addLuaSprite('dustpicoicon', true)
		playAnim('dustpicoicon', 'normal', false)

end

function onUpdate(elapsed)
	setProperty('iconP1.alpha', 0)
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('dustpicoicon.x', getProperty('iconP1.x')- 80)
	setProperty('dustpicoicon.angle', getProperty('iconP1.angle'))
	setProperty('dustpicoicon.y', getProperty('iconP1.y')- 65)
	setProperty('dustpicoicon.scale.x', getProperty('iconP1.scale.x') - 0.6)
	setProperty('dustpicoicon.scale.y', getProperty('iconP1.scale.y') - 0.6)
end

function onBeatHit()
if curBeat % 2 == 0 then
	if getProperty('health') > 1.6 then
		playAnim('dustpicoicon', 'winning', false)
	elseif getProperty('health') < 0.5 then
		playAnim('dustpicoicon', 'losing', false)
	else
		playAnim('dustpicoicon', 'normal', false)
	end
end
end
