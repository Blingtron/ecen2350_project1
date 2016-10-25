module de0_4bit2comp_comparator(X,Y,
								  xs0,xs1,xs2,xs3,xs4,xs5,xs6,
								  ys0,ys1,ys2,ys3,ys4,ys5,ys6,
								  lout0,lout1,gout0,gout1,eout0,eout1,
								  negselect,xneg,yneg);
	input [3:0]X,Y;
	input negselect;
	output xneg,yneg;
	output xs0,xs1,xs2,xs3,xs4,xs5,xs6;
	output ys0,ys1,ys2,ys3,ys4,ys5,ys6;
	output lout0, gout0, eout0;
	output lout1, gout1, eout1;

	encoder_7seg2s xEncode(X[3],X[2],X[1],X[0],negselect,xs0,xs1,xs2,xs3,xs4,xs5,xs6,xneg);
	encoder_7seg2s yEncode(Y[3],Y[2],Y[1],Y[0],negselect,ys0,ys1,ys2,ys3,ys4,ys5,ys6,yneg);
	comparator_2nbit2comp top_comparator2(X,Y,lout0,gout0,eout0,negselect);

	assign lout1 = lout0;
	assign gout1 = gout0;
	assign eout1 = eout0;

endmodule // de0_4bitcomparator