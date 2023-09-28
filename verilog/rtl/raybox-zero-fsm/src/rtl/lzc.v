//NOTE: This is based on this:
// https://github.com/algofoogle/raybox/blob/main/src/rtl/lzc_b.v
//...in this case, hard-coded for 20-bit inputs, i.e. Q10.10.

`default_nettype none
`timescale 1ns / 1ps

`include "fixed_point_params.v"

`define INRANGE [`Qm-1:-`Qn]

//NOTE: The FIRST defined of the following will be used:
// `define D17 // 17-bit range, e.g. Q8.9
// `define D18 // 18-bit range, e.g. Q9.9
// `define D19 // 19-bit range, e.g. Q9.10
`define D20 // 20-bit range, e.g. Q10.10
`define D22 // 22-bit range, e.g. Q11.11
`define D24 // 24-bit range, e.g. Q12.12
`define D30 // 30-bit range, e.g. Q15.15, mostly for testing.

module lzc(
  input `INRANGE i_data,
  output [4:0] o_lzc      // 0..20 (or rather 0..`Qm+`Qn) is normal.
);

  function [4:0] f_lzc(input `INRANGE data);
    casez (i_data)
      // SMELL: This is a sloppy way to do this, and is currently hard-coded for known bit range inputs only...
`ifdef D17
      17'b1????????????????:  f_lzc =  0;
      17'b01???????????????:  f_lzc =  1;
      17'b001??????????????:  f_lzc =  2;
      17'b0001?????????????:  f_lzc =  3;
      17'b00001????????????:  f_lzc =  4;
      17'b000001???????????:  f_lzc =  5;
      17'b0000001??????????:  f_lzc =  6;
      17'b00000001?????????:  f_lzc =  7;
      17'b000000001????????:  f_lzc =  8;
      17'b0000000001???????:  f_lzc =  9;
      17'b00000000001??????:  f_lzc = 10;
      17'b000000000001?????:  f_lzc = 11;
      17'b0000000000001????:  f_lzc = 12;
      17'b00000000000001???:  f_lzc = 13;
      17'b000000000000001??:  f_lzc = 14;
      17'b0000000000000001?:  f_lzc = 15;
      17'b00000000000000001:  f_lzc = 16;
      17'b00000000000000000:  f_lzc = 17;
`elsif D18
      18'b1?????????????????:  f_lzc =  0;
      18'b01????????????????:  f_lzc =  1;
      18'b001???????????????:  f_lzc =  2;
      18'b0001??????????????:  f_lzc =  3;
      18'b00001?????????????:  f_lzc =  4;
      18'b000001????????????:  f_lzc =  5;
      18'b0000001???????????:  f_lzc =  6;
      18'b00000001??????????:  f_lzc =  7;
      18'b000000001?????????:  f_lzc =  8;
      18'b0000000001????????:  f_lzc =  9;
      18'b00000000001???????:  f_lzc = 10;
      18'b000000000001??????:  f_lzc = 11;
      18'b0000000000001?????:  f_lzc = 12;
      18'b00000000000001????:  f_lzc = 13;
      18'b000000000000001???:  f_lzc = 14;
      18'b0000000000000001??:  f_lzc = 15;
      18'b00000000000000001?:  f_lzc = 16;
      18'b000000000000000001:  f_lzc = 17;
      18'b000000000000000000:  f_lzc = 18;
`elsif D19
      19'b1??????????????????:  f_lzc =  0;
      19'b01?????????????????:  f_lzc =  1;
      19'b001????????????????:  f_lzc =  2;
      19'b0001???????????????:  f_lzc =  3;
      19'b00001??????????????:  f_lzc =  4;
      19'b000001?????????????:  f_lzc =  5;
      19'b0000001????????????:  f_lzc =  6;
      19'b00000001???????????:  f_lzc =  7;
      19'b000000001??????????:  f_lzc =  8;
      19'b0000000001?????????:  f_lzc =  9;
      19'b00000000001????????:  f_lzc = 10;
      19'b000000000001???????:  f_lzc = 11;
      19'b0000000000001??????:  f_lzc = 12;
      19'b00000000000001?????:  f_lzc = 13;
      19'b000000000000001????:  f_lzc = 14;
      19'b0000000000000001???:  f_lzc = 15;
      19'b00000000000000001??:  f_lzc = 16;
      19'b000000000000000001?:  f_lzc = 17;
      19'b0000000000000000001:  f_lzc = 18;
      19'b0000000000000000000:  f_lzc = 19;
`elsif D20
      20'b1???????????????????:  f_lzc =  0;
      20'b01??????????????????:  f_lzc =  1;
      20'b001?????????????????:  f_lzc =  2;
      20'b0001????????????????:  f_lzc =  3;
      20'b00001???????????????:  f_lzc =  4;
      20'b000001??????????????:  f_lzc =  5;
      20'b0000001?????????????:  f_lzc =  6;
      20'b00000001????????????:  f_lzc =  7;
      20'b000000001???????????:  f_lzc =  8;
      20'b0000000001??????????:  f_lzc =  9;
      20'b00000000001?????????:  f_lzc = 10;
      20'b000000000001????????:  f_lzc = 11;
      20'b0000000000001???????:  f_lzc = 12;
      20'b00000000000001??????:  f_lzc = 13;
      20'b000000000000001?????:  f_lzc = 14;
      20'b0000000000000001????:  f_lzc = 15;
      20'b00000000000000001???:  f_lzc = 16;
      20'b000000000000000001??:  f_lzc = 17;
      20'b0000000000000000001?:  f_lzc = 18;
      20'b00000000000000000001:  f_lzc = 19;
      20'b00000000000000000000:  f_lzc = 20;
`elsif D22
      22'b1?????????????????????:  f_lzc =  0;
      22'b01????????????????????:  f_lzc =  1;
      22'b001???????????????????:  f_lzc =  2;
      22'b0001??????????????????:  f_lzc =  3;
      22'b00001?????????????????:  f_lzc =  4;
      22'b000001????????????????:  f_lzc =  5;
      22'b0000001???????????????:  f_lzc =  6;
      22'b00000001??????????????:  f_lzc =  7;
      22'b000000001?????????????:  f_lzc =  8;
      22'b0000000001????????????:  f_lzc =  9;
      22'b00000000001???????????:  f_lzc = 10;
      22'b000000000001??????????:  f_lzc = 11;
      22'b0000000000001?????????:  f_lzc = 12;
      22'b00000000000001????????:  f_lzc = 13;
      22'b000000000000001???????:  f_lzc = 14;
      22'b0000000000000001??????:  f_lzc = 15;
      22'b00000000000000001?????:  f_lzc = 16;
      22'b000000000000000001????:  f_lzc = 17;
      22'b0000000000000000001???:  f_lzc = 18;
      22'b00000000000000000001??:  f_lzc = 19;
      22'b000000000000000000001?:  f_lzc = 20;
      22'b0000000000000000000001:  f_lzc = 21;
      22'b0000000000000000000000:  f_lzc = 22;
`elsif D24
      24'b1???????????????????????:  f_lzc =  0;
      24'b01??????????????????????:  f_lzc =  1;
      24'b001?????????????????????:  f_lzc =  2;
      24'b0001????????????????????:  f_lzc =  3;
      24'b00001???????????????????:  f_lzc =  4;
      24'b000001??????????????????:  f_lzc =  5;
      24'b0000001?????????????????:  f_lzc =  6;
      24'b00000001????????????????:  f_lzc =  7;
      24'b000000001???????????????:  f_lzc =  8;
      24'b0000000001??????????????:  f_lzc =  9;
      24'b00000000001?????????????:  f_lzc = 10;
      24'b000000000001????????????:  f_lzc = 11;
      24'b0000000000001???????????:  f_lzc = 12;
      24'b00000000000001??????????:  f_lzc = 13;
      24'b000000000000001?????????:  f_lzc = 14;
      24'b0000000000000001????????:  f_lzc = 15;
      24'b00000000000000001???????:  f_lzc = 16;
      24'b000000000000000001??????:  f_lzc = 17;
      24'b0000000000000000001?????:  f_lzc = 18;
      24'b00000000000000000001????:  f_lzc = 19;
      24'b000000000000000000001???:  f_lzc = 20;
      24'b0000000000000000000001??:  f_lzc = 21;
      24'b00000000000000000000001?:  f_lzc = 22;
      24'b000000000000000000000001:  f_lzc = 23;
      24'b000000000000000000000000:  f_lzc = 24;
`elsif D30
      30'b1?????????????????????????????:  f_lzc =  0;
      30'b01????????????????????????????:  f_lzc =  1;
      30'b001???????????????????????????:  f_lzc =  2;
      30'b0001??????????????????????????:  f_lzc =  3;
      30'b00001?????????????????????????:  f_lzc =  4;
      30'b000001????????????????????????:  f_lzc =  5;
      30'b0000001???????????????????????:  f_lzc =  6;
      30'b00000001??????????????????????:  f_lzc =  7;
      30'b000000001?????????????????????:  f_lzc =  8;
      30'b0000000001????????????????????:  f_lzc =  9;
      30'b00000000001???????????????????:  f_lzc = 10;
      30'b000000000001??????????????????:  f_lzc = 11;
      30'b0000000000001?????????????????:  f_lzc = 12;
      30'b00000000000001????????????????:  f_lzc = 13;
      30'b000000000000001???????????????:  f_lzc = 14;
      30'b0000000000000001??????????????:  f_lzc = 15;
      30'b00000000000000001?????????????:  f_lzc = 16;
      30'b000000000000000001????????????:  f_lzc = 17;
      30'b0000000000000000001???????????:  f_lzc = 18;
      30'b00000000000000000001??????????:  f_lzc = 19;
      30'b000000000000000000001?????????:  f_lzc = 20;
      30'b0000000000000000000001????????:  f_lzc = 21;
      30'b00000000000000000000001???????:  f_lzc = 22;
      30'b000000000000000000000001??????:  f_lzc = 23;
      30'b0000000000000000000000001?????:  f_lzc = 24;
      30'b00000000000000000000000001????:  f_lzc = 25;
      30'b000000000000000000000000001???:  f_lzc = 26;
      30'b0000000000000000000000000001??:  f_lzc = 27;
      30'b00000000000000000000000000001?:  f_lzc = 28;
      30'b000000000000000000000000000001:  f_lzc = 29;
      30'b000000000000000000000000000000:  f_lzc = 30;
`endif
    endcase

  endfunction

  assign o_lzc = f_lzc(i_data);

endmodule
