`timescale 1ns/100ps

module tb_top_design();


   // Parameters
   parameter N_PROBE   = 8;

   // Ports
   reg                    clock;

   // Vars
   reg                    i_reset;
   wire [N_PROBE-1 : 0]   o_filtered_signal;
   wire [N_PROBE-1 : 0]   tb_signal;

   initial begin
      clock        = 1'b0;
      i_reset      = 1'b0;
      #100 i_reset = 1'b1;
   end

   always #10 clock = ~clock;

   assign tb_signal = tb_top_design.u_top_design.w_signal; 

   top_design
     u_top_design(
		  .o_filtered_signal (o_filtered_signal),
		  .clock             (clock),
		  .i_reset           (i_reset)
		  );
      

endmodule // tb_top_design
