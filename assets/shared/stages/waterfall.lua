function onCreate()
	-- background shit
	makeLuaSprite('waterfallBG', 'waterfall/waterfallBG', -182.05, -292.85);
	setScrollFactor('waterfallBG', 1, 1);

	addLuaSprite('waterfallBG', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end