module blink #(
  parameter int TOGGLE_CYCLES = 10;
)(
  input logic clk,
  input logic rst_n,
  output logic led
);

logic [$clog2(TOGGLE_CYCLES)-1:0] cnt;

always_ff @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    cnt <= '0;
    led <= 1'b0;
  end else if (cnt == TOGGLE_CYCLES - 1) begin
    cnt <= '0;
    led <= ~led;
  end else begin
    cnt <= cnt + 1'b1;
  end
end

endmodule
