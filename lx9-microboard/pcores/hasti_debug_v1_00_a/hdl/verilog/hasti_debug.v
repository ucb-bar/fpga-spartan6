`timescale 1ns/1ps

module hasti_debug(input clk, input reset,
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
    input  io_bus_hresp
);

  reg [31:0] data;
  wire[31:0] T0;
  wire[31:0] T1;
  wire T2;
  wire T3;
  reg [1:0] state;
  wire[1:0] T36;
  wire[1:0] T4;
  wire[1:0] T5;
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
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  reg  wen;
  wire T37;
  wire T24;
  wire T25;
  reg  ack;
  wire T38;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire[1:0] T30;
  wire[31:0] T31;
  reg [29:0] addr;
  wire[29:0] T32;
  wire[29:0] T33;
  wire[29:0] T34;
  wire[29:0] T35;
  wire dbg_io_req_valid;
  wire[1:0] dbg_io_req_bits_cmd;
  wire[31:0] dbg_io_req_bits_data;
  wire dbg_io_resp_ready;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    data = {1{$random}};
    state = {1{$random}};
    wen = {1{$random}};
    ack = {1{$random}};
    addr = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = T22 ? io_bus_hrdata : T1;
  assign T1 = T2 ? dbg_io_req_bits_data : data;
  assign T2 = T3 & dbg_io_req_valid;
  assign T3 = 2'h0 == state;
  assign T36 = reset ? 2'h0 : T4;
  assign T4 = T20 ? 2'h0 : T5;
  assign T5 = T18 ? 2'h3 : T6;
  assign T6 = T16 ? 2'h2 : T7;
  assign T7 = T14 ? 2'h1 : T8;
  assign T8 = T12 ? 2'h1 : T9;
  assign T9 = T10 ? 2'h3 : state;
  assign T10 = T2 & T11;
  assign T11 = 2'h0 == dbg_io_req_bits_cmd;
  assign T12 = T2 & T13;
  assign T13 = 2'h1 == dbg_io_req_bits_cmd;
  assign T14 = T2 & T15;
  assign T15 = 2'h2 == dbg_io_req_bits_cmd;
  assign T16 = T17 & io_bus_hready;
  assign T17 = 2'h1 == state;
  assign T18 = T19 & io_bus_hready;
  assign T19 = 2'h2 == state;
  assign T20 = T21 & dbg_io_resp_ready;
  assign T21 = 2'h3 == state;
  assign T22 = T18 & T23;
  assign T23 = wen ^ 1'h1;
  assign T37 = reset ? 1'h0 : T24;
  assign T24 = T14 ? 1'h1 : T25;
  assign T25 = T12 ? 1'h0 : wen;
  assign T38 = reset ? 1'h0 : T26;
  assign T26 = T18 ? T28 : T27;
  assign T27 = T10 ? 1'h0 : ack;
  assign T28 = T29 == 1'h0;
  assign T29 = io_bus_hresp == 1'h0;
  assign io_bus_hwdata = data;
  assign io_bus_hmastlock = 1'h0;
  assign io_bus_htrans = T30;
  assign T30 = T17 ? 2'h2 : 2'h0;
  assign io_bus_hprot = 4'h3;
  assign io_bus_hburst = 3'h0;
  assign io_bus_hsize = 3'h2;
  assign io_bus_hwrite = wen;
  assign io_bus_haddr = T31;
  assign T31 = {addr, 2'h0};
  assign T32 = T16 ? T35 : T33;
  assign T33 = T10 ? T34 : addr;
  assign T34 = dbg_io_req_bits_data >> 2'h2;
  assign T35 = addr + 30'h1;
  jtag_debug dbg(.clk(clk), .reset(reset),
       .io_req_ready( T3 ),
       .io_req_valid( dbg_io_req_valid ),
       .io_req_bits_cmd( dbg_io_req_bits_cmd ),
       .io_req_bits_data( dbg_io_req_bits_data ),
       .io_resp_ready( dbg_io_resp_ready ),
       .io_resp_valid( T21 ),
       .io_resp_bits_ack( ack ),
       .io_resp_bits_data( data )
  );

  always @(posedge clk) begin
    if(T22) begin
      data <= io_bus_hrdata;
    end else if(T2) begin
      data <= dbg_io_req_bits_data;
    end
    if(reset) begin
      state <= 2'h0;
    end else if(T20) begin
      state <= 2'h0;
    end else if(T18) begin
      state <= 2'h3;
    end else if(T16) begin
      state <= 2'h2;
    end else if(T14) begin
      state <= 2'h1;
    end else if(T12) begin
      state <= 2'h1;
    end else if(T10) begin
      state <= 2'h3;
    end
    if(reset) begin
      wen <= 1'h0;
    end else if(T14) begin
      wen <= 1'h1;
    end else if(T12) begin
      wen <= 1'h0;
    end
    if(reset) begin
      ack <= 1'h0;
    end else if(T18) begin
      ack <= T28;
    end else if(T10) begin
      ack <= 1'h0;
    end
    if(T16) begin
      addr <= T35;
    end else if(T10) begin
      addr <= T34;
    end
  end
endmodule

