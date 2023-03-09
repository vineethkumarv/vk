// or browse Examples
`define A "welcome"
`define C test
`define B "A,you are here"
`define D(A) `"`C,A,C should be searching for parameter test`"
module test;
  initial begin
    $display(`A);
    $display(`B);
    $display(`D(45162));
    //`A;
  end
endmodule
