`timescale 1ns/1ps

module hasti_mbist(input clk, input reset,
    output[31:0] io_bus_haddr,
    output io_bus_hwrite,
    output[2:0] io_bus_hsize,
    output[2:0] io_bus_hburst,
    output[3:0] io_bus_hprot,
    output[1:0] io_bus_htrans,
    output io_bus_hmastlock,
    output[31:0] io_bus_hwdata,
    input [31:0] io_bus_hrdata,
    input  io_bus_hready,
    input  io_bus_hresp,
    output io_pass
);

  wire T0;
  wire T1;
  reg  error;
  wire T23;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  reg [1:0] state;
  wire[1:0] T24;
  wire[1:0] T6;
  wire[1:0] T7;
  wire[1:0] T8;
  wire[1:0] T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  reg [29:0] addr;
  wire[29:0] T25;
  wire[29:0] T16;
  wire[29:0] addr_next;
  wire T17;
  wire T18;
  wire T19;
  wire[31:0] T26;
  wire[1:0] T20;
  wire[1:0] T21;
  wire[31:0] T22;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    error = {1{$random}};
    state = {1{$random}};
    addr = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_pass = T0;
  assign T0 = T19 ? T1 : 1'h0;
  assign T1 = error ^ 1'h1;
  assign T23 = reset ? 1'h0 : T2;
  assign T2 = T4 ? T3 : error;
  assign T3 = io_bus_hrdata != io_bus_hwdata;
  assign T4 = T5 & io_bus_hready;
  assign T5 = 2'h2 == state;
  assign T24 = reset ? 2'h0 : T6;
  assign T6 = T17 ? 2'h0 : T7;
  assign T7 = T14 ? 2'h3 : T8;
  assign T8 = T12 ? 2'h2 : T9;
  assign T9 = T10 ? 2'h1 : state;
  assign T10 = T11 & io_bus_hready;
  assign T11 = 2'h0 == state;
  assign T12 = T13 & io_bus_hready;
  assign T13 = 2'h1 == state;
  assign T14 = T4 & T15;
  assign T15 = addr == 30'hff;
  assign T25 = reset ? 30'h0 : T16;
  assign T16 = T4 ? addr_next : addr;
  assign addr_next = addr + 30'h1;
  assign T17 = T4 & T18;
  assign T18 = T15 ^ 1'h1;
  assign T19 = 2'h3 == state;
  assign io_bus_hwdata = T26;
  assign T26 = {2'h0, addr};
  assign io_bus_hmastlock = 1'h0;
  assign io_bus_htrans = T20;
  assign T20 = T13 ? 2'h2 : T21;
  assign T21 = T11 ? 2'h2 : 2'h0;
  assign io_bus_hprot = 4'h3;
  assign io_bus_hburst = 3'h0;
  assign io_bus_hsize = 3'h2;
  assign io_bus_hwrite = T11;
  assign io_bus_haddr = T22;
  assign T22 = {addr, 2'h0};

  always @(posedge clk) begin
    if(reset) begin
      error <= 1'h0;
    end else if(T4) begin
      error <= T3;
    end
    if(reset) begin
      state <= 2'h0;
    end else if(T17) begin
      state <= 2'h0;
    end else if(T14) begin
      state <= 2'h3;
    end else if(T12) begin
      state <= 2'h2;
    end else if(T10) begin
      state <= 2'h1;
    end
    if(reset) begin
      addr <= 30'h0;
    end else if(T4) begin
      addr <= addr_next;
    end
  end
endmodule

