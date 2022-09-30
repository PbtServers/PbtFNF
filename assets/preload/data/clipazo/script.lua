function onStepHit()
    if curStep == 1024 then
        --stop part
        cameraFlash('hud', 'FFFFFF', 1.1)
        doTweenAlpha('foxee', 'camHUD', 0, 0.4)
    end
    if curStep == 1028 then
        --laugh
        setProperty('dadGroup.scale.x', 0.1)
        setProperty('dadGroup.scale.y', 0.1)
    end
    if curStep == 1041 then
        --balloon noise + door stop L
        makeLuaSprite('iwantyou', '', 0, 0)
        setObjectCamera('iwantyou', 'hud')
        makeGraphic('iwantyou', 1280, 720, '000000')
        addLuaSprite('iwantyou')
        setProperty('camHUD.alpha', 1)
        doTweenX('scaleupx', 'dadGroup.scale', 1, 0.4, 'circInOut')
        doTweenY('scaleupy', 'dadGroup.scale', 1, 0.4, 'circInOut')
    end
    if curStep == 1441 then
        doTweenX('goodbyex', 'dadGroup.scale', 0.3, 0.5, 'circInOut')
        doTweenY('goodbyey', 'dadGroup.scale', 0.3, 0.5, 'circInOut')
        doTweenAlpha('goodbyealpha', 'dadGroup', 0, 0.7, 'circInOut')
        --end!
    end 
    if curStep == 1457 then
        setProperty('dadGroup.alpha', 1)
        setProperty('dadGroup.y', 1000)
        setProperty('dadGroup.scale.x', 1)
        setProperty('dadGroup.scale.y', 1)
        doTweenAlpha('uwuw!', 'iwantyou', 0, 0.4)
    end
    if curStep == 1464 then
        doTweenY('up! up! go up!', 'dad', -245, 0.6, 'circInOut')
    end
    if curStep == 2240 then
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes', i, 'velocity.x', math.random(-80, 80))
            setPropertyFromGroup('strumLineNotes', i, 'acceleration.x', math.random(-80, 80))

            setPropertyFromGroup('strumLineNotes', i, 'velocity.y', math.random(-250, -300))
            setPropertyFromGroup('strumLineNotes', i, 'acceleration.y', math.random(600, 650))
        end
        doTweenAlpha('camHUD', 'camHUD', 0, 20)
    end
end

function onEvent(a, v, w)
    if a == 'Change Character' then
        if w == 'feddy-hater' then
            setProperty('health', getHealth() - 0.2)

            setProperty('fed.alpha', 0.75)
            setProperty('dad.alpha', 0)
        elseif w == 'feddy' then
            setProperty('dad.alpha', 1)
            setProperty('fed.alpha', 0)
        end
    end
    if a == 'Change Captions' then
        if v ~= '' then
            setTextString('weed', v)
            setProperty('capty.alpha', 0.4)
        else
            setProperty('capty.alpha', 0)
            setTextString('weed', '')
        end
    end
end

function onCreate()
    makeLuaSprite('capty', '', 140, 585)
    setObjectCamera('capty', 'other')
    setProperty('capty.origin.x', 640)
    setProperty('capty.alpha', 0)
    makeGraphic('capty', 1000, 55, '000000')
    addLuaSprite('capty')
    
    makeLuaText('weed', '', 1280, 0, 590)
    setObjectCamera('weed', 'other')
    setTextAlignment('weed', 'center')
    setTextSize('weed', 50)
    setTextFont('weed', 'font.ttf')
    setTextColor('weed', 'FFFFFF')
    addLuaText('weed')

    makeAnimatedLuaSprite('fed', 'characters/feddy_hater', 150, -300)
    setObjectCamera('fed', 'hud')
    setProperty('fed.alpha', 0)
    scaleObject('fed', 1.4, 1.4)
    updateHitbox('fed')
    addAnimationByPrefix('fed', 'boo', 'feddy up instance')
    addLuaSprite('fed', true)
end

function onUpdate()
    objectPlayAnimation('fed', 'boo')
end