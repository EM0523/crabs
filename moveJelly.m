function [xJelly,yJelly,thetaJelly] = moveJelly(level, x, y, theta, size, height, width)
  jellyMove = 200;
  step = jellyMove + level;

  % return a y-position increased by step, but return the same x and theta values
  yJelly = y + step;

  xJelly = x;

  thetaJelly = theta;

  if (yJelly > height-10*size)

    yJelly = size;

    xJelly = rand*width;

  % set the returned y-value to be size and return a new random x value between 0 and % width

endif
endfunction
