module comparator_2bit(
  lin, gin, ein,
  lout, gout, eout,
  x1,x0,
  y1,y0,
  );
  
  input x0,x1,y0,y1,gin,lin,ein;
  output gout,lout,eout;
  not (x0n,x0),(x1n,x1),(y0n,y0),(y1n,y1);
  not(ngin,gin),(nlin,lin);
  
  // equal out structural definition
  and(eq0,x1,x0,y1,y0),(eq1,x1n,x0,y1n,y0),
    (eq2,x1,x0n,y1,y0n),(eq3,x1n,x0n,y1n,y0n);
  or(echeck,eq0,eq1,eq2,eq3);
  and(eout,ngin,nlin,echeck);
  
  // lesser out structural definition
  and(la,x1n,y1),(lb,y1,y0,x0n),(lc,x1n,x0n,y0);
  or(lcheck,la,lb,lc,lin);
  and(lout,ngin,lcheck);
  
  // greater out structural definion
  and(ga,x1,y1n),(gb,x1,x0,y0n),(gc,x0,y1n,y0n);
  or(gcheck,ga,gb,gc,gin);
  and(gout,nlin,gcheck);
  
  
endmodule // comparator_2bit