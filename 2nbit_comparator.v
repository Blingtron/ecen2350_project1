module comparator_2nbit(X, Y, lout, gout, eout);
  // 2n-bit comparator constructed with cascaded 2-bit comparator units
  parameter n = 2;
  input [(2*n-1):0]X,Y;
  output lout,gout,eout;
  wire [n:0] L, G, E;
  genvar i;
  
  assign L[n] = 0;
  assign G[n] = 0;
  assign E[n] = 0;
  
  assign lout = L[0];
  assign gout = G[0];
  assign eout = E[0];
 
  generate
	for(i=n; i>0; i=i-1)
		begin:comp2bit
			comparator_2bit unit(L[i],G[i],E[i],
                           L[i-1],G[i-1],E[i-1],
                           X[2*i-1],X[2*i-2],
                           Y[2*i-1],Y[2*i-2]);
		end
	endgenerate
								
endmodule // nbit_comparator
	