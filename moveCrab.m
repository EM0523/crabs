function [xCrab,yCrab,thetaCrab] = moveCrab(cmd,x,y,theta,height,width,size)
 thetaCrab = pi/6;
  StepCrab = 50;

  if( cmd == "i" ) %rotate right
  xCrab = x + StepCrab*sin(theta);
  yCrab = y - StepCrab*cos(theta);
  thetaCrab = theta + thetaCrab;

  elseif ( cmd == "j" ) %move left
  xCrab = x - StepCrab*sin(theta);
  yCrab = y + StepCrab*cos(theta);
  thetaCrab = theta;

  elseif ( cmd == "k" ) %move back
  xCrab = x - StepCrab*cos(theta);
  yCrab = y - StepCrab*sin(theta);
  thetaCrab = theta;

  elseif ( cmd == "l" ) %move right
  xCrab = x + StepCrab*sin(theta);
  yCrab = y - StepCrab*cos(theta);
  thetaCrab = theta;

  elseif ( cmd == "," ) % rotate left.
  xCrab = x - StepCrab*sin(theta);
  yCrab = y + StepCrab*cos(theta);
  thetaCrab = theta - thetaCrab;

  else % if none of the cases are true, set the new variables equal to the old inputs.
  xCrab = x - StepCrab*sin(theta);
  yCrab = y + StepCrab*cos(theta);
  thetaCrab = theta;

  endif
endfunction
