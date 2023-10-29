function crabs()
    level = 1;
  % Draw the game map and initialize map dimensions.
  [mapHeight , mapWidth] = drawMap( "BGImage.png" );
  % Initialize captain location, heading and size
  xCapt = 1000;
  yCapt = 1000;
  thetaCapt = -pi/2;
  sizeCapt = 50;

  xCrab = 800;
  yCrab = 500;
  thetaCrab = -pi/2;
  sizeCrab = 50;

  %initialize jellyfish
  xJelly = rand*mapWidth;
  yJelly = 0;
  thetaJelly = -pi/2;
  sizeJelly = 25;

  % Draw the captain and initialize graphics handles
  % Put your call to drawCapt() here ..... You must give drawCapt its
  captainGraphics = drawCapt(xCapt , yCapt , thetaCapt , sizeCapt);

  crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);

  jellyGraphics = drawJelly(xJelly,yJelly,thetaJelly,sizeJelly);

  % input and output arguments.

  cmd = "null"; % initial command

  while(1) % While not quit, read keyboard and respond

 % erase old jellyfish
   for i=1:length(jellyGraphics)
     delete(jellyGraphics(i));
   endfor

   % move jellyfish
   [xJelly,yJelly,thetaJelly] = moveJelly(level, xJelly, yJelly,thetaJelly, sizeJelly, mapHeight,mapWidth);

   % draw jellyfish
   jellyGraphics = drawJelly(xJelly,yJelly,thetaJelly,sizeJelly);

   %Read the keyboard.
  cmd = kbhit(1);
  if (cmd == 'Q')
    break;
    endif

    % Read the keyboard.

  if( cmd == "w" || cmd == "a" || cmd == "d" ) %Captain has moved. Respond.

  % erase old captain
  for i=1:length( captainGraphics )
    set( captainGraphics(i), 'Visible', 'off' );
  endfor

  % move capt
  [xCapt, yCapt, thetaCapt] = moveCapt(cmd, xCapt, yCapt, thetaCapt);

  % draw new capt
 captainGraphics = drawCapt( xCapt, yCapt, thetaCapt, sizeCapt);


 elseif (cmd == "i" || cmd == "j" || cmd == "k" || cmd == "l" || cmd ==",") % respond crab moved

 %erase old crab
 for i=1:length( crabGraphics )
   set(crabGraphics(i), 'Visible', 'off' );
  endfor

   %move crab
   [xCrab,yCrab,thetaCrab] = moveCrab(cmd,xCrab,yCrab,thetaCrab,sizeCrab, mapHeight, mapWidth);

   %draw crabs
   crabGraphics = drawCrab (xCrab,yCrab,thetaCrab,sizeCrab);
endif

   fflush(stdout);
   pause(.01)
   endwhile
endfunction
