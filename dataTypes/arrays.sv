module arrays();

   bit [7:0] sth_pkd;
   /*
    * Illegal syntax here... such specification is only for unpacked arrays...
    * bit [8]   sth;
    */

   bit       sth_unpkd [7:0];
   bit       alt_unpkd [8];

endmodule : arrays

   
