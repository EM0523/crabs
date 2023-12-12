function crabs(level)
  level = 1
  numJelly = level;
  % Draw the game map and initialize map dimensions.
  [mapHeight , mapWidth] = drawMap( "BGImage.png" );

  %initialize captain location, heading and size
  xCapt = 1000;
  yCapt = 500;
  thetaCapt = -pi/2;
  sizeCapt = 50;
  healthCapt = 100;
  crabsCaught = 0;

  %initialize crab location,heading, and size
  xCrab = rand(1,numCrabs)*mapWidth;
  yCrab = 3*mapHeight/4 + rand(1,numCrabs)*mapHeight/4;
  thetaCrab = ones(1,numCrabs)*(-pi/2);
  crabscaught = 0;
  sizeCrab = 50;
  isCrabcaught = zeros(1,numCrabs);

  %initialize jelly fish
  xJelly = rand(1,numJelly)*mapWidth;
  yJelly = rand(1,numJelly)*mapHeight;
  thetaJelly = ones(1,numCrabs)*(-pi/2);
  sizeJelly = 25;
  jellySting = 2;

  % Draw the captain and initialize graphics handles
  % Put your call to drawCapt() here ..... You must give drawCapt its
  [captainGraphics,xNet,yNet] = drawCapt(xCapt,yCapt,thetaCapt,sizeCapt);

  %draw crabs
 for k=1:numCrabs
    crabGraphics(:,k) = drawCrab(xCrab(k),yCrab(k),thetaCrab(k),sizeCrab);
  endfor

    %draw jelly
 for k=1:numJelly
    jellyGraphics(:,k) = drawJelly(xJelly(k),yJelly(k),thetaJelly(k),sizeJelly);
  endfor

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

   for k=1:numJelly

  if ( getDist(xJelly,yJelly,xCapt,yCapt) < 3*sizeCapt )
    healthCapt = healthCapt - jellySting;
  endif

 % erase old jellyfish
   for i=1:length(jellyGraphics)
     delete(jellyGraphics(i,k));
   endfor

   %initialize jelly fish
  xJelly = rand(1,numJelly)*mapWidth;
  yJelly = rand(1,numJelly)*mapHeight;
  thetaJelly = ones(1,numCrabs)*(-pi/2);
  sizeJelly = 25;
  jellySting = 2;

   %Read the keyboard.
  cmd = kbhit(1);
  if (cmd == 'Q')
    break;
  endif

 endfor
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

 for k=1:numCrabs

 if(!isCrabcaught(k)&&getDist(xNet,yNet,xCrab(k),yCrab(k)) < 2*sizeCapt ) %crab is caught

 %keep track of how many crabs are caught
 crabsCaught = crabsCaught + 1;
 isCrabCaught(k)= 4;

 %erase old crab
 for i=1:length(crabGraphics(:,k))
  delete(crabGraphics(i,k));
  endfor

 %initialize crab location,heading, and size
  xCrab = rand(1,numCrabs)*mapWidth;
  yCrab = 3*mapHeight/4 + rand(1,numCrabs)*mapHeight/4;
  thetaCrab = ones(1,numCrabs)*(-pi/2);
  crabscaught = 0;
  sizeCrab = 50;
  isCrabcaught = zeros(1,numCrabs);
endif

endfor
   fflush(stdout);
   pause(.01)
   endwhile
endfunction
