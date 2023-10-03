function capt = getCapt (captSize)
  %right side
  captPt1 = [ captSize; captSize; 1];
  captPt2 = [ -captSize; captSize; 1];
  %feet
  captPt3 = [-3*captSize; captSize; 1]; %left
  captPt4 = [-3*captSize; -captSize; 1]; %right
  %right side
  captPt5 = [ -captSize; -captSize; 1];
  captPt6 = [ captSize; -captSize; 1];
  %head
  captPt7 = [ captSize; -captSize/2; 1];
  captPt8 = [ 2 *captSize; -captSize/2; 1];
  captPt9 = [ 2*captSize; captSize/2; 1];
  captPt10 = [ captSize; captSize/2; 1];
  %hands
  captPt11 = [ 0; 2*captSize; 1]; %left
  captPt12 = [ 0; -2*captSize; 1]; %right
  %spear
  captPt13=[ 3*captSize; -2*captSize; 1];
  captPt14=[ -captSize; -2*captSize; 1];
  capt = [ captPt1, captPt2, captPt3, captPt4, captPt5, captPt6, captPt7, ...
  captPt8, captPt9, captPt10, captPt11, captPt12, captPt13, captPt14];
endfunction
