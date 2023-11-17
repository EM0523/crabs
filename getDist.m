function dist = getDist(x1, y1, x2, y2)
  a = y2 - y1;
  b = x2 - x1;
  dist = sqrt(a^2 + b^2);
endfunction
