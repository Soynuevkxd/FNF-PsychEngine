function onCreate()-- animated icon for Chara.
		makeAnimatedLuaSprite('dustcharaicon', 'icons/dust/chara_icons', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('dustcharaicon', 'normal', 'normal_chara', 24, false)
		addAnimationByPrefix('dustcharaicon', 'losing', 'loosing_chara', 24, false)
		addAnimationByPrefix('dustcharaicon', 'winning', 'winning_chara', 24, false)
		setScrollFactor('dustcharaicon', 0, 0)
		setObjectCamera('dustcharaicon', 'other') -- either is under the health bar or nothing
		addLuaSprite('dustcharaicon', true)
		playAnim('dustcharaicon', 'normal', false)
end

function onUpdate(elapsed)
	setProperty('iconP2.alpha', 0)
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('dustcharaicon.x', getProperty('iconP2.x')- 120)
	setProperty('dustcharaicon.angle', getProperty('iconP2.angle'))
	setProperty('dustcharaicon.y', getProperty('iconP2.y')- 120)
	setProperty('dustcharaicon.scale.x', getProperty('iconP2.scale.x') - 0.6)
	setProperty('dustcharaicon.scale.y', getProperty('iconP2.scale.y') - 0.6)
end

function onBeatHit()
if curBeat % 2 == 0 then
	if getProperty('health') < 0.5 then
		playAnim('dustcharaicon', 'winning', false)
	elseif getProperty('health') > 1.6 then
		playAnim('dustcharaicon', 'losing', false)
	else
		playAnim('dustcharaicon', 'normal', false)
	end
end
end