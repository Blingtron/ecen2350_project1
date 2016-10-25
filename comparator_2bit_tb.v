`timescale 1ns/1ns
module comparator_2bit_tb();
  reg clk;
  reg [3:0] xy;
  
  // each wire set needed for comparison inputs.
  wire lout_l,gout_l,eout_l;
  wire lout_g,gout_g,eout_g;
  wire lout_e,gout_e,eout_e;
  wire lout_0,gout_0,eout_0;
  
  initial begin
    clk = 1;
    xy = -1;
  end
  always #5 clk = ~clk;
  always@(posedge clk)
    xy = xy + 1;
  // Lesser In Set  
  comparator_2bit MUTL(1,0,0,
                        lout_l,gout_l,eout_l,
                        xy[3],xy[2],
                        xy[1],xy[0]);
  // Greater In Set
  comparator_2bit MUTG(0,1,0,
                        lout_g,gout_g,eout_g,
                        xy[3],xy[2],
                        xy[1],xy[0]);
  // Equal In Set
  comparator_2bit MUTE(0,0,1,
                        lout_e,gout_e,eout_e,
                        xy[3],xy[2],
                        xy[1],xy[0]);
  // No comp in set (first unit)  
  comparator_2bit MUT0(0,0,0,
                        lout_0,gout_0,eout_0,
                        xy[3],xy[2],
                        xy[1],xy[0]); 
endmodule // testbench


