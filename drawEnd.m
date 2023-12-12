function restart = drawEnd (imgName,crabsCaught,numCrabs)

    drawMap(imgName);
    hold on
      %text Let's Play

      textLoc = [ 500, 1000];
      textHandle = text(textLoc(1),textLoc(2), strcat('Total Crabs Caught: ', num2str(crabsCaught)), 'Fontsize', 20, 'Color', 'green');
      pause(5)
     %text do you want to play again y/n?
      delete(textHandle)
    %  textHandle=

      while(1)
        %read keyboard

        commandwindow();
        cmd=kbhit(1);

        yn = str2num(cmd);

         textLoc = [500,1100];
         textplayagain = text(textLoc(1), textLoc(2), strcat('Do you want to play again? y/n', num2str(yn)), 'Fontsize', 20, 'Color', 'green');
        if( cmd == 'y' || cmd == 'Y')
              restart = 1;
              break;
        elseif( cmd == 'n' || cmd == 'N')
               restart = (0);
               break;
        endif
       pause(0.1);
      endwhile


    hold off


endfunction
