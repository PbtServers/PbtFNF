local intensity = 0.005
local duration = 0.1

function opponentNoteHit()
    camShake()
end

function camShake()
    cameraShake('game', intensity, duration)
end

local xx = 324;

local yy = 324;

local xx2 = 324;

local yy2 = 324;

local ofs = 124;

local followchars = true;

local del = 0;

local del2 = 0;

function onUpdate()

if curBeat == 0 then

makeLuaSprite('pcendido', 'M6-Virus-PC', 0, 0);
addLuaSprite('pcendido', true);

end

if curBeat == 2 then

removeLuaSprite('pcendido', true);
makeLuaSprite('pcwin', 'M6-Virus-Login', 0, 0);
addLuaSprite('pcwin', true);

end

if curBeat == 4 then

removeLuaSprite('pcwin', true);
makeLuaSprite('pccrash', 'M6-Virus-Crash', 0, 0);
addLuaSprite('pccrash', true);

end

if curBeat == 5 then

removeLuaSprite('pccrash', true);
makeLuaSprite('pcmanos', 'M6-Virus-PC-Manos', 0, 0);
addLuaSprite('pcmanos', true);

end

if curBeat == 7 then

removeLuaSprite('pcmanos', true);

end

if curBeat == 90 then

makeLuaSprite('pcendido', 'M6-Virus-PC', 0, 0);
addLuaSprite('pcendido', true);

end

if curBeat == 97 then

removeLuaSprite('pcendido', true);
makeLuaSprite('pccrash', 'M6-Virus-Crash', 0, 0);
addLuaSprite('pccrash', true);

end

if curBeat == 100 then

removeLuaSprite('pccrash', true);

end

if curBeat == 214 then

makeLuaSprite('pcendido', 'M6-Virus-PC', 0, 0);
addLuaSprite('pcendido', true);

end

if curBeat == 221 then

removeLuaSprite('pcendido', true);
makeLuaSprite('pccrash', 'M6-Virus-Crash', 0, 0);
addLuaSprite('pccrash', true);

end

if curBeat == 293 then

removeLuaSprite('pccrash', true);
makeLuaSprite('pcwin', 'M6-Virus-Login', 0, 0);
addLuaSprite('pcwin', true);

end

if curBeat == 296 then

removeLuaSprite('pcwin', true);

end

if curBeat == 319 then

makeLuaSprite('pccrash', 'M6-Virus-Crash', 0, 0);
addLuaSprite('pccrash', true);

end

if curBeat == 322 then

removeLuaSprite('pccrash', true);

end

if curBeat == 356 then

makeLuaSprite('pc11', 'M6-Virus-PC-Win11', 0, 0);
addLuaSprite('pc11', true);

end

if curBeat == 362 then

removeLuaSprite('pc11', true);
makeLuaSprite('pccrash', 'M6-Virus-Crash', 0, 0);
addLuaSprite('pccrash', true);

end

if curBeat == 363 then

removeLuaSprite('pccrash', true);
makeLuaSprite('pcwin', 'M6-Virus-Login', 0, 0);
addLuaSprite('pcwin', true);

end

if curBeat == 367 then

removeLuaSprite('pcwin', true);
makeLuaSprite('pcendido', 'M6-Virus-PC', 0, 0);
addLuaSprite('pcendido', true);

end

if curBeat == 374 then

removeLuaSprite('pcendido', true);
makeLuaSprite('pcwin', 'M6-Virus-Login', 0, 0);
addLuaSprite('pcwin', true);

end

if curBeat == 378 then

removeLuaSprite('pcwin', true);
makeLuaSprite('pcendido', 'M6-Virus-PC', 0, 0);
addLuaSprite('pcendido', true);

end

if del > 0 then

del = del - 1

end

if del2 > 0 then

del2 = del2 - 1

end

    if followchars == true then

        if mustHitSection == false then

            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then

                triggerEvent('Camera Follow Pos',xx-ofs,yy)

            end

            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then

                triggerEvent('Camera Follow Pos',xx+ofs,yy)

            end

            if getProperty('dad.animation.curAnim.name') == 'singUP' then

                triggerEvent('Camera Follow Pos',xx,yy-ofs)

            end

            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then

                triggerEvent('Camera Follow Pos',xx,yy+ofs)

            end

            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then

                triggerEvent('Camera Follow Pos',xx-ofs,yy)

            end

            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then

                triggerEvent('Camera Follow Pos',xx+ofs,yy)

            end

            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then

                triggerEvent('Camera Follow Pos',xx,yy-ofs)

            end

            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then

                triggerEvent('Camera Follow Pos',xx,yy+ofs)

            end

            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then

                triggerEvent('Camera Follow Pos',324,260)

            end

            if getProperty('dad.animation.curAnim.name') == 'idle' then

                triggerEvent('Camera Follow Pos',324,260)

            end

        end

    else

        triggerEvent('Camera Follow Pos',324,260)

    end

    

end