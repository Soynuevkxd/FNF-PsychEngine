function onCreate()-- animated icon for Sans.
		makeAnimatedLuaSprite('dustsansicon', 'icons/dust/sans_icons', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('dustsansicon', 'normal', 'normal', 24, false)
		addAnimationByPrefix('dustsansicon', 'losing', 'loosing', 24, false)
		addAnimationByPrefix('dustsansicon', 'winning', 'winning', 24, false)
		setScrollFactor('dustsansicon', 0, 0)
		setObjectCamera('dustsansicon', 'other') -- either is under the health bar or nothing
		addLuaSprite('dustsansicon', true)
		playAnim('dustsansicon', 'normal', false)
end

function onUpdate(elapsed)
	setProperty('iconP2.alpha', 0)
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('dustsansicon.x', getProperty('iconP2.x')-75)
	setProperty('dustsansicon.angle', getProperty('iconP2.angle'))
	setProperty('dustsansicon.y', getProperty('iconP2.y')- 50)
	setProperty('dustsansicon.scale.x', getProperty('iconP2.scale.x') - 0.6)
	setProperty('dustsansicon.scale.y', getProperty('iconP2.scale.y') - 0.6)
end

function onBeatHit()
if curBeat % 2 == 0 then
	if getProperty('health') < 0.5 then
		playAnim('dustsansicon', 'winning', false)
	elseif getProperty('health') > 1.6 then
		playAnim('dustsansicon', 'losing', false)
	else
		playAnim('dustsansicon', 'normal', false)
	end
end
end