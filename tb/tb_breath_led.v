
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

//always #5  clk = ! clk ;

endmodule