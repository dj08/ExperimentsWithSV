/*
 * Experiments with section 21.2 of IEEE 1800-2012 SV LRM
 * 
 */

module displayTasks() ;

   initial begin
      static bit [7:0] sth = 5;
      static int       sthi = 8;
      static bit [7:0] src [3] = '{3{5}};
      static bit       unpkd [8] = '{8{8}};
      
      /*
       * First two return '1', last two '0'
       */
      $displayb( sth[0] );		// 1
      $display ( sth[0] );		// 1
      $displayb( sthi[0] );		// 0
      $display ( sthi[0] );		// 0

      /*
       * This makes a difference... notice the effect of multiple ',' 
       * - they add more spaces to the print.
       */
      $displayb( sth[0], sth );		// 100000101
      $displayh( sth[0], sth );		// 105 (1 and 05)
      $displayo( sth[0], sth );		// 1005 (1 and 005)

      $displayb( sth[0], sth, sthi );	// 10000010100000000000000000000000000001000
      $displayh( sth[0], sth, sthi );	// 10500000008
      $displayo( sth[0], sth, sthi );	// 100500000000010

      $displayb( sth[0],, sth,, sthi );	// 1 00000101 00000000000000000000000000001000
      $displayh( sth[0],, sth,, sthi );	// 1 05 00000008
      $displayo( sth[0],, sth,, sthi );	// 1 005 00000000010

      $displayh( sth[0],, sth );	// 1 05

      $displayb( sth[0],,, sth );	// 1  00000101
      $displayb( sth[0],,,,, sth );	// 1    00000101
      $displayb( "sth[0]=%0b, sth=%0b", 
                 sth[0], sth );		// sth[0]=1, sth=101
      $display ( sth[0], sth );		// 1  5
      $display ( sth[0],, sth );	// 1   5

      /*
       * Experiments with multi-dim arrays
       */
      $display ( src[0],, src[0][0],, 
                 src[0][2:1] );		//   5 1 2
      $displayb( src[0],, src[0][0],, 
                 src[0][2:1] );		// 00000101 1 10

      /*
       * These formats return an error...

       * Here, simulator does not find anything for the second %b!
       $displayb( "sth[0]=%0b, sth=%0b", sth[0],, sth );	

       * Here, we are expecting too much from $display* for a multi-dim/unpkd array... :)
       $displayb( src,, src[0],, src[0][2:1], unpkd );

       */
      

   end

endmodule : displayTasks

