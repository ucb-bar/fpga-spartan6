`timescale 1ns/1ps

module jtag_debug(
    input clk,
    input reset,
    input  io_req_ready,
    output io_req_valid,
    output[1:0] io_req_bits_cmd,
    output[31:0] io_req_bits_data,
    output io_resp_ready,
    input  io_resp_valid,
    input  io_resp_bits_ack,
    input [31:0] io_resp_bits_data
);

  wire tck;
  wire tdi;
  wire tdo;

  wire sel;
  wire treset;
  wire s_capture;
  wire s_shift;
  wire s_update;

  BSCAN_SPARTAN6 #(
    .JTAG_CHAIN(1)
  ) bscan (
    .DRCK(),
    .RESET(treset),
    .RUNTEST(),
    .SEL(sel),
    .CAPTURE(s_capture),
    .SHIFT(s_shift),
    .UPDATE(s_update),
    .TCK(tck),
    .TDI(tdi),
    .TDO(tdo),
    .TMS());


  wire req_ready;
  wire req_valid;
  wire [33:0] req_bits;
  wire [33:0] req_bits_deq;

  assign io_req_bits_cmd = req_bits_deq[33:32];
  assign io_req_bits_data = req_bits_deq[31:0];

  async_fifo #(
    .DSIZE(34), .ASIZE(2)
  ) fifo_req (
    .enq_clk(tck),
    .enq_rst(treset),
    .enq_ready(req_ready),
    .enq_valid(req_valid),
    .enq_bits(req_bits),

    .deq_clk(clk),
    .deq_rst(reset),
    .deq_ready(io_req_ready),
    .deq_valid(io_req_valid),
    .deq_bits(req_bits_deq));

  wire resp_ready;
  wire resp_valid;
  wire [32:0] resp_bits;

  async_fifo #(
    .DSIZE(33), .ASIZE(2)
  ) fifo_resp (
    .enq_clk(clk),
    .enq_rst(reset),
    .enq_ready(io_resp_ready),
    .enq_valid(io_resp_valid),
    .enq_bits({ io_resp_bits_ack, io_resp_bits_data }),

    .deq_clk(tck),
    .deq_rst(treset),
    .deq_ready(resp_ready),
    .deq_valid(resp_valid),
    .deq_bits(resp_bits));


  reg [33:0] dr;

  assign req_bits = dr;
  assign req_valid = sel && s_update;
  assign resp_ready = sel && s_capture;

  assign tdo = dr[0];

  always @(posedge tck) begin
    if (sel) begin
      if (s_capture) begin
        dr <= { !resp_valid, resp_bits };
      end else if (s_shift) begin
        dr <= { tdi, dr[33:1] };
      end
    end
  end

endmodule

