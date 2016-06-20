/*
 * Experiments with loop constructs in SV. Refer Section 12 of 2012 LRM
 * 
 */

module loops();

   int sampleA [7:0] = '{0,1,2,3,4,5,6,7};
   int sampleB [3:7];

   initial begin
      foreach (sampleA[i])
        $display( "sampleA[%0d] = %0d", i, sampleA[i] );
      /* Output: 
       sampleA[7] = 0
       sampleA[6] = 1
       sampleA[5] = 2
       sampleA[4] = 3
       sampleA[3] = 4
       sampleA[2] = 5
       sampleA[1] = 6
       sampleA[0] = 7
       */
      
      foreach (sampleB[i])
        $display( "sampleB[%0d] = %0d", i, sampleB[i] );
      /* Output: Notice the order!
       sampleB[3] = 0
       sampleB[4] = 0
       sampleB[5] = 0
       sampleB[6] = 0
       sampleB[7] = 0
       */

   end
   
   
endmodule : loops

