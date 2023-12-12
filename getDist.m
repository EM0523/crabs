function dist = getDist(xCapt, yCapt, xJelly, yJelly)
  xDiff = (yCapt - yJelly);
  yDiff = (xCapt - xJelly);
 dist = sqrt((xDiff).^2 + (yDiff).^2);
endfunction
