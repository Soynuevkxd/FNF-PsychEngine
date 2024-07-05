function onCreate()
	-- background shit
	makeLuaSprite('snowdin_cave', 'snowdin_cave', -182.05, -192.85);
	setScrollFactor('snowdin_cave', 1, 1);

	addLuaSprite('snowdin_cave', false);
end

function onCreatePost()
if getProperty('boyfriend.curCharacter') == 'pico' then
setProperty('gf.alpha', 0)
end
end