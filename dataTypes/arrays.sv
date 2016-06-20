module arrays();

   // Vanilla initializations
   bit [7:0] sth_pkd;
   bit       sth_unpkd [7:0];
   bit       yet_sth_unpkd [8];			// Same as [7:0]
   /*
    * Illegal syntax here... such specification is only for unpacked arrays...
    * bit [8]   sth;
    */

   // Initialize in declaration
   int       sampleA_unpkd [10] = '{0,1,2,3,4,5,6,7,8,9};
   /* Over/under specification returns compile error
    * int       sampleA_unpkd [10] = '{0,1,2,3,4,5,6,7,8,9,10};
    * int       sampleB_unpkd [10] = '{0,1,2,3,4,5,6,7};
    */

   int       sampleB_unpkd [3];
   /* Specifying the default specification does not work, needs some research...
    * sampleB_unpkd = '{0,1,2,3,4,5,6,7, default:-1};
    * initial 
    *   sampleB_unpkd = '{0,1,2,3,4,5,6,7, default:-1};
    */

   // Key-value pair like initialization... why would anyone do that?
   int       sampleC_unpkd [4] = '{1:2, 2:1, 3:7, 0:100};
   /* Doesn't work for partial initialization either... compile error below...
    * int       sampleC_unpkd [4] = '{1:2, 2:1};	// Compile err
    */

   /* Shortcut specifications don't work like this
    * int       sampleC_unpkd [10] = '{0..9};		// Compile err
    * int       sampleC_unpkd [10] = '{0 .. 9};		// Compile err
    */

   // Assignment can only be given in declaration or in a procedural context.
   initial begin
      sampleB_unpkd = '{3,2,1};			// Full assignment
      sampleB_unpkd[1:2] = '{100,101};		// Partial (re-)assignment

      sampleA_unpkd = '{10{100}};		// Shorthand assignment

      // sampleB_unpkd = '{200, default:-1};	// Doesn't work - compile error
   end
   
   int       sampleB[4];

   /*
    * Display tasks cannot accept entire unpacked arrays either.
    * Packed arrays are acceptable.
   initial 
     begin : displayTasks

        $display( "sampleA_unpkd, sampleB_unpkd, sampleB2_unpkd" );
        $display( sampleA_unpkd,, sampleB_unpkd,, sampleC_unpkd );

     end : displayTasks
    */
   
endmodule : arrays

   
