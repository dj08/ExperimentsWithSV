module arrays();

   /**** Unpacked Arrays 
    * Standard way to declare arrays. 
    * Limitation: Cannot be referred collectively often.
    * 
    ****/
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

   /*
    * Display tasks cannot accept entire unpacked arrays either.
    * Packed arrays are acceptable.
    initial 
    begin : displayTasks

    $display( "sampleA_unpkd, sampleB_unpkd, sampleB2_unpkd" );
    $display( sampleA_unpkd,, sampleB_unpkd,, sampleC_unpkd );

     end : displayTasks
    */

   /*
    * Basic operations: printing, comparing, ... : use for/foreach
    * 
    */

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

   /**** Packed Arrays
    * Packed arrays, finally. Much easier to deal with in a bunch.
    * Limitations: bit/logic only. 
    * 
    ****/

   bit [7:0] sampleA_pkd;
   bit [7:0] sampleB_pkd = 'd10;		// or 'b1011_1101
   bit [7:0] sampleC_pkd = 'b1011_1101;
   logic [7:0] sampleD_pkd = 'b10XX_Z111;	// Underscores not a problem.
   logic [7:0] sampleE_pkd;			// Initializes to x, not z.

   /* The following fail a compile:

    bit [8] sample;
    int [7:0] sampleA;
    int [7:0] sampleA = '{0,1,2,3,4,5,6,7,8,9};
    int [1:2] sampleB;
    */

   initial begin
      $display( "Packed array prints" );
      $display ( sampleA_pkd,, sampleB_pkd,, sampleC_pkd,, sampleD_pkd,, sampleE_pkd );	
      //         0             10            189           X             x

      $displayb( sampleA_pkd,, sampleB_pkd,, sampleC_pkd,, sampleD_pkd,, sampleE_pkd );	
      //         00000000      00001010      10111101      10xxz111      xxxxxxxx
   end

   // Packed arrays are useful for memories as well.
   // bit [3:0][7:0] barray [3];		// 3x32 memory

   
endmodule : arrays


