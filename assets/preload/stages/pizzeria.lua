function onCreate()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);

	makeLuaSprite('bg', 'stages/bg', 0, 0)
	setObjectCamera('bg', 'hud')
	scaleObject('bg', 0.67, 0.67)
	addLuaSprite('bg')

	makeLuaSprite('mark', 'stages/mark', 0, 0)
	setObjectCamera('mark', 'other')
	scaleObject('mark', 0.67, 0.67)
	addLuaSprite('mark')

	makeLuaSprite('bar', 'ui/youtubebar', 0, 0)
	setObjectCamera('bar', 'other')
	scaleObject('bar', 0.67, 0.67)
	addLuaSprite('bar')

	makeLuaText('songLength', '--:-- / --:--', 0, 130, 681.5)
	setObjectCamera('songLength', 'other')
	setTextFont('songLength', 'font.ttf')
	setTextSize('songLength', 26)
	addLuaText('songLength', true)

	makeLuaText('foreverScore', 'Score: 0 | Misses: 0 | Accuracy: ?', 1030, 130, 681.5);
	setObjectCamera('foreverScore', 'other')
	setTextAlignment('foreverScore', 'right')
	setTextSize('foreverScore', 24)
	setTextFont('foreverScore', 'font.ttf')
	addLuaText('foreverScore', true)

	makeLuaSprite('teehee', 'ui/teehee', 1225, 675)
	setObjectCamera('teehee', 'other')
	scaleObject('teehee', 0.67, 0.67)
	addLuaSprite('teehee')
end

function onDestroy()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
end

function onCreatePost()
	setObjectCamera('dadGroup', 'hud')
	setObjectCamera('boyfriendGroup', 'other')
	
	setProperty('timeBar.x', 10000)
	setProperty('timeTxt.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setProperty('scoreTxt.visible', false)

	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'x', -1000)
	end
	
	makeLuaSprite("healthbar_p1", "", 640, 658)
	makeGraphic("healthbar_p1",	640, 13, 'A7A7A7')
	addLuaSprite("healthbar_p1", true)
	setObjectCamera("healthbar_p1", "other")
	setObjectOrder("healthbar_p1", 2)
	setProperty("healthbar_p1" .. ".origin.x", getProperty("healthbar_p1" .. ".width"))
	
	makeLuaSprite("healthbar_p2", "", 0, 658)
	makeGraphic("healthbar_p2",	640, 13, 'FF0000')
	addLuaSprite("healthbar_p2", true)
	setObjectCamera("healthbar_p2", "other")
	setObjectOrder("healthbar_p2", 1)
	setProperty("healthbar_p2" .. ".origin.x", 0)
end

function onUpdatePost()
	local percent_p1 = (getProperty("healthBar.percent") / 100)
	local percent_p2 = 1 - percent_p1

	setProperty("healthbar_p1" .. ".scale.x", percent_p2 * 2)
	setProperty("healthbar_p2" .. ".scale.x", (percent_p1 * 2) + (percent_p1 < 1 and 0.01 or 0))

	if mouseClicked('left') and mouseOverLapsSprite('teehee', 'hud') then
		endSong()
	end
end

function onRecalculateRating()
	setTextString('foreverScore',
	'Score: '..score.. -- setup score
	' | Misses: '..misses.. -- misses (easy)
	' | Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%') --setup accuracy
end

function onStepHit()
	setTextString('songLength', milliToHuman(math.floor(getPropertyFromClass('Conductor', 'songPosition') - noteOffset)).. ' / ' .. milliToHuman(math.floor(songLength)) .. '\n')
end

function posOverlaps(
    x1, y1, w1, h1, --r1,
    x2, y2, w2, h2 --r2
)
    return (
        x1 + w1 >= x2 and x1 < x2 + w2 and
        y1 + h1 >= y2 and y1 < y2 + h2
    )
end

function mouseOverLapsSprite(spr, cam)
    local mouseX, mouseY = getMouseX(cam or "other"), getMouseY(cam or "other")
    
    local x, y, w, h = getProperty(spr .. ".x"), getProperty(spr .. ".y"), getProperty(spr .. ".width"), getProperty(spr .. ".height")
    
    return posOverlaps(
        mouseX, mouseY, 1, 1,
        x, y, w, h
    )
end

function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%02d:%02d", minutes, seconds)  
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
	n = math.pow(10, n or 0)
	x = x * n
	if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
	return x / n
end