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
  captPt15=[ 3*captSize; -4*captSize; 1];
  captPt16=[ 5*captSize; -4*captSize; 1];
  captPt17=[ 5*captSize; -2*captSize; 1];
  captPt18=[ 5*captSize; 0; 1];
  captPt19=[ 3*captSize; 0; 1];

 captPt20=[ 4*captSize; -2*captSize; 1];

  %matrix
  capt = [ captPt1, captPt2, captPt3, captPt4, captPt5, captPt6, captPt7, ...
  captPt8, captPt9, captPt10, captPt11, captPt12, captPt13, captPt14, ...
  captPt15, captPt16, captPt17, captPt18, captPt19, captPt20];
endfunction
