/* A relative comparison study of differences between verilog and systemverilog
 */

module top();

   reg varInp, varOut;
   wire wireInp, wireOut;
   
   middle_as_in_verilog middleInst ( // .varInp(varInp), 
                                     .wireInp(wireInp), 
                                     // .varOut(varOut), 
                                     .wireOut(wireOut) );

endmodule // Verilog
     // endmodule : top // SV

module middle_as_in_verilog ( 

                              /* 
                               * Verilog/SV : i/p and i/o need to be wires, since they are driven
                               * externally.
                               * o/p can be vars as well.
                               * 
                               */
                              // input reg varInp;
                              input wire  wireInp,

                              // output reg  varOut,
                              output wire wireOut );
   
   

endmodule
