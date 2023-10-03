function crabs ()
  % Draw the game map and initialize map dimensions.
  [mapHeight , mapWidth] = drawMap( "BGImage.png" );
  % Initialize captain location, heading and size
  xCapt = 1000;
  yCapt = 1200;
  thetaCapt = -pi/2;
  sizeCapt = 50;
  % Draw the captain and initialize graphics handles
  % Put your call to drawCapt() here ..... You must give drawCapt its
  drawCapt (xCapt , yCapt , thetaCapt , sizeCapt)
  % input and output arguments.
endfunction

