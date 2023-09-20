`timescale 1ns/1ns  // Define the timescale for simulation

module tb_sequence_detector;

  // Inputs
  reg in;
  reg clk;
  reg rst;

  // Outputs
  wire out;
  wire [2:0] state;

  // Instantiate the sequence_detector module
  sequence_detector uut (
    .in(in),
    .clk(clk),
    .rst(rst),
    .out(out),
    .state(state)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Initialize signals
  initial begin
    clk = 0;
    rst = 0;
    in = 0;
    
    // Monitor output signals
    $monitor("Time=%t, in=%b, clk=%b, rst=%b, out=%b, state=%b", $time, in, clk, rst, out, state);

    // Reset the design
    rst = 1;
    #10 rst = 0;
    
    // Test sequence
    in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;

    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    
    // Finish simulation
    $finish;
  end

endmodule
