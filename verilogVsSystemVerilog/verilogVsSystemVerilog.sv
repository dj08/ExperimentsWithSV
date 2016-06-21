/* A relative comparison study of differences between verilog and systemverilog
 */

module top();

   reg varInp, varOut;
   wire wireInp, wireOut;
   
   middle_as_in_verilog middleInst ( .varInp(varInp), .wireInp(wireInp), 
                                     .varOut(varOut), .wireOut(wireOut) );

// endmodule // Verilog
endmodule : top // SV

module middle_as_in_verilog( varInp, wireInp, varOut, wireOut );

   /* 
    * Verilog/SV : o/p and i/o need to be wires.
    * i/p can be vars as well.
    * 
    */
   input reg varInp;
   input wire wireInp;

   output reg varOut;
   output wire wireOut;
   

endmodule
