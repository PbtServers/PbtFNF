function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'perma2', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);

	makeLuaSprite('stagecurtains', 'juanypbt', -500, -300);
	setScrollFactor('stagecurtains', 1.3, 1.3);
	scaleObject('stagecurtains', 0.9, 0.9);

	addLuaSprite('stageback', false);
	addLuaSprite('stagecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end