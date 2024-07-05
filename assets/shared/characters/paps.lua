function onCreate()-- animated icon for Sans.
		makeAnimatedLuaSprite('dustpapsicon', 'icons/dust/paps_icons', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('dustpapsicon', 'normal', 'normal_paps', 24, false)
		addAnimationByPrefix('dustpapsicon', 'losing', 'loosing_paps', 24, false)
		addAnimationByPrefix('dustpapsicon', 'winning', 'winning_paps', 24, false)
		setScrollFactor('dustpapsicon', 0, 0)
		setObjectCamera('dustpapsicon', 'other') -- either is under the health bar or nothing
		addLuaSprite('dustpapsicon', true)
		playAnim('dustpapsicon', 'normal', false)
end

function onCreatePost()
setProperty('dad.alpha', 0.8)
end

function onUpdate(elapsed)
	setProperty('iconP2.alpha', 0)
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('dustpapsicon.x', getProperty('iconP2.x')-40)
	setProperty('dustpapsicon.angle', getProperty('iconP2.angle'))
	setProperty('dustpapsicon.y', getProperty('iconP2.y')- 60)
	setProperty('dustpapsicon.scale.x', getProperty('iconP2.scale.x') - 0.6)
	setProperty('dustpapsicon.scale.y', getProperty('iconP2.scale.y') - 0.6)
end

function onBeatHit()
if curBeat % 2 == 0 then
	if getProperty('health') < 0.5 then
		playAnim('dustpapsicon', 'winning', false)
	elseif getProperty('health') > 1.6 then
		playAnim('dustpapsicon', 'losing', false)
	else
		playAnim('dustpapsicon', 'normal', false)
	end
end
end