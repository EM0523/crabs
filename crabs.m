function crabs()
    restart = 1;
    while(restart)

  %draw start screen
    level = drawStart("startScreen.png");

  % Draw the game map and initialize map dimensions.
  [mapHeight , mapWidth] = drawMap( "BGImage.png" );

       numJelly = level;
       numCrabs = level;

  %initialize captain location, heading and size
  xCapt = 1000;
  yCapt = 500;
  thetaCapt = -pi/2;
  sizeCapt = 50;
  healthCapt = 100;
  crabsCaught = 0;

  %initialize crab location, heading and size
  xCrab = rand(1,numCrabs)*mapWidth;
  yCrab = 3*mapHeight/4 + rand(1,numCrabs)*mapHeight/4;
  thetaCrab = ones(1,numCrabs)*(-pi/2);
  crabsCaught = 0;
  sizeCrab = 50;
  isCrabCaught = zeros(1,numCrabs);

%initialize jelly fish
  xJelly = rand(1,numJelly)*mapWidth;
  yJelly = rand(1,numJelly)*mapHeight;
  thetaJelly = ones(1,numJelly)*(-pi/2);
  sizeJelly = 25;
  jellySting = 5;

  % Draw the captain and initialize graphics handles
  [captainGraphics,xNet,yNet] = drawCapt(xCapt,yCapt,thetaCapt,sizeCapt);

  %draw the crabs
    for k=1:numCrabs
       crabGraphics(:,k) = drawCrab(xCrab(k), yCrab(k),thetaCrab(k), sizeCrab);
       endfor

  %draw jellyfish
  for j=1:numJelly
    jellyGraphics(:,j) = drawJelly(xJelly(j),yJelly(j),thetaJelly(j),sizeJelly);
  endfor

    % print health status
    healthLoc = [100,100];
    crabsCaughtLoc = [100,175];
    healthStatus = text(healthLoc(1), healthLoc(2), strcat('Health = ', num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
  crabsCaughtStatus = text(crabsCaughtLoc(1), crabsCaughtLoc(2), strcat('Crabs Caught = ',num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');

  while(1)

        for j=1:numJelly

       %erase old Jelly
          for i=1:length(jellyGraphics)
            set(jellyGraphics(i,j),'Visible','off');
          endfor

            % move jellyfish
          [xJelly(j),yJelly(j),thetaJelly(j)] = moveJelly(level, xJelly(j), yJelly(j), thetaJelly(j), sizeJelly, mapHeight, mapWidth);

            % draw jellyfish
           jellyGraphics(:,j) = drawJelly(xJelly(j),yJelly(j),thetaJelly(j),sizeJelly);

        endfor

 %read keyboard
 commandwindow();
  cmd = kbhit(1);

if (cmd == 'Q' || healthCapt < 0 || crabsCaught == numCrabs )
    break;
endif

if( cmd == "w" || cmd == "a" || cmd == "d"|| cmd == "s")

     % erase old captain
      for i=1:length( captainGraphics )
        set( captainGraphics(i), 'Visible', 'off' );
      endfor

      % move capt
      [xCapt, yCapt, thetaCapt] = moveCapt(cmd, xCapt, yCapt, thetaCapt);

      % draw new capt
     [captainGraphics,xNet,yNet] = drawCapt(xCapt,yCapt,thetaCapt,sizeCapt);
endif

for j=1:numJelly
        if( getDist(xJelly(j),yJelly(j),xCapt,yCapt) < 3*sizeCapt )
              healthCapt = healthCapt - jellySting;
              % ends the game if the captain's health is at 0
        endif
endfor

for k=1:numCrabs

      if( !isCrabCaught(k) && getDist (xNet, yNet, xCrab(k), yCrab(k)) < 2*sizeCapt) %crab is caught
            crabsCaught = crabsCaught + 1;
            isCrabCaught(k) = 1;

     %erase old crab
       for i=1:length(crabGraphics(:,k))
         delete(crabGraphics(i,k));
       endfor
    endif

endfor

%remove old and plot new health and points status to screen
  delete(healthStatus);
  delete(crabsCaughtStatus);
    healthStatus = text(healthLoc(1), healthLoc(2), strcat('Health = ', num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
  crabsCaughtStatus = text(crabsCaughtLoc(1), crabsCaughtLoc(2), strcat('Crabs Caught = ',num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');

fflush(stdout);
pause(.01);

endwhile

  restart = drawEnd("endScreen.png",crabsCaught,numCrabs);

 endwhile

  close all
   clear

endfunction
