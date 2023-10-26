function crabGraphics = drawCrab (xCrab,yCrab,thetaCrab,sizeCrab)
% This function draws the crab by rotating and shifting the crab
% as it appears in getCrab.m where it is at the origin with zero heading.
%get crab at the origin
crab = getCrab(sizeCrab);
%rotate crab
R = getRotation(thetaCrab);
crabRotated = R*crab;
%shift crab to new location
S = getTranslation(xCrab,yCrab);
crab = S*crabRotated;
%get crab points
pt1=crab(:,1);
pt2=crab(:,2);
pt3=crab(:,3);
pt4=crab(:,4);
pt5=crab(:,5);
pt6=crab(:,6);
pt7=crab(:,7);
pt8=crab(:,8);
pt9=crab(:,9);
pt10=crab(:,10);
%draw the crab body
crabGraphics(1) = drawLine(pt1,pt2,"r");
crabGraphics(2) = drawLine(pt2,pt3,"r");
crabGraphics(3) = drawLine(pt3,pt4,"r");
crabGraphics(4) = drawLine(pt4,pt1,"r");
%draw crab pinchers
crabGraphics(5) = drawLine(pt1,pt5,"r");
crabGraphics(6) = drawLine(pt4,pt6,"r");
% draw legs
crabGraphics(7) = drawLine(pt2,pt7,"r");
crabGraphics(8) = drawLine(pt7,pt8,"r");
crabGraphics(9) = drawLine(pt3,pt9,"r");
crabGraphics(10) = drawLine(pt9,pt10,"r");
endfunction

