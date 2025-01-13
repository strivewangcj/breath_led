`timescale 1ns/1ns
module breath_led_tb;

  // Parameters

  //Ports
  reg clk;
  reg rst_n;
  wire led;

  breath_led  breath_led_inst (
    .clk(clk),
    .rst_n(rst_n),
    .led(led)
  );

always #10  clk = ! clk ;

initial begin
  clk = 0 ;
  rst_n = 0;
  #100
  rst_n = 1;
end

endmodule