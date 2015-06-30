`timescale 1ns/1ps

module hasti_bram_ctrl(input clk, input reset,
    input [31:0] io_bus_haddr,
    input  io_bus_hwrite,
    input [2:0] io_bus_hsize,
    input [2:0] io_bus_hburst,
    input [3:0] io_bus_hprot,
    input [1:0] io_bus_htrans,
    input  io_bus_hmastlock,
    input [31:0] io_bus_hwdata,
    output[31:0] io_bus_hrdata,
    input  io_bus_hsel,
    input  io_bus_hreadyin,
    output io_bus_hreadyout,
    output io_bus_hresp,
    output io_bram_clk,
    output io_bram_rst,
    output[31:0] io_bram_addr,
    output io_bram_en,
    output[3:0] io_bram_wmask,
    output[31:0] io_bram_wdata,
    input [31:0] io_bram_rdata
);

  reg[0:0] T0;
  wire T1;
  wire T2;
  reg [31:0] wdata;
  wire[31:0] T3;
  reg  wen;
  wire T42;
  wire T4;
  wire en;
  wire T5;
  wire T6;
  wire T7;
  wire[3:0] T8;
  reg [3:0] wmask;
  wire[3:0] T43;
  wire[6:0] T44;
  wire[6:0] T9;
  wire[6:0] T45;
  wire[6:0] wmask_shift;
  wire[1:0] T10;
  wire[3:0] wmask_lut;
  wire[3:0] T11;
  wire[3:0] T12;
  wire T13;
  wire T14;
  wire T15;
  wire[31:0] T16;
  wire[31:0] T17;
  reg [29:0] waddr;
  wire[29:0] T18;
  wire[29:0] addr;
  wire[31:0] T19;
  wire[31:0] T20;
  wire[31:0] T21;
  wire[31:0] rmask;
  wire[31:0] T22;
  wire[15:0] T23;
  wire[7:0] T24;
  wire[7:0] T46;
  wire T25;
  wire[3:0] T26;
  wire[3:0] T27;
  wire[3:0] T47;
  reg  bypass;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire[7:0] T34;
  wire[7:0] T48;
  wire T35;
  wire[15:0] T36;
  wire[7:0] T37;
  wire[7:0] T49;
  wire T38;
  wire[7:0] T39;
  wire[7:0] T50;
  wire T40;
  wire[31:0] T41;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    T0 = 1'b0;
    wdata = {1{$random}};
    wen = {1{$random}};
    wmask = {1{$random}};
    waddr = {1{$random}};
    bypass = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_bram_clk = clk;
  assign io_bram_rst = reset;

  assign T1 = T2 | reset;
  assign T2 = io_bus_hsize <= 3'h2;
  assign io_bram_wdata = wdata;
  assign T3 = wen ? io_bus_hwdata : wdata;
  assign T42 = reset ? 1'h0 : T4;
  assign T4 = en & io_bus_hwrite;
  assign en = io_bus_hsel & T5;
  assign T5 = T7 | T6;
  assign T6 = io_bus_htrans == 2'h3;
  assign T7 = io_bus_htrans == 2'h2;
  assign io_bram_wmask = T8;
  assign T8 = T4 ? wmask : 4'h0;
  assign T43 = T44[2'h3:1'h0];
  assign T44 = reset ? 7'h0 : T9;
  assign T9 = T4 ? wmask_shift : T45;
  assign T45 = {3'h0, wmask};
  assign wmask_shift = wmask_lut << T10;
  assign T10 = io_bus_haddr[1'h1:1'h0];
  assign wmask_lut = T15 ? 4'h1 : T11;
  assign T11 = T14 ? 4'h3 : T12;
  assign T12 = T13 ? 4'hf : 4'h0;
  assign T13 = io_bus_hsize == 3'h2;
  assign T14 = io_bus_hsize == 3'h1;
  assign T15 = io_bus_hsize == 3'h0;
  assign io_bram_en = en;
  assign io_bram_addr = T16;
  assign T16 = T4 ? T17 : io_bus_haddr;
  assign T17 = {waddr, 2'h0};
  assign T18 = T4 ? addr : waddr;
  assign addr = io_bus_haddr[5'h1f:2'h2];
  assign io_bus_hresp = 1'h0;
  assign io_bus_hreadyout = 1'h1;
  assign io_bus_hrdata = T19;
  assign T19 = T41 | T20;
  assign T20 = io_bram_rdata & T21;
  assign T21 = ~ rmask;
  assign rmask = T22;
  assign T22 = {T36, T23};
  assign T23 = {T34, T24};
  assign T24 = 8'h0 - T46;
  assign T46 = {7'h0, T25};
  assign T25 = T26[1'h0:1'h0];
  assign T26 = wmask & T27;
  assign T27 = 4'h0 - T47;
  assign T47 = {3'h0, bypass};
  assign T28 = T32 ? T29 : bypass;
  assign T29 = T31 & T30;
  assign T30 = wmask != 4'h0;
  assign T31 = waddr == addr;
  assign T32 = en & T33;
  assign T33 = io_bus_hwrite ^ 1'h1;
  assign T34 = 8'h0 - T48;
  assign T48 = {7'h0, T35};
  assign T35 = T26[1'h1:1'h1];
  assign T36 = {T39, T37};
  assign T37 = 8'h0 - T49;
  assign T49 = {7'h0, T38};
  assign T38 = T26[2'h2:2'h2];
  assign T39 = 8'h0 - T50;
  assign T50 = {7'h0, T40};
  assign T40 = T26[2'h3:2'h3];
  assign T41 = wdata & rmask;

  always @(posedge clk) begin
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T0 <= 1'b1;
  if(!T1 && T0 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "HSIZE exceeds data bus width");
    $finish;
  end
// synthesis translate_on
`endif
    if(wen) begin
      wdata <= io_bus_hwdata;
    end
    if(reset) begin
      wen <= 1'h0;
    end else begin
      wen <= T4;
    end
    wmask <= T43;
    if(T4) begin
      waddr <= addr;
    end
    if(T32) begin
      bypass <= T29;
    end
  end
endmodule

