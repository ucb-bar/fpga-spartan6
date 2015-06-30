`timescale 1ns/1ps

module bram_block_4096x32(
  input CLK,
  input RST,
  input [31:0] A,
  input EN,
  input [3:0] WE,
  input [31:0] DI,
  output [31:0] DO
);

  reg [31:0] ram [4095:0];
  reg [11:0] reg_addr;
  wire [11:0] addr;

  assign addr = A[13:2];

  always @(posedge CLK) begin
    if (EN) begin
      if (WE == 4'h0) begin
        reg_addr <= addr;
      end else begin
        if (WE[0]) ram[addr][7:0] <= DI[7:0];
        if (WE[1]) ram[addr][15:8] <= DI[15:8];
        if (WE[2]) ram[addr][23:16] <= DI[23:16];
        if (WE[3]) ram[addr][31:24] <= DI[31:24];
      end
    end
  end

  assign DO = ram[reg_addr];

endmodule
