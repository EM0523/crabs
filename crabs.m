function crabs()
    level = 1;
  % Draw the game map and initialize map dimensions.
  [mapHeight , mapWidth] = drawMap( "BGImage.png" );

  %initialize captain location, heading and size
  xCapt = 1000;
  yCapt = 500;
  thetaCapt = -pi/2;
  sizeCapt = 50;
  healthCapt = 100;
  crabsCaught = 0;

  xCrab = 800;
  yCrab = 500;
  thetaCrab = -pi/2;
  sizeCrab = 50;

  %initialize jelly fish
  xJelly=rand*mapWidth;
  yJelly=0;
  thetaJelly = -pi/2;
  sizeJelly = 25;
  jellySting = 2;

  % Draw the captain and initialize graphics handles
  % Put your call to drawCapt() here ..... You must give drawCapt its
[captainGraphics,xNet,yNet] = drawCapt(xCapt,yCapt,thetaCapt,sizeCapt);

  crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);

  jellyGraphics = drawJelly(xJelly,yJelly,thetaJelly,sizeJelly);

  % input and output arguments.

  cmd = "null"; % initial command

  % print health status
    healthLoc = [100,100];
    crabsCaughtLoc = [100,175];
    healthStatus = text(healthLoc(1), healthLoc(2), strcat('Health = ', ...
                  num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
  crabsCaughtStatus = text(crabsCaughtLoc(1), crabsCaughtLoc(2), ...
  strcat('Crabs Caught = ',num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');

  while(1) % While not quit, read keyboard and respond

  %remove old and plot new health and points status to screen
  delete(healthStatus);
  delete(crabsCaughtStatus);

 healthStatus = text(healthLoc(1), healthLoc(2), strcat('Health = ', ...
               num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
  crabsCaughtStatus = text(crabsCaughtLoc(1), crabsCaughtLoc(2), ...
  strcat('Crabs Caught = ',num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');

  if ( getDist(xJelly,yJelly,xCapt,yCapt) < 3*sizeCapt )
    healthCapt = healthCapt - jellySting;
  endif

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
 [captainGraphics,xNet,yNet] = drawCapt(xCapt,yCapt,thetaCapt,sizeCapt);

 endif

 if( getDist(xNet,yNet,xCrab,yCrab) < 2*sizeCapt ) %crab is caught

 %keep track of how many crabs are caught

 crabsCaught = crabsCaught +1;

 %erase old crab
 for i=1:length(crabGraphics)
  delete(crabGraphics(i));
endfor

%create a new crab. initialize new crab location, heading and size
xCrab = rand*mapWidth;
yCrab = rand*mapHeight;
thetaCrab = -pi/2;
sizeCrab = 50;

%draw new crab
crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);

endif

   fflush(stdout);
   pause(.01)
   endwhile
endfunction
