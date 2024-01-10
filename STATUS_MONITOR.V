module STATUS_MONITOR(
    input wire clk,
    input wire rst,
    output reg [6:0]cnt_mux, ///  a2 a1 a0   en s2  s1 s0 
    input wire [13:0]data,
    output reg [13:0] memory_data [0:95]
);

always @(posedge clk or negedge rst)
begin
    if (~rst)
    cnt_mux <= 1'd0;
    else if (cnt_mux == 95)
    cnt_mux <= 7'd0;
    else 
    cnt_mux <= cnt_mux + 1;
end

always @(posedge clk )

    begin
      memory_data [cnt_mux] <= data;
    end

wire [6:0]srect;
ila_0 your_instance_name (
	.clk(clk), // input wire clk


	.probe0(memory_data[srect]), // input wire [6:0] probe0
	.probe1(data) ,
	.probe2(cnt_mux)
);

vio_0 your_instance_name1 (
  .clk(clk),                // input wire clk
  .probe_in0(),    // input wire [6 : 0] probe_in0
  .probe_out0(srect)  // output wire [6 : 0] probe_out0
);

endmodule


