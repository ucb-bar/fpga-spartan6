`timescale 1ns/1ps

module Control(input clk, input reset,
    output io_dpath_stallf,
    output io_dpath_killf,
    output io_dpath_stalldx,
    output io_dpath_killdx,
    output io_dpath_stallw,
    output io_dpath_id_j,
    output io_dpath_id_br,
    output[1:0] io_dpath_id_sel_alu1,
    output[2:0] io_dpath_id_sel_alu2,
    output[2:0] io_dpath_id_sel_imm,
    output[3:0] io_dpath_id_fn_alu,
    output io_dpath_id_wen,
    output io_dpath_id_csr_en,
    output[2:0] io_dpath_id_csr_cmd,
    output io_dpath_id_mem_valid,
    output io_dpath_id_mem_rw,
    output[2:0] io_dpath_id_mem_type,
    output io_dpath_id_mul_valid,
    output io_dpath_id_xcpt,
    output[31:0] io_dpath_id_cause,
    output io_dpath_ll_valid,
    output[4:0] io_dpath_ll_waddr,
    output io_dpath_ll_fn,
    output io_dpath_ll_mem_rw,
    output[2:0] io_dpath_ll_mem_type,
    input [31:0] io_dpath_inst,
    input  io_dpath_ma_pc,
    input  io_dpath_ma_addr,
    input  io_dpath_br_taken,
    input  io_dpath_mul_ready,
    input  io_dpath_clear_sb,
    input  io_dpath_csr_replay,
    input  io_dpath_csr_xcpt,
    input  io_dpath_csr_eret,
    input  io_dpath_csr_interrupt,
    input [31:0] io_dpath_csr_interrupt_cause,
    output io_dpath_logging_invalidate,
    output io_dpath_logging_sb_stall,
    output io_dpath_logging_scr_stall,
    output io_dpath_logging_dmem_stall,
    output io_dpath_logging_mul_stall,
    //output[31:0] io_imem_haddr
    output io_imem_hwrite,
    output[2:0] io_imem_hsize,
    output[2:0] io_imem_hburst,
    output[3:0] io_imem_hprot,
    output[1:0] io_imem_htrans,
    output io_imem_hmastlock,
    //output[31:0] io_imem_hwdata
    input [31:0] io_imem_hrdata,
    input  io_imem_hready,
    input  io_imem_hresp,
    //output[31:0] io_dmem_haddr
    //output io_dmem_hwrite
    //output[2:0] io_dmem_hsize
    output[2:0] io_dmem_hburst,
    output[3:0] io_dmem_hprot,
    output[1:0] io_dmem_htrans,
    output io_dmem_hmastlock,
    //output[31:0] io_dmem_hwdata
    input [31:0] io_dmem_hrdata,
    input  io_dmem_hready,
    input  io_dmem_hresp,
    input  io_host_reset,
    input  io_host_id,
    //output io_host_pcr_req_ready
    input  io_host_pcr_req_valid,
    input  io_host_pcr_req_bits_rw,
    input [11:0] io_host_pcr_req_bits_addr,
    input [31:0] io_host_pcr_req_bits_data,
    input  io_host_pcr_rep_ready,
    //output io_host_pcr_rep_valid
    //output[31:0] io_host_pcr_rep_bits
    input  io_host_ipi_req_ready,
    //output io_host_ipi_req_valid
    //output io_host_ipi_req_bits
    //output io_host_ipi_rep_ready
    input  io_host_ipi_rep_valid,
    input  io_host_ipi_rep_bits
    //output io_host_debug_stats_pcr
);

  wire[1:0] T0;
  wire id_mul_stall;
  wire T1;
  wire id_dmem_stall;
  wire T2;
  reg  id_sb_stall;
  wire T272;
  wire T3;
  wire T4;
  wire T5;
  wire id_set_sb;
  wire id_mul_valid;
  wire[31:0] T6;
  wire T7;
  wire[31:0] T8;
  wire T9;
  wire id_imem_invalidate;
  wire id_fence_i;
  wire[31:0] T10;
  wire id_retire_nomem;
  wire T11;
  wire id_retire_nomem_exclude_csr;
  wire T12;
  wire id_xcpt_nomem;
  wire T13;
  wire T14;
  wire id_inst_valid;
  wire id_shift_valid;
  wire T15;
  wire T16;
  wire T17;
  wire id_shift_imm;
  wire[31:0] T18;
  wire _id_inst_valid;
  wire T19;
  wire[31:0] T20;
  wire T21;
  wire T22;
  wire[31:0] T23;
  wire T24;
  wire T25;
  wire[31:0] T26;
  wire T27;
  wire T28;
  wire[31:0] T29;
  wire T30;
  wire T31;
  wire[31:0] T32;
  wire T33;
  wire T34;
  wire[31:0] T35;
  wire T36;
  wire T37;
  wire[31:0] T38;
  wire T39;
  wire T40;
  wire[31:0] T41;
  wire T42;
  wire T43;
  wire[31:0] T44;
  wire T45;
  wire T46;
  wire[31:0] T47;
  wire T48;
  wire T49;
  wire[31:0] T50;
  wire T51;
  wire T52;
  wire[31:0] T53;
  wire T54;
  wire T55;
  wire[31:0] T56;
  wire T57;
  wire T58;
  wire[31:0] T59;
  wire T60;
  wire T61;
  wire[31:0] T62;
  wire T63;
  wire T64;
  wire[31:0] T65;
  wire T66;
  wire T67;
  wire[31:0] T68;
  wire T69;
  wire T70;
  wire[31:0] T71;
  wire T72;
  wire[31:0] T73;
  wire T74;
  reg  id_valid;
  wire T273;
  wire T75;
  wire T76;
  wire T77;
  wire T78;
  wire T79;
  wire imem_bus_error;
  wire T80;
  wire T81;
  wire id_ok;
  wire T82;
  wire T83;
  reg [2:0] ll_mem_type;
  wire[2:0] T84;
  wire[2:0] id_mem_type;
  wire[1:0] T85;
  wire T86;
  wire[31:0] T87;
  wire T88;
  wire[31:0] T89;
  wire T90;
  wire[31:0] T91;
  wire T92;
  wire id_mem_valid;
  wire[31:0] T93;
  reg  ll_mem_rw;
  wire T94;
  wire id_mem_rw;
  wire[31:0] T95;
  reg  ll_fn;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  reg [4:0] ll_waddr;
  wire[4:0] T100;
  wire[4:0] id_waddr;
  wire[31:0] id_cause;
  wire[31:0] T274;
  wire[2:0] T101;
  wire[2:0] T102;
  wire[2:0] T103;
  wire T104;
  wire T105;
  wire dmem_bus_error;
  wire T106;
  wire T107;
  wire T108;
  wire T109;
  wire T110;
  wire T111;
  wire T112;
  wire T113;
  wire[31:0] id_cause_nomem;
  wire[31:0] T275;
  wire[1:0] T114;
  wire[1:0] T115;
  wire id_xcpt;
  wire T116;
  wire T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire id_retire;
  wire T122;
  wire T123;
  wire T124;
  wire[2:0] T125;
  wire[2:0] id_csr;
  wire[2:0] _id_csr;
  wire[1:0] T126;
  wire T127;
  wire[31:0] T128;
  wire T129;
  wire[31:0] T130;
  wire T131;
  wire[31:0] T132;
  wire id_csr_ren;
  wire T133;
  wire[4:0] id_raddr1;
  wire T134;
  wire T135;
  wire T136;
  wire T137;
  wire id_csr_en;
  wire T138;
  wire id_wen;
  wire T139;
  wire T140;
  wire T141;
  wire[31:0] T142;
  wire T143;
  wire T144;
  wire[31:0] T145;
  wire T146;
  wire T147;
  wire[31:0] T148;
  wire T149;
  wire[31:0] T150;
  wire[3:0] id_fn_alu;
  wire[2:0] T151;
  wire[1:0] T152;
  wire T153;
  wire T154;
  wire[31:0] T155;
  wire T156;
  wire T157;
  wire[31:0] T158;
  wire T159;
  wire[31:0] T160;
  wire T161;
  wire T162;
  wire[31:0] T163;
  wire T164;
  wire T165;
  wire[31:0] T166;
  wire T167;
  wire T168;
  wire[31:0] T169;
  wire T170;
  wire T171;
  wire[31:0] T172;
  wire T173;
  wire[31:0] T174;
  wire T175;
  wire T176;
  wire[31:0] T177;
  wire T178;
  wire T179;
  wire[31:0] T180;
  wire T181;
  wire T182;
  wire[31:0] T183;
  wire T184;
  wire[31:0] T185;
  wire T186;
  wire T187;
  wire[31:0] T188;
  wire T189;
  wire T190;
  wire T191;
  wire[31:0] T192;
  wire id_br;
  wire[31:0] T193;
  wire[2:0] id_sel_imm;
  wire[1:0] T194;
  wire T195;
  wire T196;
  wire[31:0] T197;
  wire T198;
  wire[31:0] T199;
  wire T200;
  wire T201;
  wire[31:0] T202;
  wire T203;
  wire T204;
  wire[31:0] T205;
  wire T206;
  wire T207;
  wire[31:0] T208;
  wire T209;
  wire[31:0] T210;
  wire[2:0] T276;
  wire[1:0] id_sel_alu2;
  wire T211;
  wire T212;
  wire[31:0] T213;
  wire T214;
  wire T215;
  wire[31:0] T216;
  wire T217;
  wire T218;
  wire[31:0] T219;
  wire T220;
  wire[31:0] T221;
  wire T222;
  wire T223;
  wire[31:0] T224;
  wire T225;
  wire T226;
  wire[31:0] T227;
  wire T228;
  wire[31:0] T229;
  wire[1:0] id_sel_alu1;
  wire T230;
  wire T231;
  wire T232;
  wire[31:0] T233;
  wire T234;
  wire[31:0] T235;
  wire T236;
  wire T237;
  wire[31:0] T238;
  wire T239;
  wire[31:0] T240;
  wire T241;
  wire T242;
  wire id_j;
  wire T243;
  wire T244;
  wire T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  wire T250;
  wire T251;
  wire T252;
  wire T253;
  wire id_redirect;
  wire T254;
  wire T255;
  wire T256;
  wire id_br_taken;
  wire T257;
  wire T258;
  wire T259;
  reg  if_kill;
  wire T277;
  wire T260;
  wire T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire T266;
  wire T267;
  wire T268;
  wire T269;
  wire T270;
  wire T271;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    id_sb_stall = {1{$random}};
    id_valid = {1{$random}};
    ll_mem_type = {1{$random}};
    ll_mem_rw = {1{$random}};
    ll_fn = {1{$random}};
    ll_waddr = {1{$random}};
    if_kill = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_host_debug_stats_pcr = {1{$random}};
//  assign io_host_ipi_rep_ready = {1{$random}};
//  assign io_host_ipi_req_bits = {1{$random}};
//  assign io_host_ipi_req_valid = {1{$random}};
//  assign io_host_pcr_rep_bits = {1{$random}};
//  assign io_host_pcr_rep_valid = {1{$random}};
//  assign io_host_pcr_req_ready = {1{$random}};
//  assign io_dmem_hwdata = {1{$random}};
//  assign io_dmem_hsize = {1{$random}};
//  assign io_dmem_hwrite = {1{$random}};
//  assign io_dmem_haddr = {1{$random}};
//  assign io_imem_hwdata = {1{$random}};
//  assign io_imem_haddr = {1{$random}};
// synthesis translate_on
`endif
  assign io_dmem_hmastlock = 1'h0;
  assign io_dmem_htrans = T0;
  assign T0 = io_dpath_id_mem_valid ? 2'h2 : 2'h0;
  assign io_dmem_hprot = 4'h3;
  assign io_dmem_hburst = 3'h0;
  assign io_imem_hmastlock = 1'h0;
  assign io_imem_htrans = 2'h2;
  assign io_imem_hprot = 4'h3;
  assign io_imem_hburst = 3'h0;
  assign io_imem_hsize = 3'h2;
  assign io_imem_hwrite = 1'h0;
  assign io_dpath_logging_mul_stall = id_mul_stall;
  assign id_mul_stall = io_dpath_id_mul_valid & T1;
  assign T1 = io_dpath_mul_ready ^ 1'h1;
  assign io_dpath_logging_dmem_stall = id_dmem_stall;
  assign id_dmem_stall = io_dpath_id_mem_valid & T2;
  assign T2 = io_dmem_hready ^ 1'h1;
  assign io_dpath_logging_scr_stall = io_dpath_csr_replay;
  assign io_dpath_logging_sb_stall = id_sb_stall;
  assign T272 = reset ? 1'h0 : T3;
  assign T3 = T5 ? 1'h1 : T4;
  assign T4 = io_dpath_clear_sb ? 1'h0 : id_sb_stall;
  assign T5 = T9 & id_set_sb;
  assign id_set_sb = T7 | id_mul_valid;
  assign id_mul_valid = T6 == 32'h2000030;
  assign T6 = io_dpath_inst & 32'h2000074;
  assign T7 = T8 == 32'h0;
  assign T8 = io_dpath_inst & 32'h38;
  assign T9 = io_dpath_killdx ^ 1'h1;
  assign io_dpath_logging_invalidate = id_imem_invalidate;
  assign id_imem_invalidate = id_retire_nomem & id_fence_i;
  assign id_fence_i = T10 == 32'h1008;
  assign T10 = io_dpath_inst & 32'h1048;
  assign id_retire_nomem = id_retire_nomem_exclude_csr & T11;
  assign T11 = io_dpath_csr_xcpt ^ 1'h1;
  assign id_retire_nomem_exclude_csr = id_ok & T12;
  assign T12 = id_xcpt_nomem ^ 1'h1;
  assign id_xcpt_nomem = T79 | T13;
  assign T13 = T74 & T14;
  assign T14 = id_inst_valid ^ 1'h1;
  assign id_inst_valid = _id_inst_valid & id_shift_valid;
  assign id_shift_valid = T17 | T15;
  assign T15 = T16 == 1'h0;
  assign T16 = io_dpath_inst[5'h19:5'h19];
  assign T17 = id_shift_imm ^ 1'h1;
  assign id_shift_imm = T18 == 32'h1010;
  assign T18 = io_dpath_inst & 32'h3034;
  assign _id_inst_valid = T21 | T19;
  assign T19 = T20 == 32'h3;
  assign T20 = io_dpath_inst & 32'h306f;
  assign T21 = T24 | T22;
  assign T22 = T23 == 32'h4063;
  assign T23 = io_dpath_inst & 32'h407f;
  assign T24 = T27 | T25;
  assign T25 = T26 == 32'h1063;
  assign T26 = io_dpath_inst & 32'h306f;
  assign T27 = T30 | T28;
  assign T28 = T29 == 32'h23;
  assign T29 = io_dpath_inst & 32'h603f;
  assign T30 = T33 | T31;
  assign T31 = T32 == 32'h5033;
  assign T32 = io_dpath_inst & 32'hbe00707f;
  assign T33 = T36 | T34;
  assign T34 = T35 == 32'h5013;
  assign T35 = io_dpath_inst & 32'hbc00707f;
  assign T36 = T39 | T37;
  assign T37 = T38 == 32'h2073;
  assign T38 = io_dpath_inst & 32'h207f;
  assign T39 = T42 | T40;
  assign T40 = T41 == 32'h2013;
  assign T41 = io_dpath_inst & 32'h207f;
  assign T42 = T45 | T43;
  assign T43 = T44 == 32'h1013;
  assign T44 = io_dpath_inst & 32'hfc00305f;
  assign T45 = T48 | T46;
  assign T46 = T47 == 32'h73;
  assign T47 = io_dpath_inst & 32'hefffffff;
  assign T48 = T51 | T49;
  assign T49 = T50 == 32'h73;
  assign T50 = io_dpath_inst & 32'hffefffff;
  assign T51 = T54 | T52;
  assign T52 = T53 == 32'h6f;
  assign T53 = io_dpath_inst & 32'h7f;
  assign T54 = T57 | T55;
  assign T55 = T56 == 32'h63;
  assign T56 = io_dpath_inst & 32'h707b;
  assign T57 = T60 | T58;
  assign T58 = T59 == 32'h33;
  assign T59 = io_dpath_inst & 32'hbe00707f;
  assign T60 = T63 | T61;
  assign T61 = T62 == 32'h33;
  assign T62 = io_dpath_inst & 32'hfc00007f;
  assign T63 = T66 | T64;
  assign T64 = T65 == 32'h17;
  assign T65 = io_dpath_inst & 32'h5f;
  assign T66 = T69 | T67;
  assign T67 = T68 == 32'hf;
  assign T68 = io_dpath_inst & 32'h607f;
  assign T69 = T72 | T70;
  assign T70 = T71 == 32'h3;
  assign T71 = io_dpath_inst & 32'h207f;
  assign T72 = T73 == 32'h3;
  assign T73 = io_dpath_inst & 32'h505f;
  assign T74 = T78 & id_valid;
  assign T273 = reset ? 1'h0 : T75;
  assign T75 = T77 ? T76 : id_valid;
  assign T76 = io_dpath_killf ^ 1'h1;
  assign T77 = io_dpath_stalldx ^ 1'h1;
  assign T78 = id_sb_stall ^ 1'h1;
  assign T79 = T81 | imem_bus_error;
  assign imem_bus_error = io_imem_hready & T80;
  assign T80 = io_imem_hresp == 1'h1;
  assign T81 = io_dpath_csr_interrupt | io_dpath_ma_pc;
  assign id_ok = T82 & id_inst_valid;
  assign T82 = T83 & id_valid;
  assign T83 = id_sb_stall ^ 1'h1;
  assign io_dpath_ll_mem_type = ll_mem_type;
  assign T84 = T92 ? id_mem_type : ll_mem_type;
  assign id_mem_type = {T90, T85};
  assign T85 = {T88, T86};
  assign T86 = T87 == 32'h1000;
  assign T87 = io_dpath_inst & 32'h1000;
  assign T88 = T89 == 32'h2000;
  assign T89 = io_dpath_inst & 32'h2000;
  assign T90 = T91 == 32'h4000;
  assign T91 = io_dpath_inst & 32'h4000;
  assign T92 = T9 & id_mem_valid;
  assign id_mem_valid = T93 == 32'h0;
  assign T93 = io_dpath_inst & 32'h58;
  assign io_dpath_ll_mem_rw = ll_mem_rw;
  assign T94 = T92 ? id_mem_rw : ll_mem_rw;
  assign id_mem_rw = T95 == 32'h20;
  assign T95 = io_dpath_inst & 32'h20;
  assign io_dpath_ll_fn = ll_fn;
  assign T96 = T99 ? 1'h1 : T97;
  assign T97 = T98 ? 1'h0 : ll_fn;
  assign T98 = T5 & id_mem_valid;
  assign T99 = T5 & id_mul_valid;
  assign io_dpath_ll_waddr = ll_waddr;
  assign T100 = T5 ? id_waddr : ll_waddr;
  assign id_waddr = io_dpath_inst[4'hb:3'h7];
  assign io_dpath_ll_valid = id_sb_stall;
  assign io_dpath_id_cause = id_cause;
  assign id_cause = id_xcpt_nomem ? id_cause_nomem : T274;
  assign T274 = {29'h0, T101};
  assign T101 = T110 ? 3'h4 : T102;
  assign T102 = T107 ? 3'h6 : T103;
  assign T103 = T104 ? 3'h5 : 3'h7;
  assign T104 = dmem_bus_error & T105;
  assign T105 = ll_mem_rw ^ 1'h1;
  assign dmem_bus_error = io_dmem_hready & T106;
  assign T106 = io_dmem_hresp == 1'h1;
  assign T107 = T108 & io_dpath_ma_addr;
  assign T108 = T109 & id_mem_rw;
  assign T109 = id_ok & id_mem_valid;
  assign T110 = T111 & io_dpath_ma_addr;
  assign T111 = T113 & T112;
  assign T112 = id_mem_rw ^ 1'h1;
  assign T113 = id_ok & id_mem_valid;
  assign id_cause_nomem = io_dpath_csr_interrupt ? io_dpath_csr_interrupt_cause : T275;
  assign T275 = {30'h0, T114};
  assign T114 = io_dpath_ma_pc ? 2'h0 : T115;
  assign T115 = imem_bus_error ? 2'h1 : 2'h2;
  assign io_dpath_id_xcpt = id_xcpt;
  assign id_xcpt = T117 | T116;
  assign T116 = dmem_bus_error & ll_mem_rw;
  assign T117 = T118 | T104;
  assign T118 = T119 | T107;
  assign T119 = id_xcpt_nomem | T110;
  assign io_dpath_id_mul_valid = T120;
  assign T120 = id_retire_nomem & id_mul_valid;
  assign io_dpath_id_mem_type = id_mem_type;
  assign io_dpath_id_mem_rw = id_mem_rw;
  assign io_dpath_id_mem_valid = T121;
  assign T121 = id_retire & id_mem_valid;
  assign id_retire = T123 & T122;
  assign T122 = io_dpath_csr_xcpt ^ 1'h1;
  assign T123 = id_ok & T124;
  assign T124 = id_xcpt ^ 1'h1;
  assign io_dpath_id_csr_cmd = T125;
  assign T125 = id_retire_nomem_exclude_csr ? id_csr : 3'h0;
  assign id_csr = id_csr_ren ? 3'h5 : _id_csr;
  assign _id_csr = {T131, T126};
  assign T126 = {T129, T127};
  assign T127 = T128 == 32'h1050;
  assign T128 = io_dpath_inst & 32'h1050;
  assign T129 = T130 == 32'h2050;
  assign T130 = io_dpath_inst & 32'h2050;
  assign T131 = T132 == 32'h50;
  assign T132 = io_dpath_inst & 32'h3050;
  assign id_csr_ren = T134 & T133;
  assign T133 = id_raddr1 == 5'h0;
  assign id_raddr1 = io_dpath_inst[5'h13:4'hf];
  assign T134 = T136 | T135;
  assign T135 = _id_csr == 3'h3;
  assign T136 = _id_csr == 3'h2;
  assign io_dpath_id_csr_en = T137;
  assign T137 = id_retire_nomem & id_csr_en;
  assign id_csr_en = _id_csr != 3'h0;
  assign io_dpath_id_wen = T138;
  assign T138 = id_retire & id_wen;
  assign id_wen = T139 | T129;
  assign T139 = T140 | T127;
  assign T140 = T143 | T141;
  assign T141 = T142 == 32'h48;
  assign T142 = io_dpath_inst & 32'h48;
  assign T143 = T146 | T144;
  assign T144 = T145 == 32'h10;
  assign T145 = io_dpath_inst & 32'h30;
  assign T146 = T149 | T147;
  assign T147 = T148 == 32'h10;
  assign T148 = io_dpath_inst & 32'h2000050;
  assign T149 = T150 == 32'h4;
  assign T150 = io_dpath_inst & 32'hc;
  assign io_dpath_id_fn_alu = id_fn_alu;
  assign id_fn_alu = {T186, T151};
  assign T151 = {T175, T152};
  assign T152 = {T161, T153};
  assign T153 = T156 | T154;
  assign T154 = T155 == 32'h7000;
  assign T155 = io_dpath_inst & 32'h7044;
  assign T156 = T159 | T157;
  assign T157 = T158 == 32'h1040;
  assign T158 = io_dpath_inst & 32'h1058;
  assign T159 = T160 == 32'h1010;
  assign T160 = io_dpath_inst & 32'h3054;
  assign T161 = T164 | T162;
  assign T162 = T163 == 32'h40001010;
  assign T163 = io_dpath_inst & 32'h40001054;
  assign T164 = T167 | T165;
  assign T165 = T166 == 32'h40000030;
  assign T166 = io_dpath_inst & 32'h40003034;
  assign T167 = T170 | T168;
  assign T168 = T169 == 32'h6000;
  assign T169 = io_dpath_inst & 32'h6018;
  assign T170 = T173 | T171;
  assign T171 = T172 == 32'h6000;
  assign T172 = io_dpath_inst & 32'h6044;
  assign T173 = T174 == 32'h3000;
  assign T174 = io_dpath_inst & 32'h3044;
  assign T175 = T178 | T176;
  assign T176 = T177 == 32'h4040;
  assign T177 = io_dpath_inst & 32'h4058;
  assign T178 = T181 | T179;
  assign T179 = T180 == 32'h4010;
  assign T180 = io_dpath_inst & 32'h5054;
  assign T181 = T184 | T182;
  assign T182 = T183 == 32'h4010;
  assign T183 = io_dpath_inst & 32'h40004054;
  assign T184 = T185 == 32'h2010;
  assign T185 = io_dpath_inst & 32'h2054;
  assign T186 = T189 | T187;
  assign T187 = T188 == 32'h40001010;
  assign T188 = io_dpath_inst & 32'h40003054;
  assign T189 = T190 | T165;
  assign T190 = id_br | T191;
  assign T191 = T192 == 32'h2010;
  assign T192 = io_dpath_inst & 32'h6054;
  assign id_br = T193 == 32'h40;
  assign T193 = io_dpath_inst & 32'h54;
  assign io_dpath_id_sel_imm = id_sel_imm;
  assign id_sel_imm = {T203, T194};
  assign T194 = {T200, T195};
  assign T195 = T198 | T196;
  assign T196 = T197 == 32'h40;
  assign T197 = io_dpath_inst & 32'h44;
  assign T198 = T199 == 32'h8;
  assign T199 = io_dpath_inst & 32'h8;
  assign T200 = T201 | T198;
  assign T201 = T202 == 32'h4;
  assign T202 = io_dpath_inst & 32'h44;
  assign T203 = T206 | T204;
  assign T204 = T205 == 32'h10;
  assign T205 = io_dpath_inst & 32'h14;
  assign T206 = T209 | T207;
  assign T207 = T208 == 32'h4;
  assign T208 = io_dpath_inst & 32'h1c;
  assign T209 = T210 == 32'h0;
  assign T210 = io_dpath_inst & 32'h24;
  assign io_dpath_id_sel_alu2 = T276;
  assign T276 = {1'h0, id_sel_alu2};
  assign id_sel_alu2 = {T222, T211};
  assign T211 = T214 | T212;
  assign T212 = T213 == 32'h4050;
  assign T213 = io_dpath_inst & 32'h4050;
  assign T214 = T217 | T215;
  assign T215 = T216 == 32'h4;
  assign T216 = io_dpath_inst & 32'h4;
  assign T217 = T220 | T218;
  assign T218 = T219 == 32'h0;
  assign T219 = io_dpath_inst & 32'h20;
  assign T220 = T221 == 32'h0;
  assign T221 = io_dpath_inst & 32'h50;
  assign T222 = T225 | T223;
  assign T223 = T224 == 32'h4000;
  assign T224 = io_dpath_inst & 32'h4008;
  assign T225 = T228 | T226;
  assign T226 = T227 == 32'h0;
  assign T227 = io_dpath_inst & 32'h14;
  assign T228 = T229 == 32'h0;
  assign T229 = io_dpath_inst & 32'h40;
  assign io_dpath_id_sel_alu1 = id_sel_alu1;
  assign id_sel_alu1 = {T236, T230};
  assign T230 = T231 | T226;
  assign T231 = T234 | T232;
  assign T232 = T233 == 32'h0;
  assign T233 = io_dpath_inst & 32'h44;
  assign T234 = T235 == 32'h0;
  assign T235 = io_dpath_inst & 32'h4004;
  assign T236 = T239 | T237;
  assign T237 = T238 == 32'h4;
  assign T238 = io_dpath_inst & 32'h14;
  assign T239 = T240 == 32'h4;
  assign T240 = io_dpath_inst & 32'h24;
  assign io_dpath_id_br = T241;
  assign T241 = id_retire_nomem & id_br;
  assign io_dpath_id_j = T242;
  assign T242 = id_retire_nomem & id_j;
  assign id_j = T207 | T141;
  assign io_dpath_stallw = T243;
  assign T243 = T245 & T244;
  assign T244 = io_dmem_hready ^ 1'h1;
  assign T245 = id_sb_stall & T246;
  assign T246 = ll_fn ^ 1'h1;
  assign io_dpath_killdx = T247;
  assign T247 = T248 | io_dpath_stalldx;
  assign T248 = id_retire ^ 1'h1;
  assign io_dpath_stalldx = T249;
  assign T249 = T250 | io_dpath_stallw;
  assign T250 = T251 | id_mul_stall;
  assign T251 = T252 | id_dmem_stall;
  assign T252 = id_sb_stall | io_dpath_csr_replay;
  assign io_dpath_killf = T253;
  assign T253 = T257 | id_redirect;
  assign id_redirect = T254 | io_dpath_csr_eret;
  assign T254 = T255 | io_dpath_csr_xcpt;
  assign T255 = T256 | id_xcpt;
  assign T256 = io_dpath_id_j | id_br_taken;
  assign id_br_taken = io_dpath_id_br & io_dpath_br_taken;
  assign T257 = T258 | id_imem_invalidate;
  assign T258 = T259 | io_dpath_csr_interrupt;
  assign T259 = T265 | if_kill;
  assign T277 = reset ? 1'h1 : T260;
  assign T260 = T264 ? 1'h0 : T261;
  assign T261 = T262 ? 1'h1 : if_kill;
  assign T262 = id_redirect & T263;
  assign T263 = io_imem_hready ^ 1'h1;
  assign T264 = if_kill & io_imem_hready;
  assign T265 = io_imem_hready ^ 1'h1;
  assign io_dpath_stallf = T266;
  assign T266 = T271 & T267;
  assign T267 = T268 | io_dpath_stallw;
  assign T268 = T269 | io_dpath_stalldx;
  assign T269 = T270 | id_imem_invalidate;
  assign T270 = io_imem_hready ^ 1'h1;
  assign T271 = id_redirect ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      id_sb_stall <= 1'h0;
    end else if(T5) begin
      id_sb_stall <= 1'h1;
    end else if(io_dpath_clear_sb) begin
      id_sb_stall <= 1'h0;
    end
    if(reset) begin
      id_valid <= 1'h0;
    end else if(T77) begin
      id_valid <= T76;
    end
    if(T92) begin
      ll_mem_type <= id_mem_type;
    end
    if(T92) begin
      ll_mem_rw <= id_mem_rw;
    end
    if(T99) begin
      ll_fn <= 1'h1;
    end else if(T98) begin
      ll_fn <= 1'h0;
    end
    if(T5) begin
      ll_waddr <= id_waddr;
    end
    if(reset) begin
      if_kill <= 1'h1;
    end else if(T264) begin
      if_kill <= 1'h0;
    end else if(T262) begin
      if_kill <= 1'h1;
    end
  end
endmodule

module CSRFile(input clk, input reset,
    input  io_host_reset,
    input  io_host_id,
    output io_host_pcr_req_ready,
    input  io_host_pcr_req_valid,
    input  io_host_pcr_req_bits_rw,
    input [11:0] io_host_pcr_req_bits_addr,
    input [31:0] io_host_pcr_req_bits_data,
    input  io_host_pcr_rep_ready,
    output io_host_pcr_rep_valid,
    output[31:0] io_host_pcr_rep_bits,
    input  io_host_ipi_req_ready,
    output io_host_ipi_req_valid,
    output io_host_ipi_req_bits,
    output io_host_ipi_rep_ready,
    input  io_host_ipi_rep_valid,
    input  io_host_ipi_rep_bits,
    output io_host_debug_stats_pcr,
    input [11:0] io_rw_addr,
    input [2:0] io_rw_cmd,
    output[31:0] io_rw_rdata,
    input [31:0] io_rw_wdata,
    output io_csr_replay,
    output io_csr_stall,
    output io_csr_xcpt,
    output io_eret,
    output io_status_sd,
    output[30:0] io_status_zero2,
    output io_status_sd_rv32,
    output[8:0] io_status_zero1,
    output[4:0] io_status_vm,
    output io_status_mprv,
    output[1:0] io_status_xs,
    output[1:0] io_status_fs,
    output[1:0] io_status_prv3,
    output io_status_ie3,
    output[1:0] io_status_prv2,
    output io_status_ie2,
    output[1:0] io_status_prv1,
    output io_status_ie1,
    output[1:0] io_status_prv,
    output io_status_ie,
    output[31:0] io_ptbr,
    output[31:0] io_evec,
    input  io_exception,
    input  io_retire,
    input  io_uarch_counters_15,
    input  io_uarch_counters_14,
    input  io_uarch_counters_13,
    input  io_uarch_counters_12,
    input  io_uarch_counters_11,
    input  io_uarch_counters_10,
    input  io_uarch_counters_9,
    input  io_uarch_counters_8,
    input  io_uarch_counters_7,
    input  io_uarch_counters_6,
    input  io_uarch_counters_5,
    input  io_uarch_counters_4,
    input  io_uarch_counters_3,
    input  io_uarch_counters_2,
    input  io_uarch_counters_1,
    input  io_uarch_counters_0,
    input [31:0] io_cause,
    input [31:0] io_pc,
    output io_fatc,
    output[31:0] io_time,
    output[2:0] io_fcsr_rm,
    //input  io_fcsr_flags_valid
    //input [4:0] io_fcsr_flags_bits
    //input  io_rocc_cmd_ready
    //output io_rocc_cmd_valid
    //output[6:0] io_rocc_cmd_bits_inst_funct
    //output[4:0] io_rocc_cmd_bits_inst_rs2
    //output[4:0] io_rocc_cmd_bits_inst_rs1
    //output io_rocc_cmd_bits_inst_xd
    //output io_rocc_cmd_bits_inst_xs1
    //output io_rocc_cmd_bits_inst_xs2
    //output[4:0] io_rocc_cmd_bits_inst_rd
    //output[6:0] io_rocc_cmd_bits_inst_opcode
    //output[31:0] io_rocc_cmd_bits_rs1
    //output[31:0] io_rocc_cmd_bits_rs2
    //output io_rocc_resp_ready
    //input  io_rocc_resp_valid
    //input [4:0] io_rocc_resp_bits_rd
    //input [31:0] io_rocc_resp_bits_data
    //output io_rocc_mem_req_ready
    //input  io_rocc_mem_req_valid
    //input [32:0] io_rocc_mem_req_bits_addr
    //input [7:0] io_rocc_mem_req_bits_tag
    //input [4:0] io_rocc_mem_req_bits_cmd
    //input [2:0] io_rocc_mem_req_bits_typ
    //input  io_rocc_mem_req_bits_kill
    //input  io_rocc_mem_req_bits_phys
    //input [31:0] io_rocc_mem_req_bits_data
    //output io_rocc_mem_resp_valid
    //output[32:0] io_rocc_mem_resp_bits_addr
    //output[7:0] io_rocc_mem_resp_bits_tag
    //output[4:0] io_rocc_mem_resp_bits_cmd
    //output[2:0] io_rocc_mem_resp_bits_typ
    //output[31:0] io_rocc_mem_resp_bits_data
    //output io_rocc_mem_resp_bits_nack
    //output io_rocc_mem_resp_bits_replay
    //output io_rocc_mem_resp_bits_has_data
    //output[31:0] io_rocc_mem_resp_bits_data_subword
    //output[31:0] io_rocc_mem_resp_bits_store_data
    //output io_rocc_mem_replay_next_valid
    //output[7:0] io_rocc_mem_replay_next_bits
    //output io_rocc_mem_xcpt_ma_ld
    //output io_rocc_mem_xcpt_ma_st
    //output io_rocc_mem_xcpt_pf_ld
    //output io_rocc_mem_xcpt_pf_st
    //input  io_rocc_mem_invalidate_lr
    //output io_rocc_mem_ordered
    //input  io_rocc_busy
    //output io_rocc_s
    //input  io_rocc_interrupt
    //output io_rocc_imem_acquire_ready
    //input  io_rocc_imem_acquire_valid
    //input [25:0] io_rocc_imem_acquire_bits_addr_block
    //input  io_rocc_imem_acquire_bits_client_xact_id
    //input [1:0] io_rocc_imem_acquire_bits_addr_beat
    //input [127:0] io_rocc_imem_acquire_bits_data
    //input  io_rocc_imem_acquire_bits_is_builtin_type
    //input [2:0] io_rocc_imem_acquire_bits_a_type
    //input [16:0] io_rocc_imem_acquire_bits_union
    //input  io_rocc_imem_grant_ready
    //output io_rocc_imem_grant_valid
    //output[1:0] io_rocc_imem_grant_bits_addr_beat
    //output[127:0] io_rocc_imem_grant_bits_data
    //output io_rocc_imem_grant_bits_client_xact_id
    //output[3:0] io_rocc_imem_grant_bits_manager_xact_id
    //output io_rocc_imem_grant_bits_is_builtin_type
    //output[3:0] io_rocc_imem_grant_bits_g_type
    //output io_rocc_dmem_acquire_ready
    //input  io_rocc_dmem_acquire_valid
    //input [25:0] io_rocc_dmem_acquire_bits_addr_block
    //input  io_rocc_dmem_acquire_bits_client_xact_id
    //input [1:0] io_rocc_dmem_acquire_bits_addr_beat
    //input [127:0] io_rocc_dmem_acquire_bits_data
    //input  io_rocc_dmem_acquire_bits_is_builtin_type
    //input [2:0] io_rocc_dmem_acquire_bits_a_type
    //input [16:0] io_rocc_dmem_acquire_bits_union
    //input  io_rocc_dmem_grant_ready
    //output io_rocc_dmem_grant_valid
    //output[1:0] io_rocc_dmem_grant_bits_addr_beat
    //output[127:0] io_rocc_dmem_grant_bits_data
    //output io_rocc_dmem_grant_bits_client_xact_id
    //output[3:0] io_rocc_dmem_grant_bits_manager_xact_id
    //output io_rocc_dmem_grant_bits_is_builtin_type
    //output[3:0] io_rocc_dmem_grant_bits_g_type
    //output io_rocc_iptw_req_ready
    //input  io_rocc_iptw_req_valid
    //input [19:0] io_rocc_iptw_req_bits_addr
    //input [1:0] io_rocc_iptw_req_bits_prv
    //input  io_rocc_iptw_req_bits_store
    //input  io_rocc_iptw_req_bits_fetch
    //output io_rocc_iptw_resp_valid
    //output io_rocc_iptw_resp_bits_error
    //output[19:0] io_rocc_iptw_resp_bits_pte_ppn
    //output[2:0] io_rocc_iptw_resp_bits_pte_reserved_for_software
    //output io_rocc_iptw_resp_bits_pte_d
    //output io_rocc_iptw_resp_bits_pte_r
    //output[3:0] io_rocc_iptw_resp_bits_pte_typ
    //output io_rocc_iptw_resp_bits_pte_v
    //output io_rocc_iptw_status_sd
    //output[30:0] io_rocc_iptw_status_zero2
    //output io_rocc_iptw_status_sd_rv32
    //output[8:0] io_rocc_iptw_status_zero1
    //output[4:0] io_rocc_iptw_status_vm
    //output io_rocc_iptw_status_mprv
    //output[1:0] io_rocc_iptw_status_xs
    //output[1:0] io_rocc_iptw_status_fs
    //output[1:0] io_rocc_iptw_status_prv3
    //output io_rocc_iptw_status_ie3
    //output[1:0] io_rocc_iptw_status_prv2
    //output io_rocc_iptw_status_ie2
    //output[1:0] io_rocc_iptw_status_prv1
    //output io_rocc_iptw_status_ie1
    //output[1:0] io_rocc_iptw_status_prv
    //output io_rocc_iptw_status_ie
    //output io_rocc_iptw_invalidate
    //output io_rocc_dptw_req_ready
    //input  io_rocc_dptw_req_valid
    //input [19:0] io_rocc_dptw_req_bits_addr
    //input [1:0] io_rocc_dptw_req_bits_prv
    //input  io_rocc_dptw_req_bits_store
    //input  io_rocc_dptw_req_bits_fetch
    //output io_rocc_dptw_resp_valid
    //output io_rocc_dptw_resp_bits_error
    //output[19:0] io_rocc_dptw_resp_bits_pte_ppn
    //output[2:0] io_rocc_dptw_resp_bits_pte_reserved_for_software
    //output io_rocc_dptw_resp_bits_pte_d
    //output io_rocc_dptw_resp_bits_pte_r
    //output[3:0] io_rocc_dptw_resp_bits_pte_typ
    //output io_rocc_dptw_resp_bits_pte_v
    //output io_rocc_dptw_status_sd
    //output[30:0] io_rocc_dptw_status_zero2
    //output io_rocc_dptw_status_sd_rv32
    //output[8:0] io_rocc_dptw_status_zero1
    //output[4:0] io_rocc_dptw_status_vm
    //output io_rocc_dptw_status_mprv
    //output[1:0] io_rocc_dptw_status_xs
    //output[1:0] io_rocc_dptw_status_fs
    //output[1:0] io_rocc_dptw_status_prv3
    //output io_rocc_dptw_status_ie3
    //output[1:0] io_rocc_dptw_status_prv2
    //output io_rocc_dptw_status_ie2
    //output[1:0] io_rocc_dptw_status_prv1
    //output io_rocc_dptw_status_ie1
    //output[1:0] io_rocc_dptw_status_prv
    //output io_rocc_dptw_status_ie
    //output io_rocc_dptw_invalidate
    //output io_rocc_pptw_req_ready
    //input  io_rocc_pptw_req_valid
    //input [19:0] io_rocc_pptw_req_bits_addr
    //input [1:0] io_rocc_pptw_req_bits_prv
    //input  io_rocc_pptw_req_bits_store
    //input  io_rocc_pptw_req_bits_fetch
    //output io_rocc_pptw_resp_valid
    //output io_rocc_pptw_resp_bits_error
    //output[19:0] io_rocc_pptw_resp_bits_pte_ppn
    //output[2:0] io_rocc_pptw_resp_bits_pte_reserved_for_software
    //output io_rocc_pptw_resp_bits_pte_d
    //output io_rocc_pptw_resp_bits_pte_r
    //output[3:0] io_rocc_pptw_resp_bits_pte_typ
    //output io_rocc_pptw_resp_bits_pte_v
    //output io_rocc_pptw_status_sd
    //output[30:0] io_rocc_pptw_status_zero2
    //output io_rocc_pptw_status_sd_rv32
    //output[8:0] io_rocc_pptw_status_zero1
    //output[4:0] io_rocc_pptw_status_vm
    //output io_rocc_pptw_status_mprv
    //output[1:0] io_rocc_pptw_status_xs
    //output[1:0] io_rocc_pptw_status_fs
    //output[1:0] io_rocc_pptw_status_prv3
    //output io_rocc_pptw_status_ie3
    //output[1:0] io_rocc_pptw_status_prv2
    //output io_rocc_pptw_status_ie2
    //output[1:0] io_rocc_pptw_status_prv1
    //output io_rocc_pptw_status_ie1
    //output[1:0] io_rocc_pptw_status_prv
    //output io_rocc_pptw_status_ie
    //output io_rocc_pptw_invalidate
    //output io_rocc_exception
    output io_interrupt,
    output[31:0] io_interrupt_cause
);

  reg[0:0] T0;
  wire T1;
  wire T2;
  wire[3:0] T3;
  wire[3:0] T4;
  wire[2:0] T5;
  wire[2:0] T6;
  wire[1:0] T7;
  wire[1:0] T8;
  wire[1:0] T691;
  wire csr_xcpt;
  wire insn_break;
  wire system_insn;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire insn_call;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire priv_sufficient;
  reg [1:0] reg_mstatus_prv;
  wire[1:0] T22;
  wire[1:0] T23;
  wire[1:0] T24;
  wire[1:0] T25;
  wire[1:0] T26;
  wire T27;
  reg [1:0] reg_mstatus_prv1;
  wire[1:0] T28;
  wire[1:0] T29;
  wire[1:0] T30;
  wire[1:0] T31;
  reg [1:0] reg_mstatus_prv2;
  wire[1:0] T32;
  wire[1:0] T33;
  wire[1:0] T34;
  wire[1:0] T35;
  wire[31:0] wdata;
  wire[31:0] T36;
  wire[31:0] T37;
  reg [31:0] host_pcr_bits_data;
  wire[31:0] T38;
  wire[31:0] T39;
  wire T40;
  wire host_pcr_req_fire;
  wire T41;
  wire cpu_ren;
  wire T42;
  wire T43;
  reg  host_pcr_req_valid;
  wire T44;
  wire T45;
  wire[31:0] T46;
  wire T47;
  wire[31:0] T48;
  wire[31:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire[11:0] addr;
  reg [11:0] host_pcr_bits_addr;
  wire[11:0] T58;
  wire wen;
  wire T59;
  reg  host_pcr_bits_rw;
  wire T60;
  wire T61;
  wire T62;
  wire read_only;
  wire[1:0] T63;
  wire cpu_wen;
  wire T64;
  wire T65;
  wire insn_ret;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire T70;
  wire T71;
  wire T72;
  wire T73;
  wire insn_redirect_trap;
  wire maybe_insn_redirect_trap;
  wire T74;
  wire[1:0] T75;
  wire T76;
  wire T77;
  wire T78;
  wire T79;
  wire[1:0] csr_addr_priv;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire T85;
  wire fp_csr;
  wire T86;
  wire T87;
  wire T88;
  wire T89;
  wire T90;
  wire T91;
  wire addr_valid;
  wire T92;
  wire T93;
  wire T94;
  wire T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire T102;
  wire T103;
  wire T104;
  wire T105;
  wire T106;
  wire T107;
  wire T108;
  wire T109;
  wire T110;
  wire T111;
  wire T112;
  wire T113;
  wire T114;
  wire T115;
  wire T116;
  wire T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire T132;
  wire T133;
  wire T134;
  wire T135;
  wire T136;
  wire T137;
  wire T138;
  wire T139;
  wire T140;
  wire T141;
  wire T142;
  wire T143;
  wire T144;
  wire T145;
  wire T146;
  wire T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire T156;
  wire T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire T164;
  wire T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  wire T172;
  wire T173;
  wire T174;
  wire T175;
  wire[2:0] T692;
  wire[3:0] T693;
  wire[1:0] T176;
  wire[1:0] T177;
  wire[1:0] T694;
  wire[31:0] T178;
  wire[31:0] T179;
  wire[31:0] T180;
  wire[31:0] T181;
  wire T182;
  wire T183;
  wire T184;
  reg  reg_mstatus_ie;
  wire T185;
  wire T186;
  wire T187;
  wire T188;
  reg  reg_mstatus_ie1;
  wire T189;
  wire T190;
  wire T191;
  wire T192;
  reg  reg_mstatus_ie2;
  wire T193;
  wire T194;
  wire T195;
  wire T196;
  wire T197;
  wire T198;
  wire T199;
  wire T200;
  reg  reg_mip_ssip;
  wire T695;
  reg  reg_mie_ssip;
  wire T696;
  wire T201;
  wire T202;
  wire T203;
  wire T204;
  wire T205;
  wire T206;
  reg  reg_mip_msip;
  wire T697;
  wire T207;
  wire T208;
  wire T209;
  wire T210;
  reg  reg_mie_msip;
  wire T698;
  wire T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  reg  reg_mip_stip;
  wire T699;
  wire T220;
  wire T221;
  wire T222;
  reg [31:0] reg_stimecmp;
  wire[31:0] T223;
  wire[31:0] T224;
  wire[31:0] T225;
  reg [4:0] R226;
  wire[4:0] T700;
  wire[4:0] T227;
  wire[4:0] T228;
  wire[4:0] T229;
  wire[4:0] T230;
  wire[5:0] T231;
  wire[5:0] T701;
  wire[4:0] T232;
  wire T233;
  wire[4:0] T234;
  wire T235;
  wire[4:0] T236;
  wire T237;
  reg [26:0] R238;
  wire[26:0] T702;
  wire[26:0] T239;
  wire[26:0] T240;
  wire[26:0] T241;
  wire[26:0] T242;
  wire[26:0] T243;
  wire T244;
  wire[26:0] T245;
  wire[26:0] T246;
  wire[26:0] T247;
  wire T248;
  reg  reg_mie_stip;
  wire T703;
  wire T249;
  wire T250;
  wire T251;
  wire T252;
  wire T253;
  wire T254;
  reg [31:0] reg_fromhost;
  wire[31:0] T704;
  wire[31:0] T255;
  wire T256;
  wire T257;
  wire T258;
  wire T259;
  wire T260;
  wire T261;
  reg [2:0] reg_frm;
  wire[2:0] T705;
  wire[31:0] T262;
  wire[31:0] T263;
  wire[31:0] T706;
  wire T264;
  wire[31:0] T707;
  wire[26:0] T265;
  wire T266;
  wire insn_sfence_vm;
  wire T267;
  wire T268;
  wire T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire[31:0] T274;
  wire[31:0] T275;
  wire[31:0] T276;
  reg [31:0] reg_sepc;
  wire[31:0] T277;
  reg [31:0] reg_mepc;
  wire[31:0] T278;
  wire[31:0] T279;
  wire[31:0] T280;
  wire[31:0] T281;
  wire[31:0] T282;
  wire T283;
  wire T284;
  reg [31:0] reg_stvec;
  wire[31:0] T708;
  wire[8:0] T287;
  wire[8:0] T709;
  wire[7:0] T288;
  wire T289;
  reg [31:0] reg_sptbr;
  reg  reg_mstatus_ie3;
  wire T290;
  reg [1:0] reg_mstatus_prv3;
  wire[1:0] T291;
  wire[1:0] T710;
  wire T292;
  wire T293;
  reg [1:0] reg_mstatus_fs;
  wire[1:0] T294;
  wire[1:0] T711;
  wire T295;
  wire T296;
  reg [1:0] reg_mstatus_xs;
  wire[1:0] T297;
  reg  reg_mstatus_mprv;
  wire T298;
  wire T299;
  wire T300;
  wire T301;
  reg [4:0] reg_mstatus_vm;
  wire[4:0] T302;
  reg [8:0] reg_mstatus_zero1;
  wire[8:0] T303;
  reg [30:0] reg_mstatus_zero2;
  wire[30:0] T304;
  wire T305;
  wire T306;
  wire T307;
  wire T308;
  reg  reg_wfi;
  wire T712;
  wire T309;
  wire T310;
  wire insn_wfi;
  wire T311;
  wire T312;
  wire T313;
  wire T314;
  wire T315;
  wire T316;
  wire T317;
  wire some_interrupt_pending;
  wire T318;
  wire T319;
  wire T320;
  wire T321;
  wire T322;
  wire T323;
  wire T324;
  wire T325;
  wire T326;
  wire T327;
  wire T328;
  wire T329;
  wire T330;
  wire[31:0] T713;
  wire[63:0] T331;
  wire[63:0] T714;
  wire[31:0] T332;
  wire[31:0] T333;
  reg [4:0] R334;
  wire[4:0] T715;
  wire[4:0] T335;
  wire[4:0] T336;
  wire[5:0] T337;
  wire[5:0] T716;
  wire T338;
  reg [26:0] R339;
  wire[26:0] T717;
  wire[26:0] T340;
  wire[26:0] T341;
  wire T342;
  wire T343;
  wire[63:0] T344;
  wire[63:0] T718;
  wire[31:0] T345;
  wire[31:0] T346;
  reg [4:0] R347;
  wire[4:0] T719;
  wire[4:0] T348;
  wire[4:0] T349;
  wire[5:0] T350;
  wire[5:0] T720;
  wire T351;
  reg [26:0] R352;
  wire[26:0] T721;
  wire[26:0] T353;
  wire[26:0] T354;
  wire T355;
  wire T356;
  wire[63:0] T357;
  wire[63:0] T722;
  wire[31:0] T358;
  wire[31:0] T359;
  reg [4:0] R360;
  wire[4:0] T723;
  wire[4:0] T361;
  wire[4:0] T362;
  wire[5:0] T363;
  wire[5:0] T724;
  wire T364;
  reg [26:0] R365;
  wire[26:0] T725;
  wire[26:0] T366;
  wire[26:0] T367;
  wire T368;
  wire T369;
  wire[63:0] T370;
  wire[63:0] T726;
  wire[31:0] T371;
  wire[31:0] T372;
  reg [4:0] R373;
  wire[4:0] T727;
  wire[4:0] T374;
  wire[4:0] T375;
  wire[5:0] T376;
  wire[5:0] T728;
  wire T377;
  reg [26:0] R378;
  wire[26:0] T729;
  wire[26:0] T379;
  wire[26:0] T380;
  wire T381;
  wire T382;
  wire[63:0] T383;
  wire[63:0] T730;
  wire[31:0] T384;
  wire[31:0] T385;
  reg [4:0] R386;
  wire[4:0] T731;
  wire[4:0] T387;
  wire[4:0] T388;
  wire[5:0] T389;
  wire[5:0] T732;
  wire T390;
  reg [26:0] R391;
  wire[26:0] T733;
  wire[26:0] T392;
  wire[26:0] T393;
  wire T394;
  wire T395;
  wire[63:0] T396;
  wire[63:0] T734;
  wire[31:0] T397;
  wire[31:0] T398;
  reg [4:0] R399;
  wire[4:0] T735;
  wire[4:0] T400;
  wire[4:0] T401;
  wire[5:0] T402;
  wire[5:0] T736;
  wire T403;
  reg [26:0] R404;
  wire[26:0] T737;
  wire[26:0] T405;
  wire[26:0] T406;
  wire T407;
  wire T408;
  wire[63:0] T409;
  wire[63:0] T738;
  wire[31:0] T410;
  wire[31:0] T411;
  reg [4:0] R412;
  wire[4:0] T739;
  wire[4:0] T413;
  wire[4:0] T414;
  wire[5:0] T415;
  wire[5:0] T740;
  wire T416;
  reg [26:0] R417;
  wire[26:0] T741;
  wire[26:0] T418;
  wire[26:0] T419;
  wire T420;
  wire T421;
  wire[63:0] T422;
  wire[63:0] T742;
  wire[31:0] T423;
  wire[31:0] T424;
  reg [4:0] R425;
  wire[4:0] T743;
  wire[4:0] T426;
  wire[4:0] T427;
  wire[5:0] T428;
  wire[5:0] T744;
  wire T429;
  reg [26:0] R430;
  wire[26:0] T745;
  wire[26:0] T431;
  wire[26:0] T432;
  wire T433;
  wire T434;
  wire[63:0] T435;
  wire[63:0] T746;
  wire[31:0] T436;
  wire[31:0] T437;
  reg [4:0] R438;
  wire[4:0] T747;
  wire[4:0] T439;
  wire[4:0] T440;
  wire[5:0] T441;
  wire[5:0] T748;
  wire T442;
  reg [26:0] R443;
  wire[26:0] T749;
  wire[26:0] T444;
  wire[26:0] T445;
  wire T446;
  wire T447;
  wire[63:0] T448;
  wire[63:0] T750;
  wire[31:0] T449;
  wire[31:0] T450;
  reg [4:0] R451;
  wire[4:0] T751;
  wire[4:0] T452;
  wire[4:0] T453;
  wire[5:0] T454;
  wire[5:0] T752;
  wire T455;
  reg [26:0] R456;
  wire[26:0] T753;
  wire[26:0] T457;
  wire[26:0] T458;
  wire T459;
  wire T460;
  wire[63:0] T461;
  wire[63:0] T754;
  wire[31:0] T462;
  wire[31:0] T463;
  reg [4:0] R464;
  wire[4:0] T755;
  wire[4:0] T465;
  wire[4:0] T466;
  wire[5:0] T467;
  wire[5:0] T756;
  wire T468;
  reg [26:0] R469;
  wire[26:0] T757;
  wire[26:0] T470;
  wire[26:0] T471;
  wire T472;
  wire T473;
  wire[63:0] T474;
  wire[63:0] T758;
  wire[31:0] T475;
  wire[31:0] T476;
  reg [4:0] R477;
  wire[4:0] T759;
  wire[4:0] T478;
  wire[4:0] T479;
  wire[5:0] T480;
  wire[5:0] T760;
  wire T481;
  reg [26:0] R482;
  wire[26:0] T761;
  wire[26:0] T483;
  wire[26:0] T484;
  wire T485;
  wire T486;
  wire[63:0] T487;
  wire[63:0] T762;
  wire[31:0] T488;
  wire[31:0] T489;
  reg [4:0] R490;
  wire[4:0] T763;
  wire[4:0] T491;
  wire[4:0] T492;
  wire[5:0] T493;
  wire[5:0] T764;
  wire T494;
  reg [26:0] R495;
  wire[26:0] T765;
  wire[26:0] T496;
  wire[26:0] T497;
  wire T498;
  wire T499;
  wire[63:0] T500;
  wire[63:0] T766;
  wire[31:0] T501;
  wire[31:0] T502;
  reg [4:0] R503;
  wire[4:0] T767;
  wire[4:0] T504;
  wire[4:0] T505;
  wire[5:0] T506;
  wire[5:0] T768;
  wire T507;
  reg [26:0] R508;
  wire[26:0] T769;
  wire[26:0] T509;
  wire[26:0] T510;
  wire T511;
  wire T512;
  wire[63:0] T513;
  wire[63:0] T770;
  wire[31:0] T514;
  wire[31:0] T515;
  reg [4:0] R516;
  wire[4:0] T771;
  wire[4:0] T517;
  wire[4:0] T518;
  wire[5:0] T519;
  wire[5:0] T772;
  wire T520;
  reg [26:0] R521;
  wire[26:0] T773;
  wire[26:0] T522;
  wire[26:0] T523;
  wire T524;
  wire T525;
  wire[63:0] T526;
  wire[63:0] T774;
  wire[31:0] T527;
  wire[31:0] T528;
  reg [4:0] R529;
  wire[4:0] T775;
  wire[4:0] T530;
  wire[4:0] T531;
  wire[5:0] T532;
  wire[5:0] T776;
  wire T533;
  reg [26:0] R534;
  wire[26:0] T777;
  wire[26:0] T535;
  wire[26:0] T536;
  wire T537;
  wire T538;
  wire[63:0] T539;
  wire[63:0] T778;
  wire[31:0] T540;
  wire[63:0] T541;
  wire[63:0] T779;
  wire[31:0] T542;
  reg [31:0] reg_tohost;
  wire[31:0] T780;
  wire[31:0] T543;
  wire[31:0] T544;
  wire T545;
  wire T546;
  wire T547;
  wire T548;
  wire T549;
  wire T550;
  wire T551;
  wire[63:0] T552;
  wire[63:0] T781;
  wire T553;
  reg  reg_stats;
  wire T782;
  wire T554;
  wire T555;
  wire T556;
  wire[63:0] T557;
  wire[63:0] T783;
  wire T558;
  wire[63:0] T559;
  wire[63:0] T784;
  wire T560;
  wire[63:0] T561;
  wire[63:0] T785;
  wire[31:0] T562;
  wire[63:0] T563;
  wire[63:0] T786;
  wire[31:0] T564;
  reg [31:0] reg_mcause;
  wire[31:0] T565;
  wire[31:0] T566;
  wire[31:0] T567;
  wire[31:0] T568;
  wire[31:0] T569;
  wire T570;
  wire T571;
  wire[31:0] T787;
  wire[3:0] T572;
  wire[3:0] T788;
  wire T573;
  wire[31:0] T574;
  wire T575;
  wire[63:0] T576;
  wire[63:0] T789;
  wire[31:0] T577;
  reg [31:0] reg_mbadaddr;
  wire[31:0] T790;
  wire[32:0] T579;
  wire[32:0] T580;
  wire[32:0] T791;
  wire[31:0] T581;
  wire[32:0] T792;
  wire T589;
  wire T590;
  wire T591;
  wire T592;
  wire T593;
  wire T594;
  wire T595;
  wire T596;
  wire[32:0] T793;
  wire T597;
  wire[63:0] T599;
  wire[63:0] T794;
  wire[31:0] T600;
  wire[63:0] T603;
  wire[63:0] T795;
  wire[31:0] T604;
  reg [31:0] reg_mscratch;
  wire[31:0] T605;
  wire T606;
  wire[63:0] T607;
  wire[63:0] T796;
  wire[7:0] T608;
  wire[7:0] T609;
  wire[7:0] T610;
  wire[3:0] T611;
  wire[1:0] T612;
  reg  reg_mie_usip;
  wire T797;
  wire[1:0] T613;
  reg  reg_mie_hsip;
  wire T798;
  wire[3:0] T614;
  wire[1:0] T615;
  reg  reg_mie_utip;
  wire T799;
  wire[1:0] T616;
  reg  reg_mie_htip;
  wire T800;
  reg  reg_mie_mtip;
  wire T801;
  wire T617;
  wire T618;
  wire[63:0] T619;
  wire[63:0] T802;
  wire[7:0] T620;
  wire[7:0] T621;
  wire[7:0] T622;
  wire[3:0] T623;
  wire[1:0] T624;
  reg  reg_mip_usip;
  wire T803;
  wire[1:0] T625;
  reg  reg_mip_hsip;
  wire T804;
  wire[3:0] T626;
  wire[1:0] T627;
  reg  reg_mip_utip;
  wire T805;
  wire[1:0] T628;
  reg  reg_mip_htip;
  wire T806;
  reg  reg_mip_mtip;
  wire T807;
  wire[63:0] T629;
  wire[63:0] T808;
  wire[8:0] T630;
  wire[63:0] T631;
  wire[63:0] T632;
  wire[63:0] T633;
  wire[63:0] read_mstatus;
  wire[63:0] T634;
  wire[11:0] T635;
  wire[5:0] T636;
  wire[2:0] T637;
  wire[2:0] T638;
  wire[5:0] T639;
  wire[2:0] T640;
  wire[2:0] T641;
  wire[51:0] T642;
  wire[9:0] T643;
  wire[3:0] T644;
  wire[5:0] T645;
  wire[41:0] T646;
  wire[9:0] T647;
  wire[31:0] T648;
  wire[63:0] T809;
  wire[31:0] T649;
  wire[31:0] T810;
  wire[31:0] T650;
  wire[31:0] T811;
  wire[12:0] T651;
  wire[31:0] T652;
  wire[31:0] T653;
  wire[31:0] T654;
  wire[31:0] T655;
  wire[31:0] T656;
  wire[31:0] T657;
  wire[31:0] T658;
  wire[31:0] T659;
  wire[31:0] T660;
  wire[31:0] T661;
  wire[31:0] T662;
  reg [4:0] R663;
  wire[4:0] T812;
  wire[4:0] T664;
  wire[4:0] T665;
  wire[4:0] T666;
  wire[5:0] T667;
  wire[5:0] T813;
  wire T668;
  wire[4:0] T669;
  wire T670;
  reg [26:0] R671;
  wire[26:0] T814;
  wire[26:0] T672;
  wire[26:0] T673;
  wire[26:0] T674;
  wire T675;
  wire T676;
  wire[26:0] T677;
  wire[31:0] T678;
  wire[31:0] T679;
  wire[31:0] T680;
  wire[31:0] T681;
  wire[31:0] T682;
  wire[31:0] T683;
  wire T815;
  wire T684;
  reg  host_pcr_rep_valid;
  wire T685;
  wire T686;
  wire T687;
  wire T688;
  wire T689;
  wire T690;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    T0 = 1'b0;
    reg_mstatus_prv = {1{$random}};
    reg_mstatus_prv1 = {1{$random}};
    reg_mstatus_prv2 = {1{$random}};
    host_pcr_bits_data = {1{$random}};
    host_pcr_req_valid = {1{$random}};
    host_pcr_bits_addr = {1{$random}};
    host_pcr_bits_rw = {1{$random}};
    reg_mstatus_ie = {1{$random}};
    reg_mstatus_ie1 = {1{$random}};
    reg_mstatus_ie2 = {1{$random}};
    reg_mip_ssip = {1{$random}};
    reg_mie_ssip = {1{$random}};
    reg_mip_msip = {1{$random}};
    reg_mie_msip = {1{$random}};
    reg_mip_stip = {1{$random}};
    reg_stimecmp = {1{$random}};
    R226 = {1{$random}};
    R238 = {1{$random}};
    reg_mie_stip = {1{$random}};
    reg_fromhost = {1{$random}};
    reg_frm = {1{$random}};
    reg_sepc = {1{$random}};
    reg_mepc = {1{$random}};
    reg_stvec = {1{$random}};
    reg_sptbr = {1{$random}};
    reg_mstatus_ie3 = {1{$random}};
    reg_mstatus_prv3 = {1{$random}};
    reg_mstatus_fs = {1{$random}};
    reg_mstatus_xs = {1{$random}};
    reg_mstatus_mprv = {1{$random}};
    reg_mstatus_vm = {1{$random}};
    reg_mstatus_zero1 = {1{$random}};
    reg_mstatus_zero2 = {1{$random}};
    reg_wfi = {1{$random}};
    R334 = {1{$random}};
    R339 = {1{$random}};
    R347 = {1{$random}};
    R352 = {1{$random}};
    R360 = {1{$random}};
    R365 = {1{$random}};
    R373 = {1{$random}};
    R378 = {1{$random}};
    R386 = {1{$random}};
    R391 = {1{$random}};
    R399 = {1{$random}};
    R404 = {1{$random}};
    R412 = {1{$random}};
    R417 = {1{$random}};
    R425 = {1{$random}};
    R430 = {1{$random}};
    R438 = {1{$random}};
    R443 = {1{$random}};
    R451 = {1{$random}};
    R456 = {1{$random}};
    R464 = {1{$random}};
    R469 = {1{$random}};
    R477 = {1{$random}};
    R482 = {1{$random}};
    R490 = {1{$random}};
    R495 = {1{$random}};
    R503 = {1{$random}};
    R508 = {1{$random}};
    R516 = {1{$random}};
    R521 = {1{$random}};
    R529 = {1{$random}};
    R534 = {1{$random}};
    reg_tohost = {1{$random}};
    reg_stats = {1{$random}};
    reg_mcause = {1{$random}};
    reg_mbadaddr = {1{$random}};
    reg_mscratch = {1{$random}};
    reg_mie_usip = {1{$random}};
    reg_mie_hsip = {1{$random}};
    reg_mie_utip = {1{$random}};
    reg_mie_htip = {1{$random}};
    reg_mie_mtip = {1{$random}};
    reg_mip_usip = {1{$random}};
    reg_mip_hsip = {1{$random}};
    reg_mip_utip = {1{$random}};
    reg_mip_htip = {1{$random}};
    reg_mip_mtip = {1{$random}};
    R663 = {1{$random}};
    R671 = {1{$random}};
    host_pcr_rep_valid = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_rocc_exception = {1{$random}};
//  assign io_rocc_pptw_invalidate = {1{$random}};
//  assign io_rocc_pptw_status_ie = {1{$random}};
//  assign io_rocc_pptw_status_prv = {1{$random}};
//  assign io_rocc_pptw_status_ie1 = {1{$random}};
//  assign io_rocc_pptw_status_prv1 = {1{$random}};
//  assign io_rocc_pptw_status_ie2 = {1{$random}};
//  assign io_rocc_pptw_status_prv2 = {1{$random}};
//  assign io_rocc_pptw_status_ie3 = {1{$random}};
//  assign io_rocc_pptw_status_prv3 = {1{$random}};
//  assign io_rocc_pptw_status_fs = {1{$random}};
//  assign io_rocc_pptw_status_xs = {1{$random}};
//  assign io_rocc_pptw_status_mprv = {1{$random}};
//  assign io_rocc_pptw_status_vm = {1{$random}};
//  assign io_rocc_pptw_status_zero1 = {1{$random}};
//  assign io_rocc_pptw_status_sd_rv32 = {1{$random}};
//  assign io_rocc_pptw_status_zero2 = {1{$random}};
//  assign io_rocc_pptw_status_sd = {1{$random}};
//  assign io_rocc_pptw_resp_bits_pte_v = {1{$random}};
//  assign io_rocc_pptw_resp_bits_pte_typ = {1{$random}};
//  assign io_rocc_pptw_resp_bits_pte_r = {1{$random}};
//  assign io_rocc_pptw_resp_bits_pte_d = {1{$random}};
//  assign io_rocc_pptw_resp_bits_pte_reserved_for_software = {1{$random}};
//  assign io_rocc_pptw_resp_bits_pte_ppn = {1{$random}};
//  assign io_rocc_pptw_resp_bits_error = {1{$random}};
//  assign io_rocc_pptw_resp_valid = {1{$random}};
//  assign io_rocc_pptw_req_ready = {1{$random}};
//  assign io_rocc_dptw_invalidate = {1{$random}};
//  assign io_rocc_dptw_status_ie = {1{$random}};
//  assign io_rocc_dptw_status_prv = {1{$random}};
//  assign io_rocc_dptw_status_ie1 = {1{$random}};
//  assign io_rocc_dptw_status_prv1 = {1{$random}};
//  assign io_rocc_dptw_status_ie2 = {1{$random}};
//  assign io_rocc_dptw_status_prv2 = {1{$random}};
//  assign io_rocc_dptw_status_ie3 = {1{$random}};
//  assign io_rocc_dptw_status_prv3 = {1{$random}};
//  assign io_rocc_dptw_status_fs = {1{$random}};
//  assign io_rocc_dptw_status_xs = {1{$random}};
//  assign io_rocc_dptw_status_mprv = {1{$random}};
//  assign io_rocc_dptw_status_vm = {1{$random}};
//  assign io_rocc_dptw_status_zero1 = {1{$random}};
//  assign io_rocc_dptw_status_sd_rv32 = {1{$random}};
//  assign io_rocc_dptw_status_zero2 = {1{$random}};
//  assign io_rocc_dptw_status_sd = {1{$random}};
//  assign io_rocc_dptw_resp_bits_pte_v = {1{$random}};
//  assign io_rocc_dptw_resp_bits_pte_typ = {1{$random}};
//  assign io_rocc_dptw_resp_bits_pte_r = {1{$random}};
//  assign io_rocc_dptw_resp_bits_pte_d = {1{$random}};
//  assign io_rocc_dptw_resp_bits_pte_reserved_for_software = {1{$random}};
//  assign io_rocc_dptw_resp_bits_pte_ppn = {1{$random}};
//  assign io_rocc_dptw_resp_bits_error = {1{$random}};
//  assign io_rocc_dptw_resp_valid = {1{$random}};
//  assign io_rocc_dptw_req_ready = {1{$random}};
//  assign io_rocc_iptw_invalidate = {1{$random}};
//  assign io_rocc_iptw_status_ie = {1{$random}};
//  assign io_rocc_iptw_status_prv = {1{$random}};
//  assign io_rocc_iptw_status_ie1 = {1{$random}};
//  assign io_rocc_iptw_status_prv1 = {1{$random}};
//  assign io_rocc_iptw_status_ie2 = {1{$random}};
//  assign io_rocc_iptw_status_prv2 = {1{$random}};
//  assign io_rocc_iptw_status_ie3 = {1{$random}};
//  assign io_rocc_iptw_status_prv3 = {1{$random}};
//  assign io_rocc_iptw_status_fs = {1{$random}};
//  assign io_rocc_iptw_status_xs = {1{$random}};
//  assign io_rocc_iptw_status_mprv = {1{$random}};
//  assign io_rocc_iptw_status_vm = {1{$random}};
//  assign io_rocc_iptw_status_zero1 = {1{$random}};
//  assign io_rocc_iptw_status_sd_rv32 = {1{$random}};
//  assign io_rocc_iptw_status_zero2 = {1{$random}};
//  assign io_rocc_iptw_status_sd = {1{$random}};
//  assign io_rocc_iptw_resp_bits_pte_v = {1{$random}};
//  assign io_rocc_iptw_resp_bits_pte_typ = {1{$random}};
//  assign io_rocc_iptw_resp_bits_pte_r = {1{$random}};
//  assign io_rocc_iptw_resp_bits_pte_d = {1{$random}};
//  assign io_rocc_iptw_resp_bits_pte_reserved_for_software = {1{$random}};
//  assign io_rocc_iptw_resp_bits_pte_ppn = {1{$random}};
//  assign io_rocc_iptw_resp_bits_error = {1{$random}};
//  assign io_rocc_iptw_resp_valid = {1{$random}};
//  assign io_rocc_iptw_req_ready = {1{$random}};
//  assign io_rocc_dmem_grant_bits_g_type = {1{$random}};
//  assign io_rocc_dmem_grant_bits_is_builtin_type = {1{$random}};
//  assign io_rocc_dmem_grant_bits_manager_xact_id = {1{$random}};
//  assign io_rocc_dmem_grant_bits_client_xact_id = {1{$random}};
//  assign io_rocc_dmem_grant_bits_data = {4{$random}};
//  assign io_rocc_dmem_grant_bits_addr_beat = {1{$random}};
//  assign io_rocc_dmem_grant_valid = {1{$random}};
//  assign io_rocc_dmem_acquire_ready = {1{$random}};
//  assign io_rocc_imem_grant_bits_g_type = {1{$random}};
//  assign io_rocc_imem_grant_bits_is_builtin_type = {1{$random}};
//  assign io_rocc_imem_grant_bits_manager_xact_id = {1{$random}};
//  assign io_rocc_imem_grant_bits_client_xact_id = {1{$random}};
//  assign io_rocc_imem_grant_bits_data = {4{$random}};
//  assign io_rocc_imem_grant_bits_addr_beat = {1{$random}};
//  assign io_rocc_imem_grant_valid = {1{$random}};
//  assign io_rocc_imem_acquire_ready = {1{$random}};
//  assign io_rocc_s = {1{$random}};
//  assign io_rocc_mem_ordered = {1{$random}};
//  assign io_rocc_mem_xcpt_pf_st = {1{$random}};
//  assign io_rocc_mem_xcpt_pf_ld = {1{$random}};
//  assign io_rocc_mem_xcpt_ma_st = {1{$random}};
//  assign io_rocc_mem_xcpt_ma_ld = {1{$random}};
//  assign io_rocc_mem_replay_next_bits = {1{$random}};
//  assign io_rocc_mem_replay_next_valid = {1{$random}};
//  assign io_rocc_mem_resp_bits_store_data = {1{$random}};
//  assign io_rocc_mem_resp_bits_data_subword = {1{$random}};
//  assign io_rocc_mem_resp_bits_has_data = {1{$random}};
//  assign io_rocc_mem_resp_bits_replay = {1{$random}};
//  assign io_rocc_mem_resp_bits_nack = {1{$random}};
//  assign io_rocc_mem_resp_bits_data = {1{$random}};
//  assign io_rocc_mem_resp_bits_typ = {1{$random}};
//  assign io_rocc_mem_resp_bits_cmd = {1{$random}};
//  assign io_rocc_mem_resp_bits_tag = {1{$random}};
//  assign io_rocc_mem_resp_bits_addr = {2{$random}};
//  assign io_rocc_mem_resp_valid = {1{$random}};
//  assign io_rocc_mem_req_ready = {1{$random}};
//  assign io_rocc_resp_ready = {1{$random}};
//  assign io_rocc_cmd_bits_rs2 = {1{$random}};
//  assign io_rocc_cmd_bits_rs1 = {1{$random}};
//  assign io_rocc_cmd_bits_inst_opcode = {1{$random}};
//  assign io_rocc_cmd_bits_inst_rd = {1{$random}};
//  assign io_rocc_cmd_bits_inst_xs2 = {1{$random}};
//  assign io_rocc_cmd_bits_inst_xs1 = {1{$random}};
//  assign io_rocc_cmd_bits_inst_xd = {1{$random}};
//  assign io_rocc_cmd_bits_inst_rs1 = {1{$random}};
//  assign io_rocc_cmd_bits_inst_rs2 = {1{$random}};
//  assign io_rocc_cmd_bits_inst_funct = {1{$random}};
//  assign io_rocc_cmd_valid = {1{$random}};
// synthesis translate_on
`endif
  assign T1 = T2 | reset;
  assign T2 = T3 <= 4'h1;
  assign T3 = T693 + T4;
  assign T4 = {1'h0, T5};
  assign T5 = T692 + T6;
  assign T6 = {1'h0, T7};
  assign T7 = T691 + T8;
  assign T8 = {1'h0, io_csr_replay};
  assign T691 = {1'h0, csr_xcpt};
  assign csr_xcpt = T13 | insn_break;
  assign insn_break = T9 & system_insn;
  assign system_insn = io_rw_cmd == 3'h4;
  assign T9 = T11 & T10;
  assign T10 = io_rw_addr[1'h0:1'h0];
  assign T11 = T12 ^ 1'h1;
  assign T12 = io_rw_addr[4'h8:4'h8];
  assign T13 = T19 | insn_call;
  assign insn_call = T14 & system_insn;
  assign T14 = T17 & T15;
  assign T15 = T16 ^ 1'h1;
  assign T16 = io_rw_addr[1'h0:1'h0];
  assign T17 = T18 ^ 1'h1;
  assign T18 = io_rw_addr[4'h8:4'h8];
  assign T19 = T80 | T20;
  assign T20 = system_insn & T21;
  assign T21 = priv_sufficient ^ 1'h1;
  assign priv_sufficient = csr_addr_priv <= reg_mstatus_prv;
  assign T22 = reset ? 2'h3 : T23;
  assign T23 = T76 ? T75 : T24;
  assign T24 = insn_redirect_trap ? 2'h1 : T25;
  assign T25 = insn_ret ? reg_mstatus_prv1 : T26;
  assign T26 = T27 ? 2'h3 : reg_mstatus_prv;
  assign T27 = io_exception | csr_xcpt;
  assign T28 = reset ? 2'h3 : T29;
  assign T29 = T52 ? T35 : T30;
  assign T30 = insn_ret ? reg_mstatus_prv2 : T31;
  assign T31 = T27 ? reg_mstatus_prv : reg_mstatus_prv1;
  assign T32 = reset ? 2'h0 : T33;
  assign T33 = insn_ret ? 2'h0 : T34;
  assign T34 = T27 ? reg_mstatus_prv1 : reg_mstatus_prv2;
  assign T35 = wdata[3'h5:3'h4];
  assign wdata = T51 ? io_rw_wdata : T36;
  assign T36 = T50 ? T48 : T37;
  assign T37 = T47 ? T46 : host_pcr_bits_data;
  assign T38 = host_pcr_req_fire ? io_rw_rdata : T39;
  assign T39 = T40 ? io_host_pcr_req_bits_data : host_pcr_bits_data;
  assign T40 = io_host_pcr_req_ready & io_host_pcr_req_valid;
  assign host_pcr_req_fire = host_pcr_req_valid & T41;
  assign T41 = cpu_ren ^ 1'h1;
  assign cpu_ren = T43 & T42;
  assign T42 = system_insn ^ 1'h1;
  assign T43 = io_rw_cmd != 3'h0;
  assign T44 = host_pcr_req_fire ? 1'h0 : T45;
  assign T45 = T40 ? 1'h1 : host_pcr_req_valid;
  assign T46 = io_rw_rdata | io_rw_wdata;
  assign T47 = io_rw_cmd == 3'h2;
  assign T48 = io_rw_rdata & T49;
  assign T49 = ~ io_rw_wdata;
  assign T50 = io_rw_cmd == 3'h3;
  assign T51 = io_rw_cmd == 3'h1;
  assign T52 = T56 & T53;
  assign T53 = T55 | T54;
  assign T54 = 2'h0 == T35;
  assign T55 = 2'h3 == T35;
  assign T56 = wen & T57;
  assign T57 = addr == 12'h300;
  assign addr = cpu_ren ? io_rw_addr : host_pcr_bits_addr;
  assign T58 = T40 ? io_host_pcr_req_bits_addr : host_pcr_bits_addr;
  assign wen = T61 | T59;
  assign T59 = host_pcr_req_fire & host_pcr_bits_rw;
  assign T60 = T40 ? io_host_pcr_req_bits_rw : host_pcr_bits_rw;
  assign T61 = cpu_wen & T62;
  assign T62 = read_only ^ 1'h1;
  assign read_only = T63 == 2'h3;
  assign T63 = io_rw_addr[4'hb:4'ha];
  assign cpu_wen = T64 & priv_sufficient;
  assign T64 = cpu_ren & T65;
  assign T65 = io_rw_cmd != 3'h5;
  assign insn_ret = T66 & priv_sufficient;
  assign T66 = T67 & system_insn;
  assign T67 = T70 & T68;
  assign T68 = T69 ^ 1'h1;
  assign T69 = io_rw_addr[1'h0:1'h0];
  assign T70 = T73 & T71;
  assign T71 = T72 ^ 1'h1;
  assign T72 = io_rw_addr[1'h1:1'h1];
  assign T73 = io_rw_addr[4'h8:4'h8];
  assign insn_redirect_trap = maybe_insn_redirect_trap & priv_sufficient;
  assign maybe_insn_redirect_trap = T74 & system_insn;
  assign T74 = io_rw_addr[2'h2:2'h2];
  assign T75 = wdata[2'h2:1'h1];
  assign T76 = T56 & T77;
  assign T77 = T79 | T78;
  assign T78 = 2'h0 == T75;
  assign T79 = 2'h3 == T75;
  assign csr_addr_priv = io_rw_addr[4'h9:4'h8];
  assign T80 = T175 | T81;
  assign T81 = cpu_ren & T82;
  assign T82 = T90 | T83;
  assign T83 = fp_csr & T84;
  assign T84 = T85 ^ 1'h1;
  assign T85 = io_status_fs != 2'h0;
  assign fp_csr = T87 | T86;
  assign T86 = addr == 12'h3;
  assign T87 = T89 | T88;
  assign T88 = addr == 12'h2;
  assign T89 = addr == 12'h1;
  assign T90 = T174 | T91;
  assign T91 = addr_valid ^ 1'h1;
  assign addr_valid = T93 | T92;
  assign T92 = addr == 12'hccf;
  assign T93 = T95 | T94;
  assign T94 = addr == 12'hcce;
  assign T95 = T97 | T96;
  assign T96 = addr == 12'hccd;
  assign T97 = T99 | T98;
  assign T98 = addr == 12'hccc;
  assign T99 = T101 | T100;
  assign T100 = addr == 12'hccb;
  assign T101 = T103 | T102;
  assign T102 = addr == 12'hcca;
  assign T103 = T105 | T104;
  assign T104 = addr == 12'hcc9;
  assign T105 = T107 | T106;
  assign T106 = addr == 12'hcc8;
  assign T107 = T109 | T108;
  assign T108 = addr == 12'hcc7;
  assign T109 = T111 | T110;
  assign T110 = addr == 12'hcc6;
  assign T111 = T113 | T112;
  assign T112 = addr == 12'hcc5;
  assign T113 = T115 | T114;
  assign T114 = addr == 12'hcc4;
  assign T115 = T117 | T116;
  assign T116 = addr == 12'hcc3;
  assign T117 = T119 | T118;
  assign T118 = addr == 12'hcc2;
  assign T119 = T121 | T120;
  assign T120 = addr == 12'hcc1;
  assign T121 = T123 | T122;
  assign T122 = addr == 12'hcc0;
  assign T123 = T125 | T124;
  assign T124 = addr == 12'h781;
  assign T125 = T127 | T126;
  assign T126 = addr == 12'h780;
  assign T127 = T129 | T128;
  assign T128 = addr == 12'hc0;
  assign T129 = T131 | T130;
  assign T130 = addr == 12'h783;
  assign T131 = T133 | T132;
  assign T132 = addr == 12'hf10;
  assign T133 = T135 | T134;
  assign T134 = addr == 12'h121;
  assign T135 = T137 | T136;
  assign T136 = addr == 12'h342;
  assign T137 = T139 | T138;
  assign T138 = addr == 12'h343;
  assign T139 = T141 | T140;
  assign T140 = addr == 12'h341;
  assign T141 = T143 | T142;
  assign T142 = addr == 12'h340;
  assign T143 = T145 | T144;
  assign T144 = addr == 12'h304;
  assign T145 = T147 | T146;
  assign T146 = addr == 12'h344;
  assign T147 = T149 | T148;
  assign T148 = addr == 12'h301;
  assign T149 = T151 | T150;
  assign T150 = addr == 12'h302;
  assign T151 = T152 | T57;
  assign T152 = T154 | T153;
  assign T153 = addr == 12'hf01;
  assign T154 = T156 | T155;
  assign T155 = addr == 12'hf00;
  assign T156 = T158 | T157;
  assign T157 = addr == 12'ha01;
  assign T158 = T160 | T159;
  assign T159 = addr == 12'hd01;
  assign T160 = T162 | T161;
  assign T161 = addr == 12'h901;
  assign T162 = T164 | T163;
  assign T163 = addr == 12'hc01;
  assign T164 = T166 | T165;
  assign T165 = addr == 12'h902;
  assign T166 = T168 | T167;
  assign T167 = addr == 12'hc02;
  assign T168 = T170 | T169;
  assign T169 = addr == 12'h900;
  assign T170 = T172 | T171;
  assign T171 = addr == 12'hc00;
  assign T172 = T173 | T86;
  assign T173 = T89 | T88;
  assign T174 = priv_sufficient ^ 1'h1;
  assign T175 = cpu_wen & read_only;
  assign T692 = {2'h0, io_exception};
  assign T693 = {2'h0, T176};
  assign T176 = T694 + T177;
  assign T177 = {1'h0, insn_redirect_trap};
  assign T694 = {1'h0, insn_ret};
  assign io_interrupt_cause = T178;
  assign T178 = T249 ? 32'h80000002 : T179;
  assign T179 = T214 ? 32'h80000001 : T180;
  assign T180 = T201 ? 32'h80000000 : T181;
  assign T181 = T182 ? 32'h80000000 : 32'h0;
  assign T182 = T200 & T183;
  assign T183 = T199 | T184;
  assign T184 = T198 & reg_mstatus_ie;
  assign T185 = reset ? 1'h0 : T186;
  assign T186 = T56 ? T197 : T187;
  assign T187 = insn_ret ? reg_mstatus_ie1 : T188;
  assign T188 = T27 ? 1'h0 : reg_mstatus_ie;
  assign T189 = reset ? 1'h0 : T190;
  assign T190 = T56 ? T196 : T191;
  assign T191 = insn_ret ? reg_mstatus_ie2 : T192;
  assign T192 = T27 ? reg_mstatus_ie : reg_mstatus_ie1;
  assign T193 = reset ? 1'h0 : T194;
  assign T194 = insn_ret ? 1'h1 : T195;
  assign T195 = T27 ? reg_mstatus_ie1 : reg_mstatus_ie2;
  assign T196 = wdata[2'h3:2'h3];
  assign T197 = wdata[1'h0:1'h0];
  assign T198 = reg_mstatus_prv == 2'h1;
  assign T199 = reg_mstatus_prv < 2'h1;
  assign T200 = reg_mie_ssip & reg_mip_ssip;
  assign T695 = reset ? 1'h0 : reg_mip_ssip;
  assign T696 = reset ? 1'h0 : reg_mie_ssip;
  assign T201 = T206 & T202;
  assign T202 = T205 | T203;
  assign T203 = T204 & reg_mstatus_ie;
  assign T204 = reg_mstatus_prv == 2'h3;
  assign T205 = reg_mstatus_prv < 2'h3;
  assign T206 = reg_mie_msip & reg_mip_msip;
  assign T697 = reset ? 1'h0 : T207;
  assign T207 = io_host_ipi_rep_valid ? 1'h1 : T208;
  assign T208 = T210 ? T209 : reg_mip_msip;
  assign T209 = wdata[2'h3:2'h3];
  assign T210 = wen & T146;
  assign T698 = reset ? 1'h0 : T211;
  assign T211 = T213 ? T212 : reg_mie_msip;
  assign T212 = wdata[2'h3:2'h3];
  assign T213 = wen & T144;
  assign T214 = T219 & T215;
  assign T215 = T218 | T216;
  assign T216 = T217 & reg_mstatus_ie;
  assign T217 = reg_mstatus_prv == 2'h1;
  assign T218 = reg_mstatus_prv < 2'h1;
  assign T219 = reg_mie_stip & reg_mip_stip;
  assign T699 = reset ? 1'h0 : T220;
  assign T220 = T248 ? 1'h0 : T221;
  assign T221 = T222 ? 1'h1 : reg_mip_stip;
  assign T222 = T224 == reg_stimecmp;
  assign T223 = T248 ? wdata : reg_stimecmp;
  assign T224 = T225[5'h1f:1'h0];
  assign T225 = {R238, R226};
  assign T700 = reset ? 5'h0 : T227;
  assign T227 = T237 ? T236 : T228;
  assign T228 = T235 ? T234 : T229;
  assign T229 = T233 ? T232 : T230;
  assign T230 = T231[3'h4:1'h0];
  assign T231 = T701 + 6'h1;
  assign T701 = {1'h0, R226};
  assign T232 = wdata[3'h4:1'h0];
  assign T233 = wen & T169;
  assign T234 = wdata[3'h4:1'h0];
  assign T235 = wen & T161;
  assign T236 = wdata[3'h4:1'h0];
  assign T237 = wen & T157;
  assign T702 = reset ? 27'h0 : T239;
  assign T239 = T237 ? T247 : T240;
  assign T240 = T235 ? T246 : T241;
  assign T241 = T233 ? T245 : T242;
  assign T242 = T244 ? T243 : R238;
  assign T243 = R238 + 27'h1;
  assign T244 = T231[3'h5:3'h5];
  assign T245 = wdata[5'h1f:3'h5];
  assign T246 = wdata[5'h1f:3'h5];
  assign T247 = wdata[5'h1f:3'h5];
  assign T248 = wen & T134;
  assign T703 = reset ? 1'h0 : reg_mie_stip;
  assign T249 = T254 & T250;
  assign T250 = T253 | T251;
  assign T251 = T252 & reg_mstatus_ie;
  assign T252 = reg_mstatus_prv == 2'h3;
  assign T253 = reg_mstatus_prv < 2'h3;
  assign T254 = reg_fromhost != 32'h0;
  assign T704 = reset ? 32'h0 : T255;
  assign T255 = T256 ? wdata : reg_fromhost;
  assign T256 = T260 & T257;
  assign T257 = T259 | T258;
  assign T258 = host_pcr_req_fire ^ 1'h1;
  assign T259 = reg_fromhost == 32'h0;
  assign T260 = wen & T124;
  assign io_interrupt = T261;
  assign T261 = io_interrupt_cause[5'h1f:5'h1f];
  assign io_fcsr_rm = reg_frm;
  assign T705 = T262[2'h2:1'h0];
  assign T262 = T266 ? T707 : T263;
  assign T263 = T264 ? wdata : T706;
  assign T706 = {29'h0, reg_frm};
  assign T264 = wen & T88;
  assign T707 = {5'h0, T265};
  assign T265 = wdata >> 3'h5;
  assign T266 = wen & T86;
  assign io_time = T225;
  assign io_fatc = insn_sfence_vm;
  assign insn_sfence_vm = T267 & priv_sufficient;
  assign T267 = T268 & system_insn;
  assign T268 = T270 & T269;
  assign T269 = io_rw_addr[1'h0:1'h0];
  assign T270 = T273 & T271;
  assign T271 = T272 ^ 1'h1;
  assign T272 = io_rw_addr[1'h1:1'h1];
  assign T273 = io_rw_addr[4'h8:4'h8];
  assign io_evec = T274;
  assign T274 = T289 ? T708 : T275;
  assign T275 = maybe_insn_redirect_trap ? reg_stvec : T276;
  assign T276 = T284 ? reg_mepc : reg_sepc;
  assign T277 = insn_redirect_trap ? reg_mepc : reg_sepc;
  assign T278 = T283 ? T281 : T279;
  assign T279 = T27 ? T280 : reg_mepc;
  assign T280 = io_pc & 32'hfffffffc;
  assign T281 = T282 & 32'hfffffffc;
  assign T282 = wdata;
  assign T283 = wen & T140;
  assign T284 = reg_mstatus_prv[1'h1:1'h1];
  assign T708 = {23'h0, T287};
  assign T287 = T709 + 9'h100;
  assign T709 = {1'h0, T288};
  assign T288 = reg_mstatus_prv << 3'h6;
  assign T289 = io_exception | csr_xcpt;
  assign io_ptbr = reg_sptbr;
  assign io_status_ie = reg_mstatus_ie;
  assign io_status_prv = reg_mstatus_prv;
  assign io_status_ie1 = reg_mstatus_ie1;
  assign io_status_prv1 = reg_mstatus_prv1;
  assign io_status_ie2 = reg_mstatus_ie2;
  assign io_status_prv2 = reg_mstatus_prv2;
  assign io_status_ie3 = reg_mstatus_ie3;
  assign T290 = reset ? 1'h0 : reg_mstatus_ie3;
  assign io_status_prv3 = reg_mstatus_prv3;
  assign T291 = reset ? 2'h0 : reg_mstatus_prv3;
  assign io_status_fs = T710;
  assign T710 = T292 ? 2'h3 : 2'h0;
  assign T292 = T293;
  assign T293 = reg_mstatus_fs != 2'h0;
  assign T294 = reset ? 2'h0 : reg_mstatus_fs;
  assign io_status_xs = T711;
  assign T711 = T295 ? 2'h3 : 2'h0;
  assign T295 = T296;
  assign T296 = reg_mstatus_xs != 2'h0;
  assign T297 = reset ? 2'h0 : reg_mstatus_xs;
  assign io_status_mprv = reg_mstatus_mprv;
  assign T298 = reset ? 1'h0 : T299;
  assign T299 = T56 ? T301 : T300;
  assign T300 = T27 ? 1'h0 : reg_mstatus_mprv;
  assign T301 = wdata[5'h10:5'h10];
  assign io_status_vm = reg_mstatus_vm;
  assign T302 = reset ? 5'h0 : reg_mstatus_vm;
  assign io_status_zero1 = reg_mstatus_zero1;
  assign T303 = reset ? 9'h0 : reg_mstatus_zero1;
  assign io_status_sd_rv32 = io_status_sd;
  assign io_status_zero2 = reg_mstatus_zero2;
  assign T304 = reset ? 31'h0 : reg_mstatus_zero2;
  assign io_status_sd = T305;
  assign T305 = T307 | T306;
  assign T306 = reg_mstatus_fs != 2'h0;
  assign T307 = reg_mstatus_xs != 2'h0;
  assign io_eret = T308;
  assign T308 = insn_ret | insn_redirect_trap;
  assign io_csr_xcpt = csr_xcpt;
  assign io_csr_stall = reg_wfi;
  assign T712 = reset ? 1'h0 : T309;
  assign T309 = some_interrupt_pending ? 1'h0 : T310;
  assign T310 = insn_wfi ? 1'h1 : reg_wfi;
  assign insn_wfi = T311 & priv_sufficient;
  assign T311 = T312 & system_insn;
  assign T312 = T315 & T313;
  assign T313 = T314 ^ 1'h1;
  assign T314 = io_rw_addr[1'h0:1'h0];
  assign T315 = T317 & T316;
  assign T316 = io_rw_addr[1'h1:1'h1];
  assign T317 = io_rw_addr[4'h8:4'h8];
  assign some_interrupt_pending = T318;
  assign T318 = T327 ? 1'h1 : T319;
  assign T319 = T325 ? 1'h1 : T320;
  assign T320 = T323 ? 1'h1 : T321;
  assign T321 = T200 & T322;
  assign T322 = reg_mstatus_prv <= 2'h1;
  assign T323 = T206 & T324;
  assign T324 = reg_mstatus_prv <= 2'h3;
  assign T325 = T219 & T326;
  assign T326 = reg_mstatus_prv <= 2'h1;
  assign T327 = T254 & T328;
  assign T328 = reg_mstatus_prv <= 2'h3;
  assign io_csr_replay = T329;
  assign T329 = io_host_ipi_req_valid & T330;
  assign T330 = io_host_ipi_req_ready ^ 1'h1;
  assign io_rw_rdata = T713;
  assign T713 = T331[5'h1f:1'h0];
  assign T331 = T344 | T714;
  assign T714 = {32'h0, T332};
  assign T332 = T92 ? T333 : 32'h0;
  assign T333 = {R339, R334};
  assign T715 = reset ? 5'h0 : T335;
  assign T335 = T338 ? T336 : R334;
  assign T336 = T337[3'h4:1'h0];
  assign T337 = T716 + 6'h1;
  assign T716 = {1'h0, R334};
  assign T338 = io_uarch_counters_15 != 1'h0;
  assign T717 = reset ? 27'h0 : T340;
  assign T340 = T342 ? T341 : R339;
  assign T341 = R339 + 27'h1;
  assign T342 = T338 & T343;
  assign T343 = T337[3'h5:3'h5];
  assign T344 = T357 | T718;
  assign T718 = {32'h0, T345};
  assign T345 = T94 ? T346 : 32'h0;
  assign T346 = {R352, R347};
  assign T719 = reset ? 5'h0 : T348;
  assign T348 = T351 ? T349 : R347;
  assign T349 = T350[3'h4:1'h0];
  assign T350 = T720 + 6'h1;
  assign T720 = {1'h0, R347};
  assign T351 = io_uarch_counters_14 != 1'h0;
  assign T721 = reset ? 27'h0 : T353;
  assign T353 = T355 ? T354 : R352;
  assign T354 = R352 + 27'h1;
  assign T355 = T351 & T356;
  assign T356 = T350[3'h5:3'h5];
  assign T357 = T370 | T722;
  assign T722 = {32'h0, T358};
  assign T358 = T96 ? T359 : 32'h0;
  assign T359 = {R365, R360};
  assign T723 = reset ? 5'h0 : T361;
  assign T361 = T364 ? T362 : R360;
  assign T362 = T363[3'h4:1'h0];
  assign T363 = T724 + 6'h1;
  assign T724 = {1'h0, R360};
  assign T364 = io_uarch_counters_13 != 1'h0;
  assign T725 = reset ? 27'h0 : T366;
  assign T366 = T368 ? T367 : R365;
  assign T367 = R365 + 27'h1;
  assign T368 = T364 & T369;
  assign T369 = T363[3'h5:3'h5];
  assign T370 = T383 | T726;
  assign T726 = {32'h0, T371};
  assign T371 = T98 ? T372 : 32'h0;
  assign T372 = {R378, R373};
  assign T727 = reset ? 5'h0 : T374;
  assign T374 = T377 ? T375 : R373;
  assign T375 = T376[3'h4:1'h0];
  assign T376 = T728 + 6'h1;
  assign T728 = {1'h0, R373};
  assign T377 = io_uarch_counters_12 != 1'h0;
  assign T729 = reset ? 27'h0 : T379;
  assign T379 = T381 ? T380 : R378;
  assign T380 = R378 + 27'h1;
  assign T381 = T377 & T382;
  assign T382 = T376[3'h5:3'h5];
  assign T383 = T396 | T730;
  assign T730 = {32'h0, T384};
  assign T384 = T100 ? T385 : 32'h0;
  assign T385 = {R391, R386};
  assign T731 = reset ? 5'h0 : T387;
  assign T387 = T390 ? T388 : R386;
  assign T388 = T389[3'h4:1'h0];
  assign T389 = T732 + 6'h1;
  assign T732 = {1'h0, R386};
  assign T390 = io_uarch_counters_11 != 1'h0;
  assign T733 = reset ? 27'h0 : T392;
  assign T392 = T394 ? T393 : R391;
  assign T393 = R391 + 27'h1;
  assign T394 = T390 & T395;
  assign T395 = T389[3'h5:3'h5];
  assign T396 = T409 | T734;
  assign T734 = {32'h0, T397};
  assign T397 = T102 ? T398 : 32'h0;
  assign T398 = {R404, R399};
  assign T735 = reset ? 5'h0 : T400;
  assign T400 = T403 ? T401 : R399;
  assign T401 = T402[3'h4:1'h0];
  assign T402 = T736 + 6'h1;
  assign T736 = {1'h0, R399};
  assign T403 = io_uarch_counters_10 != 1'h0;
  assign T737 = reset ? 27'h0 : T405;
  assign T405 = T407 ? T406 : R404;
  assign T406 = R404 + 27'h1;
  assign T407 = T403 & T408;
  assign T408 = T402[3'h5:3'h5];
  assign T409 = T422 | T738;
  assign T738 = {32'h0, T410};
  assign T410 = T104 ? T411 : 32'h0;
  assign T411 = {R417, R412};
  assign T739 = reset ? 5'h0 : T413;
  assign T413 = T416 ? T414 : R412;
  assign T414 = T415[3'h4:1'h0];
  assign T415 = T740 + 6'h1;
  assign T740 = {1'h0, R412};
  assign T416 = io_uarch_counters_9 != 1'h0;
  assign T741 = reset ? 27'h0 : T418;
  assign T418 = T420 ? T419 : R417;
  assign T419 = R417 + 27'h1;
  assign T420 = T416 & T421;
  assign T421 = T415[3'h5:3'h5];
  assign T422 = T435 | T742;
  assign T742 = {32'h0, T423};
  assign T423 = T106 ? T424 : 32'h0;
  assign T424 = {R430, R425};
  assign T743 = reset ? 5'h0 : T426;
  assign T426 = T429 ? T427 : R425;
  assign T427 = T428[3'h4:1'h0];
  assign T428 = T744 + 6'h1;
  assign T744 = {1'h0, R425};
  assign T429 = io_uarch_counters_8 != 1'h0;
  assign T745 = reset ? 27'h0 : T431;
  assign T431 = T433 ? T432 : R430;
  assign T432 = R430 + 27'h1;
  assign T433 = T429 & T434;
  assign T434 = T428[3'h5:3'h5];
  assign T435 = T448 | T746;
  assign T746 = {32'h0, T436};
  assign T436 = T108 ? T437 : 32'h0;
  assign T437 = {R443, R438};
  assign T747 = reset ? 5'h0 : T439;
  assign T439 = T442 ? T440 : R438;
  assign T440 = T441[3'h4:1'h0];
  assign T441 = T748 + 6'h1;
  assign T748 = {1'h0, R438};
  assign T442 = io_uarch_counters_7 != 1'h0;
  assign T749 = reset ? 27'h0 : T444;
  assign T444 = T446 ? T445 : R443;
  assign T445 = R443 + 27'h1;
  assign T446 = T442 & T447;
  assign T447 = T441[3'h5:3'h5];
  assign T448 = T461 | T750;
  assign T750 = {32'h0, T449};
  assign T449 = T110 ? T450 : 32'h0;
  assign T450 = {R456, R451};
  assign T751 = reset ? 5'h0 : T452;
  assign T452 = T455 ? T453 : R451;
  assign T453 = T454[3'h4:1'h0];
  assign T454 = T752 + 6'h1;
  assign T752 = {1'h0, R451};
  assign T455 = io_uarch_counters_6 != 1'h0;
  assign T753 = reset ? 27'h0 : T457;
  assign T457 = T459 ? T458 : R456;
  assign T458 = R456 + 27'h1;
  assign T459 = T455 & T460;
  assign T460 = T454[3'h5:3'h5];
  assign T461 = T474 | T754;
  assign T754 = {32'h0, T462};
  assign T462 = T112 ? T463 : 32'h0;
  assign T463 = {R469, R464};
  assign T755 = reset ? 5'h0 : T465;
  assign T465 = T468 ? T466 : R464;
  assign T466 = T467[3'h4:1'h0];
  assign T467 = T756 + 6'h1;
  assign T756 = {1'h0, R464};
  assign T468 = io_uarch_counters_5 != 1'h0;
  assign T757 = reset ? 27'h0 : T470;
  assign T470 = T472 ? T471 : R469;
  assign T471 = R469 + 27'h1;
  assign T472 = T468 & T473;
  assign T473 = T467[3'h5:3'h5];
  assign T474 = T487 | T758;
  assign T758 = {32'h0, T475};
  assign T475 = T114 ? T476 : 32'h0;
  assign T476 = {R482, R477};
  assign T759 = reset ? 5'h0 : T478;
  assign T478 = T481 ? T479 : R477;
  assign T479 = T480[3'h4:1'h0];
  assign T480 = T760 + 6'h1;
  assign T760 = {1'h0, R477};
  assign T481 = io_uarch_counters_4 != 1'h0;
  assign T761 = reset ? 27'h0 : T483;
  assign T483 = T485 ? T484 : R482;
  assign T484 = R482 + 27'h1;
  assign T485 = T481 & T486;
  assign T486 = T480[3'h5:3'h5];
  assign T487 = T500 | T762;
  assign T762 = {32'h0, T488};
  assign T488 = T116 ? T489 : 32'h0;
  assign T489 = {R495, R490};
  assign T763 = reset ? 5'h0 : T491;
  assign T491 = T494 ? T492 : R490;
  assign T492 = T493[3'h4:1'h0];
  assign T493 = T764 + 6'h1;
  assign T764 = {1'h0, R490};
  assign T494 = io_uarch_counters_3 != 1'h0;
  assign T765 = reset ? 27'h0 : T496;
  assign T496 = T498 ? T497 : R495;
  assign T497 = R495 + 27'h1;
  assign T498 = T494 & T499;
  assign T499 = T493[3'h5:3'h5];
  assign T500 = T513 | T766;
  assign T766 = {32'h0, T501};
  assign T501 = T118 ? T502 : 32'h0;
  assign T502 = {R508, R503};
  assign T767 = reset ? 5'h0 : T504;
  assign T504 = T507 ? T505 : R503;
  assign T505 = T506[3'h4:1'h0];
  assign T506 = T768 + 6'h1;
  assign T768 = {1'h0, R503};
  assign T507 = io_uarch_counters_2 != 1'h0;
  assign T769 = reset ? 27'h0 : T509;
  assign T509 = T511 ? T510 : R508;
  assign T510 = R508 + 27'h1;
  assign T511 = T507 & T512;
  assign T512 = T506[3'h5:3'h5];
  assign T513 = T526 | T770;
  assign T770 = {32'h0, T514};
  assign T514 = T120 ? T515 : 32'h0;
  assign T515 = {R521, R516};
  assign T771 = reset ? 5'h0 : T517;
  assign T517 = T520 ? T518 : R516;
  assign T518 = T519[3'h4:1'h0];
  assign T519 = T772 + 6'h1;
  assign T772 = {1'h0, R516};
  assign T520 = io_uarch_counters_1 != 1'h0;
  assign T773 = reset ? 27'h0 : T522;
  assign T522 = T524 ? T523 : R521;
  assign T523 = R521 + 27'h1;
  assign T524 = T520 & T525;
  assign T525 = T519[3'h5:3'h5];
  assign T526 = T539 | T774;
  assign T774 = {32'h0, T527};
  assign T527 = T122 ? T528 : 32'h0;
  assign T528 = {R534, R529};
  assign T775 = reset ? 5'h0 : T530;
  assign T530 = T533 ? T531 : R529;
  assign T531 = T532[3'h4:1'h0];
  assign T532 = T776 + 6'h1;
  assign T776 = {1'h0, R529};
  assign T533 = io_uarch_counters_0 != 1'h0;
  assign T777 = reset ? 27'h0 : T535;
  assign T535 = T537 ? T536 : R534;
  assign T536 = R534 + 27'h1;
  assign T537 = T533 & T538;
  assign T538 = T532[3'h5:3'h5];
  assign T539 = T541 | T778;
  assign T778 = {32'h0, T540};
  assign T540 = T124 ? reg_fromhost : 32'h0;
  assign T541 = T552 | T779;
  assign T779 = {32'h0, T542};
  assign T542 = T126 ? reg_tohost : 32'h0;
  assign T780 = reset ? 32'h0 : T543;
  assign T543 = T548 ? wdata : T544;
  assign T544 = T545 ? 32'h0 : reg_tohost;
  assign T545 = T546 & T126;
  assign T546 = host_pcr_req_fire & T547;
  assign T547 = host_pcr_bits_rw ^ 1'h1;
  assign T548 = T551 & T549;
  assign T549 = T550 | host_pcr_req_fire;
  assign T550 = reg_tohost == 32'h0;
  assign T551 = wen & T126;
  assign T552 = T557 | T781;
  assign T781 = {63'h0, T553};
  assign T553 = T128 ? reg_stats : 1'h0;
  assign T782 = reset ? 1'h0 : T554;
  assign T554 = T556 ? T555 : reg_stats;
  assign T555 = wdata[1'h0:1'h0];
  assign T556 = wen & T128;
  assign T557 = T559 | T783;
  assign T783 = {63'h0, T558};
  assign T558 = T130 ? io_host_id : 1'h0;
  assign T559 = T561 | T784;
  assign T784 = {63'h0, T560};
  assign T560 = T132 ? io_host_id : 1'h0;
  assign T561 = T563 | T785;
  assign T785 = {32'h0, T562};
  assign T562 = T134 ? reg_stimecmp : 32'h0;
  assign T563 = T576 | T786;
  assign T786 = {32'h0, T564};
  assign T564 = T136 ? reg_mcause : 32'h0;
  assign T565 = T575 ? T574 : T566;
  assign T566 = T573 ? T787 : T567;
  assign T567 = T571 ? 32'h3 : T568;
  assign T568 = T570 ? 32'h2 : T569;
  assign T569 = T27 ? io_cause : reg_mcause;
  assign T570 = T27 & csr_xcpt;
  assign T571 = T570 & insn_break;
  assign T787 = {28'h0, T572};
  assign T572 = T788 + 4'h8;
  assign T788 = {2'h0, reg_mstatus_prv};
  assign T573 = T570 & insn_call;
  assign T574 = wdata & 32'h8000001f;
  assign T575 = wen & T136;
  assign T576 = T599 | T789;
  assign T789 = {32'h0, T577};
  assign T577 = T138 ? reg_mbadaddr : 32'h0;
  assign T790 = T579[5'h1f:1'h0];
  assign T579 = T597 ? T793 : T580;
  assign T580 = T589 ? T792 : T791;
  assign T791 = {1'h0, T581};
  assign T581 = T27 ? io_pc : reg_mbadaddr;
  assign T792 = {1'h0, io_rw_wdata};
  assign T589 = T27 & T590;
  assign T590 = T592 | T591;
  assign T591 = io_cause == 32'h6;
  assign T592 = T594 | T593;
  assign T593 = io_cause == 32'h7;
  assign T594 = T596 | T595;
  assign T595 = io_cause == 32'h4;
  assign T596 = io_cause == 32'h5;
  assign T793 = {1'h0, wdata};
  assign T597 = wen & T138;
  assign T599 = T603 | T794;
  assign T794 = {32'h0, T600};
  assign T600 = T140 ? reg_mepc : 32'h0;
  assign T603 = T607 | T795;
  assign T795 = {32'h0, T604};
  assign T604 = T142 ? reg_mscratch : 32'h0;
  assign T605 = T606 ? wdata : reg_mscratch;
  assign T606 = wen & T142;
  assign T607 = T619 | T796;
  assign T796 = {56'h0, T608};
  assign T608 = T144 ? T609 : 8'h0;
  assign T609 = T610;
  assign T610 = {T614, T611};
  assign T611 = {T613, T612};
  assign T612 = {reg_mie_ssip, reg_mie_usip};
  assign T797 = reset ? 1'h0 : reg_mie_usip;
  assign T613 = {reg_mie_msip, reg_mie_hsip};
  assign T798 = reset ? 1'h0 : reg_mie_hsip;
  assign T614 = {T616, T615};
  assign T615 = {reg_mie_stip, reg_mie_utip};
  assign T799 = reset ? 1'h0 : reg_mie_utip;
  assign T616 = {reg_mie_mtip, reg_mie_htip};
  assign T800 = reset ? 1'h0 : reg_mie_htip;
  assign T801 = reset ? 1'h0 : T617;
  assign T617 = T213 ? T618 : reg_mie_mtip;
  assign T618 = wdata[3'h7:3'h7];
  assign T619 = T629 | T802;
  assign T802 = {56'h0, T620};
  assign T620 = T146 ? T621 : 8'h0;
  assign T621 = T622;
  assign T622 = {T626, T623};
  assign T623 = {T625, T624};
  assign T624 = {reg_mip_ssip, reg_mip_usip};
  assign T803 = reset ? 1'h0 : reg_mip_usip;
  assign T625 = {reg_mip_msip, reg_mip_hsip};
  assign T804 = reset ? 1'h0 : reg_mip_hsip;
  assign T626 = {T628, T627};
  assign T627 = {reg_mip_stip, reg_mip_utip};
  assign T805 = reset ? 1'h0 : reg_mip_utip;
  assign T628 = {reg_mip_mtip, reg_mip_htip};
  assign T806 = reset ? 1'h0 : reg_mip_htip;
  assign T807 = reset ? 1'h0 : reg_mip_mtip;
  assign T629 = T631 | T808;
  assign T808 = {55'h0, T630};
  assign T630 = T148 ? 9'h100 : 9'h0;
  assign T631 = T632 | 64'h0;
  assign T632 = T809 | T633;
  assign T633 = T57 ? read_mstatus : 64'h0;
  assign read_mstatus = T634;
  assign T634 = {T642, T635};
  assign T635 = {T639, T636};
  assign T636 = {T638, T637};
  assign T637 = {io_status_prv, io_status_ie};
  assign T638 = {io_status_prv1, io_status_ie1};
  assign T639 = {T641, T640};
  assign T640 = {io_status_prv2, io_status_ie2};
  assign T641 = {io_status_prv3, io_status_ie3};
  assign T642 = {T646, T643};
  assign T643 = {T645, T644};
  assign T644 = {io_status_xs, io_status_fs};
  assign T645 = {io_status_vm, io_status_mprv};
  assign T646 = {T648, T647};
  assign T647 = {io_status_sd_rv32, io_status_zero1};
  assign T648 = {io_status_sd, io_status_zero2};
  assign T809 = {32'h0, T649};
  assign T649 = T650 | T810;
  assign T810 = {31'h0, T153};
  assign T650 = T652 | T811;
  assign T811 = {19'h0, T651};
  assign T651 = T155 ? 13'h1101 : 13'h0;
  assign T652 = T654 | T653;
  assign T653 = T157 ? T225 : 32'h0;
  assign T654 = T656 | T655;
  assign T655 = T159 ? T225 : 32'h0;
  assign T656 = T658 | T657;
  assign T657 = T161 ? T225 : 32'h0;
  assign T658 = T660 | T659;
  assign T659 = T163 ? T225 : 32'h0;
  assign T660 = T678 | T661;
  assign T661 = T165 ? T662 : 32'h0;
  assign T662 = {R671, R663};
  assign T812 = reset ? 5'h0 : T664;
  assign T664 = T670 ? T669 : T665;
  assign T665 = T668 ? T666 : R663;
  assign T666 = T667[3'h4:1'h0];
  assign T667 = T813 + 6'h1;
  assign T813 = {1'h0, R663};
  assign T668 = io_retire != 1'h0;
  assign T669 = wdata[3'h4:1'h0];
  assign T670 = wen & T165;
  assign T814 = reset ? 27'h0 : T672;
  assign T672 = T670 ? T677 : T673;
  assign T673 = T675 ? T674 : R671;
  assign T674 = R671 + 27'h1;
  assign T675 = T668 & T676;
  assign T676 = T667[3'h5:3'h5];
  assign T677 = wdata[5'h1f:3'h5];
  assign T678 = T680 | T679;
  assign T679 = T167 ? T662 : 32'h0;
  assign T680 = T682 | T681;
  assign T681 = T169 ? T225 : 32'h0;
  assign T682 = 32'h0 | T683;
  assign T683 = T171 ? T225 : 32'h0;
  assign io_host_debug_stats_pcr = reg_stats;
  assign io_host_ipi_rep_ready = 1'h1;
  assign io_host_ipi_req_bits = T815;
  assign T815 = io_rw_wdata[1'h0:1'h0];
  assign io_host_ipi_req_valid = T684;
  assign T684 = cpu_wen & T130;
  assign io_host_pcr_rep_bits = host_pcr_bits_data;
  assign io_host_pcr_rep_valid = host_pcr_rep_valid;
  assign T685 = T687 ? 1'h0 : T686;
  assign T686 = host_pcr_req_fire ? 1'h1 : host_pcr_rep_valid;
  assign T687 = io_host_pcr_rep_ready & io_host_pcr_rep_valid;
  assign io_host_pcr_req_ready = T688;
  assign T688 = T690 & T689;
  assign T689 = host_pcr_rep_valid ^ 1'h1;
  assign T690 = host_pcr_req_valid ^ 1'h1;

  always @(posedge clk) begin
`ifndef SYNTHESIS
// synthesis translate_off
  if(reset) T0 <= 1'b1;
  if(!T1 && T0 && !reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "these conditions must be mutually exclusive");
    $finish;
  end
// synthesis translate_on
`endif
    if(reset) begin
      reg_mstatus_prv <= 2'h3;
    end else if(T76) begin
      reg_mstatus_prv <= T75;
    end else if(insn_redirect_trap) begin
      reg_mstatus_prv <= 2'h1;
    end else if(insn_ret) begin
      reg_mstatus_prv <= reg_mstatus_prv1;
    end else if(T27) begin
      reg_mstatus_prv <= 2'h3;
    end
    if(reset) begin
      reg_mstatus_prv1 <= 2'h3;
    end else if(T52) begin
      reg_mstatus_prv1 <= T35;
    end else if(insn_ret) begin
      reg_mstatus_prv1 <= reg_mstatus_prv2;
    end else if(T27) begin
      reg_mstatus_prv1 <= reg_mstatus_prv;
    end
    if(reset) begin
      reg_mstatus_prv2 <= 2'h0;
    end else if(insn_ret) begin
      reg_mstatus_prv2 <= 2'h0;
    end else if(T27) begin
      reg_mstatus_prv2 <= reg_mstatus_prv1;
    end
    if(host_pcr_req_fire) begin
      host_pcr_bits_data <= io_rw_rdata;
    end else if(T40) begin
      host_pcr_bits_data <= io_host_pcr_req_bits_data;
    end
    if(host_pcr_req_fire) begin
      host_pcr_req_valid <= 1'h0;
    end else if(T40) begin
      host_pcr_req_valid <= 1'h1;
    end
    if(T40) begin
      host_pcr_bits_addr <= io_host_pcr_req_bits_addr;
    end
    if(T40) begin
      host_pcr_bits_rw <= io_host_pcr_req_bits_rw;
    end
    if(reset) begin
      reg_mstatus_ie <= 1'h0;
    end else if(T56) begin
      reg_mstatus_ie <= T197;
    end else if(insn_ret) begin
      reg_mstatus_ie <= reg_mstatus_ie1;
    end else if(T27) begin
      reg_mstatus_ie <= 1'h0;
    end
    if(reset) begin
      reg_mstatus_ie1 <= 1'h0;
    end else if(T56) begin
      reg_mstatus_ie1 <= T196;
    end else if(insn_ret) begin
      reg_mstatus_ie1 <= reg_mstatus_ie2;
    end else if(T27) begin
      reg_mstatus_ie1 <= reg_mstatus_ie;
    end
    if(reset) begin
      reg_mstatus_ie2 <= 1'h0;
    end else if(insn_ret) begin
      reg_mstatus_ie2 <= 1'h1;
    end else if(T27) begin
      reg_mstatus_ie2 <= reg_mstatus_ie1;
    end
    if(reset) begin
      reg_mip_ssip <= 1'h0;
    end
    if(reset) begin
      reg_mie_ssip <= 1'h0;
    end
    if(reset) begin
      reg_mip_msip <= 1'h0;
    end else if(io_host_ipi_rep_valid) begin
      reg_mip_msip <= 1'h1;
    end else if(T210) begin
      reg_mip_msip <= T209;
    end
    if(reset) begin
      reg_mie_msip <= 1'h0;
    end else if(T213) begin
      reg_mie_msip <= T212;
    end
    if(reset) begin
      reg_mip_stip <= 1'h0;
    end else if(T248) begin
      reg_mip_stip <= 1'h0;
    end else if(T222) begin
      reg_mip_stip <= 1'h1;
    end
    if(T248) begin
      reg_stimecmp <= wdata;
    end
    if(reset) begin
      R226 <= 5'h0;
    end else if(T237) begin
      R226 <= T236;
    end else if(T235) begin
      R226 <= T234;
    end else if(T233) begin
      R226 <= T232;
    end else begin
      R226 <= T230;
    end
    if(reset) begin
      R238 <= 27'h0;
    end else if(T237) begin
      R238 <= T247;
    end else if(T235) begin
      R238 <= T246;
    end else if(T233) begin
      R238 <= T245;
    end else if(T244) begin
      R238 <= T243;
    end
    if(reset) begin
      reg_mie_stip <= 1'h0;
    end
    if(reset) begin
      reg_fromhost <= 32'h0;
    end else if(T256) begin
      reg_fromhost <= wdata;
    end
    reg_frm <= T705;
    if(insn_redirect_trap) begin
      reg_sepc <= reg_mepc;
    end
    if(T283) begin
      reg_mepc <= T281;
    end else if(T27) begin
      reg_mepc <= T280;
    end
    reg_stvec <= reg_stvec;
    reg_sptbr <= reg_sptbr;
    if(reset) begin
      reg_mstatus_ie3 <= 1'h0;
    end
    if(reset) begin
      reg_mstatus_prv3 <= 2'h0;
    end
    if(reset) begin
      reg_mstatus_fs <= 2'h0;
    end
    if(reset) begin
      reg_mstatus_xs <= 2'h0;
    end
    if(reset) begin
      reg_mstatus_mprv <= 1'h0;
    end else if(T56) begin
      reg_mstatus_mprv <= T301;
    end else if(T27) begin
      reg_mstatus_mprv <= 1'h0;
    end
    if(reset) begin
      reg_mstatus_vm <= 5'h0;
    end
    if(reset) begin
      reg_mstatus_zero1 <= 9'h0;
    end
    if(reset) begin
      reg_mstatus_zero2 <= 31'h0;
    end
    if(reset) begin
      reg_wfi <= 1'h0;
    end else if(some_interrupt_pending) begin
      reg_wfi <= 1'h0;
    end else if(insn_wfi) begin
      reg_wfi <= 1'h1;
    end
    if(reset) begin
      R334 <= 5'h0;
    end else if(T338) begin
      R334 <= T336;
    end
    if(reset) begin
      R339 <= 27'h0;
    end else if(T342) begin
      R339 <= T341;
    end
    if(reset) begin
      R347 <= 5'h0;
    end else if(T351) begin
      R347 <= T349;
    end
    if(reset) begin
      R352 <= 27'h0;
    end else if(T355) begin
      R352 <= T354;
    end
    if(reset) begin
      R360 <= 5'h0;
    end else if(T364) begin
      R360 <= T362;
    end
    if(reset) begin
      R365 <= 27'h0;
    end else if(T368) begin
      R365 <= T367;
    end
    if(reset) begin
      R373 <= 5'h0;
    end else if(T377) begin
      R373 <= T375;
    end
    if(reset) begin
      R378 <= 27'h0;
    end else if(T381) begin
      R378 <= T380;
    end
    if(reset) begin
      R386 <= 5'h0;
    end else if(T390) begin
      R386 <= T388;
    end
    if(reset) begin
      R391 <= 27'h0;
    end else if(T394) begin
      R391 <= T393;
    end
    if(reset) begin
      R399 <= 5'h0;
    end else if(T403) begin
      R399 <= T401;
    end
    if(reset) begin
      R404 <= 27'h0;
    end else if(T407) begin
      R404 <= T406;
    end
    if(reset) begin
      R412 <= 5'h0;
    end else if(T416) begin
      R412 <= T414;
    end
    if(reset) begin
      R417 <= 27'h0;
    end else if(T420) begin
      R417 <= T419;
    end
    if(reset) begin
      R425 <= 5'h0;
    end else if(T429) begin
      R425 <= T427;
    end
    if(reset) begin
      R430 <= 27'h0;
    end else if(T433) begin
      R430 <= T432;
    end
    if(reset) begin
      R438 <= 5'h0;
    end else if(T442) begin
      R438 <= T440;
    end
    if(reset) begin
      R443 <= 27'h0;
    end else if(T446) begin
      R443 <= T445;
    end
    if(reset) begin
      R451 <= 5'h0;
    end else if(T455) begin
      R451 <= T453;
    end
    if(reset) begin
      R456 <= 27'h0;
    end else if(T459) begin
      R456 <= T458;
    end
    if(reset) begin
      R464 <= 5'h0;
    end else if(T468) begin
      R464 <= T466;
    end
    if(reset) begin
      R469 <= 27'h0;
    end else if(T472) begin
      R469 <= T471;
    end
    if(reset) begin
      R477 <= 5'h0;
    end else if(T481) begin
      R477 <= T479;
    end
    if(reset) begin
      R482 <= 27'h0;
    end else if(T485) begin
      R482 <= T484;
    end
    if(reset) begin
      R490 <= 5'h0;
    end else if(T494) begin
      R490 <= T492;
    end
    if(reset) begin
      R495 <= 27'h0;
    end else if(T498) begin
      R495 <= T497;
    end
    if(reset) begin
      R503 <= 5'h0;
    end else if(T507) begin
      R503 <= T505;
    end
    if(reset) begin
      R508 <= 27'h0;
    end else if(T511) begin
      R508 <= T510;
    end
    if(reset) begin
      R516 <= 5'h0;
    end else if(T520) begin
      R516 <= T518;
    end
    if(reset) begin
      R521 <= 27'h0;
    end else if(T524) begin
      R521 <= T523;
    end
    if(reset) begin
      R529 <= 5'h0;
    end else if(T533) begin
      R529 <= T531;
    end
    if(reset) begin
      R534 <= 27'h0;
    end else if(T537) begin
      R534 <= T536;
    end
    if(reset) begin
      reg_tohost <= 32'h0;
    end else if(T548) begin
      reg_tohost <= wdata;
    end else if(T545) begin
      reg_tohost <= 32'h0;
    end
    if(reset) begin
      reg_stats <= 1'h0;
    end else if(T556) begin
      reg_stats <= T555;
    end
    if(T575) begin
      reg_mcause <= T574;
    end else if(T573) begin
      reg_mcause <= T787;
    end else if(T571) begin
      reg_mcause <= 32'h3;
    end else if(T570) begin
      reg_mcause <= 32'h2;
    end else if(T27) begin
      reg_mcause <= io_cause;
    end
    reg_mbadaddr <= T790;
    if(T606) begin
      reg_mscratch <= wdata;
    end
    if(reset) begin
      reg_mie_usip <= 1'h0;
    end
    if(reset) begin
      reg_mie_hsip <= 1'h0;
    end
    if(reset) begin
      reg_mie_utip <= 1'h0;
    end
    if(reset) begin
      reg_mie_htip <= 1'h0;
    end
    if(reset) begin
      reg_mie_mtip <= 1'h0;
    end else if(T213) begin
      reg_mie_mtip <= T618;
    end
    if(reset) begin
      reg_mip_usip <= 1'h0;
    end
    if(reset) begin
      reg_mip_hsip <= 1'h0;
    end
    if(reset) begin
      reg_mip_utip <= 1'h0;
    end
    if(reset) begin
      reg_mip_htip <= 1'h0;
    end
    if(reset) begin
      reg_mip_mtip <= 1'h0;
    end
    if(reset) begin
      R663 <= 5'h0;
    end else if(T670) begin
      R663 <= T669;
    end else if(T668) begin
      R663 <= T666;
    end
    if(reset) begin
      R671 <= 27'h0;
    end else if(T670) begin
      R671 <= T677;
    end else if(T675) begin
      R671 <= T674;
    end
    if(T687) begin
      host_pcr_rep_valid <= 1'h0;
    end else if(host_pcr_req_fire) begin
      host_pcr_rep_valid <= 1'h1;
    end
  end
endmodule

module ALU(
    input [3:0] io_fn,
    input [31:0] io_in1,
    input [31:0] io_in2,
    output[31:0] io_out,
    output[31:0] io_adder_out
);

  wire[31:0] sum;
  wire[31:0] T0;
  wire[31:0] T1;
  wire T2;
  wire[31:0] T3;
  wire[31:0] T4;
  wire[31:0] T5;
  wire[31:0] T6;
  wire[31:0] T7;
  wire[31:0] T8;
  wire[31:0] T104;
  wire cmp;
  wire T9;
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
  wire[31:0] T23;
  wire T24;
  wire[31:0] T25;
  wire T26;
  wire[31:0] T27;
  wire T28;
  wire[31:0] shout_l;
  wire[31:0] T29;
  wire[31:0] T30;
  wire[30:0] T31;
  wire[31:0] T32;
  wire[31:0] T33;
  wire[31:0] T34;
  wire[29:0] T35;
  wire[31:0] T36;
  wire[31:0] T37;
  wire[31:0] T38;
  wire[27:0] T39;
  wire[31:0] T40;
  wire[31:0] T41;
  wire[31:0] T42;
  wire[23:0] T43;
  wire[31:0] T44;
  wire[31:0] T45;
  wire[31:0] T46;
  wire[15:0] T47;
  wire[31:0] T48;
  wire[31:0] T105;
  wire[15:0] T49;
  wire[31:0] T50;
  wire[31:0] T106;
  wire[23:0] T51;
  wire[31:0] T52;
  wire[31:0] T107;
  wire[27:0] T53;
  wire[31:0] T54;
  wire[31:0] T108;
  wire[29:0] T55;
  wire[31:0] T56;
  wire[31:0] T109;
  wire[30:0] T57;
  wire T58;
  wire[31:0] shout_r;
  wire[32:0] T59;
  wire[4:0] shamt;
  wire[32:0] T60;
  wire[32:0] T61;
  wire[31:0] shin;
  wire[31:0] T62;
  wire[31:0] T63;
  wire[31:0] T64;
  wire[30:0] T65;
  wire[31:0] T66;
  wire[31:0] T67;
  wire[31:0] T68;
  wire[29:0] T69;
  wire[31:0] T70;
  wire[31:0] T71;
  wire[31:0] T72;
  wire[27:0] T73;
  wire[31:0] T74;
  wire[31:0] T75;
  wire[31:0] T76;
  wire[23:0] T77;
  wire[31:0] T78;
  wire[31:0] T79;
  wire[31:0] T80;
  wire[15:0] T81;
  wire[31:0] T82;
  wire[31:0] T110;
  wire[15:0] T83;
  wire[31:0] T84;
  wire[31:0] T111;
  wire[23:0] T85;
  wire[31:0] T86;
  wire[31:0] T112;
  wire[27:0] T87;
  wire[31:0] T88;
  wire[31:0] T113;
  wire[29:0] T89;
  wire[31:0] T90;
  wire[31:0] T114;
  wire[30:0] T91;
  wire T92;
  wire T93;
  wire T94;
  wire T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire T102;
  wire T103;


  assign io_adder_out = sum;
  assign sum = io_in1 + T0;
  assign T0 = T2 ? T1 : io_in2;
  assign T1 = 32'h0 - io_in2;
  assign T2 = io_fn[2'h3:2'h3];
  assign io_out = T3;
  assign T3 = T101 ? sum : T4;
  assign T4 = T98 ? shout_r : T5;
  assign T5 = T58 ? shout_l : T6;
  assign T6 = T28 ? T27 : T7;
  assign T7 = T26 ? T25 : T8;
  assign T8 = T24 ? T23 : T104;
  assign T104 = {31'h0, cmp};
  assign cmp = T22 ^ T9;
  assign T9 = T20 ? T19 : T10;
  assign T10 = T16 ? T15 : T11;
  assign T11 = T14 ? T13 : T12;
  assign T12 = io_in1[5'h1f:5'h1f];
  assign T13 = io_in2[5'h1f:5'h1f];
  assign T14 = io_fn[1'h1:1'h1];
  assign T15 = sum[5'h1f:5'h1f];
  assign T16 = T18 == T17;
  assign T17 = io_in2[5'h1f:5'h1f];
  assign T18 = io_in1[5'h1f:5'h1f];
  assign T19 = sum == 32'h0;
  assign T20 = T21 ^ 1'h1;
  assign T21 = io_fn[2'h2:2'h2];
  assign T22 = io_fn[1'h0:1'h0];
  assign T23 = io_in1 ^ io_in2;
  assign T24 = io_fn == 4'h4;
  assign T25 = io_in1 | io_in2;
  assign T26 = io_fn == 4'h6;
  assign T27 = io_in1 & io_in2;
  assign T28 = io_fn == 4'h7;
  assign shout_l = T56 | T29;
  assign T29 = T30 & 32'haaaaaaaa;
  assign T30 = T31 << 1'h1;
  assign T31 = T32[5'h1e:1'h0];
  assign T32 = T54 | T33;
  assign T33 = T34 & 32'hcccccccc;
  assign T34 = T35 << 2'h2;
  assign T35 = T36[5'h1d:1'h0];
  assign T36 = T52 | T37;
  assign T37 = T38 & 32'hf0f0f0f0;
  assign T38 = T39 << 3'h4;
  assign T39 = T40[5'h1b:1'h0];
  assign T40 = T50 | T41;
  assign T41 = T42 & 32'hff00ff00;
  assign T42 = T43 << 4'h8;
  assign T43 = T44[5'h17:1'h0];
  assign T44 = T48 | T45;
  assign T45 = T46 & 32'hffff0000;
  assign T46 = T47 << 5'h10;
  assign T47 = shout_r[4'hf:1'h0];
  assign T48 = T105 & 32'hffff;
  assign T105 = {16'h0, T49};
  assign T49 = shout_r >> 5'h10;
  assign T50 = T106 & 32'hff00ff;
  assign T106 = {8'h0, T51};
  assign T51 = T44 >> 4'h8;
  assign T52 = T107 & 32'hf0f0f0f;
  assign T107 = {4'h0, T53};
  assign T53 = T40 >> 3'h4;
  assign T54 = T108 & 32'h33333333;
  assign T108 = {2'h0, T55};
  assign T55 = T36 >> 2'h2;
  assign T56 = T109 & 32'h55555555;
  assign T109 = {1'h0, T57};
  assign T57 = T32 >> 1'h1;
  assign T58 = io_fn == 4'h1;
  assign shout_r = T59[5'h1f:1'h0];
  assign T59 = $signed(T60) >>> shamt;
  assign shamt = io_in2[3'h4:1'h0];
  assign T60 = T61;
  assign T61 = {T95, shin};
  assign shin = T92 ? io_in1 : T62;
  assign T62 = T90 | T63;
  assign T63 = T64 & 32'haaaaaaaa;
  assign T64 = T65 << 1'h1;
  assign T65 = T66[5'h1e:1'h0];
  assign T66 = T88 | T67;
  assign T67 = T68 & 32'hcccccccc;
  assign T68 = T69 << 2'h2;
  assign T69 = T70[5'h1d:1'h0];
  assign T70 = T86 | T71;
  assign T71 = T72 & 32'hf0f0f0f0;
  assign T72 = T73 << 3'h4;
  assign T73 = T74[5'h1b:1'h0];
  assign T74 = T84 | T75;
  assign T75 = T76 & 32'hff00ff00;
  assign T76 = T77 << 4'h8;
  assign T77 = T78[5'h17:1'h0];
  assign T78 = T82 | T79;
  assign T79 = T80 & 32'hffff0000;
  assign T80 = T81 << 5'h10;
  assign T81 = io_in1[4'hf:1'h0];
  assign T82 = T110 & 32'hffff;
  assign T110 = {16'h0, T83};
  assign T83 = io_in1 >> 5'h10;
  assign T84 = T111 & 32'hff00ff;
  assign T111 = {8'h0, T85};
  assign T85 = T78 >> 4'h8;
  assign T86 = T112 & 32'hf0f0f0f;
  assign T112 = {4'h0, T87};
  assign T87 = T74 >> 3'h4;
  assign T88 = T113 & 32'h33333333;
  assign T113 = {2'h0, T89};
  assign T89 = T70 >> 2'h2;
  assign T90 = T114 & 32'h55555555;
  assign T114 = {1'h0, T91};
  assign T91 = T66 >> 1'h1;
  assign T92 = T94 | T93;
  assign T93 = io_fn == 4'hb;
  assign T94 = io_fn == 4'h5;
  assign T95 = T97 & T96;
  assign T96 = shin[5'h1f:5'h1f];
  assign T97 = io_fn[2'h3:2'h3];
  assign T98 = T100 | T99;
  assign T99 = io_fn == 4'hb;
  assign T100 = io_fn == 4'h5;
  assign T101 = T103 | T102;
  assign T102 = io_fn == 4'ha;
  assign T103 = io_fn == 4'h0;
endmodule

module MulDiv(input clk, input reset,
    output io_req_ready,
    input  io_req_valid,
    input [3:0] io_req_bits_fn,
    input  io_req_bits_dw,
    input [31:0] io_req_bits_in1,
    input [31:0] io_req_bits_in2,
    input [4:0] io_req_bits_tag,
    input  io_kill,
    input  io_resp_ready,
    output io_resp_valid,
    output[31:0] io_resp_bits_data,
    output[4:0] io_resp_bits_tag
);

  reg [4:0] req_tag;
  wire[4:0] T0;
  wire T1;
  wire[31:0] T2;
  wire[31:0] T3;
  reg [65:0] remainder;
  wire[65:0] T4;
  wire[65:0] T5;
  wire[65:0] T6;
  wire[65:0] T7;
  wire[65:0] T8;
  wire[65:0] T9;
  wire[65:0] T10;
  wire[65:0] T180;
  wire[31:0] negated_remainder;
  wire[31:0] T119;
  wire T11;
  wire T12;
  reg  isMul;
  wire T13;
  wire cmdMul;
  wire T14;
  wire[3:0] T15;
  wire T16;
  wire[3:0] T17;
  wire T18;
  wire T19;
  reg [2:0] state;
  wire[2:0] T181;
  wire[2:0] T20;
  wire[2:0] T21;
  wire[2:0] T22;
  wire[2:0] T23;
  wire[2:0] T24;
  wire[2:0] T25;
  wire[2:0] T26;
  wire[2:0] T27;
  reg  neg_out;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  reg  isHi;
  wire T33;
  wire cmdHi;
  wire T34;
  wire T35;
  wire[3:0] T36;
  wire T37;
  wire[3:0] T38;
  wire T39;
  wire T40;
  wire less;
  wire[32:0] subtractor;
  reg [32:0] divisor;
  wire[32:0] T41;
  wire[32:0] T42;
  wire T43;
  wire T44;
  wire T45;
  wire[32:0] T46;
  wire[31:0] rhs_in;
  wire[15:0] T47;
  wire[15:0] T48;
  wire[15:0] T49;
  wire[15:0] T182;
  wire[15:0] T50;
  wire T51;
  wire rhs_sign;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire rhsSigned;
  wire T56;
  wire[3:0] T57;
  wire[32:0] T58;
  wire T59;
  reg [5:0] count;
  wire[5:0] T60;
  wire[5:0] T61;
  wire[5:0] T62;
  wire[5:0] T63;
  wire[5:0] T64;
  wire[5:0] T65;
  wire[5:0] T183;
  wire[4:0] T66;
  wire[4:0] T67;
  wire[4:0] T68;
  wire[4:0] T184;
  wire[4:0] T185;
  wire[4:0] T186;
  wire[4:0] T187;
  wire[4:0] T188;
  wire[4:0] T189;
  wire[4:0] T190;
  wire[4:0] T191;
  wire[4:0] T192;
  wire[4:0] T193;
  wire[4:0] T194;
  wire[4:0] T195;
  wire[4:0] T196;
  wire[4:0] T197;
  wire[4:0] T198;
  wire[4:0] T199;
  wire[3:0] T200;
  wire[3:0] T201;
  wire[3:0] T202;
  wire[3:0] T203;
  wire[3:0] T204;
  wire[3:0] T205;
  wire[3:0] T206;
  wire[3:0] T207;
  wire[2:0] T208;
  wire[2:0] T209;
  wire[2:0] T210;
  wire[2:0] T211;
  wire[1:0] T212;
  wire[1:0] T213;
  wire T214;
  wire[31:0] T70;
  wire[31:0] T71;
  wire T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire T220;
  wire T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire T226;
  wire T227;
  wire T228;
  wire T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire T236;
  wire T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire T242;
  wire T243;
  wire T244;
  wire[4:0] T72;
  wire[4:0] T245;
  wire[4:0] T246;
  wire[4:0] T247;
  wire[4:0] T248;
  wire[4:0] T249;
  wire[4:0] T250;
  wire[4:0] T251;
  wire[4:0] T252;
  wire[4:0] T253;
  wire[4:0] T254;
  wire[4:0] T255;
  wire[4:0] T256;
  wire[4:0] T257;
  wire[4:0] T258;
  wire[4:0] T259;
  wire[4:0] T260;
  wire[3:0] T261;
  wire[3:0] T262;
  wire[3:0] T263;
  wire[3:0] T264;
  wire[3:0] T265;
  wire[3:0] T266;
  wire[3:0] T267;
  wire[3:0] T268;
  wire[2:0] T269;
  wire[2:0] T270;
  wire[2:0] T271;
  wire[2:0] T272;
  wire[1:0] T273;
  wire[1:0] T274;
  wire T275;
  wire[31:0] T74;
  wire[31:0] T75;
  wire T276;
  wire T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire T282;
  wire T283;
  wire T284;
  wire T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire T290;
  wire T291;
  wire T292;
  wire T293;
  wire T294;
  wire T295;
  wire T296;
  wire T297;
  wire T298;
  wire T299;
  wire T300;
  wire T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire T76;
  wire T77;
  wire T78;
  wire T79;
  wire lhs_sign;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire lhsSigned;
  wire T84;
  wire[3:0] T85;
  wire T86;
  wire T87;
  wire[2:0] T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire[31:0] T94;
  wire[31:0] T95;
  wire[31:0] T96;
  wire[32:0] T97;
  wire[4:0] T98;
  wire[9:0] T99;
  wire[31:0] T100;
  wire[64:0] T101;
  wire[31:0] T102;
  wire[32:0] T103;
  wire T104;
  wire T105;
  wire T106;
  wire T107;
  wire T108;
  wire[2:0] T109;
  wire[2:0] T110;
  wire T111;
  wire T112;
  wire T113;
  wire T114;
  wire[2:0] T115;
  wire T116;
  wire T117;
  wire T118;
  wire[65:0] T306;
  wire T120;
  wire[65:0] T307;
  wire[31:0] T121;
  wire T122;
  wire[65:0] T123;
  wire[65:0] T124;
  wire[32:0] T125;
  wire[31:0] T126;
  wire[64:0] T127;
  wire[31:0] T128;
  wire[64:0] T129;
  wire[64:0] T130;
  wire[64:0] T131;
  wire[23:0] T132;
  wire[40:0] T133;
  wire[40:0] T308;
  wire[32:0] T134;
  wire[32:0] T135;
  wire[7:0] T309;
  wire T310;
  wire[40:0] T136;
  wire[8:0] T137;
  wire[8:0] T138;
  wire[7:0] T139;
  wire[32:0] T140;
  wire[64:0] T141;
  wire[4:0] T142;
  wire[9:0] T143;
  wire[9:0] T144;
  wire[32:0] T145;
  wire[32:0] T146;
  wire T147;
  wire T148;
  wire[65:0] T311;
  wire[64:0] T149;
  wire[32:0] T150;
  wire T151;
  wire[31:0] T152;
  wire[31:0] T153;
  wire[31:0] T154;
  wire[31:0] T155;
  wire T156;
  wire T157;
  wire T158;
  wire[65:0] T312;
  wire[62:0] T159;
  wire[31:0] T160;
  wire T161;
  wire T162;
  wire T163;
  wire T164;
  wire T165;
  wire T166;
  wire[65:0] T313;
  wire[31:0] lhs_in;
  wire[15:0] T167;
  wire[15:0] T168;
  wire[15:0] T169;
  wire[15:0] T314;
  wire[15:0] T170;
  wire T171;
  wire[31:0] T172;
  wire[15:0] T173;
  wire[15:0] T174;
  wire[15:0] T315;
  wire T175;
  wire T176;
  reg  req_dw;
  wire T177;
  wire T178;
  wire T179;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    req_tag = {1{$random}};
    remainder = {3{$random}};
    isMul = {1{$random}};
    state = {1{$random}};
    neg_out = {1{$random}};
    isHi = {1{$random}};
    divisor = {2{$random}};
    count = {1{$random}};
    req_dw = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_resp_bits_tag = req_tag;
  assign T0 = T1 ? io_req_bits_tag : req_tag;
  assign T1 = io_req_ready & io_req_valid;
  assign io_resp_bits_data = T2;
  assign T2 = T176 ? T172 : T3;
  assign T3 = remainder[5'h1f:1'h0];
  assign T4 = T1 ? T313 : T5;
  assign T5 = T161 ? T312 : T6;
  assign T6 = T156 ? T311 : T7;
  assign T7 = T147 ? T123 : T8;
  assign T8 = T122 ? T307 : T9;
  assign T9 = T120 ? T306 : T10;
  assign T10 = T11 ? T180 : remainder;
  assign T180 = {34'h0, negated_remainder};
  assign negated_remainder = 32'h0 - T119;
  assign T119 = remainder[5'h1f:1'h0];
  assign T11 = T19 & T12;
  assign T12 = T18 | isMul;
  assign T13 = T1 ? cmdMul : isMul;
  assign cmdMul = T16 | T14;
  assign T14 = T15 == 4'h8;
  assign T15 = io_req_bits_fn & 4'h8;
  assign T16 = T17 == 4'h0;
  assign T17 = io_req_bits_fn & 4'h4;
  assign T18 = remainder[5'h1f:5'h1f];
  assign T19 = state == 3'h1;
  assign T181 = reset ? 3'h0 : T20;
  assign T20 = T1 ? T115 : T21;
  assign T21 = T113 ? 3'h0 : T22;
  assign T22 = T111 ? T109 : T23;
  assign T23 = T89 ? T88 : T24;
  assign T24 = T122 ? T27 : T25;
  assign T25 = T120 ? 3'h5 : T26;
  assign T26 = T19 ? 3'h2 : state;
  assign T27 = neg_out ? 3'h4 : 3'h5;
  assign T28 = T1 ? T77 : T29;
  assign T29 = T30 ? 1'h0 : neg_out;
  assign T30 = T156 & T31;
  assign T31 = T39 & T32;
  assign T32 = isHi ^ 1'h1;
  assign T33 = T1 ? cmdHi : isHi;
  assign cmdHi = T34 | T14;
  assign T34 = T37 | T35;
  assign T35 = T36 == 4'h2;
  assign T36 = io_req_bits_fn & 4'h2;
  assign T37 = T38 == 4'h1;
  assign T38 = io_req_bits_fn & 4'h5;
  assign T39 = T59 & T40;
  assign T40 = less ^ 1'h1;
  assign less = subtractor[6'h20:6'h20];
  assign subtractor = T58 - divisor;
  assign T41 = T1 ? T46 : T42;
  assign T42 = T43 ? subtractor : divisor;
  assign T43 = T19 & T44;
  assign T44 = T45 | isMul;
  assign T45 = divisor[5'h1f:5'h1f];
  assign T46 = {rhs_sign, rhs_in};
  assign rhs_in = {T48, T47};
  assign T47 = io_req_bits_in2[4'hf:1'h0];
  assign T48 = T51 ? T50 : T49;
  assign T49 = 16'h0 - T182;
  assign T182 = {15'h0, rhs_sign};
  assign T50 = io_req_bits_in2[5'h1f:5'h10];
  assign T51 = io_req_bits_dw == 1'h1;
  assign rhs_sign = rhsSigned & T52;
  assign T52 = T55 ? T54 : T53;
  assign T53 = io_req_bits_in2[4'hf:4'hf];
  assign T54 = io_req_bits_in2[5'h1f:5'h1f];
  assign T55 = io_req_bits_dw == 1'h1;
  assign rhsSigned = T56 | T16;
  assign T56 = T57 == 4'h0;
  assign T57 = io_req_bits_fn & 4'h9;
  assign T58 = remainder[7'h40:6'h20];
  assign T59 = count == 6'h0;
  assign T60 = T1 ? 6'h0 : T61;
  assign T61 = T161 ? T183 : T62;
  assign T62 = T156 ? T65 : T63;
  assign T63 = T147 ? T64 : count;
  assign T64 = count + 6'h1;
  assign T65 = count + 6'h1;
  assign T183 = {1'h0, T66};
  assign T66 = T76 ? 5'h1f : T67;
  assign T67 = T68[3'h4:1'h0];
  assign T68 = T72 - T184;
  assign T184 = T244 ? 5'h1f : T185;
  assign T185 = T243 ? 5'h1e : T186;
  assign T186 = T242 ? 5'h1d : T187;
  assign T187 = T241 ? 5'h1c : T188;
  assign T188 = T240 ? 5'h1b : T189;
  assign T189 = T239 ? 5'h1a : T190;
  assign T190 = T238 ? 5'h19 : T191;
  assign T191 = T237 ? 5'h18 : T192;
  assign T192 = T236 ? 5'h17 : T193;
  assign T193 = T235 ? 5'h16 : T194;
  assign T194 = T234 ? 5'h15 : T195;
  assign T195 = T233 ? 5'h14 : T196;
  assign T196 = T232 ? 5'h13 : T197;
  assign T197 = T231 ? 5'h12 : T198;
  assign T198 = T230 ? 5'h11 : T199;
  assign T199 = T229 ? 5'h10 : T200;
  assign T200 = T228 ? 4'hf : T201;
  assign T201 = T227 ? 4'he : T202;
  assign T202 = T226 ? 4'hd : T203;
  assign T203 = T225 ? 4'hc : T204;
  assign T204 = T224 ? 4'hb : T205;
  assign T205 = T223 ? 4'ha : T206;
  assign T206 = T222 ? 4'h9 : T207;
  assign T207 = T221 ? 4'h8 : T208;
  assign T208 = T220 ? 3'h7 : T209;
  assign T209 = T219 ? 3'h6 : T210;
  assign T210 = T218 ? 3'h5 : T211;
  assign T211 = T217 ? 3'h4 : T212;
  assign T212 = T216 ? 2'h3 : T213;
  assign T213 = T215 ? 2'h2 : T214;
  assign T214 = T70[1'h1:1'h1];
  assign T70 = T71[5'h1f:1'h0];
  assign T71 = remainder[5'h1f:1'h0];
  assign T215 = T70[2'h2:2'h2];
  assign T216 = T70[2'h3:2'h3];
  assign T217 = T70[3'h4:3'h4];
  assign T218 = T70[3'h5:3'h5];
  assign T219 = T70[3'h6:3'h6];
  assign T220 = T70[3'h7:3'h7];
  assign T221 = T70[4'h8:4'h8];
  assign T222 = T70[4'h9:4'h9];
  assign T223 = T70[4'ha:4'ha];
  assign T224 = T70[4'hb:4'hb];
  assign T225 = T70[4'hc:4'hc];
  assign T226 = T70[4'hd:4'hd];
  assign T227 = T70[4'he:4'he];
  assign T228 = T70[4'hf:4'hf];
  assign T229 = T70[5'h10:5'h10];
  assign T230 = T70[5'h11:5'h11];
  assign T231 = T70[5'h12:5'h12];
  assign T232 = T70[5'h13:5'h13];
  assign T233 = T70[5'h14:5'h14];
  assign T234 = T70[5'h15:5'h15];
  assign T235 = T70[5'h16:5'h16];
  assign T236 = T70[5'h17:5'h17];
  assign T237 = T70[5'h18:5'h18];
  assign T238 = T70[5'h19:5'h19];
  assign T239 = T70[5'h1a:5'h1a];
  assign T240 = T70[5'h1b:5'h1b];
  assign T241 = T70[5'h1c:5'h1c];
  assign T242 = T70[5'h1d:5'h1d];
  assign T243 = T70[5'h1e:5'h1e];
  assign T244 = T70[5'h1f:5'h1f];
  assign T72 = 5'h1f + T245;
  assign T245 = T305 ? 5'h1f : T246;
  assign T246 = T304 ? 5'h1e : T247;
  assign T247 = T303 ? 5'h1d : T248;
  assign T248 = T302 ? 5'h1c : T249;
  assign T249 = T301 ? 5'h1b : T250;
  assign T250 = T300 ? 5'h1a : T251;
  assign T251 = T299 ? 5'h19 : T252;
  assign T252 = T298 ? 5'h18 : T253;
  assign T253 = T297 ? 5'h17 : T254;
  assign T254 = T296 ? 5'h16 : T255;
  assign T255 = T295 ? 5'h15 : T256;
  assign T256 = T294 ? 5'h14 : T257;
  assign T257 = T293 ? 5'h13 : T258;
  assign T258 = T292 ? 5'h12 : T259;
  assign T259 = T291 ? 5'h11 : T260;
  assign T260 = T290 ? 5'h10 : T261;
  assign T261 = T289 ? 4'hf : T262;
  assign T262 = T288 ? 4'he : T263;
  assign T263 = T287 ? 4'hd : T264;
  assign T264 = T286 ? 4'hc : T265;
  assign T265 = T285 ? 4'hb : T266;
  assign T266 = T284 ? 4'ha : T267;
  assign T267 = T283 ? 4'h9 : T268;
  assign T268 = T282 ? 4'h8 : T269;
  assign T269 = T281 ? 3'h7 : T270;
  assign T270 = T280 ? 3'h6 : T271;
  assign T271 = T279 ? 3'h5 : T272;
  assign T272 = T278 ? 3'h4 : T273;
  assign T273 = T277 ? 2'h3 : T274;
  assign T274 = T276 ? 2'h2 : T275;
  assign T275 = T74[1'h1:1'h1];
  assign T74 = T75[5'h1f:1'h0];
  assign T75 = divisor[5'h1f:1'h0];
  assign T276 = T74[2'h2:2'h2];
  assign T277 = T74[2'h3:2'h3];
  assign T278 = T74[3'h4:3'h4];
  assign T279 = T74[3'h5:3'h5];
  assign T280 = T74[3'h6:3'h6];
  assign T281 = T74[3'h7:3'h7];
  assign T282 = T74[4'h8:4'h8];
  assign T283 = T74[4'h9:4'h9];
  assign T284 = T74[4'ha:4'ha];
  assign T285 = T74[4'hb:4'hb];
  assign T286 = T74[4'hc:4'hc];
  assign T287 = T74[4'hd:4'hd];
  assign T288 = T74[4'he:4'he];
  assign T289 = T74[4'hf:4'hf];
  assign T290 = T74[5'h10:5'h10];
  assign T291 = T74[5'h11:5'h11];
  assign T292 = T74[5'h12:5'h12];
  assign T293 = T74[5'h13:5'h13];
  assign T294 = T74[5'h14:5'h14];
  assign T295 = T74[5'h15:5'h15];
  assign T296 = T74[5'h16:5'h16];
  assign T297 = T74[5'h17:5'h17];
  assign T298 = T74[5'h18:5'h18];
  assign T299 = T74[5'h19:5'h19];
  assign T300 = T74[5'h1a:5'h1a];
  assign T301 = T74[5'h1b:5'h1b];
  assign T302 = T74[5'h1c:5'h1c];
  assign T303 = T74[5'h1d:5'h1d];
  assign T304 = T74[5'h1e:5'h1e];
  assign T305 = T74[5'h1f:5'h1f];
  assign T76 = T184 < T245;
  assign T77 = T87 & T78;
  assign T78 = cmdHi ? lhs_sign : T79;
  assign T79 = lhs_sign != rhs_sign;
  assign lhs_sign = lhsSigned & T80;
  assign T80 = T83 ? T82 : T81;
  assign T81 = io_req_bits_in1[4'hf:4'hf];
  assign T82 = io_req_bits_in1[5'h1f:5'h1f];
  assign T83 = io_req_bits_dw == 1'h1;
  assign lhsSigned = T86 | T84;
  assign T84 = T85 == 4'h0;
  assign T85 = io_req_bits_fn & 4'h3;
  assign T86 = T56 | T16;
  assign T87 = cmdMul ^ 1'h1;
  assign T88 = isHi ? 3'h3 : 3'h5;
  assign T89 = T147 & T90;
  assign T90 = T92 | T91;
  assign T91 = count == 6'h3;
  assign T92 = T104 & T93;
  assign T93 = T94 == 32'h0;
  assign T94 = T100 & T95;
  assign T95 = ~ T96;
  assign T96 = T97[5'h1f:1'h0];
  assign T97 = $signed(33'h100000000) >>> T98;
  assign T98 = T99[3'h4:1'h0];
  assign T99 = count * 4'h8;
  assign T100 = T101[5'h1f:1'h0];
  assign T101 = {T103, T102};
  assign T102 = remainder[5'h1f:1'h0];
  assign T103 = remainder[7'h41:6'h21];
  assign T104 = T106 & T105;
  assign T105 = isHi ^ 1'h1;
  assign T106 = T108 & T107;
  assign T107 = count != 6'h0;
  assign T108 = count != 6'h3;
  assign T109 = isHi ? 3'h3 : T110;
  assign T110 = neg_out ? 3'h4 : 3'h5;
  assign T111 = T156 & T112;
  assign T112 = count == 6'h20;
  assign T113 = T114 | io_kill;
  assign T114 = io_resp_ready & io_resp_valid;
  assign T115 = T116 ? 3'h1 : 3'h2;
  assign T116 = lhs_sign | T117;
  assign T117 = rhs_sign & T118;
  assign T118 = cmdMul ^ 1'h1;
  assign T306 = {34'h0, negated_remainder};
  assign T120 = state == 3'h4;
  assign T307 = {34'h0, T121};
  assign T121 = remainder[7'h40:6'h21];
  assign T122 = state == 3'h3;
  assign T123 = T124;
  assign T124 = {T146, T125};
  assign T125 = {1'h0, T126};
  assign T126 = T127[5'h1f:1'h0];
  assign T127 = {T145, T128};
  assign T128 = T129[5'h1f:1'h0];
  assign T129 = T92 ? T141 : T130;
  assign T130 = T131;
  assign T131 = {T133, T132};
  assign T132 = T100[5'h1f:4'h8];
  assign T133 = T136 + T308;
  assign T308 = {T309, T134};
  assign T134 = T135;
  assign T135 = T101[7'h40:6'h20];
  assign T309 = T310 ? 8'hff : 8'h0;
  assign T310 = T134[6'h20:6'h20];
  assign T136 = $signed(T140) * $signed(T137);
  assign T137 = T138;
  assign T138 = {1'h0, T139};
  assign T139 = T100[3'h7:1'h0];
  assign T140 = divisor;
  assign T141 = T101 >> T142;
  assign T142 = T143[3'h4:1'h0];
  assign T143 = 10'h20 - T144;
  assign T144 = count * 4'h8;
  assign T145 = T130[7'h40:6'h20];
  assign T146 = T127 >> 6'h20;
  assign T147 = T148 & isMul;
  assign T148 = state == 3'h2;
  assign T311 = {1'h0, T149};
  assign T149 = {T153, T150};
  assign T150 = {T152, T151};
  assign T151 = less ^ 1'h1;
  assign T152 = remainder[5'h1f:1'h0];
  assign T153 = less ? T155 : T154;
  assign T154 = subtractor[5'h1f:1'h0];
  assign T155 = remainder[6'h3f:6'h20];
  assign T156 = T158 & T157;
  assign T157 = isMul ^ 1'h1;
  assign T158 = state == 3'h2;
  assign T312 = {3'h0, T159};
  assign T159 = T160 << T66;
  assign T160 = remainder[5'h1f:1'h0];
  assign T161 = T156 & T162;
  assign T162 = T165 & T163;
  assign T163 = T164 | T76;
  assign T164 = 5'h0 < T68;
  assign T165 = T166 & less;
  assign T166 = count == 6'h0;
  assign T313 = {34'h0, lhs_in};
  assign lhs_in = {T168, T167};
  assign T167 = io_req_bits_in1[4'hf:1'h0];
  assign T168 = T171 ? T170 : T169;
  assign T169 = 16'h0 - T314;
  assign T314 = {15'h0, lhs_sign};
  assign T170 = io_req_bits_in1[5'h1f:5'h10];
  assign T171 = io_req_bits_dw == 1'h1;
  assign T172 = {T174, T173};
  assign T173 = remainder[4'hf:1'h0];
  assign T174 = 16'h0 - T315;
  assign T315 = {15'h0, T175};
  assign T175 = remainder[4'hf:4'hf];
  assign T176 = req_dw == 1'h0;
  assign T177 = T1 ? io_req_bits_dw : req_dw;
  assign io_resp_valid = T178;
  assign T178 = state == 3'h5;
  assign io_req_ready = T179;
  assign T179 = state == 3'h0;

  always @(posedge clk) begin
    if(T1) begin
      req_tag <= io_req_bits_tag;
    end
    if(T1) begin
      remainder <= T313;
    end else if(T161) begin
      remainder <= T312;
    end else if(T156) begin
      remainder <= T311;
    end else if(T147) begin
      remainder <= T123;
    end else if(T122) begin
      remainder <= T307;
    end else if(T120) begin
      remainder <= T306;
    end else if(T11) begin
      remainder <= T180;
    end
    if(T1) begin
      isMul <= cmdMul;
    end
    if(reset) begin
      state <= 3'h0;
    end else if(T1) begin
      state <= T115;
    end else if(T113) begin
      state <= 3'h0;
    end else if(T111) begin
      state <= T109;
    end else if(T89) begin
      state <= T88;
    end else if(T122) begin
      state <= T27;
    end else if(T120) begin
      state <= 3'h5;
    end else if(T19) begin
      state <= 3'h2;
    end
    if(T1) begin
      neg_out <= T77;
    end else if(T30) begin
      neg_out <= 1'h0;
    end
    if(T1) begin
      isHi <= cmdHi;
    end
    if(T1) begin
      divisor <= T46;
    end else if(T43) begin
      divisor <= subtractor;
    end
    if(T1) begin
      count <= 6'h0;
    end else if(T161) begin
      count <= T183;
    end else if(T156) begin
      count <= T65;
    end else if(T147) begin
      count <= T64;
    end
    if(T1) begin
      req_dw <= io_req_bits_dw;
    end
  end
endmodule

module Datapath(input clk, input reset,
    input  io_ctrl_stallf,
    input  io_ctrl_killf,
    input  io_ctrl_stalldx,
    input  io_ctrl_killdx,
    input  io_ctrl_stallw,
    input  io_ctrl_id_j,
    input  io_ctrl_id_br,
    input [1:0] io_ctrl_id_sel_alu1,
    input [2:0] io_ctrl_id_sel_alu2,
    input [2:0] io_ctrl_id_sel_imm,
    input [3:0] io_ctrl_id_fn_alu,
    input  io_ctrl_id_wen,
    input  io_ctrl_id_csr_en,
    input [2:0] io_ctrl_id_csr_cmd,
    input  io_ctrl_id_mem_valid,
    input  io_ctrl_id_mem_rw,
    input [2:0] io_ctrl_id_mem_type,
    input  io_ctrl_id_mul_valid,
    input  io_ctrl_id_xcpt,
    input [31:0] io_ctrl_id_cause,
    input  io_ctrl_ll_valid,
    input [4:0] io_ctrl_ll_waddr,
    input  io_ctrl_ll_fn,
    input  io_ctrl_ll_mem_rw,
    input [2:0] io_ctrl_ll_mem_type,
    output[31:0] io_ctrl_inst,
    output io_ctrl_ma_pc,
    output io_ctrl_ma_addr,
    output io_ctrl_br_taken,
    output io_ctrl_mul_ready,
    output io_ctrl_clear_sb,
    output io_ctrl_csr_replay,
    output io_ctrl_csr_xcpt,
    output io_ctrl_csr_eret,
    output io_ctrl_csr_interrupt,
    output[31:0] io_ctrl_csr_interrupt_cause,
    input  io_ctrl_logging_invalidate,
    input  io_ctrl_logging_sb_stall,
    input  io_ctrl_logging_scr_stall,
    input  io_ctrl_logging_dmem_stall,
    input  io_ctrl_logging_mul_stall,
    output[31:0] io_imem_haddr,
    //output io_imem_hwrite
    //output[2:0] io_imem_hsize
    //output[2:0] io_imem_hburst
    //output[3:0] io_imem_hprot
    //output[1:0] io_imem_htrans
    //output io_imem_hmastlock
    //output[31:0] io_imem_hwdata
    input [31:0] io_imem_hrdata,
    input  io_imem_hready,
    input  io_imem_hresp,
    output[31:0] io_dmem_haddr,
    output io_dmem_hwrite,
    output[2:0] io_dmem_hsize,
    //output[2:0] io_dmem_hburst
    //output[3:0] io_dmem_hprot
    //output[1:0] io_dmem_htrans
    //output io_dmem_hmastlock
    output[31:0] io_dmem_hwdata,
    input [31:0] io_dmem_hrdata,
    input  io_dmem_hready,
    input  io_dmem_hresp,
    input  io_host_reset,
    input  io_host_id,
    output io_host_pcr_req_ready,
    input  io_host_pcr_req_valid,
    input  io_host_pcr_req_bits_rw,
    input [11:0] io_host_pcr_req_bits_addr,
    input [31:0] io_host_pcr_req_bits_data,
    input  io_host_pcr_rep_ready,
    output io_host_pcr_rep_valid,
    output[31:0] io_host_pcr_rep_bits,
    input  io_host_ipi_req_ready,
    output io_host_ipi_req_valid,
    output io_host_ipi_req_bits,
    output io_host_ipi_rep_ready,
    input  io_host_ipi_rep_valid,
    input  io_host_ipi_rep_bits,
    output io_host_debug_stats_pcr
);

  wire T0;
  wire[31:0] T1;
  reg [31:0] id_inst;
  wire[31:0] T2;
  wire T3;
  wire T4;
  wire T5;
  wire[31:0] T6;
  wire[31:0] T7;
  wire T8;
  wire xcpt;
  wire[31:0] T9;
  wire[31:0] id_rs_1;
  wire[31:0] T10;
  wire[31:0] T11;
  wire[31:0] T12;
  reg [31:0] T13 [30:0];
  wire[31:0] T14;
  wire T15;
  wire T16;
  wire[4:0] T17;
  wire T18;
  wire T19;
  reg [4:0] wb_waddr;
  wire[4:0] T20;
  wire[4:0] waddr;
  wire[4:0] id_rd;
  wire T21;
  wire dmem_resp_valid;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire wen;
  wire T26;
  reg  wb_wen;
  wire T236;
  wire[4:0] T27;
  wire[4:0] T28;
  wire[4:0] T29;
  wire T30;
  reg [31:0] wb_wdata;
  wire[31:0] T31;
  wire[31:0] T32;
  wire[31:0] T33;
  wire[31:0] T34;
  wire[31:0] T35;
  wire[31:0] T36;
  wire[15:0] T37;
  wire T38;
  wire T39;
  wire T40;
  wire[31:0] T41;
  wire[15:0] T42;
  wire[7:0] T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire[31:0] wdata;
  wire[31:0] T48;
  wire[31:0] T49;
  wire[31:0] T50;
  wire[7:0] T51;
  wire[7:0] T52;
  wire[31:0] T53;
  wire[15:0] T54;
  wire[15:0] T55;
  wire[15:0] T56;
  wire T57;
  reg [1:0] dmem_load_lowaddr;
  wire[1:0] T58;
  wire[1:0] T59;
  wire T60;
  wire T61;
  wire[15:0] T62;
  wire[15:0] T63;
  wire[15:0] T64;
  wire[15:0] T237;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire T70;
  wire T71;
  wire T72;
  wire T73;
  wire T74;
  wire[7:0] T75;
  wire T76;
  wire[23:0] T77;
  wire[23:0] T78;
  wire[23:0] T79;
  wire[23:0] T238;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire T85;
  wire T86;
  wire[4:0] T87;
  wire[31:0] T88;
  wire[31:0] id_rs_0;
  wire[31:0] T89;
  wire[31:0] T90;
  wire[31:0] T91;
  wire[4:0] T92;
  wire[4:0] T93;
  wire T94;
  wire T95;
  wire T96;
  wire[4:0] T97;
  wire T98;
  wire[31:0] T99;
  wire[4:0] T100;
  wire[31:0] T101;
  reg [31:0] id_pc;
  wire[31:0] T102;
  reg [31:0] pc;
  wire[31:0] T239;
  wire[32:0] T240;
  wire[32:0] T103;
  wire[32:0] T241;
  wire[32:0] npc;
  wire[32:0] T104;
  wire[32:0] T105;
  wire[32:0] T242;
  wire[31:0] T106;
  wire[31:0] T107;
  wire T108;
  wire[32:0] id_br_target;
  wire[32:0] T109;
  wire[32:0] T110;
  wire[32:0] T111;
  wire[31:0] T112;
  wire T113;
  wire T114;
  wire[32:0] T243;
  wire[31:0] id_imm;
  wire[31:0] T115;
  wire[11:0] T116;
  wire[4:0] T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire T125;
  wire T126;
  wire[3:0] T127;
  wire[3:0] T128;
  wire[3:0] T129;
  wire[3:0] T130;
  wire[3:0] T131;
  wire T132;
  wire[3:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire T137;
  wire[6:0] T138;
  wire[5:0] T139;
  wire[5:0] T140;
  wire T141;
  wire T142;
  wire T143;
  wire T144;
  wire T145;
  wire T146;
  wire T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire T156;
  wire T157;
  wire[19:0] T158;
  wire[18:0] T159;
  wire[7:0] T160;
  wire[7:0] T161;
  wire[7:0] T162;
  wire[7:0] T244;
  wire T163;
  wire T164;
  wire T165;
  wire[10:0] T166;
  wire[10:0] T245;
  wire[10:0] T167;
  wire[10:0] T168;
  wire T169;
  wire T246;
  wire T170;
  wire T171;
  wire T172;
  wire[6:0] T173;
  wire[6:0] T174;
  wire[6:0] T175;
  wire[6:0] T176;
  wire[6:0] T177;
  wire[6:0] T178;
  wire[6:0] T179;
  wire[6:0] T180;
  wire[6:0] T181;
  wire[6:0] T182;
  wire[6:0] T183;
  reg [6:0] R184;
  wire[6:0] T247;
  wire[6:0] T185;
  wire[6:0] T186;
  reg [6:0] R187;
  wire[6:0] T248;
  wire[6:0] T188;
  wire[6:0] T189;
  reg [6:0] R190;
  wire[6:0] T249;
  wire[6:0] T191;
  wire[6:0] T192;
  reg [6:0] R193;
  wire[6:0] T250;
  wire[6:0] T194;
  wire[6:0] T195;
  reg [6:0] R196;
  wire[6:0] T251;
  wire[6:0] T197;
  wire T198;
  wire[6:0] T199;
  reg [6:0] R200;
  wire[6:0] T252;
  wire[6:0] T201;
  wire T202;
  wire T203;
  wire T204;
  wire[31:0] T205;
  wire T206;
  wire[1143:0] T207;
  wire[31:0] T208;
  wire[31:0] T209;
  wire[31:0] T210;
  wire T211;
  wire[31:0] T212;
  wire T213;
  wire T214;
  wire[31:0] T215;
  wire[31:0] T216;
  wire T217;
  wire[31:0] T218;
  wire T219;
  wire T220;
  wire[11:0] T221;
  wire[2:0] T222;
  wire[2:0] T223;
  wire[31:0] T253;
  wire[32:0] T224;
  wire[32:0] T254;
  wire T225;
  wire T226;
  wire T227;
  wire T228;
  wire T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire csr_io_host_pcr_req_ready;
  wire csr_io_host_pcr_rep_valid;
  wire[31:0] csr_io_host_pcr_rep_bits;
  wire csr_io_host_ipi_req_valid;
  wire csr_io_host_ipi_req_bits;
  wire csr_io_host_ipi_rep_ready;
  wire csr_io_host_debug_stats_pcr;
  wire[31:0] csr_io_rw_rdata;
  wire csr_io_csr_replay;
  wire csr_io_csr_xcpt;
  wire csr_io_eret;
  wire[31:0] csr_io_evec;
  wire[31:0] csr_io_time;
  wire csr_io_interrupt;
  wire[31:0] csr_io_interrupt_cause;
  wire[31:0] alu_io_out;
  wire[31:0] alu_io_adder_out;
  wire muldiv_io_req_ready;
  wire muldiv_io_resp_valid;
  wire[31:0] muldiv_io_resp_bits_data;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    id_inst = {1{$random}};
    for (initvar = 0; initvar < 31; initvar = initvar+1)
      T13[initvar] = {1{$random}};
    wb_waddr = {1{$random}};
    wb_wen = {1{$random}};
    wb_wdata = {1{$random}};
    dmem_load_lowaddr = {1{$random}};
    id_pc = {1{$random}};
    pc = {1{$random}};
    R184 = {1{$random}};
    R187 = {1{$random}};
    R190 = {1{$random}};
    R193 = {1{$random}};
    R196 = {1{$random}};
    R200 = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_dmem_hmastlock = {1{$random}};
//  assign io_dmem_htrans = {1{$random}};
//  assign io_dmem_hprot = {1{$random}};
//  assign io_dmem_hburst = {1{$random}};
//  assign io_imem_hwdata = {1{$random}};
//  assign io_imem_hmastlock = {1{$random}};
//  assign io_imem_htrans = {1{$random}};
//  assign io_imem_hprot = {1{$random}};
//  assign io_imem_hburst = {1{$random}};
//  assign io_imem_hsize = {1{$random}};
//  assign io_imem_hwrite = {1{$random}};
// synthesis translate_on
`endif
  assign T0 = reset ^ 1'h1;
  assign T1 = id_inst;
  assign T2 = T3 ? io_imem_hrdata : id_inst;
  assign T3 = T5 & T4;
  assign T4 = io_ctrl_killf ^ 1'h1;
  assign T5 = io_ctrl_stalldx ^ 1'h1;
  assign T6 = id_inst;
  assign T7 = io_ctrl_id_cause;
  assign T8 = xcpt;
  assign xcpt = io_ctrl_id_xcpt | io_ctrl_csr_xcpt;
  assign T9 = id_rs_1;
  assign id_rs_1 = T10;
  assign T10 = T85 ? wb_wdata : T11;
  assign T11 = T30 ? T12 : 32'h0;
  assign T12 = T13[T28];
  assign T15 = T18 & T16;
  assign T16 = T17 < 5'h1f;
  assign T17 = T27[3'h4:1'h0];
  assign T18 = wb_wen & T19;
  assign T19 = wb_waddr != 5'h0;
  assign T20 = wen ? waddr : wb_waddr;
  assign waddr = T21 ? io_ctrl_ll_waddr : id_rd;
  assign id_rd = id_inst[4'hb:3'h7];
  assign T21 = dmem_resp_valid | muldiv_io_resp_valid;
  assign dmem_resp_valid = T22 & io_dmem_hready;
  assign T22 = T24 & T23;
  assign T23 = io_ctrl_ll_mem_rw ^ 1'h1;
  assign T24 = io_ctrl_ll_valid & T25;
  assign T25 = io_ctrl_ll_fn ^ 1'h1;
  assign wen = T26 | muldiv_io_resp_valid;
  assign T26 = io_ctrl_id_wen | dmem_resp_valid;
  assign T236 = reset ? 1'h0 : wen;
  assign T27 = ~ wb_waddr;
  assign T28 = ~ T29;
  assign T29 = id_inst[5'h18:5'h14];
  assign T30 = T29 != 5'h0;
  assign T31 = wen ? wdata : T32;
  assign T32 = T47 ? T33 : wb_wdata;
  assign T33 = T44 ? T41 : T34;
  assign T34 = T38 ? T36 : T35;
  assign T35 = id_rs_1[5'h1f:1'h0];
  assign T36 = {T37, T37};
  assign T37 = id_rs_1[4'hf:1'h0];
  assign T38 = T40 | T39;
  assign T39 = io_ctrl_id_mem_type == 3'h5;
  assign T40 = io_ctrl_id_mem_type == 3'h1;
  assign T41 = {T42, T42};
  assign T42 = {T43, T43};
  assign T43 = id_rs_1[3'h7:1'h0];
  assign T44 = T46 | T45;
  assign T45 = io_ctrl_id_mem_type == 3'h4;
  assign T46 = io_ctrl_id_mem_type == 3'h0;
  assign T47 = io_ctrl_id_mem_valid & io_ctrl_id_mem_rw;
  assign wdata = io_ctrl_id_csr_en ? csr_io_rw_rdata : T48;
  assign T48 = dmem_resp_valid ? T50 : T49;
  assign T49 = muldiv_io_resp_valid ? muldiv_io_resp_bits_data : alu_io_out;
  assign T50 = {T77, T51};
  assign T51 = T76 ? T75 : T52;
  assign T52 = T53[3'h7:1'h0];
  assign T53 = {T62, T54};
  assign T54 = T57 ? T56 : T55;
  assign T55 = io_dmem_hrdata[4'hf:1'h0];
  assign T56 = io_dmem_hrdata[5'h1f:5'h10];
  assign T57 = dmem_load_lowaddr[1'h1:1'h1];
  assign T58 = T60 ? T59 : dmem_load_lowaddr;
  assign T59 = alu_io_adder_out[1'h1:1'h0];
  assign T60 = io_ctrl_id_mem_valid & T61;
  assign T61 = io_ctrl_id_mem_rw ^ 1'h1;
  assign T62 = T72 ? T64 : T63;
  assign T63 = io_dmem_hrdata[5'h1f:5'h10];
  assign T64 = 16'h0 - T237;
  assign T237 = {15'h0, T65};
  assign T65 = T67 & T66;
  assign T66 = T54[4'hf:4'hf];
  assign T67 = T69 | T68;
  assign T68 = io_ctrl_ll_mem_type == 3'h2;
  assign T69 = T71 | T70;
  assign T70 = io_ctrl_ll_mem_type == 3'h1;
  assign T71 = io_ctrl_ll_mem_type == 3'h0;
  assign T72 = T74 | T73;
  assign T73 = io_ctrl_ll_mem_type == 3'h5;
  assign T74 = io_ctrl_ll_mem_type == 3'h1;
  assign T75 = T53[4'hf:4'h8];
  assign T76 = dmem_load_lowaddr[1'h0:1'h0];
  assign T77 = T82 ? T79 : T78;
  assign T78 = T53[5'h1f:4'h8];
  assign T79 = 24'h0 - T238;
  assign T238 = {23'h0, T80};
  assign T80 = T67 & T81;
  assign T81 = T51[3'h7:3'h7];
  assign T82 = T84 | T83;
  assign T83 = io_ctrl_ll_mem_type == 3'h4;
  assign T84 = io_ctrl_ll_mem_type == 3'h0;
  assign T85 = T18 & T86;
  assign T86 = wb_waddr == T29;
  assign T87 = T29;
  assign T88 = id_rs_0;
  assign id_rs_0 = T89;
  assign T89 = T95 ? wb_wdata : T90;
  assign T90 = T94 ? T91 : 32'h0;
  assign T91 = T13[T92];
  assign T92 = ~ T93;
  assign T93 = id_inst[5'h13:4'hf];
  assign T94 = T93 != 5'h0;
  assign T95 = T18 & T96;
  assign T96 = wb_waddr == T93;
  assign T97 = T93;
  assign T98 = wen;
  assign T99 = wdata;
  assign T100 = waddr;
  assign T101 = id_pc;
  assign T102 = T3 ? pc : id_pc;
  assign T239 = T240[5'h1f:1'h0];
  assign T240 = reset ? 33'h1fc : T103;
  assign T103 = T172 ? npc : T241;
  assign T241 = {1'h0, pc};
  assign npc = T104;
  assign T104 = T105 & 33'h1fffffffe;
  assign T105 = T170 ? id_br_target : T242;
  assign T242 = {1'h0, T106};
  assign T106 = T108 ? csr_io_evec : T107;
  assign T107 = pc + 32'h4;
  assign T108 = xcpt | io_ctrl_csr_eret;
  assign id_br_target = T109;
  assign T109 = T243 + T110;
  assign T110 = T111;
  assign T111 = {1'h0, T112};
  assign T112 = T113 ? id_rs_0 : id_pc;
  assign T113 = io_ctrl_id_j & T114;
  assign T114 = io_ctrl_id_sel_imm == 3'h4;
  assign T243 = {T246, id_imm};
  assign id_imm = T115;
  assign T115 = {T158, T116};
  assign T116 = {T138, T117};
  assign T117 = {T127, T118};
  assign T118 = T126 ? T125 : T119;
  assign T119 = T124 ? T123 : T120;
  assign T120 = T122 ? T121 : 1'h0;
  assign T121 = id_inst[4'hf:4'hf];
  assign T122 = io_ctrl_id_sel_imm == 3'h5;
  assign T123 = id_inst[5'h14:5'h14];
  assign T124 = io_ctrl_id_sel_imm == 3'h4;
  assign T125 = id_inst[3'h7:3'h7];
  assign T126 = io_ctrl_id_sel_imm == 3'h0;
  assign T127 = T137 ? 4'h0 : T128;
  assign T128 = T134 ? T133 : T129;
  assign T129 = T132 ? T131 : T130;
  assign T130 = id_inst[5'h18:5'h15];
  assign T131 = id_inst[5'h13:5'h10];
  assign T132 = io_ctrl_id_sel_imm == 3'h5;
  assign T133 = id_inst[4'hb:4'h8];
  assign T134 = T136 | T135;
  assign T135 = io_ctrl_id_sel_imm == 3'h1;
  assign T136 = io_ctrl_id_sel_imm == 3'h0;
  assign T137 = io_ctrl_id_sel_imm == 3'h2;
  assign T138 = {T144, T139};
  assign T139 = T141 ? 6'h0 : T140;
  assign T140 = id_inst[5'h1e:5'h19];
  assign T141 = T143 | T142;
  assign T142 = io_ctrl_id_sel_imm == 3'h5;
  assign T143 = io_ctrl_id_sel_imm == 3'h2;
  assign T144 = T155 ? 1'h0 : T145;
  assign T145 = T154 ? T152 : T146;
  assign T146 = T151 ? T149 : T147;
  assign T147 = T148;
  assign T148 = id_inst[5'h1f:5'h1f];
  assign T149 = T150;
  assign T150 = id_inst[3'h7:3'h7];
  assign T151 = io_ctrl_id_sel_imm == 3'h1;
  assign T152 = T153;
  assign T153 = id_inst[5'h14:5'h14];
  assign T154 = io_ctrl_id_sel_imm == 3'h3;
  assign T155 = T157 | T156;
  assign T156 = io_ctrl_id_sel_imm == 3'h5;
  assign T157 = io_ctrl_id_sel_imm == 3'h2;
  assign T158 = {T147, T159};
  assign T159 = {T166, T160};
  assign T160 = T163 ? T244 : T161;
  assign T161 = T162;
  assign T162 = id_inst[5'h13:4'hc];
  assign T244 = T147 ? 8'hff : 8'h0;
  assign T163 = T165 & T164;
  assign T164 = io_ctrl_id_sel_imm != 3'h3;
  assign T165 = io_ctrl_id_sel_imm != 3'h2;
  assign T166 = T169 ? T167 : T245;
  assign T245 = T147 ? 11'h7ff : 11'h0;
  assign T167 = T168;
  assign T168 = id_inst[5'h1e:5'h14];
  assign T169 = io_ctrl_id_sel_imm == 3'h2;
  assign T246 = id_imm[5'h1f:5'h1f];
  assign T170 = io_ctrl_id_j | T171;
  assign T171 = io_ctrl_id_br & io_ctrl_br_taken;
  assign T172 = io_ctrl_stallf ^ 1'h1;
  assign T173 = T174;
  assign T174 = xcpt ? 7'h58 : 7'h2d;
  assign T175 = T176;
  assign T176 = io_ctrl_logging_mul_stall ? 7'h4d : 7'h2d;
  assign T177 = T178;
  assign T178 = io_ctrl_logging_dmem_stall ? 7'h44 : 7'h2d;
  assign T179 = T180;
  assign T180 = io_ctrl_logging_scr_stall ? 7'h43 : 7'h2d;
  assign T181 = T182;
  assign T182 = io_ctrl_logging_sb_stall ? 7'h53 : 7'h2d;
  assign T183 = R184;
  assign T247 = reset ? 7'h2d : T185;
  assign T185 = xcpt ? 7'h58 : 7'h2d;
  assign T186 = R187;
  assign T248 = reset ? 7'h2d : T188;
  assign T188 = io_ctrl_csr_eret ? 7'h53 : 7'h2d;
  assign T189 = R190;
  assign T249 = reset ? 7'h2d : T191;
  assign T191 = io_ctrl_logging_invalidate ? 7'h56 : 7'h2d;
  assign T192 = R193;
  assign T250 = reset ? 7'h2d : T194;
  assign T194 = io_ctrl_id_j ? 7'h4a : 7'h2d;
  assign T195 = R196;
  assign T251 = reset ? 7'h2d : T197;
  assign T197 = T198 ? 7'h42 : 7'h2d;
  assign T198 = io_ctrl_id_br & io_ctrl_br_taken;
  assign T199 = R200;
  assign T252 = reset ? 7'h2d : T201;
  assign T201 = T202 ? 7'h49 : 7'h2d;
  assign T202 = io_imem_hready ^ 1'h1;
  assign T203 = T204;
  assign T204 = io_ctrl_killdx ^ 1'h1;
  assign T205 = csr_io_time;
  assign T206 = io_host_id;
  assign T208 = T214 ? 32'h4 : T209;
  assign T209 = T213 ? T212 : T210;
  assign T210 = T211 ? id_imm : 32'h0;
  assign T211 = io_ctrl_id_sel_alu2 == 3'h3;
  assign T212 = id_rs_1;
  assign T213 = io_ctrl_id_sel_alu2 == 3'h2;
  assign T214 = io_ctrl_id_sel_alu2 == 3'h1;
  assign T215 = T219 ? T218 : T216;
  assign T216 = T217 ? id_pc : 32'h0;
  assign T217 = io_ctrl_id_sel_alu1 == 2'h2;
  assign T218 = id_rs_0;
  assign T219 = io_ctrl_id_sel_alu1 == 2'h1;
  assign T220 = io_ctrl_killdx ^ 1'h1;
  assign T221 = id_inst[5'h1f:5'h14];
  assign io_host_debug_stats_pcr = csr_io_host_debug_stats_pcr;
  assign io_host_ipi_rep_ready = csr_io_host_ipi_rep_ready;
  assign io_host_ipi_req_bits = csr_io_host_ipi_req_bits;
  assign io_host_ipi_req_valid = csr_io_host_ipi_req_valid;
  assign io_host_pcr_rep_bits = csr_io_host_pcr_rep_bits;
  assign io_host_pcr_rep_valid = csr_io_host_pcr_rep_valid;
  assign io_host_pcr_req_ready = csr_io_host_pcr_req_ready;
  assign io_dmem_hwdata = wb_wdata;
  assign io_dmem_hsize = T222;
  assign T222 = T44 ? 3'h0 : T223;
  assign T223 = T38 ? 3'h1 : 3'h2;
  assign io_dmem_hwrite = io_ctrl_id_mem_rw;
  assign io_dmem_haddr = alu_io_adder_out;
  assign io_imem_haddr = T253;
  assign T253 = T224[5'h1f:1'h0];
  assign T224 = io_ctrl_stallf ? T254 : npc;
  assign T254 = {1'h0, pc};
  assign io_ctrl_csr_interrupt_cause = csr_io_interrupt_cause;
  assign io_ctrl_csr_interrupt = csr_io_interrupt;
  assign io_ctrl_csr_eret = csr_io_eret;
  assign io_ctrl_csr_xcpt = csr_io_csr_xcpt;
  assign io_ctrl_csr_replay = csr_io_csr_replay;
  assign io_ctrl_clear_sb = T225;
  assign T225 = dmem_resp_valid | muldiv_io_resp_valid;
  assign io_ctrl_mul_ready = muldiv_io_req_ready;
  assign io_ctrl_br_taken = T226;
  assign T226 = alu_io_out[1'h0:1'h0];
  assign io_ctrl_ma_addr = T227;
  assign T227 = T230 | T228;
  assign T228 = T229 & T38;
  assign T229 = alu_io_adder_out[1'h0:1'h0];
  assign T230 = T232 & T231;
  assign T231 = io_ctrl_id_mem_type == 3'h2;
  assign T232 = T234 | T233;
  assign T233 = alu_io_adder_out[1'h0:1'h0];
  assign T234 = alu_io_adder_out[1'h1:1'h1];
  assign io_ctrl_ma_pc = T235;
  assign T235 = pc[1'h1:1'h1];
  assign io_ctrl_inst = id_inst;
  CSRFile csr(.clk(clk), .reset(reset),
       .io_host_reset( io_host_reset ),
       .io_host_id( io_host_id ),
       .io_host_pcr_req_ready( csr_io_host_pcr_req_ready ),
       .io_host_pcr_req_valid( io_host_pcr_req_valid ),
       .io_host_pcr_req_bits_rw( io_host_pcr_req_bits_rw ),
       .io_host_pcr_req_bits_addr( io_host_pcr_req_bits_addr ),
       .io_host_pcr_req_bits_data( io_host_pcr_req_bits_data ),
       .io_host_pcr_rep_ready( io_host_pcr_rep_ready ),
       .io_host_pcr_rep_valid( csr_io_host_pcr_rep_valid ),
       .io_host_pcr_rep_bits( csr_io_host_pcr_rep_bits ),
       .io_host_ipi_req_ready( io_host_ipi_req_ready ),
       .io_host_ipi_req_valid( csr_io_host_ipi_req_valid ),
       .io_host_ipi_req_bits( csr_io_host_ipi_req_bits ),
       .io_host_ipi_rep_ready( csr_io_host_ipi_rep_ready ),
       .io_host_ipi_rep_valid( io_host_ipi_rep_valid ),
       .io_host_ipi_rep_bits( io_host_ipi_rep_bits ),
       .io_host_debug_stats_pcr( csr_io_host_debug_stats_pcr ),
       .io_rw_addr( T221 ),
       .io_rw_cmd( io_ctrl_id_csr_cmd ),
       .io_rw_rdata( csr_io_rw_rdata ),
       .io_rw_wdata( alu_io_adder_out ),
       .io_csr_replay( csr_io_csr_replay ),
       //.io_csr_stall(  )
       .io_csr_xcpt( csr_io_csr_xcpt ),
       .io_eret( csr_io_eret ),
       //.io_status_sd(  )
       //.io_status_zero2(  )
       //.io_status_sd_rv32(  )
       //.io_status_zero1(  )
       //.io_status_vm(  )
       //.io_status_mprv(  )
       //.io_status_xs(  )
       //.io_status_fs(  )
       //.io_status_prv3(  )
       //.io_status_ie3(  )
       //.io_status_prv2(  )
       //.io_status_ie2(  )
       //.io_status_prv1(  )
       //.io_status_ie1(  )
       //.io_status_prv(  )
       //.io_status_ie(  )
       //.io_ptbr(  )
       .io_evec( csr_io_evec ),
       .io_exception( io_ctrl_id_xcpt ),
       .io_retire( T220 ),
       //.io_uarch_counters_15(  )
       //.io_uarch_counters_14(  )
       //.io_uarch_counters_13(  )
       //.io_uarch_counters_12(  )
       //.io_uarch_counters_11(  )
       //.io_uarch_counters_10(  )
       //.io_uarch_counters_9(  )
       //.io_uarch_counters_8(  )
       //.io_uarch_counters_7(  )
       //.io_uarch_counters_6(  )
       //.io_uarch_counters_5(  )
       //.io_uarch_counters_4(  )
       //.io_uarch_counters_3(  )
       //.io_uarch_counters_2(  )
       //.io_uarch_counters_1(  )
       //.io_uarch_counters_0(  )
       .io_cause( io_ctrl_id_cause ),
       .io_pc( id_pc ),
       //.io_fatc(  )
       .io_time( csr_io_time ),
       //.io_fcsr_rm(  )
       //.io_fcsr_flags_valid(  )
       //.io_fcsr_flags_bits(  )
       //.io_rocc_cmd_ready(  )
       //.io_rocc_cmd_valid(  )
       //.io_rocc_cmd_bits_inst_funct(  )
       //.io_rocc_cmd_bits_inst_rs2(  )
       //.io_rocc_cmd_bits_inst_rs1(  )
       //.io_rocc_cmd_bits_inst_xd(  )
       //.io_rocc_cmd_bits_inst_xs1(  )
       //.io_rocc_cmd_bits_inst_xs2(  )
       //.io_rocc_cmd_bits_inst_rd(  )
       //.io_rocc_cmd_bits_inst_opcode(  )
       //.io_rocc_cmd_bits_rs1(  )
       //.io_rocc_cmd_bits_rs2(  )
       //.io_rocc_resp_ready(  )
       //.io_rocc_resp_valid(  )
       //.io_rocc_resp_bits_rd(  )
       //.io_rocc_resp_bits_data(  )
       //.io_rocc_mem_req_ready(  )
       //.io_rocc_mem_req_valid(  )
       //.io_rocc_mem_req_bits_addr(  )
       //.io_rocc_mem_req_bits_tag(  )
       //.io_rocc_mem_req_bits_cmd(  )
       //.io_rocc_mem_req_bits_typ(  )
       //.io_rocc_mem_req_bits_kill(  )
       //.io_rocc_mem_req_bits_phys(  )
       //.io_rocc_mem_req_bits_data(  )
       //.io_rocc_mem_resp_valid(  )
       //.io_rocc_mem_resp_bits_addr(  )
       //.io_rocc_mem_resp_bits_tag(  )
       //.io_rocc_mem_resp_bits_cmd(  )
       //.io_rocc_mem_resp_bits_typ(  )
       //.io_rocc_mem_resp_bits_data(  )
       //.io_rocc_mem_resp_bits_nack(  )
       //.io_rocc_mem_resp_bits_replay(  )
       //.io_rocc_mem_resp_bits_has_data(  )
       //.io_rocc_mem_resp_bits_data_subword(  )
       //.io_rocc_mem_resp_bits_store_data(  )
       //.io_rocc_mem_replay_next_valid(  )
       //.io_rocc_mem_replay_next_bits(  )
       //.io_rocc_mem_xcpt_ma_ld(  )
       //.io_rocc_mem_xcpt_ma_st(  )
       //.io_rocc_mem_xcpt_pf_ld(  )
       //.io_rocc_mem_xcpt_pf_st(  )
       //.io_rocc_mem_invalidate_lr(  )
       //.io_rocc_mem_ordered(  )
       //.io_rocc_busy(  )
       //.io_rocc_s(  )
       //.io_rocc_interrupt(  )
       //.io_rocc_imem_acquire_ready(  )
       //.io_rocc_imem_acquire_valid(  )
       //.io_rocc_imem_acquire_bits_addr_block(  )
       //.io_rocc_imem_acquire_bits_client_xact_id(  )
       //.io_rocc_imem_acquire_bits_addr_beat(  )
       //.io_rocc_imem_acquire_bits_data(  )
       //.io_rocc_imem_acquire_bits_is_builtin_type(  )
       //.io_rocc_imem_acquire_bits_a_type(  )
       //.io_rocc_imem_acquire_bits_union(  )
       //.io_rocc_imem_grant_ready(  )
       //.io_rocc_imem_grant_valid(  )
       //.io_rocc_imem_grant_bits_addr_beat(  )
       //.io_rocc_imem_grant_bits_data(  )
       //.io_rocc_imem_grant_bits_client_xact_id(  )
       //.io_rocc_imem_grant_bits_manager_xact_id(  )
       //.io_rocc_imem_grant_bits_is_builtin_type(  )
       //.io_rocc_imem_grant_bits_g_type(  )
       //.io_rocc_dmem_acquire_ready(  )
       //.io_rocc_dmem_acquire_valid(  )
       //.io_rocc_dmem_acquire_bits_addr_block(  )
       //.io_rocc_dmem_acquire_bits_client_xact_id(  )
       //.io_rocc_dmem_acquire_bits_addr_beat(  )
       //.io_rocc_dmem_acquire_bits_data(  )
       //.io_rocc_dmem_acquire_bits_is_builtin_type(  )
       //.io_rocc_dmem_acquire_bits_a_type(  )
       //.io_rocc_dmem_acquire_bits_union(  )
       //.io_rocc_dmem_grant_ready(  )
       //.io_rocc_dmem_grant_valid(  )
       //.io_rocc_dmem_grant_bits_addr_beat(  )
       //.io_rocc_dmem_grant_bits_data(  )
       //.io_rocc_dmem_grant_bits_client_xact_id(  )
       //.io_rocc_dmem_grant_bits_manager_xact_id(  )
       //.io_rocc_dmem_grant_bits_is_builtin_type(  )
       //.io_rocc_dmem_grant_bits_g_type(  )
       //.io_rocc_iptw_req_ready(  )
       //.io_rocc_iptw_req_valid(  )
       //.io_rocc_iptw_req_bits_addr(  )
       //.io_rocc_iptw_req_bits_prv(  )
       //.io_rocc_iptw_req_bits_store(  )
       //.io_rocc_iptw_req_bits_fetch(  )
       //.io_rocc_iptw_resp_valid(  )
       //.io_rocc_iptw_resp_bits_error(  )
       //.io_rocc_iptw_resp_bits_pte_ppn(  )
       //.io_rocc_iptw_resp_bits_pte_reserved_for_software(  )
       //.io_rocc_iptw_resp_bits_pte_d(  )
       //.io_rocc_iptw_resp_bits_pte_r(  )
       //.io_rocc_iptw_resp_bits_pte_typ(  )
       //.io_rocc_iptw_resp_bits_pte_v(  )
       //.io_rocc_iptw_status_sd(  )
       //.io_rocc_iptw_status_zero2(  )
       //.io_rocc_iptw_status_sd_rv32(  )
       //.io_rocc_iptw_status_zero1(  )
       //.io_rocc_iptw_status_vm(  )
       //.io_rocc_iptw_status_mprv(  )
       //.io_rocc_iptw_status_xs(  )
       //.io_rocc_iptw_status_fs(  )
       //.io_rocc_iptw_status_prv3(  )
       //.io_rocc_iptw_status_ie3(  )
       //.io_rocc_iptw_status_prv2(  )
       //.io_rocc_iptw_status_ie2(  )
       //.io_rocc_iptw_status_prv1(  )
       //.io_rocc_iptw_status_ie1(  )
       //.io_rocc_iptw_status_prv(  )
       //.io_rocc_iptw_status_ie(  )
       //.io_rocc_iptw_invalidate(  )
       //.io_rocc_dptw_req_ready(  )
       //.io_rocc_dptw_req_valid(  )
       //.io_rocc_dptw_req_bits_addr(  )
       //.io_rocc_dptw_req_bits_prv(  )
       //.io_rocc_dptw_req_bits_store(  )
       //.io_rocc_dptw_req_bits_fetch(  )
       //.io_rocc_dptw_resp_valid(  )
       //.io_rocc_dptw_resp_bits_error(  )
       //.io_rocc_dptw_resp_bits_pte_ppn(  )
       //.io_rocc_dptw_resp_bits_pte_reserved_for_software(  )
       //.io_rocc_dptw_resp_bits_pte_d(  )
       //.io_rocc_dptw_resp_bits_pte_r(  )
       //.io_rocc_dptw_resp_bits_pte_typ(  )
       //.io_rocc_dptw_resp_bits_pte_v(  )
       //.io_rocc_dptw_status_sd(  )
       //.io_rocc_dptw_status_zero2(  )
       //.io_rocc_dptw_status_sd_rv32(  )
       //.io_rocc_dptw_status_zero1(  )
       //.io_rocc_dptw_status_vm(  )
       //.io_rocc_dptw_status_mprv(  )
       //.io_rocc_dptw_status_xs(  )
       //.io_rocc_dptw_status_fs(  )
       //.io_rocc_dptw_status_prv3(  )
       //.io_rocc_dptw_status_ie3(  )
       //.io_rocc_dptw_status_prv2(  )
       //.io_rocc_dptw_status_ie2(  )
       //.io_rocc_dptw_status_prv1(  )
       //.io_rocc_dptw_status_ie1(  )
       //.io_rocc_dptw_status_prv(  )
       //.io_rocc_dptw_status_ie(  )
       //.io_rocc_dptw_invalidate(  )
       //.io_rocc_pptw_req_ready(  )
       //.io_rocc_pptw_req_valid(  )
       //.io_rocc_pptw_req_bits_addr(  )
       //.io_rocc_pptw_req_bits_prv(  )
       //.io_rocc_pptw_req_bits_store(  )
       //.io_rocc_pptw_req_bits_fetch(  )
       //.io_rocc_pptw_resp_valid(  )
       //.io_rocc_pptw_resp_bits_error(  )
       //.io_rocc_pptw_resp_bits_pte_ppn(  )
       //.io_rocc_pptw_resp_bits_pte_reserved_for_software(  )
       //.io_rocc_pptw_resp_bits_pte_d(  )
       //.io_rocc_pptw_resp_bits_pte_r(  )
       //.io_rocc_pptw_resp_bits_pte_typ(  )
       //.io_rocc_pptw_resp_bits_pte_v(  )
       //.io_rocc_pptw_status_sd(  )
       //.io_rocc_pptw_status_zero2(  )
       //.io_rocc_pptw_status_sd_rv32(  )
       //.io_rocc_pptw_status_zero1(  )
       //.io_rocc_pptw_status_vm(  )
       //.io_rocc_pptw_status_mprv(  )
       //.io_rocc_pptw_status_xs(  )
       //.io_rocc_pptw_status_fs(  )
       //.io_rocc_pptw_status_prv3(  )
       //.io_rocc_pptw_status_ie3(  )
       //.io_rocc_pptw_status_prv2(  )
       //.io_rocc_pptw_status_ie2(  )
       //.io_rocc_pptw_status_prv1(  )
       //.io_rocc_pptw_status_ie1(  )
       //.io_rocc_pptw_status_prv(  )
       //.io_rocc_pptw_status_ie(  )
       //.io_rocc_pptw_invalidate(  )
       //.io_rocc_exception(  )
       .io_interrupt( csr_io_interrupt ),
       .io_interrupt_cause( csr_io_interrupt_cause )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign csr.io_uarch_counters_15 = {1{$random}};
    assign csr.io_uarch_counters_14 = {1{$random}};
    assign csr.io_uarch_counters_13 = {1{$random}};
    assign csr.io_uarch_counters_12 = {1{$random}};
    assign csr.io_uarch_counters_11 = {1{$random}};
    assign csr.io_uarch_counters_10 = {1{$random}};
    assign csr.io_uarch_counters_9 = {1{$random}};
    assign csr.io_uarch_counters_8 = {1{$random}};
    assign csr.io_uarch_counters_7 = {1{$random}};
    assign csr.io_uarch_counters_6 = {1{$random}};
    assign csr.io_uarch_counters_5 = {1{$random}};
    assign csr.io_uarch_counters_4 = {1{$random}};
    assign csr.io_uarch_counters_3 = {1{$random}};
    assign csr.io_uarch_counters_2 = {1{$random}};
    assign csr.io_uarch_counters_1 = {1{$random}};
    assign csr.io_uarch_counters_0 = {1{$random}};
// synthesis translate_on
`endif
  ALU alu(
       .io_fn( io_ctrl_id_fn_alu ),
       .io_in1( T215 ),
       .io_in2( T208 ),
       .io_out( alu_io_out ),
       .io_adder_out( alu_io_adder_out )
  );
  MulDiv muldiv(.clk(clk), .reset(reset),
       .io_req_ready( muldiv_io_req_ready ),
       .io_req_valid( io_ctrl_id_mul_valid ),
       .io_req_bits_fn( io_ctrl_id_fn_alu ),
       .io_req_bits_dw( 1'h1 ),
       .io_req_bits_in1( id_rs_0 ),
       .io_req_bits_in2( id_rs_1 ),
       //.io_req_bits_tag(  )
       .io_kill( 1'h0 ),
       .io_resp_ready( 1'h1 ),
       .io_resp_valid( muldiv_io_resp_valid ),
       .io_resp_bits_data( muldiv_io_resp_bits_data )
       //.io_resp_bits_tag(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign muldiv.io_req_bits_tag = {1{$random}};
// synthesis translate_on
`endif

  always @(posedge clk) begin
    if(T3) begin
      id_inst <= io_imem_hrdata;
    end
    if (T15)
      T13[T27] <= wb_wdata;
    if(wen) begin
      wb_waddr <= waddr;
    end
    if(reset) begin
      wb_wen <= 1'h0;
    end else begin
      wb_wen <= wen;
    end
    if(wen) begin
      wb_wdata <= wdata;
    end else if(T47) begin
      wb_wdata <= T33;
    end
    if(T60) begin
      dmem_load_lowaddr <= T59;
    end
    if(T3) begin
      id_pc <= pc;
    end
    pc <= T239;
    if(reset) begin
      R184 <= 7'h2d;
    end else if(xcpt) begin
      R184 <= 7'h58;
    end else begin
      R184 <= 7'h2d;
    end
    if(reset) begin
      R187 <= 7'h2d;
    end else if(io_ctrl_csr_eret) begin
      R187 <= 7'h53;
    end else begin
      R187 <= 7'h2d;
    end
    if(reset) begin
      R190 <= 7'h2d;
    end else if(io_ctrl_logging_invalidate) begin
      R190 <= 7'h56;
    end else begin
      R190 <= 7'h2d;
    end
    if(reset) begin
      R193 <= 7'h2d;
    end else if(io_ctrl_id_j) begin
      R193 <= 7'h4a;
    end else begin
      R193 <= 7'h2d;
    end
    if(reset) begin
      R196 <= 7'h2d;
    end else if(T198) begin
      R196 <= 7'h42;
    end else begin
      R196 <= 7'h2d;
    end
    if(reset) begin
      R200 <= 7'h2d;
    end else if(T202) begin
      R200 <= 7'h49;
    end else begin
      R200 <= 7'h2d;
    end
`ifndef SYNTHESIS
// synthesis translate_off
`ifdef PRINTF_COND
    if (`PRINTF_COND)
`endif
      if (T0)
        $fwrite(32'h80000002, "Z%d: %d [%d] [%s%s%s%s%s%s|%s%s%s%s%s] pc=[%h] W[r%d=%h][%d] R[r%d=%h] R[r%d=%h] [%d|%h] inst=[%h] DASM(%h)\n", T206, T205, T203, T199, T195, T192, T189, T186, T183, T181, T179, T177, T175, T173, T101, T100, T99, T98, T97, T88, T87, T9, T8, T7, T6, T1);
// synthesis translate_on
`endif
  end
endmodule

module Core(input clk, input reset,
    output[31:0] io_imem_haddr,
    output io_imem_hwrite,
    output[2:0] io_imem_hsize,
    output[2:0] io_imem_hburst,
    output[3:0] io_imem_hprot,
    output[1:0] io_imem_htrans,
    output io_imem_hmastlock,
    //output[31:0] io_imem_hwdata
    input [31:0] io_imem_hrdata,
    input  io_imem_hready,
    input  io_imem_hresp,
    output[31:0] io_dmem_haddr,
    output io_dmem_hwrite,
    output[2:0] io_dmem_hsize,
    output[2:0] io_dmem_hburst,
    output[3:0] io_dmem_hprot,
    output[1:0] io_dmem_htrans,
    output io_dmem_hmastlock,
    output[31:0] io_dmem_hwdata,
    input [31:0] io_dmem_hrdata,
    input  io_dmem_hready,
    input  io_dmem_hresp,
    input  io_host_reset,
    input  io_host_id,
    output io_host_pcr_req_ready,
    input  io_host_pcr_req_valid,
    input  io_host_pcr_req_bits_rw,
    input [11:0] io_host_pcr_req_bits_addr,
    input [31:0] io_host_pcr_req_bits_data,
    input  io_host_pcr_rep_ready,
    output io_host_pcr_rep_valid,
    output[31:0] io_host_pcr_rep_bits,
    input  io_host_ipi_req_ready,
    output io_host_ipi_req_valid,
    output io_host_ipi_req_bits,
    output io_host_ipi_rep_ready,
    input  io_host_ipi_rep_valid,
    input  io_host_ipi_rep_bits,
    output io_host_debug_stats_pcr
);

  wire ctrl_io_dpath_stallf;
  wire ctrl_io_dpath_killf;
  wire ctrl_io_dpath_stalldx;
  wire ctrl_io_dpath_killdx;
  wire ctrl_io_dpath_stallw;
  wire ctrl_io_dpath_id_j;
  wire ctrl_io_dpath_id_br;
  wire[1:0] ctrl_io_dpath_id_sel_alu1;
  wire[2:0] ctrl_io_dpath_id_sel_alu2;
  wire[2:0] ctrl_io_dpath_id_sel_imm;
  wire[3:0] ctrl_io_dpath_id_fn_alu;
  wire ctrl_io_dpath_id_wen;
  wire ctrl_io_dpath_id_csr_en;
  wire[2:0] ctrl_io_dpath_id_csr_cmd;
  wire ctrl_io_dpath_id_mem_valid;
  wire ctrl_io_dpath_id_mem_rw;
  wire[2:0] ctrl_io_dpath_id_mem_type;
  wire ctrl_io_dpath_id_mul_valid;
  wire ctrl_io_dpath_id_xcpt;
  wire[31:0] ctrl_io_dpath_id_cause;
  wire ctrl_io_dpath_ll_valid;
  wire[4:0] ctrl_io_dpath_ll_waddr;
  wire ctrl_io_dpath_ll_fn;
  wire ctrl_io_dpath_ll_mem_rw;
  wire[2:0] ctrl_io_dpath_ll_mem_type;
  wire ctrl_io_dpath_logging_invalidate;
  wire ctrl_io_dpath_logging_sb_stall;
  wire ctrl_io_dpath_logging_scr_stall;
  wire ctrl_io_dpath_logging_dmem_stall;
  wire ctrl_io_dpath_logging_mul_stall;
  wire ctrl_io_imem_hwrite;
  wire[2:0] ctrl_io_imem_hsize;
  wire[2:0] ctrl_io_imem_hburst;
  wire[3:0] ctrl_io_imem_hprot;
  wire[1:0] ctrl_io_imem_htrans;
  wire ctrl_io_imem_hmastlock;
  wire[2:0] ctrl_io_dmem_hburst;
  wire[3:0] ctrl_io_dmem_hprot;
  wire[1:0] ctrl_io_dmem_htrans;
  wire ctrl_io_dmem_hmastlock;
  wire[31:0] dpath_io_ctrl_inst;
  wire dpath_io_ctrl_ma_pc;
  wire dpath_io_ctrl_ma_addr;
  wire dpath_io_ctrl_br_taken;
  wire dpath_io_ctrl_mul_ready;
  wire dpath_io_ctrl_clear_sb;
  wire dpath_io_ctrl_csr_replay;
  wire dpath_io_ctrl_csr_xcpt;
  wire dpath_io_ctrl_csr_eret;
  wire dpath_io_ctrl_csr_interrupt;
  wire[31:0] dpath_io_ctrl_csr_interrupt_cause;
  wire[31:0] dpath_io_imem_haddr;
  wire[31:0] dpath_io_dmem_haddr;
  wire dpath_io_dmem_hwrite;
  wire[2:0] dpath_io_dmem_hsize;
  wire[31:0] dpath_io_dmem_hwdata;
  wire dpath_io_host_pcr_req_ready;
  wire dpath_io_host_pcr_rep_valid;
  wire[31:0] dpath_io_host_pcr_rep_bits;
  wire dpath_io_host_ipi_req_valid;
  wire dpath_io_host_ipi_req_bits;
  wire dpath_io_host_ipi_rep_ready;
  wire dpath_io_host_debug_stats_pcr;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_imem_hwdata = {1{$random}};
// synthesis translate_on
`endif
  assign io_host_debug_stats_pcr = dpath_io_host_debug_stats_pcr;
  assign io_host_ipi_rep_ready = dpath_io_host_ipi_rep_ready;
  assign io_host_ipi_req_bits = dpath_io_host_ipi_req_bits;
  assign io_host_ipi_req_valid = dpath_io_host_ipi_req_valid;
  assign io_host_pcr_rep_bits = dpath_io_host_pcr_rep_bits;
  assign io_host_pcr_rep_valid = dpath_io_host_pcr_rep_valid;
  assign io_host_pcr_req_ready = dpath_io_host_pcr_req_ready;
  assign io_dmem_hwdata = dpath_io_dmem_hwdata;
  assign io_dmem_hmastlock = ctrl_io_dmem_hmastlock;
  assign io_dmem_htrans = ctrl_io_dmem_htrans;
  assign io_dmem_hprot = ctrl_io_dmem_hprot;
  assign io_dmem_hburst = ctrl_io_dmem_hburst;
  assign io_dmem_hsize = dpath_io_dmem_hsize;
  assign io_dmem_hwrite = dpath_io_dmem_hwrite;
  assign io_dmem_haddr = dpath_io_dmem_haddr;
  assign io_imem_hmastlock = ctrl_io_imem_hmastlock;
  assign io_imem_htrans = ctrl_io_imem_htrans;
  assign io_imem_hprot = ctrl_io_imem_hprot;
  assign io_imem_hburst = ctrl_io_imem_hburst;
  assign io_imem_hsize = ctrl_io_imem_hsize;
  assign io_imem_hwrite = ctrl_io_imem_hwrite;
  assign io_imem_haddr = dpath_io_imem_haddr;
  Control ctrl(.clk(clk), .reset(reset),
       .io_dpath_stallf( ctrl_io_dpath_stallf ),
       .io_dpath_killf( ctrl_io_dpath_killf ),
       .io_dpath_stalldx( ctrl_io_dpath_stalldx ),
       .io_dpath_killdx( ctrl_io_dpath_killdx ),
       .io_dpath_stallw( ctrl_io_dpath_stallw ),
       .io_dpath_id_j( ctrl_io_dpath_id_j ),
       .io_dpath_id_br( ctrl_io_dpath_id_br ),
       .io_dpath_id_sel_alu1( ctrl_io_dpath_id_sel_alu1 ),
       .io_dpath_id_sel_alu2( ctrl_io_dpath_id_sel_alu2 ),
       .io_dpath_id_sel_imm( ctrl_io_dpath_id_sel_imm ),
       .io_dpath_id_fn_alu( ctrl_io_dpath_id_fn_alu ),
       .io_dpath_id_wen( ctrl_io_dpath_id_wen ),
       .io_dpath_id_csr_en( ctrl_io_dpath_id_csr_en ),
       .io_dpath_id_csr_cmd( ctrl_io_dpath_id_csr_cmd ),
       .io_dpath_id_mem_valid( ctrl_io_dpath_id_mem_valid ),
       .io_dpath_id_mem_rw( ctrl_io_dpath_id_mem_rw ),
       .io_dpath_id_mem_type( ctrl_io_dpath_id_mem_type ),
       .io_dpath_id_mul_valid( ctrl_io_dpath_id_mul_valid ),
       .io_dpath_id_xcpt( ctrl_io_dpath_id_xcpt ),
       .io_dpath_id_cause( ctrl_io_dpath_id_cause ),
       .io_dpath_ll_valid( ctrl_io_dpath_ll_valid ),
       .io_dpath_ll_waddr( ctrl_io_dpath_ll_waddr ),
       .io_dpath_ll_fn( ctrl_io_dpath_ll_fn ),
       .io_dpath_ll_mem_rw( ctrl_io_dpath_ll_mem_rw ),
       .io_dpath_ll_mem_type( ctrl_io_dpath_ll_mem_type ),
       .io_dpath_inst( dpath_io_ctrl_inst ),
       .io_dpath_ma_pc( dpath_io_ctrl_ma_pc ),
       .io_dpath_ma_addr( dpath_io_ctrl_ma_addr ),
       .io_dpath_br_taken( dpath_io_ctrl_br_taken ),
       .io_dpath_mul_ready( dpath_io_ctrl_mul_ready ),
       .io_dpath_clear_sb( dpath_io_ctrl_clear_sb ),
       .io_dpath_csr_replay( dpath_io_ctrl_csr_replay ),
       .io_dpath_csr_xcpt( dpath_io_ctrl_csr_xcpt ),
       .io_dpath_csr_eret( dpath_io_ctrl_csr_eret ),
       .io_dpath_csr_interrupt( dpath_io_ctrl_csr_interrupt ),
       .io_dpath_csr_interrupt_cause( dpath_io_ctrl_csr_interrupt_cause ),
       .io_dpath_logging_invalidate( ctrl_io_dpath_logging_invalidate ),
       .io_dpath_logging_sb_stall( ctrl_io_dpath_logging_sb_stall ),
       .io_dpath_logging_scr_stall( ctrl_io_dpath_logging_scr_stall ),
       .io_dpath_logging_dmem_stall( ctrl_io_dpath_logging_dmem_stall ),
       .io_dpath_logging_mul_stall( ctrl_io_dpath_logging_mul_stall ),
       //.io_imem_haddr(  )
       .io_imem_hwrite( ctrl_io_imem_hwrite ),
       .io_imem_hsize( ctrl_io_imem_hsize ),
       .io_imem_hburst( ctrl_io_imem_hburst ),
       .io_imem_hprot( ctrl_io_imem_hprot ),
       .io_imem_htrans( ctrl_io_imem_htrans ),
       .io_imem_hmastlock( ctrl_io_imem_hmastlock ),
       //.io_imem_hwdata(  )
       .io_imem_hrdata( io_imem_hrdata ),
       .io_imem_hready( io_imem_hready ),
       .io_imem_hresp( io_imem_hresp ),
       //.io_dmem_haddr(  )
       //.io_dmem_hwrite(  )
       //.io_dmem_hsize(  )
       .io_dmem_hburst( ctrl_io_dmem_hburst ),
       .io_dmem_hprot( ctrl_io_dmem_hprot ),
       .io_dmem_htrans( ctrl_io_dmem_htrans ),
       .io_dmem_hmastlock( ctrl_io_dmem_hmastlock ),
       //.io_dmem_hwdata(  )
       .io_dmem_hrdata( io_dmem_hrdata ),
       .io_dmem_hready( io_dmem_hready ),
       .io_dmem_hresp( io_dmem_hresp ),
       .io_host_reset( io_host_reset ),
       .io_host_id( io_host_id ),
       //.io_host_pcr_req_ready(  )
       .io_host_pcr_req_valid( io_host_pcr_req_valid ),
       .io_host_pcr_req_bits_rw( io_host_pcr_req_bits_rw ),
       .io_host_pcr_req_bits_addr( io_host_pcr_req_bits_addr ),
       .io_host_pcr_req_bits_data( io_host_pcr_req_bits_data ),
       .io_host_pcr_rep_ready( io_host_pcr_rep_ready ),
       //.io_host_pcr_rep_valid(  )
       //.io_host_pcr_rep_bits(  )
       .io_host_ipi_req_ready( io_host_ipi_req_ready ),
       //.io_host_ipi_req_valid(  )
       //.io_host_ipi_req_bits(  )
       //.io_host_ipi_rep_ready(  )
       .io_host_ipi_rep_valid( io_host_ipi_rep_valid ),
       .io_host_ipi_rep_bits( io_host_ipi_rep_bits )
       //.io_host_debug_stats_pcr(  )
  );
  Datapath dpath(.clk(clk), .reset(reset),
       .io_ctrl_stallf( ctrl_io_dpath_stallf ),
       .io_ctrl_killf( ctrl_io_dpath_killf ),
       .io_ctrl_stalldx( ctrl_io_dpath_stalldx ),
       .io_ctrl_killdx( ctrl_io_dpath_killdx ),
       .io_ctrl_stallw( ctrl_io_dpath_stallw ),
       .io_ctrl_id_j( ctrl_io_dpath_id_j ),
       .io_ctrl_id_br( ctrl_io_dpath_id_br ),
       .io_ctrl_id_sel_alu1( ctrl_io_dpath_id_sel_alu1 ),
       .io_ctrl_id_sel_alu2( ctrl_io_dpath_id_sel_alu2 ),
       .io_ctrl_id_sel_imm( ctrl_io_dpath_id_sel_imm ),
       .io_ctrl_id_fn_alu( ctrl_io_dpath_id_fn_alu ),
       .io_ctrl_id_wen( ctrl_io_dpath_id_wen ),
       .io_ctrl_id_csr_en( ctrl_io_dpath_id_csr_en ),
       .io_ctrl_id_csr_cmd( ctrl_io_dpath_id_csr_cmd ),
       .io_ctrl_id_mem_valid( ctrl_io_dpath_id_mem_valid ),
       .io_ctrl_id_mem_rw( ctrl_io_dpath_id_mem_rw ),
       .io_ctrl_id_mem_type( ctrl_io_dpath_id_mem_type ),
       .io_ctrl_id_mul_valid( ctrl_io_dpath_id_mul_valid ),
       .io_ctrl_id_xcpt( ctrl_io_dpath_id_xcpt ),
       .io_ctrl_id_cause( ctrl_io_dpath_id_cause ),
       .io_ctrl_ll_valid( ctrl_io_dpath_ll_valid ),
       .io_ctrl_ll_waddr( ctrl_io_dpath_ll_waddr ),
       .io_ctrl_ll_fn( ctrl_io_dpath_ll_fn ),
       .io_ctrl_ll_mem_rw( ctrl_io_dpath_ll_mem_rw ),
       .io_ctrl_ll_mem_type( ctrl_io_dpath_ll_mem_type ),
       .io_ctrl_inst( dpath_io_ctrl_inst ),
       .io_ctrl_ma_pc( dpath_io_ctrl_ma_pc ),
       .io_ctrl_ma_addr( dpath_io_ctrl_ma_addr ),
       .io_ctrl_br_taken( dpath_io_ctrl_br_taken ),
       .io_ctrl_mul_ready( dpath_io_ctrl_mul_ready ),
       .io_ctrl_clear_sb( dpath_io_ctrl_clear_sb ),
       .io_ctrl_csr_replay( dpath_io_ctrl_csr_replay ),
       .io_ctrl_csr_xcpt( dpath_io_ctrl_csr_xcpt ),
       .io_ctrl_csr_eret( dpath_io_ctrl_csr_eret ),
       .io_ctrl_csr_interrupt( dpath_io_ctrl_csr_interrupt ),
       .io_ctrl_csr_interrupt_cause( dpath_io_ctrl_csr_interrupt_cause ),
       .io_ctrl_logging_invalidate( ctrl_io_dpath_logging_invalidate ),
       .io_ctrl_logging_sb_stall( ctrl_io_dpath_logging_sb_stall ),
       .io_ctrl_logging_scr_stall( ctrl_io_dpath_logging_scr_stall ),
       .io_ctrl_logging_dmem_stall( ctrl_io_dpath_logging_dmem_stall ),
       .io_ctrl_logging_mul_stall( ctrl_io_dpath_logging_mul_stall ),
       .io_imem_haddr( dpath_io_imem_haddr ),
       //.io_imem_hwrite(  )
       //.io_imem_hsize(  )
       //.io_imem_hburst(  )
       //.io_imem_hprot(  )
       //.io_imem_htrans(  )
       //.io_imem_hmastlock(  )
       //.io_imem_hwdata(  )
       .io_imem_hrdata( io_imem_hrdata ),
       .io_imem_hready( io_imem_hready ),
       .io_imem_hresp( io_imem_hresp ),
       .io_dmem_haddr( dpath_io_dmem_haddr ),
       .io_dmem_hwrite( dpath_io_dmem_hwrite ),
       .io_dmem_hsize( dpath_io_dmem_hsize ),
       //.io_dmem_hburst(  )
       //.io_dmem_hprot(  )
       //.io_dmem_htrans(  )
       //.io_dmem_hmastlock(  )
       .io_dmem_hwdata( dpath_io_dmem_hwdata ),
       .io_dmem_hrdata( io_dmem_hrdata ),
       .io_dmem_hready( io_dmem_hready ),
       .io_dmem_hresp( io_dmem_hresp ),
       .io_host_reset( io_host_reset ),
       .io_host_id( io_host_id ),
       .io_host_pcr_req_ready( dpath_io_host_pcr_req_ready ),
       .io_host_pcr_req_valid( io_host_pcr_req_valid ),
       .io_host_pcr_req_bits_rw( io_host_pcr_req_bits_rw ),
       .io_host_pcr_req_bits_addr( io_host_pcr_req_bits_addr ),
       .io_host_pcr_req_bits_data( io_host_pcr_req_bits_data ),
       .io_host_pcr_rep_ready( io_host_pcr_rep_ready ),
       .io_host_pcr_rep_valid( dpath_io_host_pcr_rep_valid ),
       .io_host_pcr_rep_bits( dpath_io_host_pcr_rep_bits ),
       .io_host_ipi_req_ready( io_host_ipi_req_ready ),
       .io_host_ipi_req_valid( dpath_io_host_ipi_req_valid ),
       .io_host_ipi_req_bits( dpath_io_host_ipi_req_bits ),
       .io_host_ipi_rep_ready( dpath_io_host_ipi_rep_ready ),
       .io_host_ipi_rep_valid( io_host_ipi_rep_valid ),
       .io_host_ipi_rep_bits( io_host_ipi_rep_bits ),
       .io_host_debug_stats_pcr( dpath_io_host_debug_stats_pcr )
  );
endmodule

module HASTIBus_1(input clk,
    input [31:0] io_master_haddr,
    input  io_master_hwrite,
    input [2:0] io_master_hsize,
    input [2:0] io_master_hburst,
    input [3:0] io_master_hprot,
    input [1:0] io_master_htrans,
    input  io_master_hmastlock,
    input [31:0] io_master_hwdata,
    output[31:0] io_master_hrdata,
    output io_master_hready,
    output io_master_hresp,
    output[31:0] io_slaves_1_haddr,
    output io_slaves_1_hwrite,
    output[2:0] io_slaves_1_hsize,
    output[2:0] io_slaves_1_hburst,
    output[3:0] io_slaves_1_hprot,
    output[1:0] io_slaves_1_htrans,
    output io_slaves_1_hmastlock,
    output[31:0] io_slaves_1_hwdata,
    input [31:0] io_slaves_1_hrdata,
    output io_slaves_1_hsel,
    output io_slaves_1_hreadyin,
    input  io_slaves_1_hreadyout,
    input  io_slaves_1_hresp,
    output[31:0] io_slaves_0_haddr,
    output io_slaves_0_hwrite,
    output[2:0] io_slaves_0_hsize,
    output[2:0] io_slaves_0_hburst,
    output[3:0] io_slaves_0_hprot,
    output[1:0] io_slaves_0_htrans,
    output io_slaves_0_hmastlock,
    output[31:0] io_slaves_0_hwdata,
    input [31:0] io_slaves_0_hrdata,
    output io_slaves_0_hsel,
    output io_slaves_0_hreadyin,
    input  io_slaves_0_hreadyout,
    input  io_slaves_0_hresp
);

  wire T0;
  wire[1:0] T1;
  wire[1:0] T2;
  wire T3;
  wire[2:0] T4;
  wire T5;
  wire[17:0] T6;
  wire T7;
  wire T8;
  wire T9;
  reg  s1_hsels_1;
  wire T10;
  wire T11;
  reg  s1_hsels_0;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire[31:0] T16;
  wire[31:0] T17;
  wire[31:0] T18;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    s1_hsels_1 = {1{$random}};
    s1_hsels_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_slaves_0_hreadyin = io_master_hready;
  assign io_slaves_0_hsel = T0;
  assign T0 = T1[1'h0:1'h0];
  assign T1 = T5 ? 2'h1 : T2;
  assign T2 = T3 ? 2'h2 : 2'h0;
  assign T3 = T4 != 3'h0;
  assign T4 = io_master_haddr[5'h1f:5'h1d];
  assign T5 = T6 == 18'h0;
  assign T6 = io_master_haddr[5'h1f:4'he];
  assign io_slaves_0_hwdata = io_master_hwdata;
  assign io_slaves_0_hmastlock = io_master_hmastlock;
  assign io_slaves_0_htrans = io_master_htrans;
  assign io_slaves_0_hprot = io_master_hprot;
  assign io_slaves_0_hburst = io_master_hburst;
  assign io_slaves_0_hsize = io_master_hsize;
  assign io_slaves_0_hwrite = io_master_hwrite;
  assign io_slaves_0_haddr = io_master_haddr;
  assign io_slaves_1_hreadyin = io_master_hready;
  assign io_slaves_1_hsel = T7;
  assign T7 = T1[1'h1:1'h1];
  assign io_slaves_1_hwdata = io_master_hwdata;
  assign io_slaves_1_hmastlock = io_master_hmastlock;
  assign io_slaves_1_htrans = io_master_htrans;
  assign io_slaves_1_hprot = io_master_hprot;
  assign io_slaves_1_hburst = io_master_hburst;
  assign io_slaves_1_hsize = io_master_hsize;
  assign io_slaves_1_hwrite = io_master_hwrite;
  assign io_slaves_1_haddr = io_master_haddr;
  assign io_master_hresp = T8;
  assign T8 = T11 | T9;
  assign T9 = s1_hsels_1 ? io_slaves_1_hresp : 1'h0;
  assign T10 = io_slaves_1_hreadyout ? T7 : s1_hsels_1;
  assign T11 = s1_hsels_0 ? io_slaves_0_hresp : 1'h0;
  assign T12 = io_slaves_0_hreadyout ? T0 : s1_hsels_0;
  assign io_master_hready = T13;
  assign T13 = T15 | T14;
  assign T14 = s1_hsels_1 ? io_slaves_1_hreadyout : 1'h0;
  assign T15 = s1_hsels_0 ? io_slaves_0_hreadyout : 1'h0;
  assign io_master_hrdata = T16;
  assign T16 = T18 | T17;
  assign T17 = s1_hsels_1 ? io_slaves_1_hrdata : 32'h0;
  assign T18 = s1_hsels_0 ? io_slaves_0_hrdata : 32'h0;

  always @(posedge clk) begin
    if(io_slaves_1_hreadyout) begin
      s1_hsels_1 <= T7;
    end
    if(io_slaves_0_hreadyout) begin
      s1_hsels_0 <= T0;
    end
  end
endmodule

module HASTISlaveMux(input clk, input reset,
    input [31:0] io_ins_2_haddr,
    input  io_ins_2_hwrite,
    input [2:0] io_ins_2_hsize,
    input [2:0] io_ins_2_hburst,
    input [3:0] io_ins_2_hprot,
    input [1:0] io_ins_2_htrans,
    input  io_ins_2_hmastlock,
    input [31:0] io_ins_2_hwdata,
    output[31:0] io_ins_2_hrdata,
    input  io_ins_2_hsel,
    input  io_ins_2_hreadyin,
    output io_ins_2_hreadyout,
    output io_ins_2_hresp,
    input [31:0] io_ins_1_haddr,
    input  io_ins_1_hwrite,
    input [2:0] io_ins_1_hsize,
    input [2:0] io_ins_1_hburst,
    input [3:0] io_ins_1_hprot,
    input [1:0] io_ins_1_htrans,
    input  io_ins_1_hmastlock,
    input [31:0] io_ins_1_hwdata,
    output[31:0] io_ins_1_hrdata,
    input  io_ins_1_hsel,
    input  io_ins_1_hreadyin,
    output io_ins_1_hreadyout,
    output io_ins_1_hresp,
    input [31:0] io_ins_0_haddr,
    input  io_ins_0_hwrite,
    input [2:0] io_ins_0_hsize,
    input [2:0] io_ins_0_hburst,
    input [3:0] io_ins_0_hprot,
    input [1:0] io_ins_0_htrans,
    input  io_ins_0_hmastlock,
    input [31:0] io_ins_0_hwdata,
    output[31:0] io_ins_0_hrdata,
    input  io_ins_0_hsel,
    input  io_ins_0_hreadyin,
    output io_ins_0_hreadyout,
    output io_ins_0_hresp,
    output[31:0] io_out_haddr,
    output io_out_hwrite,
    output[2:0] io_out_hsize,
    output[2:0] io_out_hburst,
    output[3:0] io_out_hprot,
    output[1:0] io_out_htrans,
    output io_out_hmastlock,
    output[31:0] io_out_hwdata,
    input [31:0] io_out_hrdata,
    output io_out_hsel,
    output io_out_hreadyin,
    input  io_out_hreadyout,
    input  io_out_hresp
);

  wire T0;
  wire T1;
  reg  s1_grants_2;
  wire T140;
  wire T2;
  wire T3;
  wire[2:0] T4;
  wire[2:0] T5;
  wire[2:0] T6;
  wire requests_2;
  reg  s1_valid_2;
  wire T141;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire requests_1;
  reg  s1_valid_1;
  wire T142;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  reg  s1_grants_1;
  wire T143;
  wire T26;
  wire T27;
  wire T28;
  wire requests_0;
  reg  s1_valid_0;
  wire T144;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  reg  s1_grants_0;
  wire T145;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire[31:0] T46;
  wire[31:0] T47;
  wire[31:0] T48;
  wire[31:0] T49;
  wire[31:0] T50;
  wire T51;
  wire T52;
  wire T53;
  reg  s1_hmastlock_2;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  reg  s1_hmastlock_1;
  wire T58;
  wire T59;
  wire T60;
  reg  s1_hmastlock_0;
  wire T61;
  wire[1:0] T62;
  wire[1:0] T63;
  wire[1:0] T64;
  reg [1:0] s1_htrans_2;
  wire[1:0] T65;
  wire[1:0] T66;
  wire[1:0] T67;
  wire[1:0] T68;
  reg [1:0] s1_htrans_1;
  wire[1:0] T69;
  wire[1:0] T70;
  wire[1:0] T71;
  reg [1:0] s1_htrans_0;
  wire[1:0] T72;
  wire[3:0] T73;
  wire[3:0] T74;
  wire[3:0] T75;
  reg [3:0] s1_hprot_2;
  wire[3:0] T76;
  wire[3:0] T77;
  wire[3:0] T78;
  wire[3:0] T79;
  reg [3:0] s1_hprot_1;
  wire[3:0] T80;
  wire[3:0] T81;
  wire[3:0] T82;
  reg [3:0] s1_hprot_0;
  wire[3:0] T83;
  wire[2:0] T84;
  wire[2:0] T85;
  wire[2:0] T86;
  reg [2:0] s1_hburst_2;
  wire[2:0] T87;
  wire[2:0] T88;
  wire[2:0] T89;
  wire[2:0] T90;
  reg [2:0] s1_hburst_1;
  wire[2:0] T91;
  wire[2:0] T92;
  wire[2:0] T93;
  reg [2:0] s1_hburst_0;
  wire[2:0] T94;
  wire[2:0] T95;
  wire[2:0] T96;
  wire[2:0] T97;
  reg [2:0] s1_hsize_2;
  wire[2:0] T98;
  wire[2:0] T99;
  wire[2:0] T100;
  wire[2:0] T101;
  reg [2:0] s1_hsize_1;
  wire[2:0] T102;
  wire[2:0] T103;
  wire[2:0] T104;
  reg [2:0] s1_hsize_0;
  wire[2:0] T105;
  wire T106;
  wire T107;
  wire T108;
  reg  s1_hwrite_2;
  wire T109;
  wire T110;
  wire T111;
  wire T112;
  reg  s1_hwrite_1;
  wire T113;
  wire T114;
  wire T115;
  reg  s1_hwrite_0;
  wire T116;
  wire[31:0] T117;
  wire[31:0] T118;
  wire[31:0] T119;
  reg [31:0] s1_haddr_2;
  wire[31:0] T120;
  wire[31:0] T121;
  wire[31:0] T122;
  wire[31:0] T123;
  reg [31:0] s1_haddr_1;
  wire[31:0] T124;
  wire[31:0] T125;
  wire[31:0] T126;
  reg [31:0] s1_haddr_0;
  wire[31:0] T127;
  wire T128;
  wire T129;
  wire[31:0] T130;
  wire[31:0] T131;
  wire[31:0] T146;
  wire T132;
  wire T133;
  wire[31:0] T134;
  wire[31:0] T135;
  wire[31:0] T147;
  wire T136;
  wire T137;
  wire[31:0] T138;
  wire[31:0] T139;
  wire[31:0] T148;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    s1_grants_2 = {1{$random}};
    s1_valid_2 = {1{$random}};
    s1_valid_1 = {1{$random}};
    s1_grants_1 = {1{$random}};
    s1_valid_0 = {1{$random}};
    s1_grants_0 = {1{$random}};
    s1_hmastlock_2 = {1{$random}};
    s1_hmastlock_1 = {1{$random}};
    s1_hmastlock_0 = {1{$random}};
    s1_htrans_2 = {1{$random}};
    s1_htrans_1 = {1{$random}};
    s1_htrans_0 = {1{$random}};
    s1_hprot_2 = {1{$random}};
    s1_hprot_1 = {1{$random}};
    s1_hprot_0 = {1{$random}};
    s1_hburst_2 = {1{$random}};
    s1_hburst_1 = {1{$random}};
    s1_hburst_0 = {1{$random}};
    s1_hsize_2 = {1{$random}};
    s1_hsize_1 = {1{$random}};
    s1_hsize_0 = {1{$random}};
    s1_hwrite_2 = {1{$random}};
    s1_hwrite_1 = {1{$random}};
    s1_hwrite_0 = {1{$random}};
    s1_haddr_2 = {1{$random}};
    s1_haddr_1 = {1{$random}};
    s1_haddr_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out_hreadyin = T0;
  assign T0 = T41 | T1;
  assign T1 = s1_grants_2 ? io_ins_2_hreadyin : 1'h0;
  assign T140 = reset ? 1'h1 : T2;
  assign T2 = io_out_hreadyout ? T3 : s1_grants_2;
  assign T3 = T4[2'h2:2'h2];
  assign T4 = requests_0 ? 3'h1 : T5;
  assign T5 = requests_1 ? 3'h2 : T6;
  assign T6 = requests_2 ? 3'h4 : 3'h0;
  assign requests_2 = T15 | s1_valid_2;
  assign T141 = reset ? 1'h0 : T7;
  assign T7 = T12 ? T10 : T8;
  assign T8 = T9 ? 1'h0 : s1_valid_2;
  assign T9 = io_out_hreadyout & T3;
  assign T10 = io_ins_2_hsel & T11;
  assign T11 = io_ins_2_htrans != 2'h0;
  assign T12 = T14 & T13;
  assign T13 = T3 ^ 1'h1;
  assign T14 = io_out_hreadyout & s1_grants_2;
  assign T15 = io_ins_2_hsel & T16;
  assign T16 = io_ins_2_htrans != 2'h0;
  assign requests_1 = T27 | s1_valid_1;
  assign T142 = reset ? 1'h0 : T17;
  assign T17 = T23 ? T21 : T18;
  assign T18 = T19 ? 1'h0 : s1_valid_1;
  assign T19 = io_out_hreadyout & T20;
  assign T20 = T4[1'h1:1'h1];
  assign T21 = io_ins_1_hsel & T22;
  assign T22 = io_ins_1_htrans != 2'h0;
  assign T23 = T25 & T24;
  assign T24 = T20 ^ 1'h1;
  assign T25 = io_out_hreadyout & s1_grants_1;
  assign T143 = reset ? 1'h1 : T26;
  assign T26 = io_out_hreadyout ? T20 : s1_grants_1;
  assign T27 = io_ins_1_hsel & T28;
  assign T28 = io_ins_1_htrans != 2'h0;
  assign requests_0 = T39 | s1_valid_0;
  assign T144 = reset ? 1'h0 : T29;
  assign T29 = T35 ? T33 : T30;
  assign T30 = T31 ? 1'h0 : s1_valid_0;
  assign T31 = io_out_hreadyout & T32;
  assign T32 = T4[1'h0:1'h0];
  assign T33 = io_ins_0_hsel & T34;
  assign T34 = io_ins_0_htrans != 2'h0;
  assign T35 = T37 & T36;
  assign T36 = T32 ^ 1'h1;
  assign T37 = io_out_hreadyout & s1_grants_0;
  assign T145 = reset ? 1'h1 : T38;
  assign T38 = io_out_hreadyout ? T32 : s1_grants_0;
  assign T39 = io_ins_0_hsel & T40;
  assign T40 = io_ins_0_htrans != 2'h0;
  assign T41 = T43 | T42;
  assign T42 = s1_grants_1 ? io_ins_1_hreadyin : 1'h0;
  assign T43 = s1_grants_0 ? io_ins_0_hreadyin : 1'h0;
  assign io_out_hsel = T44;
  assign T44 = T45 | T3;
  assign T45 = T32 | T20;
  assign io_out_hwdata = T46;
  assign T46 = T48 | T47;
  assign T47 = s1_grants_2 ? io_ins_2_hwdata : 32'h0;
  assign T48 = T50 | T49;
  assign T49 = s1_grants_1 ? io_ins_1_hwdata : 32'h0;
  assign T50 = s1_grants_0 ? io_ins_0_hwdata : 32'h0;
  assign io_out_hmastlock = T51;
  assign T51 = T55 | T52;
  assign T52 = T3 ? T53 : 1'h0;
  assign T53 = s1_valid_2 ? s1_hmastlock_2 : io_ins_2_hmastlock;
  assign T54 = T12 ? io_ins_2_hmastlock : s1_hmastlock_2;
  assign T55 = T59 | T56;
  assign T56 = T20 ? T57 : 1'h0;
  assign T57 = s1_valid_1 ? s1_hmastlock_1 : io_ins_1_hmastlock;
  assign T58 = T23 ? io_ins_1_hmastlock : s1_hmastlock_1;
  assign T59 = T32 ? T60 : 1'h0;
  assign T60 = s1_valid_0 ? s1_hmastlock_0 : io_ins_0_hmastlock;
  assign T61 = T35 ? io_ins_0_hmastlock : s1_hmastlock_0;
  assign io_out_htrans = T62;
  assign T62 = T66 | T63;
  assign T63 = T3 ? T64 : 2'h0;
  assign T64 = s1_valid_2 ? s1_htrans_2 : io_ins_2_htrans;
  assign T65 = T12 ? io_ins_2_htrans : s1_htrans_2;
  assign T66 = T70 | T67;
  assign T67 = T20 ? T68 : 2'h0;
  assign T68 = s1_valid_1 ? s1_htrans_1 : io_ins_1_htrans;
  assign T69 = T23 ? io_ins_1_htrans : s1_htrans_1;
  assign T70 = T32 ? T71 : 2'h0;
  assign T71 = s1_valid_0 ? s1_htrans_0 : io_ins_0_htrans;
  assign T72 = T35 ? io_ins_0_htrans : s1_htrans_0;
  assign io_out_hprot = T73;
  assign T73 = T77 | T74;
  assign T74 = T3 ? T75 : 4'h0;
  assign T75 = s1_valid_2 ? s1_hprot_2 : io_ins_2_hprot;
  assign T76 = T12 ? io_ins_2_hprot : s1_hprot_2;
  assign T77 = T81 | T78;
  assign T78 = T20 ? T79 : 4'h0;
  assign T79 = s1_valid_1 ? s1_hprot_1 : io_ins_1_hprot;
  assign T80 = T23 ? io_ins_1_hprot : s1_hprot_1;
  assign T81 = T32 ? T82 : 4'h0;
  assign T82 = s1_valid_0 ? s1_hprot_0 : io_ins_0_hprot;
  assign T83 = T35 ? io_ins_0_hprot : s1_hprot_0;
  assign io_out_hburst = T84;
  assign T84 = T88 | T85;
  assign T85 = T3 ? T86 : 3'h0;
  assign T86 = s1_valid_2 ? s1_hburst_2 : io_ins_2_hburst;
  assign T87 = T12 ? io_ins_2_hburst : s1_hburst_2;
  assign T88 = T92 | T89;
  assign T89 = T20 ? T90 : 3'h0;
  assign T90 = s1_valid_1 ? s1_hburst_1 : io_ins_1_hburst;
  assign T91 = T23 ? io_ins_1_hburst : s1_hburst_1;
  assign T92 = T32 ? T93 : 3'h0;
  assign T93 = s1_valid_0 ? s1_hburst_0 : io_ins_0_hburst;
  assign T94 = T35 ? io_ins_0_hburst : s1_hburst_0;
  assign io_out_hsize = T95;
  assign T95 = T99 | T96;
  assign T96 = T3 ? T97 : 3'h0;
  assign T97 = s1_valid_2 ? s1_hsize_2 : io_ins_2_hsize;
  assign T98 = T12 ? io_ins_2_hsize : s1_hsize_2;
  assign T99 = T103 | T100;
  assign T100 = T20 ? T101 : 3'h0;
  assign T101 = s1_valid_1 ? s1_hsize_1 : io_ins_1_hsize;
  assign T102 = T23 ? io_ins_1_hsize : s1_hsize_1;
  assign T103 = T32 ? T104 : 3'h0;
  assign T104 = s1_valid_0 ? s1_hsize_0 : io_ins_0_hsize;
  assign T105 = T35 ? io_ins_0_hsize : s1_hsize_0;
  assign io_out_hwrite = T106;
  assign T106 = T110 | T107;
  assign T107 = T3 ? T108 : 1'h0;
  assign T108 = s1_valid_2 ? s1_hwrite_2 : io_ins_2_hwrite;
  assign T109 = T12 ? io_ins_2_hwrite : s1_hwrite_2;
  assign T110 = T114 | T111;
  assign T111 = T20 ? T112 : 1'h0;
  assign T112 = s1_valid_1 ? s1_hwrite_1 : io_ins_1_hwrite;
  assign T113 = T23 ? io_ins_1_hwrite : s1_hwrite_1;
  assign T114 = T32 ? T115 : 1'h0;
  assign T115 = s1_valid_0 ? s1_hwrite_0 : io_ins_0_hwrite;
  assign T116 = T35 ? io_ins_0_hwrite : s1_hwrite_0;
  assign io_out_haddr = T117;
  assign T117 = T121 | T118;
  assign T118 = T3 ? T119 : 32'h0;
  assign T119 = s1_valid_2 ? s1_haddr_2 : io_ins_2_haddr;
  assign T120 = T12 ? io_ins_2_haddr : s1_haddr_2;
  assign T121 = T125 | T122;
  assign T122 = T20 ? T123 : 32'h0;
  assign T123 = s1_valid_1 ? s1_haddr_1 : io_ins_1_haddr;
  assign T124 = T23 ? io_ins_1_haddr : s1_haddr_1;
  assign T125 = T32 ? T126 : 32'h0;
  assign T126 = s1_valid_0 ? s1_haddr_0 : io_ins_0_haddr;
  assign T127 = T35 ? io_ins_0_haddr : s1_haddr_0;
  assign io_ins_0_hresp = T128;
  assign T128 = s1_grants_0 & io_out_hresp;
  assign io_ins_0_hreadyout = T129;
  assign T129 = io_out_hreadyout & s1_grants_0;
  assign io_ins_0_hrdata = T130;
  assign T130 = T131 & io_out_hrdata;
  assign T131 = 32'h0 - T146;
  assign T146 = {31'h0, s1_grants_0};
  assign io_ins_1_hresp = T132;
  assign T132 = s1_grants_1 & io_out_hresp;
  assign io_ins_1_hreadyout = T133;
  assign T133 = io_out_hreadyout & s1_grants_1;
  assign io_ins_1_hrdata = T134;
  assign T134 = T135 & io_out_hrdata;
  assign T135 = 32'h0 - T147;
  assign T147 = {31'h0, s1_grants_1};
  assign io_ins_2_hresp = T136;
  assign T136 = s1_grants_2 & io_out_hresp;
  assign io_ins_2_hreadyout = T137;
  assign T137 = io_out_hreadyout & s1_grants_2;
  assign io_ins_2_hrdata = T138;
  assign T138 = T139 & io_out_hrdata;
  assign T139 = 32'h0 - T148;
  assign T148 = {31'h0, s1_grants_2};

  always @(posedge clk) begin
    if(reset) begin
      s1_grants_2 <= 1'h1;
    end else if(io_out_hreadyout) begin
      s1_grants_2 <= T3;
    end
    if(reset) begin
      s1_valid_2 <= 1'h0;
    end else if(T12) begin
      s1_valid_2 <= T10;
    end else if(T9) begin
      s1_valid_2 <= 1'h0;
    end
    if(reset) begin
      s1_valid_1 <= 1'h0;
    end else if(T23) begin
      s1_valid_1 <= T21;
    end else if(T19) begin
      s1_valid_1 <= 1'h0;
    end
    if(reset) begin
      s1_grants_1 <= 1'h1;
    end else if(io_out_hreadyout) begin
      s1_grants_1 <= T20;
    end
    if(reset) begin
      s1_valid_0 <= 1'h0;
    end else if(T35) begin
      s1_valid_0 <= T33;
    end else if(T31) begin
      s1_valid_0 <= 1'h0;
    end
    if(reset) begin
      s1_grants_0 <= 1'h1;
    end else if(io_out_hreadyout) begin
      s1_grants_0 <= T32;
    end
    if(T12) begin
      s1_hmastlock_2 <= io_ins_2_hmastlock;
    end
    if(T23) begin
      s1_hmastlock_1 <= io_ins_1_hmastlock;
    end
    if(T35) begin
      s1_hmastlock_0 <= io_ins_0_hmastlock;
    end
    if(T12) begin
      s1_htrans_2 <= io_ins_2_htrans;
    end
    if(T23) begin
      s1_htrans_1 <= io_ins_1_htrans;
    end
    if(T35) begin
      s1_htrans_0 <= io_ins_0_htrans;
    end
    if(T12) begin
      s1_hprot_2 <= io_ins_2_hprot;
    end
    if(T23) begin
      s1_hprot_1 <= io_ins_1_hprot;
    end
    if(T35) begin
      s1_hprot_0 <= io_ins_0_hprot;
    end
    if(T12) begin
      s1_hburst_2 <= io_ins_2_hburst;
    end
    if(T23) begin
      s1_hburst_1 <= io_ins_1_hburst;
    end
    if(T35) begin
      s1_hburst_0 <= io_ins_0_hburst;
    end
    if(T12) begin
      s1_hsize_2 <= io_ins_2_hsize;
    end
    if(T23) begin
      s1_hsize_1 <= io_ins_1_hsize;
    end
    if(T35) begin
      s1_hsize_0 <= io_ins_0_hsize;
    end
    if(T12) begin
      s1_hwrite_2 <= io_ins_2_hwrite;
    end
    if(T23) begin
      s1_hwrite_1 <= io_ins_1_hwrite;
    end
    if(T35) begin
      s1_hwrite_0 <= io_ins_0_hwrite;
    end
    if(T12) begin
      s1_haddr_2 <= io_ins_2_haddr;
    end
    if(T23) begin
      s1_haddr_1 <= io_ins_1_haddr;
    end
    if(T35) begin
      s1_haddr_0 <= io_ins_0_haddr;
    end
  end
endmodule

module HASTIXbar(input clk, input reset,
    input [31:0] io_masters_2_haddr,
    input  io_masters_2_hwrite,
    input [2:0] io_masters_2_hsize,
    input [2:0] io_masters_2_hburst,
    input [3:0] io_masters_2_hprot,
    input [1:0] io_masters_2_htrans,
    input  io_masters_2_hmastlock,
    input [31:0] io_masters_2_hwdata,
    output[31:0] io_masters_2_hrdata,
    output io_masters_2_hready,
    output io_masters_2_hresp,
    input [31:0] io_masters_1_haddr,
    input  io_masters_1_hwrite,
    input [2:0] io_masters_1_hsize,
    input [2:0] io_masters_1_hburst,
    input [3:0] io_masters_1_hprot,
    input [1:0] io_masters_1_htrans,
    input  io_masters_1_hmastlock,
    input [31:0] io_masters_1_hwdata,
    output[31:0] io_masters_1_hrdata,
    output io_masters_1_hready,
    output io_masters_1_hresp,
    input [31:0] io_masters_0_haddr,
    input  io_masters_0_hwrite,
    input [2:0] io_masters_0_hsize,
    input [2:0] io_masters_0_hburst,
    input [3:0] io_masters_0_hprot,
    input [1:0] io_masters_0_htrans,
    input  io_masters_0_hmastlock,
    input [31:0] io_masters_0_hwdata,
    output[31:0] io_masters_0_hrdata,
    output io_masters_0_hready,
    output io_masters_0_hresp,
    output[31:0] io_slaves_1_haddr,
    output io_slaves_1_hwrite,
    output[2:0] io_slaves_1_hsize,
    output[2:0] io_slaves_1_hburst,
    output[3:0] io_slaves_1_hprot,
    output[1:0] io_slaves_1_htrans,
    output io_slaves_1_hmastlock,
    output[31:0] io_slaves_1_hwdata,
    input [31:0] io_slaves_1_hrdata,
    output io_slaves_1_hsel,
    output io_slaves_1_hreadyin,
    input  io_slaves_1_hreadyout,
    input  io_slaves_1_hresp,
    output[31:0] io_slaves_0_haddr,
    output io_slaves_0_hwrite,
    output[2:0] io_slaves_0_hsize,
    output[2:0] io_slaves_0_hburst,
    output[3:0] io_slaves_0_hprot,
    output[1:0] io_slaves_0_htrans,
    output io_slaves_0_hmastlock,
    output[31:0] io_slaves_0_hwdata,
    input [31:0] io_slaves_0_hrdata,
    output io_slaves_0_hsel,
    output io_slaves_0_hreadyin,
    input  io_slaves_0_hreadyout,
    input  io_slaves_0_hresp
);

  wire[31:0] HASTIBus_io_master_hrdata;
  wire HASTIBus_io_master_hready;
  wire HASTIBus_io_master_hresp;
  wire[31:0] HASTIBus_io_slaves_1_haddr;
  wire HASTIBus_io_slaves_1_hwrite;
  wire[2:0] HASTIBus_io_slaves_1_hsize;
  wire[2:0] HASTIBus_io_slaves_1_hburst;
  wire[3:0] HASTIBus_io_slaves_1_hprot;
  wire[1:0] HASTIBus_io_slaves_1_htrans;
  wire HASTIBus_io_slaves_1_hmastlock;
  wire[31:0] HASTIBus_io_slaves_1_hwdata;
  wire HASTIBus_io_slaves_1_hsel;
  wire HASTIBus_io_slaves_1_hreadyin;
  wire[31:0] HASTIBus_io_slaves_0_haddr;
  wire HASTIBus_io_slaves_0_hwrite;
  wire[2:0] HASTIBus_io_slaves_0_hsize;
  wire[2:0] HASTIBus_io_slaves_0_hburst;
  wire[3:0] HASTIBus_io_slaves_0_hprot;
  wire[1:0] HASTIBus_io_slaves_0_htrans;
  wire HASTIBus_io_slaves_0_hmastlock;
  wire[31:0] HASTIBus_io_slaves_0_hwdata;
  wire HASTIBus_io_slaves_0_hsel;
  wire HASTIBus_io_slaves_0_hreadyin;
  wire[31:0] HASTIBus_1_io_master_hrdata;
  wire HASTIBus_1_io_master_hready;
  wire HASTIBus_1_io_master_hresp;
  wire[31:0] HASTIBus_1_io_slaves_1_haddr;
  wire HASTIBus_1_io_slaves_1_hwrite;
  wire[2:0] HASTIBus_1_io_slaves_1_hsize;
  wire[2:0] HASTIBus_1_io_slaves_1_hburst;
  wire[3:0] HASTIBus_1_io_slaves_1_hprot;
  wire[1:0] HASTIBus_1_io_slaves_1_htrans;
  wire HASTIBus_1_io_slaves_1_hmastlock;
  wire[31:0] HASTIBus_1_io_slaves_1_hwdata;
  wire HASTIBus_1_io_slaves_1_hsel;
  wire HASTIBus_1_io_slaves_1_hreadyin;
  wire[31:0] HASTIBus_1_io_slaves_0_haddr;
  wire HASTIBus_1_io_slaves_0_hwrite;
  wire[2:0] HASTIBus_1_io_slaves_0_hsize;
  wire[2:0] HASTIBus_1_io_slaves_0_hburst;
  wire[3:0] HASTIBus_1_io_slaves_0_hprot;
  wire[1:0] HASTIBus_1_io_slaves_0_htrans;
  wire HASTIBus_1_io_slaves_0_hmastlock;
  wire[31:0] HASTIBus_1_io_slaves_0_hwdata;
  wire HASTIBus_1_io_slaves_0_hsel;
  wire HASTIBus_1_io_slaves_0_hreadyin;
  wire[31:0] HASTIBus_2_io_master_hrdata;
  wire HASTIBus_2_io_master_hready;
  wire HASTIBus_2_io_master_hresp;
  wire[31:0] HASTIBus_2_io_slaves_1_haddr;
  wire HASTIBus_2_io_slaves_1_hwrite;
  wire[2:0] HASTIBus_2_io_slaves_1_hsize;
  wire[2:0] HASTIBus_2_io_slaves_1_hburst;
  wire[3:0] HASTIBus_2_io_slaves_1_hprot;
  wire[1:0] HASTIBus_2_io_slaves_1_htrans;
  wire HASTIBus_2_io_slaves_1_hmastlock;
  wire[31:0] HASTIBus_2_io_slaves_1_hwdata;
  wire HASTIBus_2_io_slaves_1_hsel;
  wire HASTIBus_2_io_slaves_1_hreadyin;
  wire[31:0] HASTIBus_2_io_slaves_0_haddr;
  wire HASTIBus_2_io_slaves_0_hwrite;
  wire[2:0] HASTIBus_2_io_slaves_0_hsize;
  wire[2:0] HASTIBus_2_io_slaves_0_hburst;
  wire[3:0] HASTIBus_2_io_slaves_0_hprot;
  wire[1:0] HASTIBus_2_io_slaves_0_htrans;
  wire HASTIBus_2_io_slaves_0_hmastlock;
  wire[31:0] HASTIBus_2_io_slaves_0_hwdata;
  wire HASTIBus_2_io_slaves_0_hsel;
  wire HASTIBus_2_io_slaves_0_hreadyin;
  wire[31:0] HASTISlaveMux_io_ins_2_hrdata;
  wire HASTISlaveMux_io_ins_2_hreadyout;
  wire HASTISlaveMux_io_ins_2_hresp;
  wire[31:0] HASTISlaveMux_io_ins_1_hrdata;
  wire HASTISlaveMux_io_ins_1_hreadyout;
  wire HASTISlaveMux_io_ins_1_hresp;
  wire[31:0] HASTISlaveMux_io_ins_0_hrdata;
  wire HASTISlaveMux_io_ins_0_hreadyout;
  wire HASTISlaveMux_io_ins_0_hresp;
  wire[31:0] HASTISlaveMux_io_out_haddr;
  wire HASTISlaveMux_io_out_hwrite;
  wire[2:0] HASTISlaveMux_io_out_hsize;
  wire[2:0] HASTISlaveMux_io_out_hburst;
  wire[3:0] HASTISlaveMux_io_out_hprot;
  wire[1:0] HASTISlaveMux_io_out_htrans;
  wire HASTISlaveMux_io_out_hmastlock;
  wire[31:0] HASTISlaveMux_io_out_hwdata;
  wire HASTISlaveMux_io_out_hsel;
  wire HASTISlaveMux_io_out_hreadyin;
  wire[31:0] HASTISlaveMux_1_io_ins_2_hrdata;
  wire HASTISlaveMux_1_io_ins_2_hreadyout;
  wire HASTISlaveMux_1_io_ins_2_hresp;
  wire[31:0] HASTISlaveMux_1_io_ins_1_hrdata;
  wire HASTISlaveMux_1_io_ins_1_hreadyout;
  wire HASTISlaveMux_1_io_ins_1_hresp;
  wire[31:0] HASTISlaveMux_1_io_ins_0_hrdata;
  wire HASTISlaveMux_1_io_ins_0_hreadyout;
  wire HASTISlaveMux_1_io_ins_0_hresp;
  wire[31:0] HASTISlaveMux_1_io_out_haddr;
  wire HASTISlaveMux_1_io_out_hwrite;
  wire[2:0] HASTISlaveMux_1_io_out_hsize;
  wire[2:0] HASTISlaveMux_1_io_out_hburst;
  wire[3:0] HASTISlaveMux_1_io_out_hprot;
  wire[1:0] HASTISlaveMux_1_io_out_htrans;
  wire HASTISlaveMux_1_io_out_hmastlock;
  wire[31:0] HASTISlaveMux_1_io_out_hwdata;
  wire HASTISlaveMux_1_io_out_hsel;
  wire HASTISlaveMux_1_io_out_hreadyin;


  assign io_slaves_0_hreadyin = HASTISlaveMux_io_out_hreadyin;
  assign io_slaves_0_hsel = HASTISlaveMux_io_out_hsel;
  assign io_slaves_0_hwdata = HASTISlaveMux_io_out_hwdata;
  assign io_slaves_0_hmastlock = HASTISlaveMux_io_out_hmastlock;
  assign io_slaves_0_htrans = HASTISlaveMux_io_out_htrans;
  assign io_slaves_0_hprot = HASTISlaveMux_io_out_hprot;
  assign io_slaves_0_hburst = HASTISlaveMux_io_out_hburst;
  assign io_slaves_0_hsize = HASTISlaveMux_io_out_hsize;
  assign io_slaves_0_hwrite = HASTISlaveMux_io_out_hwrite;
  assign io_slaves_0_haddr = HASTISlaveMux_io_out_haddr;
  assign io_slaves_1_hreadyin = HASTISlaveMux_1_io_out_hreadyin;
  assign io_slaves_1_hsel = HASTISlaveMux_1_io_out_hsel;
  assign io_slaves_1_hwdata = HASTISlaveMux_1_io_out_hwdata;
  assign io_slaves_1_hmastlock = HASTISlaveMux_1_io_out_hmastlock;
  assign io_slaves_1_htrans = HASTISlaveMux_1_io_out_htrans;
  assign io_slaves_1_hprot = HASTISlaveMux_1_io_out_hprot;
  assign io_slaves_1_hburst = HASTISlaveMux_1_io_out_hburst;
  assign io_slaves_1_hsize = HASTISlaveMux_1_io_out_hsize;
  assign io_slaves_1_hwrite = HASTISlaveMux_1_io_out_hwrite;
  assign io_slaves_1_haddr = HASTISlaveMux_1_io_out_haddr;
  assign io_masters_0_hresp = HASTIBus_io_master_hresp;
  assign io_masters_0_hready = HASTIBus_io_master_hready;
  assign io_masters_0_hrdata = HASTIBus_io_master_hrdata;
  assign io_masters_1_hresp = HASTIBus_1_io_master_hresp;
  assign io_masters_1_hready = HASTIBus_1_io_master_hready;
  assign io_masters_1_hrdata = HASTIBus_1_io_master_hrdata;
  assign io_masters_2_hresp = HASTIBus_2_io_master_hresp;
  assign io_masters_2_hready = HASTIBus_2_io_master_hready;
  assign io_masters_2_hrdata = HASTIBus_2_io_master_hrdata;
  HASTIBus_1 HASTIBus(.clk(clk),
       .io_master_haddr( io_masters_0_haddr ),
       .io_master_hwrite( io_masters_0_hwrite ),
       .io_master_hsize( io_masters_0_hsize ),
       .io_master_hburst( io_masters_0_hburst ),
       .io_master_hprot( io_masters_0_hprot ),
       .io_master_htrans( io_masters_0_htrans ),
       .io_master_hmastlock( io_masters_0_hmastlock ),
       .io_master_hwdata( io_masters_0_hwdata ),
       .io_master_hrdata( HASTIBus_io_master_hrdata ),
       .io_master_hready( HASTIBus_io_master_hready ),
       .io_master_hresp( HASTIBus_io_master_hresp ),
       .io_slaves_1_haddr( HASTIBus_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( HASTIBus_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( HASTIBus_io_slaves_1_hsize ),
       .io_slaves_1_hburst( HASTIBus_io_slaves_1_hburst ),
       .io_slaves_1_hprot( HASTIBus_io_slaves_1_hprot ),
       .io_slaves_1_htrans( HASTIBus_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( HASTIBus_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( HASTIBus_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( HASTISlaveMux_1_io_ins_0_hrdata ),
       .io_slaves_1_hsel( HASTIBus_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( HASTIBus_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( HASTISlaveMux_1_io_ins_0_hreadyout ),
       .io_slaves_1_hresp( HASTISlaveMux_1_io_ins_0_hresp ),
       .io_slaves_0_haddr( HASTIBus_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( HASTIBus_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( HASTIBus_io_slaves_0_hsize ),
       .io_slaves_0_hburst( HASTIBus_io_slaves_0_hburst ),
       .io_slaves_0_hprot( HASTIBus_io_slaves_0_hprot ),
       .io_slaves_0_htrans( HASTIBus_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( HASTIBus_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( HASTIBus_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( HASTISlaveMux_io_ins_0_hrdata ),
       .io_slaves_0_hsel( HASTIBus_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( HASTIBus_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( HASTISlaveMux_io_ins_0_hreadyout ),
       .io_slaves_0_hresp( HASTISlaveMux_io_ins_0_hresp )
  );
  HASTIBus_1 HASTIBus_1(.clk(clk),
       .io_master_haddr( io_masters_1_haddr ),
       .io_master_hwrite( io_masters_1_hwrite ),
       .io_master_hsize( io_masters_1_hsize ),
       .io_master_hburst( io_masters_1_hburst ),
       .io_master_hprot( io_masters_1_hprot ),
       .io_master_htrans( io_masters_1_htrans ),
       .io_master_hmastlock( io_masters_1_hmastlock ),
       .io_master_hwdata( io_masters_1_hwdata ),
       .io_master_hrdata( HASTIBus_1_io_master_hrdata ),
       .io_master_hready( HASTIBus_1_io_master_hready ),
       .io_master_hresp( HASTIBus_1_io_master_hresp ),
       .io_slaves_1_haddr( HASTIBus_1_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( HASTIBus_1_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( HASTIBus_1_io_slaves_1_hsize ),
       .io_slaves_1_hburst( HASTIBus_1_io_slaves_1_hburst ),
       .io_slaves_1_hprot( HASTIBus_1_io_slaves_1_hprot ),
       .io_slaves_1_htrans( HASTIBus_1_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( HASTIBus_1_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( HASTIBus_1_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( HASTISlaveMux_1_io_ins_1_hrdata ),
       .io_slaves_1_hsel( HASTIBus_1_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( HASTIBus_1_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( HASTISlaveMux_1_io_ins_1_hreadyout ),
       .io_slaves_1_hresp( HASTISlaveMux_1_io_ins_1_hresp ),
       .io_slaves_0_haddr( HASTIBus_1_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( HASTIBus_1_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( HASTIBus_1_io_slaves_0_hsize ),
       .io_slaves_0_hburst( HASTIBus_1_io_slaves_0_hburst ),
       .io_slaves_0_hprot( HASTIBus_1_io_slaves_0_hprot ),
       .io_slaves_0_htrans( HASTIBus_1_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( HASTIBus_1_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( HASTIBus_1_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( HASTISlaveMux_io_ins_1_hrdata ),
       .io_slaves_0_hsel( HASTIBus_1_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( HASTIBus_1_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( HASTISlaveMux_io_ins_1_hreadyout ),
       .io_slaves_0_hresp( HASTISlaveMux_io_ins_1_hresp )
  );
  HASTIBus_1 HASTIBus_2(.clk(clk),
       .io_master_haddr( io_masters_2_haddr ),
       .io_master_hwrite( io_masters_2_hwrite ),
       .io_master_hsize( io_masters_2_hsize ),
       .io_master_hburst( io_masters_2_hburst ),
       .io_master_hprot( io_masters_2_hprot ),
       .io_master_htrans( io_masters_2_htrans ),
       .io_master_hmastlock( io_masters_2_hmastlock ),
       .io_master_hwdata( io_masters_2_hwdata ),
       .io_master_hrdata( HASTIBus_2_io_master_hrdata ),
       .io_master_hready( HASTIBus_2_io_master_hready ),
       .io_master_hresp( HASTIBus_2_io_master_hresp ),
       .io_slaves_1_haddr( HASTIBus_2_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( HASTIBus_2_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( HASTIBus_2_io_slaves_1_hsize ),
       .io_slaves_1_hburst( HASTIBus_2_io_slaves_1_hburst ),
       .io_slaves_1_hprot( HASTIBus_2_io_slaves_1_hprot ),
       .io_slaves_1_htrans( HASTIBus_2_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( HASTIBus_2_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( HASTIBus_2_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( HASTISlaveMux_1_io_ins_2_hrdata ),
       .io_slaves_1_hsel( HASTIBus_2_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( HASTIBus_2_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( HASTISlaveMux_1_io_ins_2_hreadyout ),
       .io_slaves_1_hresp( HASTISlaveMux_1_io_ins_2_hresp ),
       .io_slaves_0_haddr( HASTIBus_2_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( HASTIBus_2_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( HASTIBus_2_io_slaves_0_hsize ),
       .io_slaves_0_hburst( HASTIBus_2_io_slaves_0_hburst ),
       .io_slaves_0_hprot( HASTIBus_2_io_slaves_0_hprot ),
       .io_slaves_0_htrans( HASTIBus_2_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( HASTIBus_2_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( HASTIBus_2_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( HASTISlaveMux_io_ins_2_hrdata ),
       .io_slaves_0_hsel( HASTIBus_2_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( HASTIBus_2_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( HASTISlaveMux_io_ins_2_hreadyout ),
       .io_slaves_0_hresp( HASTISlaveMux_io_ins_2_hresp )
  );
  HASTISlaveMux HASTISlaveMux(.clk(clk), .reset(reset),
       .io_ins_2_haddr( HASTIBus_2_io_slaves_0_haddr ),
       .io_ins_2_hwrite( HASTIBus_2_io_slaves_0_hwrite ),
       .io_ins_2_hsize( HASTIBus_2_io_slaves_0_hsize ),
       .io_ins_2_hburst( HASTIBus_2_io_slaves_0_hburst ),
       .io_ins_2_hprot( HASTIBus_2_io_slaves_0_hprot ),
       .io_ins_2_htrans( HASTIBus_2_io_slaves_0_htrans ),
       .io_ins_2_hmastlock( HASTIBus_2_io_slaves_0_hmastlock ),
       .io_ins_2_hwdata( HASTIBus_2_io_slaves_0_hwdata ),
       .io_ins_2_hrdata( HASTISlaveMux_io_ins_2_hrdata ),
       .io_ins_2_hsel( HASTIBus_2_io_slaves_0_hsel ),
       .io_ins_2_hreadyin( HASTIBus_2_io_slaves_0_hreadyin ),
       .io_ins_2_hreadyout( HASTISlaveMux_io_ins_2_hreadyout ),
       .io_ins_2_hresp( HASTISlaveMux_io_ins_2_hresp ),
       .io_ins_1_haddr( HASTIBus_1_io_slaves_0_haddr ),
       .io_ins_1_hwrite( HASTIBus_1_io_slaves_0_hwrite ),
       .io_ins_1_hsize( HASTIBus_1_io_slaves_0_hsize ),
       .io_ins_1_hburst( HASTIBus_1_io_slaves_0_hburst ),
       .io_ins_1_hprot( HASTIBus_1_io_slaves_0_hprot ),
       .io_ins_1_htrans( HASTIBus_1_io_slaves_0_htrans ),
       .io_ins_1_hmastlock( HASTIBus_1_io_slaves_0_hmastlock ),
       .io_ins_1_hwdata( HASTIBus_1_io_slaves_0_hwdata ),
       .io_ins_1_hrdata( HASTISlaveMux_io_ins_1_hrdata ),
       .io_ins_1_hsel( HASTIBus_1_io_slaves_0_hsel ),
       .io_ins_1_hreadyin( HASTIBus_1_io_slaves_0_hreadyin ),
       .io_ins_1_hreadyout( HASTISlaveMux_io_ins_1_hreadyout ),
       .io_ins_1_hresp( HASTISlaveMux_io_ins_1_hresp ),
       .io_ins_0_haddr( HASTIBus_io_slaves_0_haddr ),
       .io_ins_0_hwrite( HASTIBus_io_slaves_0_hwrite ),
       .io_ins_0_hsize( HASTIBus_io_slaves_0_hsize ),
       .io_ins_0_hburst( HASTIBus_io_slaves_0_hburst ),
       .io_ins_0_hprot( HASTIBus_io_slaves_0_hprot ),
       .io_ins_0_htrans( HASTIBus_io_slaves_0_htrans ),
       .io_ins_0_hmastlock( HASTIBus_io_slaves_0_hmastlock ),
       .io_ins_0_hwdata( HASTIBus_io_slaves_0_hwdata ),
       .io_ins_0_hrdata( HASTISlaveMux_io_ins_0_hrdata ),
       .io_ins_0_hsel( HASTIBus_io_slaves_0_hsel ),
       .io_ins_0_hreadyin( HASTIBus_io_slaves_0_hreadyin ),
       .io_ins_0_hreadyout( HASTISlaveMux_io_ins_0_hreadyout ),
       .io_ins_0_hresp( HASTISlaveMux_io_ins_0_hresp ),
       .io_out_haddr( HASTISlaveMux_io_out_haddr ),
       .io_out_hwrite( HASTISlaveMux_io_out_hwrite ),
       .io_out_hsize( HASTISlaveMux_io_out_hsize ),
       .io_out_hburst( HASTISlaveMux_io_out_hburst ),
       .io_out_hprot( HASTISlaveMux_io_out_hprot ),
       .io_out_htrans( HASTISlaveMux_io_out_htrans ),
       .io_out_hmastlock( HASTISlaveMux_io_out_hmastlock ),
       .io_out_hwdata( HASTISlaveMux_io_out_hwdata ),
       .io_out_hrdata( io_slaves_0_hrdata ),
       .io_out_hsel( HASTISlaveMux_io_out_hsel ),
       .io_out_hreadyin( HASTISlaveMux_io_out_hreadyin ),
       .io_out_hreadyout( io_slaves_0_hreadyout ),
       .io_out_hresp( io_slaves_0_hresp )
  );
  HASTISlaveMux HASTISlaveMux_1(.clk(clk), .reset(reset),
       .io_ins_2_haddr( HASTIBus_2_io_slaves_1_haddr ),
       .io_ins_2_hwrite( HASTIBus_2_io_slaves_1_hwrite ),
       .io_ins_2_hsize( HASTIBus_2_io_slaves_1_hsize ),
       .io_ins_2_hburst( HASTIBus_2_io_slaves_1_hburst ),
       .io_ins_2_hprot( HASTIBus_2_io_slaves_1_hprot ),
       .io_ins_2_htrans( HASTIBus_2_io_slaves_1_htrans ),
       .io_ins_2_hmastlock( HASTIBus_2_io_slaves_1_hmastlock ),
       .io_ins_2_hwdata( HASTIBus_2_io_slaves_1_hwdata ),
       .io_ins_2_hrdata( HASTISlaveMux_1_io_ins_2_hrdata ),
       .io_ins_2_hsel( HASTIBus_2_io_slaves_1_hsel ),
       .io_ins_2_hreadyin( HASTIBus_2_io_slaves_1_hreadyin ),
       .io_ins_2_hreadyout( HASTISlaveMux_1_io_ins_2_hreadyout ),
       .io_ins_2_hresp( HASTISlaveMux_1_io_ins_2_hresp ),
       .io_ins_1_haddr( HASTIBus_1_io_slaves_1_haddr ),
       .io_ins_1_hwrite( HASTIBus_1_io_slaves_1_hwrite ),
       .io_ins_1_hsize( HASTIBus_1_io_slaves_1_hsize ),
       .io_ins_1_hburst( HASTIBus_1_io_slaves_1_hburst ),
       .io_ins_1_hprot( HASTIBus_1_io_slaves_1_hprot ),
       .io_ins_1_htrans( HASTIBus_1_io_slaves_1_htrans ),
       .io_ins_1_hmastlock( HASTIBus_1_io_slaves_1_hmastlock ),
       .io_ins_1_hwdata( HASTIBus_1_io_slaves_1_hwdata ),
       .io_ins_1_hrdata( HASTISlaveMux_1_io_ins_1_hrdata ),
       .io_ins_1_hsel( HASTIBus_1_io_slaves_1_hsel ),
       .io_ins_1_hreadyin( HASTIBus_1_io_slaves_1_hreadyin ),
       .io_ins_1_hreadyout( HASTISlaveMux_1_io_ins_1_hreadyout ),
       .io_ins_1_hresp( HASTISlaveMux_1_io_ins_1_hresp ),
       .io_ins_0_haddr( HASTIBus_io_slaves_1_haddr ),
       .io_ins_0_hwrite( HASTIBus_io_slaves_1_hwrite ),
       .io_ins_0_hsize( HASTIBus_io_slaves_1_hsize ),
       .io_ins_0_hburst( HASTIBus_io_slaves_1_hburst ),
       .io_ins_0_hprot( HASTIBus_io_slaves_1_hprot ),
       .io_ins_0_htrans( HASTIBus_io_slaves_1_htrans ),
       .io_ins_0_hmastlock( HASTIBus_io_slaves_1_hmastlock ),
       .io_ins_0_hwdata( HASTIBus_io_slaves_1_hwdata ),
       .io_ins_0_hrdata( HASTISlaveMux_1_io_ins_0_hrdata ),
       .io_ins_0_hsel( HASTIBus_io_slaves_1_hsel ),
       .io_ins_0_hreadyin( HASTIBus_io_slaves_1_hreadyin ),
       .io_ins_0_hreadyout( HASTISlaveMux_1_io_ins_0_hreadyout ),
       .io_ins_0_hresp( HASTISlaveMux_1_io_ins_0_hresp ),
       .io_out_haddr( HASTISlaveMux_1_io_out_haddr ),
       .io_out_hwrite( HASTISlaveMux_1_io_out_hwrite ),
       .io_out_hsize( HASTISlaveMux_1_io_out_hsize ),
       .io_out_hburst( HASTISlaveMux_1_io_out_hburst ),
       .io_out_hprot( HASTISlaveMux_1_io_out_hprot ),
       .io_out_htrans( HASTISlaveMux_1_io_out_htrans ),
       .io_out_hmastlock( HASTISlaveMux_1_io_out_hmastlock ),
       .io_out_hwdata( HASTISlaveMux_1_io_out_hwdata ),
       .io_out_hrdata( io_slaves_1_hrdata ),
       .io_out_hsel( HASTISlaveMux_1_io_out_hsel ),
       .io_out_hreadyin( HASTISlaveMux_1_io_out_hreadyin ),
       .io_out_hreadyout( io_slaves_1_hreadyout ),
       .io_out_hresp( io_slaves_1_hresp )
  );
endmodule

module HASTISlaveToMaster(
    input [31:0] io_in_haddr,
    input  io_in_hwrite,
    input [2:0] io_in_hsize,
    input [2:0] io_in_hburst,
    input [3:0] io_in_hprot,
    input [1:0] io_in_htrans,
    input  io_in_hmastlock,
    input [31:0] io_in_hwdata,
    output[31:0] io_in_hrdata,
    input  io_in_hsel,
    input  io_in_hreadyin,
    output io_in_hreadyout,
    output io_in_hresp,
    output[31:0] io_out_haddr,
    output io_out_hwrite,
    output[2:0] io_out_hsize,
    output[2:0] io_out_hburst,
    output[3:0] io_out_hprot,
    output[1:0] io_out_htrans,
    output io_out_hmastlock,
    output[31:0] io_out_hwdata,
    input [31:0] io_out_hrdata,
    input  io_out_hready,
    input  io_out_hresp
);

  wire[1:0] T0;
  wire T1;


  assign io_out_hwdata = io_in_hwdata;
  assign io_out_hmastlock = io_in_hmastlock;
  assign io_out_htrans = T0;
  assign T0 = T1 ? io_in_htrans : 2'h0;
  assign T1 = io_in_hsel & io_in_hreadyin;
  assign io_out_hprot = io_in_hprot;
  assign io_out_hburst = io_in_hburst;
  assign io_out_hsize = io_in_hsize;
  assign io_out_hwrite = io_in_hwrite;
  assign io_out_haddr = io_in_haddr;
  assign io_in_hresp = io_out_hresp;
  assign io_in_hreadyout = io_out_hready;
  assign io_in_hrdata = io_out_hrdata;
endmodule

module HASTIBus_0(input clk,
    input [31:0] io_master_haddr,
    input  io_master_hwrite,
    input [2:0] io_master_hsize,
    input [2:0] io_master_hburst,
    input [3:0] io_master_hprot,
    input [1:0] io_master_htrans,
    input  io_master_hmastlock,
    input [31:0] io_master_hwdata,
    output[31:0] io_master_hrdata,
    output io_master_hready,
    output io_master_hresp,
    output[31:0] io_slaves_2_haddr,
    output io_slaves_2_hwrite,
    output[2:0] io_slaves_2_hsize,
    output[2:0] io_slaves_2_hburst,
    output[3:0] io_slaves_2_hprot,
    output[1:0] io_slaves_2_htrans,
    output io_slaves_2_hmastlock,
    output[31:0] io_slaves_2_hwdata,
    input [31:0] io_slaves_2_hrdata,
    output io_slaves_2_hsel,
    output io_slaves_2_hreadyin,
    input  io_slaves_2_hreadyout,
    input  io_slaves_2_hresp,
    output[31:0] io_slaves_1_haddr,
    output io_slaves_1_hwrite,
    output[2:0] io_slaves_1_hsize,
    output[2:0] io_slaves_1_hburst,
    output[3:0] io_slaves_1_hprot,
    output[1:0] io_slaves_1_htrans,
    output io_slaves_1_hmastlock,
    output[31:0] io_slaves_1_hwdata,
    input [31:0] io_slaves_1_hrdata,
    output io_slaves_1_hsel,
    output io_slaves_1_hreadyin,
    input  io_slaves_1_hreadyout,
    input  io_slaves_1_hresp,
    output[31:0] io_slaves_0_haddr,
    output io_slaves_0_hwrite,
    output[2:0] io_slaves_0_hsize,
    output[2:0] io_slaves_0_hburst,
    output[3:0] io_slaves_0_hprot,
    output[1:0] io_slaves_0_htrans,
    output io_slaves_0_hmastlock,
    output[31:0] io_slaves_0_hwdata,
    input [31:0] io_slaves_0_hrdata,
    output io_slaves_0_hsel,
    output io_slaves_0_hreadyin,
    input  io_slaves_0_hreadyout,
    input  io_slaves_0_hresp
);

  wire T0;
  wire[2:0] T1;
  wire[2:0] T2;
  wire[2:0] T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire[11:0] T8;
  wire T9;
  wire[5:0] T10;
  wire T11;
  wire[5:0] T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  reg  s1_hsels_2;
  wire T17;
  wire T18;
  wire T19;
  reg  s1_hsels_1;
  wire T20;
  wire T21;
  reg  s1_hsels_0;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire[31:0] T28;
  wire[31:0] T29;
  wire[31:0] T30;
  wire[31:0] T31;
  wire[31:0] T32;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    s1_hsels_2 = {1{$random}};
    s1_hsels_1 = {1{$random}};
    s1_hsels_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_slaves_0_hreadyin = io_master_hready;
  assign io_slaves_0_hsel = T0;
  assign T0 = T1[1'h0:1'h0];
  assign T1 = T11 ? 3'h1 : T2;
  assign T2 = T6 ? 3'h2 : T3;
  assign T3 = T4 ? 3'h4 : 3'h0;
  assign T4 = T5 == 1'h1;
  assign T5 = io_master_haddr[5'h1f:5'h1f];
  assign T6 = T9 & T7;
  assign T7 = T8 == 12'h0;
  assign T8 = io_master_haddr[5'h19:4'he];
  assign T9 = T10 == 6'h5;
  assign T10 = io_master_haddr[5'h1f:5'h1a];
  assign T11 = T12 == 6'h4;
  assign T12 = io_master_haddr[5'h1f:5'h1a];
  assign io_slaves_0_hwdata = io_master_hwdata;
  assign io_slaves_0_hmastlock = io_master_hmastlock;
  assign io_slaves_0_htrans = io_master_htrans;
  assign io_slaves_0_hprot = io_master_hprot;
  assign io_slaves_0_hburst = io_master_hburst;
  assign io_slaves_0_hsize = io_master_hsize;
  assign io_slaves_0_hwrite = io_master_hwrite;
  assign io_slaves_0_haddr = io_master_haddr;
  assign io_slaves_1_hreadyin = io_master_hready;
  assign io_slaves_1_hsel = T13;
  assign T13 = T1[1'h1:1'h1];
  assign io_slaves_1_hwdata = io_master_hwdata;
  assign io_slaves_1_hmastlock = io_master_hmastlock;
  assign io_slaves_1_htrans = io_master_htrans;
  assign io_slaves_1_hprot = io_master_hprot;
  assign io_slaves_1_hburst = io_master_hburst;
  assign io_slaves_1_hsize = io_master_hsize;
  assign io_slaves_1_hwrite = io_master_hwrite;
  assign io_slaves_1_haddr = io_master_haddr;
  assign io_slaves_2_hreadyin = io_master_hready;
  assign io_slaves_2_hsel = T14;
  assign T14 = T1[2'h2:2'h2];
  assign io_slaves_2_hwdata = io_master_hwdata;
  assign io_slaves_2_hmastlock = io_master_hmastlock;
  assign io_slaves_2_htrans = io_master_htrans;
  assign io_slaves_2_hprot = io_master_hprot;
  assign io_slaves_2_hburst = io_master_hburst;
  assign io_slaves_2_hsize = io_master_hsize;
  assign io_slaves_2_hwrite = io_master_hwrite;
  assign io_slaves_2_haddr = io_master_haddr;
  assign io_master_hresp = T15;
  assign T15 = T18 | T16;
  assign T16 = s1_hsels_2 ? io_slaves_2_hresp : 1'h0;
  assign T17 = io_slaves_2_hreadyout ? T14 : s1_hsels_2;
  assign T18 = T21 | T19;
  assign T19 = s1_hsels_1 ? io_slaves_1_hresp : 1'h0;
  assign T20 = io_slaves_1_hreadyout ? T13 : s1_hsels_1;
  assign T21 = s1_hsels_0 ? io_slaves_0_hresp : 1'h0;
  assign T22 = io_slaves_0_hreadyout ? T0 : s1_hsels_0;
  assign io_master_hready = T23;
  assign T23 = T25 | T24;
  assign T24 = s1_hsels_2 ? io_slaves_2_hreadyout : 1'h0;
  assign T25 = T27 | T26;
  assign T26 = s1_hsels_1 ? io_slaves_1_hreadyout : 1'h0;
  assign T27 = s1_hsels_0 ? io_slaves_0_hreadyout : 1'h0;
  assign io_master_hrdata = T28;
  assign T28 = T30 | T29;
  assign T29 = s1_hsels_2 ? io_slaves_2_hrdata : 32'h0;
  assign T30 = T32 | T31;
  assign T31 = s1_hsels_1 ? io_slaves_1_hrdata : 32'h0;
  assign T32 = s1_hsels_0 ? io_slaves_0_hrdata : 32'h0;

  always @(posedge clk) begin
    if(io_slaves_2_hreadyout) begin
      s1_hsels_2 <= T14;
    end
    if(io_slaves_1_hreadyout) begin
      s1_hsels_1 <= T13;
    end
    if(io_slaves_0_hreadyout) begin
      s1_hsels_0 <= T0;
    end
  end
endmodule

module HASTItoPOCIBridge(
    input [31:0] io_in_haddr,
    input  io_in_hwrite,
    input [2:0] io_in_hsize,
    input [2:0] io_in_hburst,
    input [3:0] io_in_hprot,
    input [1:0] io_in_htrans,
    input  io_in_hmastlock,
    input [31:0] io_in_hwdata,
    output[31:0] io_in_hrdata,
    input  io_in_hsel,
    input  io_in_hreadyin,
    output io_in_hreadyout,
    output io_in_hresp,
    output[31:0] io_out_paddr,
    output io_out_pwrite,
    output io_out_psel,
    output io_out_penable,
    output[31:0] io_out_pwdata,
    input [31:0] io_out_prdata,
    input  io_out_pready,
    input  io_out_pslverr
);

  wire T0;
  wire T1;


  assign io_out_pwdata = io_in_hwdata;
  assign io_out_penable = T0;
  assign T0 = io_in_htrans != 2'h0;
  assign io_out_psel = T1;
  assign T1 = io_in_hsel & io_in_hreadyin;
  assign io_out_pwrite = io_in_hwrite;
  assign io_out_paddr = io_in_haddr;
  assign io_in_hresp = io_out_pslverr;
  assign io_in_hreadyout = io_out_pready;
  assign io_in_hrdata = io_out_prdata;
endmodule

module POCIBus(input clk,
    input [31:0] io_master_paddr,
    input  io_master_pwrite,
    input  io_master_psel,
    input  io_master_penable,
    input [31:0] io_master_pwdata,
    output[31:0] io_master_prdata,
    output io_master_pready,
    output io_master_pslverr,
    output[31:0] io_slaves_1_paddr,
    output io_slaves_1_pwrite,
    output io_slaves_1_psel,
    output io_slaves_1_penable,
    output[31:0] io_slaves_1_pwdata,
    input [31:0] io_slaves_1_prdata,
    input  io_slaves_1_pready,
    input  io_slaves_1_pslverr,
    output[31:0] io_slaves_0_paddr,
    output io_slaves_0_pwrite,
    output io_slaves_0_psel,
    output io_slaves_0_penable,
    output[31:0] io_slaves_0_pwdata,
    input [31:0] io_slaves_0_prdata,
    input  io_slaves_0_pready,
    input  io_slaves_0_pslverr
);

  wire T0;
  wire[1:0] T1;
  wire[1:0] T2;
  wire T3;
  wire T4;
  wire[20:0] T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire[20:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  reg  s1_psels_1;
  wire T16;
  wire T17;
  reg  s1_psels_0;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire[31:0] T22;
  wire[31:0] T23;
  wire[31:0] T24;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    s1_psels_1 = {1{$random}};
    s1_psels_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_slaves_0_pwdata = io_master_pwdata;
  assign io_slaves_0_penable = io_master_penable;
  assign io_slaves_0_psel = T0;
  assign T0 = T1[1'h0:1'h0];
  assign T1 = T8 ? 2'h1 : T2;
  assign T2 = T3 ? 2'h2 : 2'h0;
  assign T3 = T6 & T4;
  assign T4 = T5 == 21'h1;
  assign T5 = io_master_paddr[5'h1e:4'ha];
  assign T6 = T7 == 1'h1;
  assign T7 = io_master_paddr[5'h1f:5'h1f];
  assign T8 = T11 & T9;
  assign T9 = T10 == 21'h0;
  assign T10 = io_master_paddr[5'h1e:4'ha];
  assign T11 = T12 == 1'h1;
  assign T12 = io_master_paddr[5'h1f:5'h1f];
  assign io_slaves_0_pwrite = io_master_pwrite;
  assign io_slaves_0_paddr = io_master_paddr;
  assign io_slaves_1_pwdata = io_master_pwdata;
  assign io_slaves_1_penable = io_master_penable;
  assign io_slaves_1_psel = T13;
  assign T13 = T1[1'h1:1'h1];
  assign io_slaves_1_pwrite = io_master_pwrite;
  assign io_slaves_1_paddr = io_master_paddr;
  assign io_master_pslverr = T14;
  assign T14 = T17 | T15;
  assign T15 = s1_psels_1 ? io_slaves_1_pslverr : 1'h0;
  assign T16 = io_slaves_1_pready ? T13 : s1_psels_1;
  assign T17 = s1_psels_0 ? io_slaves_0_pslverr : 1'h0;
  assign T18 = io_slaves_0_pready ? T0 : s1_psels_0;
  assign io_master_pready = T19;
  assign T19 = T21 | T20;
  assign T20 = s1_psels_1 ? io_slaves_1_pready : 1'h0;
  assign T21 = s1_psels_0 ? io_slaves_0_pready : 1'h0;
  assign io_master_prdata = T22;
  assign T22 = T24 | T23;
  assign T23 = s1_psels_1 ? io_slaves_1_prdata : 32'h0;
  assign T24 = s1_psels_0 ? io_slaves_0_prdata : 32'h0;

  always @(posedge clk) begin
    if(io_slaves_1_pready) begin
      s1_psels_1 <= T13;
    end
    if(io_slaves_0_pready) begin
      s1_psels_0 <= T0;
    end
  end
endmodule

module zscale(input clk, input reset,
    input  io_host_reset,
    input  io_host_id,
    output io_host_pcr_req_ready,
    input  io_host_pcr_req_valid,
    input  io_host_pcr_req_bits_rw,
    input [11:0] io_host_pcr_req_bits_addr,
    input [31:0] io_host_pcr_req_bits_data,
    input  io_host_pcr_rep_ready,
    output io_host_pcr_rep_valid,
    output[31:0] io_host_pcr_rep_bits,
    input  io_host_ipi_req_ready,
    output io_host_ipi_req_valid,
    output io_host_ipi_req_bits,
    output io_host_ipi_rep_ready,
    input  io_host_ipi_rep_valid,
    input  io_host_ipi_rep_bits,
    output io_host_debug_stats_pcr,
    input [31:0] io_jtag_haddr,
    input  io_jtag_hwrite,
    input [2:0] io_jtag_hsize,
    input [2:0] io_jtag_hburst,
    input [3:0] io_jtag_hprot,
    input [1:0] io_jtag_htrans,
    input  io_jtag_hmastlock,
    input [31:0] io_jtag_hwdata,
    output[31:0] io_jtag_hrdata,
    output io_jtag_hready,
    output io_jtag_hresp,
    output[31:0] io_bootmem_haddr,
    output io_bootmem_hwrite,
    output[2:0] io_bootmem_hsize,
    output[2:0] io_bootmem_hburst,
    output[3:0] io_bootmem_hprot,
    output[1:0] io_bootmem_htrans,
    output io_bootmem_hmastlock,
    output[31:0] io_bootmem_hwdata,
    input [31:0] io_bootmem_hrdata,
    output io_bootmem_hsel,
    output io_bootmem_hreadyin,
    input  io_bootmem_hreadyout,
    input  io_bootmem_hresp,
    output[31:0] io_dram_haddr,
    output io_dram_hwrite,
    output[2:0] io_dram_hsize,
    output[2:0] io_dram_hburst,
    output[3:0] io_dram_hprot,
    output[1:0] io_dram_htrans,
    output io_dram_hmastlock,
    output[31:0] io_dram_hwdata,
    input [31:0] io_dram_hrdata,
    output io_dram_hsel,
    output io_dram_hreadyin,
    input  io_dram_hreadyout,
    input  io_dram_hresp,
    output[31:0] io_spi_haddr,
    output io_spi_hwrite,
    output[2:0] io_spi_hsize,
    output[2:0] io_spi_hburst,
    output[3:0] io_spi_hprot,
    output[1:0] io_spi_htrans,
    output io_spi_hmastlock,
    output[31:0] io_spi_hwdata,
    input [31:0] io_spi_hrdata,
    output io_spi_hsel,
    output io_spi_hreadyin,
    input  io_spi_hreadyout,
    input  io_spi_hresp,
    output[31:0] io_led_paddr,
    output io_led_pwrite,
    output io_led_psel,
    output io_led_penable,
    output[31:0] io_led_pwdata,
    input [31:0] io_led_prdata,
    input  io_led_pready,
    input  io_led_pslverr,
    output[31:0] io_corereset_paddr,
    output io_corereset_pwrite,
    output io_corereset_psel,
    output io_corereset_penable,
    output[31:0] io_corereset_pwdata,
    input [31:0] io_corereset_prdata,
    input  io_corereset_pready,
    input  io_corereset_pslverr,
    input  init
);

  wire[31:0] sadapter_io_in_hrdata;
  wire sadapter_io_in_hreadyout;
  wire sadapter_io_in_hresp;
  wire[31:0] sadapter_io_out_haddr;
  wire sadapter_io_out_hwrite;
  wire[2:0] sadapter_io_out_hsize;
  wire[2:0] sadapter_io_out_hburst;
  wire[3:0] sadapter_io_out_hprot;
  wire[1:0] sadapter_io_out_htrans;
  wire sadapter_io_out_hmastlock;
  wire[31:0] sadapter_io_out_hwdata;
  wire[31:0] sbus_io_master_hrdata;
  wire sbus_io_master_hready;
  wire sbus_io_master_hresp;
  wire[31:0] sbus_io_slaves_2_haddr;
  wire sbus_io_slaves_2_hwrite;
  wire[2:0] sbus_io_slaves_2_hsize;
  wire[2:0] sbus_io_slaves_2_hburst;
  wire[3:0] sbus_io_slaves_2_hprot;
  wire[1:0] sbus_io_slaves_2_htrans;
  wire sbus_io_slaves_2_hmastlock;
  wire[31:0] sbus_io_slaves_2_hwdata;
  wire sbus_io_slaves_2_hsel;
  wire sbus_io_slaves_2_hreadyin;
  wire[31:0] sbus_io_slaves_1_haddr;
  wire sbus_io_slaves_1_hwrite;
  wire[2:0] sbus_io_slaves_1_hsize;
  wire[2:0] sbus_io_slaves_1_hburst;
  wire[3:0] sbus_io_slaves_1_hprot;
  wire[1:0] sbus_io_slaves_1_htrans;
  wire sbus_io_slaves_1_hmastlock;
  wire[31:0] sbus_io_slaves_1_hwdata;
  wire sbus_io_slaves_1_hsel;
  wire sbus_io_slaves_1_hreadyin;
  wire[31:0] sbus_io_slaves_0_haddr;
  wire sbus_io_slaves_0_hwrite;
  wire[2:0] sbus_io_slaves_0_hsize;
  wire[2:0] sbus_io_slaves_0_hburst;
  wire[3:0] sbus_io_slaves_0_hprot;
  wire[1:0] sbus_io_slaves_0_htrans;
  wire sbus_io_slaves_0_hmastlock;
  wire[31:0] sbus_io_slaves_0_hwdata;
  wire sbus_io_slaves_0_hsel;
  wire sbus_io_slaves_0_hreadyin;
  wire[31:0] padapter_io_in_hrdata;
  wire padapter_io_in_hreadyout;
  wire padapter_io_in_hresp;
  wire[31:0] padapter_io_out_paddr;
  wire padapter_io_out_pwrite;
  wire padapter_io_out_psel;
  wire padapter_io_out_penable;
  wire[31:0] padapter_io_out_pwdata;
  wire[31:0] pbus_io_master_prdata;
  wire pbus_io_master_pready;
  wire pbus_io_master_pslverr;
  wire[31:0] pbus_io_slaves_1_paddr;
  wire pbus_io_slaves_1_pwrite;
  wire pbus_io_slaves_1_psel;
  wire pbus_io_slaves_1_penable;
  wire[31:0] pbus_io_slaves_1_pwdata;
  wire[31:0] pbus_io_slaves_0_paddr;
  wire pbus_io_slaves_0_pwrite;
  wire pbus_io_slaves_0_psel;
  wire pbus_io_slaves_0_penable;
  wire[31:0] pbus_io_slaves_0_pwdata;
  wire[31:0] xbar_io_masters_2_hrdata;
  wire xbar_io_masters_2_hready;
  wire xbar_io_masters_2_hresp;
  wire[31:0] xbar_io_masters_1_hrdata;
  wire xbar_io_masters_1_hready;
  wire xbar_io_masters_1_hresp;
  wire[31:0] xbar_io_masters_0_hrdata;
  wire xbar_io_masters_0_hready;
  wire xbar_io_masters_0_hresp;
  wire[31:0] xbar_io_slaves_1_haddr;
  wire xbar_io_slaves_1_hwrite;
  wire[2:0] xbar_io_slaves_1_hsize;
  wire[2:0] xbar_io_slaves_1_hburst;
  wire[3:0] xbar_io_slaves_1_hprot;
  wire[1:0] xbar_io_slaves_1_htrans;
  wire xbar_io_slaves_1_hmastlock;
  wire[31:0] xbar_io_slaves_1_hwdata;
  wire xbar_io_slaves_1_hsel;
  wire xbar_io_slaves_1_hreadyin;
  wire[31:0] xbar_io_slaves_0_haddr;
  wire xbar_io_slaves_0_hwrite;
  wire[2:0] xbar_io_slaves_0_hsize;
  wire[2:0] xbar_io_slaves_0_hburst;
  wire[3:0] xbar_io_slaves_0_hprot;
  wire[1:0] xbar_io_slaves_0_htrans;
  wire xbar_io_slaves_0_hmastlock;
  wire[31:0] xbar_io_slaves_0_hwdata;
  wire xbar_io_slaves_0_hsel;
  wire xbar_io_slaves_0_hreadyin;
  wire[31:0] core_io_imem_haddr;
  wire core_io_imem_hwrite;
  wire[2:0] core_io_imem_hsize;
  wire[2:0] core_io_imem_hburst;
  wire[3:0] core_io_imem_hprot;
  wire[1:0] core_io_imem_htrans;
  wire core_io_imem_hmastlock;
  wire[31:0] core_io_dmem_haddr;
  wire core_io_dmem_hwrite;
  wire[2:0] core_io_dmem_hsize;
  wire[2:0] core_io_dmem_hburst;
  wire[3:0] core_io_dmem_hprot;
  wire[1:0] core_io_dmem_htrans;
  wire core_io_dmem_hmastlock;
  wire[31:0] core_io_dmem_hwdata;
  wire core_io_host_pcr_req_ready;
  wire core_io_host_pcr_rep_valid;
  wire[31:0] core_io_host_pcr_rep_bits;
  wire core_io_host_ipi_req_valid;
  wire core_io_host_ipi_req_bits;
  wire core_io_host_ipi_rep_ready;
  wire core_io_host_debug_stats_pcr;


  assign io_corereset_pwdata = pbus_io_slaves_1_pwdata;
  assign io_corereset_penable = pbus_io_slaves_1_penable;
  assign io_corereset_psel = pbus_io_slaves_1_psel;
  assign io_corereset_pwrite = pbus_io_slaves_1_pwrite;
  assign io_corereset_paddr = pbus_io_slaves_1_paddr;
  assign io_led_pwdata = pbus_io_slaves_0_pwdata;
  assign io_led_penable = pbus_io_slaves_0_penable;
  assign io_led_psel = pbus_io_slaves_0_psel;
  assign io_led_pwrite = pbus_io_slaves_0_pwrite;
  assign io_led_paddr = pbus_io_slaves_0_paddr;
  assign io_spi_hreadyin = sbus_io_slaves_1_hreadyin;
  assign io_spi_hsel = sbus_io_slaves_1_hsel;
  assign io_spi_hwdata = sbus_io_slaves_1_hwdata;
  assign io_spi_hmastlock = sbus_io_slaves_1_hmastlock;
  assign io_spi_htrans = sbus_io_slaves_1_htrans;
  assign io_spi_hprot = sbus_io_slaves_1_hprot;
  assign io_spi_hburst = sbus_io_slaves_1_hburst;
  assign io_spi_hsize = sbus_io_slaves_1_hsize;
  assign io_spi_hwrite = sbus_io_slaves_1_hwrite;
  assign io_spi_haddr = sbus_io_slaves_1_haddr;
  assign io_dram_hreadyin = sbus_io_slaves_0_hreadyin;
  assign io_dram_hsel = sbus_io_slaves_0_hsel;
  assign io_dram_hwdata = sbus_io_slaves_0_hwdata;
  assign io_dram_hmastlock = sbus_io_slaves_0_hmastlock;
  assign io_dram_htrans = sbus_io_slaves_0_htrans;
  assign io_dram_hprot = sbus_io_slaves_0_hprot;
  assign io_dram_hburst = sbus_io_slaves_0_hburst;
  assign io_dram_hsize = sbus_io_slaves_0_hsize;
  assign io_dram_hwrite = sbus_io_slaves_0_hwrite;
  assign io_dram_haddr = sbus_io_slaves_0_haddr;
  assign io_bootmem_hreadyin = xbar_io_slaves_0_hreadyin;
  assign io_bootmem_hsel = xbar_io_slaves_0_hsel;
  assign io_bootmem_hwdata = xbar_io_slaves_0_hwdata;
  assign io_bootmem_hmastlock = xbar_io_slaves_0_hmastlock;
  assign io_bootmem_htrans = xbar_io_slaves_0_htrans;
  assign io_bootmem_hprot = xbar_io_slaves_0_hprot;
  assign io_bootmem_hburst = xbar_io_slaves_0_hburst;
  assign io_bootmem_hsize = xbar_io_slaves_0_hsize;
  assign io_bootmem_hwrite = xbar_io_slaves_0_hwrite;
  assign io_bootmem_haddr = xbar_io_slaves_0_haddr;
  assign io_jtag_hresp = xbar_io_masters_0_hresp;
  assign io_jtag_hready = xbar_io_masters_0_hready;
  assign io_jtag_hrdata = xbar_io_masters_0_hrdata;
  assign io_host_debug_stats_pcr = core_io_host_debug_stats_pcr;
  assign io_host_ipi_rep_ready = core_io_host_ipi_rep_ready;
  assign io_host_ipi_req_bits = core_io_host_ipi_req_bits;
  assign io_host_ipi_req_valid = core_io_host_ipi_req_valid;
  assign io_host_pcr_rep_bits = core_io_host_pcr_rep_bits;
  assign io_host_pcr_rep_valid = core_io_host_pcr_rep_valid;
  assign io_host_pcr_req_ready = core_io_host_pcr_req_ready;
  Core core(.clk(clk), .reset(io_host_reset),
       .io_imem_haddr( core_io_imem_haddr ),
       .io_imem_hwrite( core_io_imem_hwrite ),
       .io_imem_hsize( core_io_imem_hsize ),
       .io_imem_hburst( core_io_imem_hburst ),
       .io_imem_hprot( core_io_imem_hprot ),
       .io_imem_htrans( core_io_imem_htrans ),
       .io_imem_hmastlock( core_io_imem_hmastlock ),
       //.io_imem_hwdata(  )
       .io_imem_hrdata( xbar_io_masters_2_hrdata ),
       .io_imem_hready( xbar_io_masters_2_hready ),
       .io_imem_hresp( xbar_io_masters_2_hresp ),
       .io_dmem_haddr( core_io_dmem_haddr ),
       .io_dmem_hwrite( core_io_dmem_hwrite ),
       .io_dmem_hsize( core_io_dmem_hsize ),
       .io_dmem_hburst( core_io_dmem_hburst ),
       .io_dmem_hprot( core_io_dmem_hprot ),
       .io_dmem_htrans( core_io_dmem_htrans ),
       .io_dmem_hmastlock( core_io_dmem_hmastlock ),
       .io_dmem_hwdata( core_io_dmem_hwdata ),
       .io_dmem_hrdata( xbar_io_masters_1_hrdata ),
       .io_dmem_hready( xbar_io_masters_1_hready ),
       .io_dmem_hresp( xbar_io_masters_1_hresp ),
       .io_host_reset( io_host_reset ),
       .io_host_id( io_host_id ),
       .io_host_pcr_req_ready( core_io_host_pcr_req_ready ),
       .io_host_pcr_req_valid( io_host_pcr_req_valid ),
       .io_host_pcr_req_bits_rw( io_host_pcr_req_bits_rw ),
       .io_host_pcr_req_bits_addr( io_host_pcr_req_bits_addr ),
       .io_host_pcr_req_bits_data( io_host_pcr_req_bits_data ),
       .io_host_pcr_rep_ready( io_host_pcr_rep_ready ),
       .io_host_pcr_rep_valid( core_io_host_pcr_rep_valid ),
       .io_host_pcr_rep_bits( core_io_host_pcr_rep_bits ),
       .io_host_ipi_req_ready( io_host_ipi_req_ready ),
       .io_host_ipi_req_valid( core_io_host_ipi_req_valid ),
       .io_host_ipi_req_bits( core_io_host_ipi_req_bits ),
       .io_host_ipi_rep_ready( core_io_host_ipi_rep_ready ),
       .io_host_ipi_rep_valid( io_host_ipi_rep_valid ),
       .io_host_ipi_rep_bits( io_host_ipi_rep_bits ),
       .io_host_debug_stats_pcr( core_io_host_debug_stats_pcr )
  );
  HASTIXbar xbar(.clk(clk), .reset(reset),
       .io_masters_2_haddr( core_io_imem_haddr ),
       .io_masters_2_hwrite( core_io_imem_hwrite ),
       .io_masters_2_hsize( core_io_imem_hsize ),
       .io_masters_2_hburst( core_io_imem_hburst ),
       .io_masters_2_hprot( core_io_imem_hprot ),
       .io_masters_2_htrans( core_io_imem_htrans ),
       .io_masters_2_hmastlock( core_io_imem_hmastlock ),
       //.io_masters_2_hwdata(  )
       .io_masters_2_hrdata( xbar_io_masters_2_hrdata ),
       .io_masters_2_hready( xbar_io_masters_2_hready ),
       .io_masters_2_hresp( xbar_io_masters_2_hresp ),
       .io_masters_1_haddr( core_io_dmem_haddr ),
       .io_masters_1_hwrite( core_io_dmem_hwrite ),
       .io_masters_1_hsize( core_io_dmem_hsize ),
       .io_masters_1_hburst( core_io_dmem_hburst ),
       .io_masters_1_hprot( core_io_dmem_hprot ),
       .io_masters_1_htrans( core_io_dmem_htrans ),
       .io_masters_1_hmastlock( core_io_dmem_hmastlock ),
       .io_masters_1_hwdata( core_io_dmem_hwdata ),
       .io_masters_1_hrdata( xbar_io_masters_1_hrdata ),
       .io_masters_1_hready( xbar_io_masters_1_hready ),
       .io_masters_1_hresp( xbar_io_masters_1_hresp ),
       .io_masters_0_haddr( io_jtag_haddr ),
       .io_masters_0_hwrite( io_jtag_hwrite ),
       .io_masters_0_hsize( io_jtag_hsize ),
       .io_masters_0_hburst( io_jtag_hburst ),
       .io_masters_0_hprot( io_jtag_hprot ),
       .io_masters_0_htrans( io_jtag_htrans ),
       .io_masters_0_hmastlock( io_jtag_hmastlock ),
       .io_masters_0_hwdata( io_jtag_hwdata ),
       .io_masters_0_hrdata( xbar_io_masters_0_hrdata ),
       .io_masters_0_hready( xbar_io_masters_0_hready ),
       .io_masters_0_hresp( xbar_io_masters_0_hresp ),
       .io_slaves_1_haddr( xbar_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( xbar_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( xbar_io_slaves_1_hsize ),
       .io_slaves_1_hburst( xbar_io_slaves_1_hburst ),
       .io_slaves_1_hprot( xbar_io_slaves_1_hprot ),
       .io_slaves_1_htrans( xbar_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( xbar_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( xbar_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( sadapter_io_in_hrdata ),
       .io_slaves_1_hsel( xbar_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( xbar_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( sadapter_io_in_hreadyout ),
       .io_slaves_1_hresp( sadapter_io_in_hresp ),
       .io_slaves_0_haddr( xbar_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( xbar_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( xbar_io_slaves_0_hsize ),
       .io_slaves_0_hburst( xbar_io_slaves_0_hburst ),
       .io_slaves_0_hprot( xbar_io_slaves_0_hprot ),
       .io_slaves_0_htrans( xbar_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( xbar_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( xbar_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( io_bootmem_hrdata ),
       .io_slaves_0_hsel( xbar_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( xbar_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( io_bootmem_hreadyout ),
       .io_slaves_0_hresp( io_bootmem_hresp )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign xbar.io_masters_2_hwdata = {1{$random}};
// synthesis translate_on
`endif
  HASTISlaveToMaster sadapter(
       .io_in_haddr( xbar_io_slaves_1_haddr ),
       .io_in_hwrite( xbar_io_slaves_1_hwrite ),
       .io_in_hsize( xbar_io_slaves_1_hsize ),
       .io_in_hburst( xbar_io_slaves_1_hburst ),
       .io_in_hprot( xbar_io_slaves_1_hprot ),
       .io_in_htrans( xbar_io_slaves_1_htrans ),
       .io_in_hmastlock( xbar_io_slaves_1_hmastlock ),
       .io_in_hwdata( xbar_io_slaves_1_hwdata ),
       .io_in_hrdata( sadapter_io_in_hrdata ),
       .io_in_hsel( xbar_io_slaves_1_hsel ),
       .io_in_hreadyin( xbar_io_slaves_1_hreadyin ),
       .io_in_hreadyout( sadapter_io_in_hreadyout ),
       .io_in_hresp( sadapter_io_in_hresp ),
       .io_out_haddr( sadapter_io_out_haddr ),
       .io_out_hwrite( sadapter_io_out_hwrite ),
       .io_out_hsize( sadapter_io_out_hsize ),
       .io_out_hburst( sadapter_io_out_hburst ),
       .io_out_hprot( sadapter_io_out_hprot ),
       .io_out_htrans( sadapter_io_out_htrans ),
       .io_out_hmastlock( sadapter_io_out_hmastlock ),
       .io_out_hwdata( sadapter_io_out_hwdata ),
       .io_out_hrdata( sbus_io_master_hrdata ),
       .io_out_hready( sbus_io_master_hready ),
       .io_out_hresp( sbus_io_master_hresp )
  );
  HASTIBus_0 sbus(.clk(clk),
       .io_master_haddr( sadapter_io_out_haddr ),
       .io_master_hwrite( sadapter_io_out_hwrite ),
       .io_master_hsize( sadapter_io_out_hsize ),
       .io_master_hburst( sadapter_io_out_hburst ),
       .io_master_hprot( sadapter_io_out_hprot ),
       .io_master_htrans( sadapter_io_out_htrans ),
       .io_master_hmastlock( sadapter_io_out_hmastlock ),
       .io_master_hwdata( sadapter_io_out_hwdata ),
       .io_master_hrdata( sbus_io_master_hrdata ),
       .io_master_hready( sbus_io_master_hready ),
       .io_master_hresp( sbus_io_master_hresp ),
       .io_slaves_2_haddr( sbus_io_slaves_2_haddr ),
       .io_slaves_2_hwrite( sbus_io_slaves_2_hwrite ),
       .io_slaves_2_hsize( sbus_io_slaves_2_hsize ),
       .io_slaves_2_hburst( sbus_io_slaves_2_hburst ),
       .io_slaves_2_hprot( sbus_io_slaves_2_hprot ),
       .io_slaves_2_htrans( sbus_io_slaves_2_htrans ),
       .io_slaves_2_hmastlock( sbus_io_slaves_2_hmastlock ),
       .io_slaves_2_hwdata( sbus_io_slaves_2_hwdata ),
       .io_slaves_2_hrdata( padapter_io_in_hrdata ),
       .io_slaves_2_hsel( sbus_io_slaves_2_hsel ),
       .io_slaves_2_hreadyin( sbus_io_slaves_2_hreadyin ),
       .io_slaves_2_hreadyout( padapter_io_in_hreadyout ),
       .io_slaves_2_hresp( padapter_io_in_hresp ),
       .io_slaves_1_haddr( sbus_io_slaves_1_haddr ),
       .io_slaves_1_hwrite( sbus_io_slaves_1_hwrite ),
       .io_slaves_1_hsize( sbus_io_slaves_1_hsize ),
       .io_slaves_1_hburst( sbus_io_slaves_1_hburst ),
       .io_slaves_1_hprot( sbus_io_slaves_1_hprot ),
       .io_slaves_1_htrans( sbus_io_slaves_1_htrans ),
       .io_slaves_1_hmastlock( sbus_io_slaves_1_hmastlock ),
       .io_slaves_1_hwdata( sbus_io_slaves_1_hwdata ),
       .io_slaves_1_hrdata( io_spi_hrdata ),
       .io_slaves_1_hsel( sbus_io_slaves_1_hsel ),
       .io_slaves_1_hreadyin( sbus_io_slaves_1_hreadyin ),
       .io_slaves_1_hreadyout( io_spi_hreadyout ),
       .io_slaves_1_hresp( io_spi_hresp ),
       .io_slaves_0_haddr( sbus_io_slaves_0_haddr ),
       .io_slaves_0_hwrite( sbus_io_slaves_0_hwrite ),
       .io_slaves_0_hsize( sbus_io_slaves_0_hsize ),
       .io_slaves_0_hburst( sbus_io_slaves_0_hburst ),
       .io_slaves_0_hprot( sbus_io_slaves_0_hprot ),
       .io_slaves_0_htrans( sbus_io_slaves_0_htrans ),
       .io_slaves_0_hmastlock( sbus_io_slaves_0_hmastlock ),
       .io_slaves_0_hwdata( sbus_io_slaves_0_hwdata ),
       .io_slaves_0_hrdata( io_dram_hrdata ),
       .io_slaves_0_hsel( sbus_io_slaves_0_hsel ),
       .io_slaves_0_hreadyin( sbus_io_slaves_0_hreadyin ),
       .io_slaves_0_hreadyout( io_dram_hreadyout ),
       .io_slaves_0_hresp( io_dram_hresp )
  );
  HASTItoPOCIBridge padapter(
       .io_in_haddr( sbus_io_slaves_2_haddr ),
       .io_in_hwrite( sbus_io_slaves_2_hwrite ),
       .io_in_hsize( sbus_io_slaves_2_hsize ),
       .io_in_hburst( sbus_io_slaves_2_hburst ),
       .io_in_hprot( sbus_io_slaves_2_hprot ),
       .io_in_htrans( sbus_io_slaves_2_htrans ),
       .io_in_hmastlock( sbus_io_slaves_2_hmastlock ),
       .io_in_hwdata( sbus_io_slaves_2_hwdata ),
       .io_in_hrdata( padapter_io_in_hrdata ),
       .io_in_hsel( sbus_io_slaves_2_hsel ),
       .io_in_hreadyin( sbus_io_slaves_2_hreadyin ),
       .io_in_hreadyout( padapter_io_in_hreadyout ),
       .io_in_hresp( padapter_io_in_hresp ),
       .io_out_paddr( padapter_io_out_paddr ),
       .io_out_pwrite( padapter_io_out_pwrite ),
       .io_out_psel( padapter_io_out_psel ),
       .io_out_penable( padapter_io_out_penable ),
       .io_out_pwdata( padapter_io_out_pwdata ),
       .io_out_prdata( pbus_io_master_prdata ),
       .io_out_pready( pbus_io_master_pready ),
       .io_out_pslverr( pbus_io_master_pslverr )
  );
  POCIBus pbus(.clk(clk),
       .io_master_paddr( padapter_io_out_paddr ),
       .io_master_pwrite( padapter_io_out_pwrite ),
       .io_master_psel( padapter_io_out_psel ),
       .io_master_penable( padapter_io_out_penable ),
       .io_master_pwdata( padapter_io_out_pwdata ),
       .io_master_prdata( pbus_io_master_prdata ),
       .io_master_pready( pbus_io_master_pready ),
       .io_master_pslverr( pbus_io_master_pslverr ),
       .io_slaves_1_paddr( pbus_io_slaves_1_paddr ),
       .io_slaves_1_pwrite( pbus_io_slaves_1_pwrite ),
       .io_slaves_1_psel( pbus_io_slaves_1_psel ),
       .io_slaves_1_penable( pbus_io_slaves_1_penable ),
       .io_slaves_1_pwdata( pbus_io_slaves_1_pwdata ),
       .io_slaves_1_prdata( io_corereset_prdata ),
       .io_slaves_1_pready( io_corereset_pready ),
       .io_slaves_1_pslverr( io_corereset_pslverr ),
       .io_slaves_0_paddr( pbus_io_slaves_0_paddr ),
       .io_slaves_0_pwrite( pbus_io_slaves_0_pwrite ),
       .io_slaves_0_psel( pbus_io_slaves_0_psel ),
       .io_slaves_0_penable( pbus_io_slaves_0_penable ),
       .io_slaves_0_pwdata( pbus_io_slaves_0_pwdata ),
       .io_slaves_0_prdata( io_led_prdata ),
       .io_slaves_0_pready( io_led_pready ),
       .io_slaves_0_pslverr( io_led_pslverr )
  );
endmodule

