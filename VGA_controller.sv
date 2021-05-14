//-------------------------------------------------------------------------
//      VGA controller                                                   --
//      Kyle Kloepper                                                    --
//      4-05-2005                                                        --
//                                                                       --
//      Modified by Stephen Kempf 04-08-2005                             --
//                                10-05-2006                             --
//                                03-12-2007                             --
//      Translated by Joe Meng    07-07-2013                             --
//      Fall 2014 Distribution                                           --
//                                                                       --
//      Used standard 640x480 vga found at epanorama                     --
//                                                                       --
//      reference: http://www.xilinx.com/bvdocs/userguides/ug130.pdf     --
//                 http://www.epanorama.net/documents/pc/vga_timing.html --
//                                                                       --
//      note: The standard is changed slightly because of 25 mhz instead --
//            of 25.175 mhz pixel clock. Refresh rate drops slightly.    --
//                                                                       --
//      For use with ECE 385 Lab 7 and Final Project                     --
//      ECE Department @ UIUC                                            --
//-------------------------------------------------------------------------


module vga_controller (
    input  logic clk,           // 50 MHz clock
    input  logic reset,         // reset signal
    output logic hs,            // Horizontal sync pulse.  Active low
	output logic vs,            // Vertical sync pulse.  Active low
	output logic pixel_clk,     // 25 MHz pixel clock output
	output logic blank,         // Blanking interval indicator.  Active low.
	output logic sync,          // Composite Sync signal.  Active low.  We don't use it in this lab,
							    //   but the video DAC on the DE2 board requires an input for it.
	output logic [9:0] DrawX,   // horizontal coordinate
	output logic [9:0] DrawY    // vertical coordinate
);
    
    // 800 horizontal pixels indexed 0 to 799
    // 525 vertical pixels indexed 0 to 524
    parameter [9:0] hpixels = 10'b1100011111; // 799
    parameter [9:0] vlines = 10'b1000001100;  // 524
	 
	// horizontal pixel and vertical line counters
    logic [9:0] hc, vc;
    logic clkdiv;
    
	// signal indicates if ok to display color for a pixel
	logic display;
	 
    // Disable Composite Sync
    assign sync = 1'b0;
     
	// This cuts the 50 Mhz clock in half to generate a 25 MHz pixel clock  
    always_ff @ (posedge clk or posedge reset) begin 
        if (reset) 
            clkdiv <= 1'b0;
        else 
            clkdiv <= ~ (clkdiv);
    end
   
	//Runs the horizontal counter  when it resets vertical counter is incremented
    always_ff @ (posedge clkdiv or posedge reset) begin : counter_proc
		if (reset) begin 
            hc <= 10'b0000000000;
            vc <= 10'b0000000000;
		end else if (hc == hpixels) begin // If hc has reached the end of pixel count
			hc <= 10'b0000000000;
            if (vc == vlines)   // if vc has reached end of line count
                vc <= 10'b0000000000;
            else
                vc <= (vc + 1'b1);
        end else begin
			hc <= (hc + 1'b1);  // no statement about vc, implied vc <= vc;
        end
	end 
   
    assign DrawX = hc;
    assign DrawY = vc;

	// horizontal sync pulse is 96 pixels long at pixels 656-752, 656 inclusive 752 exclusive
    // (signal is registered to ensure clean output waveform)
    always_ff @ (posedge reset or posedge clkdiv) begin : hsync_proc
        if (reset) begin
            hs <= 1'b0;
        end else begin
            if ((10'b1010010000 <= (hc + 1)) & ((hc + 1) < 10'b1011110000)) 
                hs <= 1'b0;
            else 
				hs <= 1'b1;
        end
    end
	 
    // vertical sync pulse is 2 lines(800 pixels) long at line 490-491
    // (signal is registered to ensure clean output waveform)
    always_ff @ (posedge reset or posedge clkdiv) begin : vsync_proc
        if (reset) begin
           vs <= 1'b0;
        end else begin
            if (((vc + 1) == 9'b111101010) | ((vc + 1) == 9'b111101011)) 
			    vs <= 1'b0;
            else 
			    vs <= 1'b1;
        end
    end
       
    // only display pixels between horizontal 0-639 and vertical 0-479 (640x480)
    // (This signal is registered within the DAC chip, so we can leave it as pure combinational logic here)    
    always_comb begin 
        if ((hc >= 10'b1010000000) | (vc >= 10'b0111100000)) 
            display = 1'b0;
        else 
            display = 1'b1;
    end 
   
    assign blank = display;
    assign pixel_clk = clkdiv;
    
endmodule
