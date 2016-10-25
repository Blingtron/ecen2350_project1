module encoder_7seg2s(x3,x2,x1,x0,negselect,
						  s0,s1,s2,s3,s4,s5,s6,negsign);
	input x3,x2,x1,x0,negselect;
	output s0,s1,s2,s3,s4,s5,s6,negsign;
	
	assign s0 = negselect&((x2&~x1&~x0)|(x0&((x1&x2&x3)|(~x1&~x2&~x3))))|~negselect&((~x3&~x1&(x0^x2))|(x3&x0&(x2^x1)));
	assign s1 = negselect&((x3&~x2&x1)|(~x3&x2&~x1&x0)|(~x3&x2&x1&~x0))|~negselect&((~x0&x2&(x1|x3))|(x0&((x1&x3)|(~x3&x2&~x1))));
	assign s2 = negselect&((~x3&~x2&x1&~x0)|(x3&x2&x1&~x0))|~negselect&((x3&x2&(x1|~x0))|(~x3&~x2&x1&~x0));
	assign s3 = negselect&((x2&~x1&~x0)|(x2&x1&x0)|(~x2&~x1&x0))|~negselect&((~x3&~x1&(x2^x0))|(x1&(x2&x0|x3&~x2&~x0)));
	assign s4 = negselect&((x2&~x1)|x0)|~negselect&((~x3&(x0|(x2&~x1)))|(~x2&~x1&x0));
	assign s5 = negselect&((x3&~x1&x0)|(~x2&~x1&x0)|(~x3&~x2&x1)|(x2&x1&x0)|(x3&x2&x1))|~negselect&((~x3&((~x2&(x0|x1))|(x1&x0)))|(x3&x2&~x1&x0));
	assign s6 = negselect&((~x3&~x2&~x1)|(~x2&~x1&x0)|(x2&x1&x0))|~negselect&((~x3&((~x2&~x1)|(x2&x1&x0)))|(x3&x2&~x1&~x0));
	assign negsign = ~(negselect&x3);

endmodule // encoder_7seg2s