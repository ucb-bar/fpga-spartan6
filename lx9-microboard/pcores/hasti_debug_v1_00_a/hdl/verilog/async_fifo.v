`timescale 1ns/1ps

module async_fifo #(parameter DSIZE = 8,
                    parameter ASIZE = 4)
( output [DSIZE-1:0] deq_bits,
  output             deq_valid,
  input  [DSIZE-1:0] enq_bits,
  output             enq_ready,
  input              enq_valid, enq_clk, enq_rst,
  input              deq_ready, deq_clk, deq_rst);

wire [ASIZE-1:0] waddr, raddr;
wire [ASIZE:0]   wptr, rptr, wq2_rptr, rq2_wptr;
//wire             winc_en;

sync_r2w #(ASIZE) sync_r2w (.wq2_rptr(wq2_rptr), .rptr(rptr),
                   .wclk(enq_clk), .wrst(enq_rst));

sync_w2r #(ASIZE) sync_w2r (.rq2_wptr(rq2_wptr), .wptr(wptr),
                   .rclk(deq_clk), .rrst(deq_rst));

fifomem #(DSIZE, ASIZE) fifomem (.rdata(deq_bits), .wdata(enq_bits),
                                 .waddr(waddr), .raddr(raddr),
                                 .wclken(enq_valid), .wfull_n(enq_ready), .wclk(enq_clk));

rptr_empty #(ASIZE) rptr_empty (.rempty_n(deq_valid),
                                .raddr(raddr),
                                .rptr(rptr), .rq2_wptr(rq2_wptr),
                                .rinc(deq_ready), .rclk(deq_clk),
                                .rrst(deq_rst));

wptr_full #(ASIZE) wptr_full (.wfull_n(enq_ready), .waddr(waddr),
                              .wptr(wptr), .wq2_rptr(wq2_rptr),
                              .winc(enq_valid), /*.winc_en(winc_en), */.wclk(enq_clk),
                              .wrst(enq_rst));

endmodule

module sync_r2w #(parameter ADDRSIZE = 4)
( output reg [ADDRSIZE:0] wq2_rptr,
  input [ADDRSIZE:0] rptr,
  input wclk, wrst);

  reg [ADDRSIZE:0] wq1_rptr;

  always @(posedge wclk /*or posedge wrst*/)
    if (wrst) {wq2_rptr,wq1_rptr} <= 0;
    else         {wq2_rptr,wq1_rptr} <= {wq1_rptr,rptr};

endmodule

module sync_w2r #(parameter ADDRSIZE = 4)
( output reg [ADDRSIZE:0] rq2_wptr,
  input [ADDRSIZE:0] wptr,
  input rclk, rrst);

  reg [ADDRSIZE:0] rq1_wptr;

  always @(posedge rclk /*or posedge rrst*/)
    if (rrst) {rq2_wptr,rq1_wptr} <= 0;
    else         {rq2_wptr,rq1_wptr} <= {rq1_wptr,wptr};

endmodule

module fifomem #(parameter DATASIZE = 8, // Memory data word width
                 parameter ADDRSIZE = 4) // Number of mem address bits
( output [DATASIZE-1:0] rdata,
  input  [DATASIZE-1:0] wdata,
  input  [ADDRSIZE-1:0] waddr, raddr,
  input                 wclken, wfull_n, wclk);

// RTL Verilog memory model
localparam DEPTH = 1<<ADDRSIZE;
reg [DATASIZE-1:0] mem [0:DEPTH-1];

assign rdata = mem[raddr];

always @(posedge wclk)
  if (wclken && wfull_n) mem[waddr] <= wdata;

endmodule

module rptr_empty #(parameter ADDRSIZE = 4)
( output reg                rempty_n,
  output     [ADDRSIZE-1:0] raddr,
  output reg [ADDRSIZE :0]  rptr,
  input      [ADDRSIZE :0]  rq2_wptr,
  input                     rinc, rclk, rrst);

  reg  [ADDRSIZE:0] rbin;
  wire [ADDRSIZE:0] rgraynext, rbinnext;
  wire              rempty_n_val;

//-------------------
// GRAYSTYLE2 pointer
//-------------------
  always @(posedge rclk /*or posedge rrst*/)
    if (rrst) {rbin, rptr} <= 0;
    else         {rbin, rptr} <= {rbinnext, rgraynext};

// Memory read-address pointer (okay to use binary to address memory)
  assign raddr     = rbin[ADDRSIZE-1:0];
  assign rbinnext  = rbin + (rinc & rempty_n);
  assign rgraynext = (rbinnext>>1) ^ rbinnext;

//---------------------------------------------------------------
// FIFO empty when the next rptr == synchronized wptr or on reset
//---------------------------------------------------------------
  assign rempty_n_val = !(rgraynext == rq2_wptr);

  always @(posedge rclk /*or posedge rrst*/)
    if (rrst) rempty_n <= 1'b0;
    else         rempty_n <= rempty_n_val;

endmodule

module wptr_full #(parameter ADDRSIZE = 4)
( output reg                wfull_n,
  output     [ADDRSIZE-1:0] waddr,
  output reg [ADDRSIZE :0]  wptr,
  input      [ADDRSIZE :0]  wq2_rptr,
  input                     winc, wclk, wrst/*,
  output                    winc_en*/);

  reg  [ADDRSIZE:0] wbin;
  wire [ADDRSIZE:0] wgraynext, wbinnext;
  wire              wfull_n_val;
//  wire              winc_en;

// GRAYSTYLE2 pointer
  always @(posedge wclk /*or posedge wrst*/)
    if (wrst) {wbin, wptr} <= 0;
    else         {wbin, wptr} <= {wbinnext, wgraynext};

// Memory write-address pointer (okay to use binary to address memory)
  assign waddr = wbin[ADDRSIZE-1:0];
//  assign winc_en = winc & wfull_n;
  assign wbinnext = wbin + (winc & wfull_n);
  assign wgraynext = (wbinnext>>1) ^ wbinnext;

//------------------------------------------------------------------
// Simplified version of the three necessary full-tests:
// assign wfull_val=((wgnext[ADDRSIZE] !=wq2_rptr[ADDRSIZE] ) &&
// (wgnext[ADDRSIZE-1] !=wq2_rptr[ADDRSIZE-1]) &&
// (wgnext[ADDRSIZE-2:0]==wq2_rptr[ADDRSIZE-2:0]));
//------------------------------------------------------------------

  assign wfull_n_val = !(wgraynext=={~wq2_rptr[ADDRSIZE:ADDRSIZE-1], wq2_rptr[ADDRSIZE-2:0]});

  always @(posedge wclk /*or posedge wrst*/)
    if (wrst) wfull_n <= 1'b1;
    else         wfull_n <= wfull_n_val;

endmodule
