function jelly = getJelly (size)

  %right side
  jellypt1=[-7*size;size;1];
  jellypt2=[-5*size;size;1 ];
  jellypt3=[-3*size;2*size;1 ];
  jellypt4=[-size;size;1 ];
  jellypt5=[size;size;1 ];


  %middle
  jellypt6=[-9*size;-2*size;1 ];
  jellypt7=[-5*size;0;1 ];
  jellypt8=[-3*size;-size;1 ];
  jellypt9=[-size;0;1 ];


  %left side
   jellypt10=[-5*size;-size;1 ];
   jellypt11=[-3*size;-2*size;1 ];
   jellypt12=[-size;-size;1 ];
   jellypt13=[size;-size;1 ];


  jelly=[jellypt1,jellypt2,jellypt3,jellypt4,jellypt5,jellypt6,jellypt7,...
  jellypt8,jellypt9,jellypt10,jellypt11,jellypt12,jellypt13];

endfunction
