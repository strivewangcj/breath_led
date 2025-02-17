module breath_led(

    input clk,
    input rst_n,
    output led

  );

  reg [6:0]   clk50Mcnt;
  reg [9:0]   clk50Mcnt_1000;
  reg [9:0]   pwm_cnt;

  reg pwm_flag;//控制由亮到灭和由灭到亮


  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      clk50Mcnt <= 7'd0;
    else if(clk50Mcnt  == 7'd99)
      clk50Mcnt <= 7'd0;
    else
      clk50Mcnt <= clk50Mcnt + 1;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      clk50Mcnt_1000 <=  10'd0;
    else if(clk50Mcnt == 7'd99 && clk50Mcnt_1000 == 'd999)
      clk50Mcnt_1000 <= 10'd0;
    else if(clk50Mcnt == 'd99)
      clk50Mcnt_1000 <= clk50Mcnt_1000 + 1;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      pwm_cnt <= 10'd0;
    else if(clk50Mcnt == 7'd99 && clk50Mcnt_1000 == 'd999 && pwm_cnt == 'd999)
      pwm_cnt <= 10'd0;
    else if(clk50Mcnt == 7'd99 && clk50Mcnt_1000 == 'd999)
      pwm_cnt <= pwm_cnt + 1;
  end


  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      pwm_flag <= 0;
    else if(clk50Mcnt == 7'd99 && clk50Mcnt_1000 == 'd999 && pwm_cnt == 'd999)
      pwm_flag <= ~pwm_flag;
  end

  assign led = pwm_flag?((clk50Mcnt_1000 < pwm_cnt) ? 0 : 1):((clk50Mcnt_1000 < pwm_cnt) ? 1 : 0);
endmodule
