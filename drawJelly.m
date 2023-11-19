function jellyGraphics = drawJelly (x,y,theta,size)

  jelly = getJelly(size);

  R = getRotation(theta);
  jellyRotated = R*jelly;

  T = getTranslation(x,y);
  jelly = T*jellyRotated;

  pt1=jelly(:,1);
  pt2=jelly(:,2);
  pt3=jelly(:,3);
  pt4=jelly(:,4);
  pt5=jelly(:,5);
  pt6=jelly(:,6);
  pt7=jelly(:,7);
  pt8=jelly(:,8);
  pt9=jelly(:,9);
  pt10=jelly(:,10);
  pt11=jelly(:,11);
  pt12=jelly(:,12);
  pt13=jelly(:,13);

  jellyGraphics(1)=drawLine(pt1,pt2,'b');
  jellyGraphics(2)=drawLine(pt2,pt3,'b');
  jellyGraphics(3)=drawLine(pt3,pt4,'b');
  jellyGraphics(4)=drawLine(pt4,pt5,'b');
  jellyGraphics(5)=drawLine(pt6,pt7,'b');
  jellyGraphics(6)=drawLine(pt7,pt8,'b');
  jellyGraphics(7)=drawLine(pt8,pt9,'b');
  jellyGraphics(8)=drawLine(pt10,pt11,'b');
  jellyGraphics(9)=drawLine(pt11,pt12,'b');
  jellyGraphics(10)=drawLine(pt12,pt13,'b');
  jellyGraphics(11)=drawLine(pt13,pt5,'b');
  jellyGraphics(12)=drawLine(pt12,pt4,'b');


endfunction
