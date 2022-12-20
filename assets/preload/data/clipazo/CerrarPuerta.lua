Dodged = false;

canDodge = false;

DodgeTime = 0;

function onCreate()

    precacheImage('cerrarpuerta_icon');
	precacheImage('bonnie');

end

function onEvent(name, value1, value2)

	if name == "CerrarPuerta" then

		DodgeTime = (value1);

		--debugPrint(DodgeTime);
		
		playSound('puertafnaf', 0.85);

		makeLuaSprite('spacebar_icon', 'cerrarpuerta_icon', -400, -220);
	
		makeLuaSprite('bonnie', 'bonnie', -300, -300);

		setObjectCamera('spacebar_icon', 'hud');
	
		setObjectCamera('bonnie', 'hud');

		scaleLuaSprite('spacebar_icon', 0.50, 0.50); 

		addLuaSprite('spacebar_icon', true); 

		canDodge = true;

		runTimer('Died', DodgeTime);

	end

end

function onUpdate()

   if canDodge == true and keyJustPressed('space') then

   Dodged = true;

   removeLuaSprite('spacebar_icon')
   removeLuaSprite('bonnie')

   canDodge = false;

   end

end

function onTimerCompleted(tag, loops, loopsLeft)

   if tag == 'Died' and Dodged == false then

   setProperty('health', 0);

   elseif tag == 'Died' and Dodged == true then

   Dodged = false;

   

   end

end