function crabs ()
  % Draw the game map and initialize map dimensions.
  [mapHeight , mapWidth] = drawMap( "BGImage.png" );
  % Initialize captain location, heading and size
  xCapt = 1000;
  yCapt = 1000;
  thetaCapt = -pi/2;
  sizeCapt = 50;
  % Draw the captain and initialize graphics handles
  % Put your call to drawCapt() here ..... You must give drawCapt its
  captainGraphics = drawCapt(xCapt , yCapt , thetaCapt , sizeCapt)
  % input and output arguments.

  cmd = "null"; % initial command

  while ( cmd != "Q") % While not quit, read keyboard and respond

  cmd = kbhit(); % Read the keyboard.

  if( cmd == "w" || cmd == "a" || cmd == "d" ) %Captain has moved. Respond.

  % erase old captain
  for i=1:length( captGraphics )
    set( captGraphics(i), 'Visible', 'off' );
  endfor

% move capt
[xCapt, yCapt, thetaCapt] = moveCapt(cmd, xCapt, yCapt, thetaCapt);

% draw new capt
captGraphics = drawCapt( xCapt, yCapt, thetaCapt, sizeCapt);

endif

endwhile
endfunction
