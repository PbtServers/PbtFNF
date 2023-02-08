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

local followchars = false;

local del = 0;

local del2 = 0;

function onUpdate()

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

    end

    

end