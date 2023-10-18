function crabs ()
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
  % Draw the captain and initialize graphics handles
  % Put your call to drawCapt() here ..... You must give drawCapt its
  captainGraphics = drawCapt(xCapt , yCapt , thetaCapt , sizeCapt);

  crabsGraphics = drawCrab (xCrab,yCrab,thetaCrab,sizeCrab);
  % input and output arguments.

  cmd = "null"; % initial command

  while ( cmd != "Q") % While not quit, read keyboard and respond

  cmd = kbhit(); % Read the keyboard.

  if( cmd == "w" || cmd == "a" || cmd == "d" ) %Captain has moved. Respond.

  % erase old captain
  for i=1:length( captainGraphics )
    set( captainGraphics(i), 'Visible', 'off' );
  endfor

% move capt
[xCapt, yCapt, thetaCapt] = moveCapt(cmd, xCapt, yCapt, thetaCapt);

% draw new capt
captainGraphics = drawCapt( xCapt, yCapt, thetaCapt, sizeCapt);

%draw crabs
crabsGraphics = drawCrab (xCrab,yCrab,thetaCrab,sizeCrab);

endif

endwhile
endfunction
