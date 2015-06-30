`timescale 1ns/1ps

module poci_gpio_x4(input clk, input reset,
    input [31:0] io_bus_paddr,
    input  io_bus_pwrite,
    input  io_bus_psel,
    input  io_bus_penable,
    input [31:0] io_bus_pwdata,
    output[31:0] io_bus_prdata,
    output io_bus_pready,
    output io_bus_pslverr,
    input [3:0] io_pin_i,
    output[3:0] io_pin_o
);

  reg [3:0] out;
  wire[3:0] T5;
  wire[31:0] T6;
  wire[31:0] T0;
  wire[31:0] T7;
  wire T1;
  wire T2;
  wire[31:0] T8;
  reg [3:0] R3;
  wire[3:0] T9;
  reg [3:0] R4;
  wire[3:0] T10;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    out = {1{$random}};
    R3 = {1{$random}};
    R4 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_pin_o = out;
  assign T5 = T6[2'h3:1'h0];
  assign T6 = reset ? 32'h0 : T0;
  assign T0 = T1 ? io_bus_pwdata : T7;
  assign T7 = {28'h0, out};
  assign T1 = T2 & io_bus_pwrite;
  assign T2 = io_bus_psel & io_bus_penable;
  assign io_bus_pslverr = 1'h0;
  assign io_bus_pready = 1'h1;
  assign io_bus_prdata = T8;
  assign T8 = {28'h0, R3};
  assign T9 = reset ? 4'h0 : R4;
  assign T10 = reset ? 4'h0 : io_pin_i;

  always @(posedge clk) begin
    out <= T5;
    if(reset) begin
      R3 <= 4'h0;
    end else begin
      R3 <= R4;
    end
    if(reset) begin
      R4 <= 4'h0;
    end else begin
      R4 <= io_pin_i;
    end
  end
endmodule

