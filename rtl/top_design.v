module top_design(
          o_filtered_signal,
          i_reset,
		  clock
		  );

   // Parameters
   parameter N_PROBE   = 8;

   // Ports
   input                   clock;
   input                   i_reset;
   output [N_PROBE  - 1 : 0] o_filtered_signal;
   
   wire [N_PROBE  - 1 : 0] w_signal;
   
   
   wire [N_PROBE - 1 : 0] w_probe0;
   wire [N_PROBE - 1 : 0] w_probe1;

   signal_generator
     u_signal_generator
       (
	.i_clock(clock),
	.i_reset(~i_reset),
	.o_signal(w_signal)
	);

  filtro_fir
    u_filtro_fir
      (
       .clk        (clock),
       .i_srst     (~i_reset),
       .i_en       (1'b1),
       .i_data     (w_signal),
       .o_data     (o_filtered_signal)
       );

   //////////////////////////////////////////
   // Crear los bloque VIO e ILA
   // Descomentar los siguientes modulos
   //////////////////////////////////////////
   
  //  ila
  //    u_ila
  //      (
  //  	.clk_0   (clock),
  //  	.probe0_0(w_signal),         // Bits: 8
  //  	.probe1_0(o_filtered_signal) // Bits: 8
  //  	);   

  //  vio
  //    u_vio
  //      (
  //  	.clk_0       (clock),
  //  	.probe_in0_0 (o_filtered_signal), // Bits: 8
  //  	.probe_out0_0(i_reset)              // Bits: 1
  //  	);

endmodule

