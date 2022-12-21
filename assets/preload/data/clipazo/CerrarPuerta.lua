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

		makeLuaSprite('spacebar_icon', 'cerrarpuerta_icon', 600, 0);
	
		makeLuaSprite('bonnie', 'bonnie', -100, 320);

		setObjectCamera('spacebar_icon', 'hud');
	
		setObjectCamera('bonnie', 'hud');

		--scaleLuaSprite('spacebar_icon', 0.50, 0.50);

		addLuaSprite('spacebar_icon', true); 
		
		addLuaSprite('bonnie', true);

		canDodge = true;

		runTimer('Died', DodgeTime);
		runTimer('PuertaCierra', DodgeTime);

	end

end

function onUpdate()

   if canDodge == true and keyJustPressed('space') then

   Dodged = true;

   removeLuaSprite('spacebar_icon')

   canDodge = false;

   end

end

function onTimerCompleted(tag, loops, loopsLeft)

   if tag == 'Died' and Dodged == false then

   setProperty('health', 0);

   elseif tag == 'Died' and Dodged == true then

   Dodged = false;
   
   end
   
   if tag == 'PuertaCierra' then
   
   removeLuaSprite('bonnie')
   
   end

end