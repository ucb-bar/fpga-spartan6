`timescale 1ns/1ps

module system_tb;

  reg reset = 1;

  wire [12:0] lpddr_a;
  wire [1:0] lpddr_ba;
  wire lpddr_ras_n;
  wire lpddr_cas_n;
  wire lpddr_we_n;
  wire lpddr_cke;
  wire lpddr_ck_p;
  wire lpddr_ck_n;
  wire [15:0] lpddr_dq;
  wire lpddr_ldqs;
  wire lpddr_udqs;
  wire lpddr_udm;
  wire lpddr_ldm;
  wire lpddr_rzq;

  wire spi_sclk;
  wire spi_cs_n;
  wire [3:0] spi_io;

  system dut
  (
    .CLOCK_Y2(),
    .USER_RESET(reset),
    .LPDDR_A(lpddr_a),
    .LPDDR_BA(lpddr_ba),
    .LPDDR_RAS_n(lpddr_ras_n),
    .LPDDR_CAS_n(lpddr_cas_n),
    .LPDDR_WE_n(lpddr_we_n),
    .LPDDR_CKE(lpddr_cke),
    .LPDDR_CK_P(lpddr_ck_p),
    .LPDDR_CK_N(lpddr_ck_n),
    .LPDDR_DQ(lpddr_dq),
    .LPDDR_LDQS(lpddr_ldqs),
    .LPDDR_UDQS(lpddr_udqs),
    .LPDDR_UDM(lpddr_udm),
    .LPDDR_LDM(lpddr_ldm),
    .LPDDR_RZQ(lpddr_rzq),
    .SPI_SCK(spi_sclk),
    .SPI_CS_n(spi_cs_n),
    .SPI_IO1(spi_io[0]),
    .SPI_IO2(spi_io[1]),
    .SPI_IO3(spi_io[2]),
    .SPI_IO4(spi_io[3]),
    .GPIO_LED()
  );
  assign lpddr_rzq = 1'b0;

  mobile_ddr lpddr
  (
    .Dq(lpddr_dq),
    .Dqs({lpddr_udqs, lpddr_ldqs}),
    .Addr(lpddr_a),
    .Ba(lpddr_ba),
    .Clk(lpddr_ck_p),
    .Clk_n(lpddr_ck_n),
    .Cke(lpddr_cke),
    .Cs_n(1'b0),
    .Ras_n(lpddr_ras_n),
    .Cas_n(lpddr_cas_n),
    .We_n(lpddr_we_n),
    .Dm({lpddr_udm, lpddr_ldm})
  );

  wire [31:0] spi_vcc;
  assign spi_vcc = 'd3600;

  N25Qxxx spi_flash
  (
    .S(spi_sclk),
    .C(spi_cs_n),
    .HOLD_DQ3(spi_io[3]),
    .DQ0(spi_io[0]),
    .DQ1(spi_io[1]),
    .Vcc(spi_vcc),
    .Vpp_W_DQ2(spi_io[2])
  );



  reg [256*8-1:0] brampath = 0;
  reg [256*8-1:0] flashpath = 0;

  initial
  begin
    if ($value$plusargs("bram=%s", brampath))
    begin
      $readmemh(brampath, dut.bram_block_4096x32_0.bram_block_4096x32_0.ram, 0, 4095);
    end

    if ($value$plusargs("flash=%s", flashpath))
    begin
      $readmemh(flashpath, spi_flash.mem.memory);
    end

    #777.7 reset = 0;
  end

endmodule
