`timescale 1ns/100ps

module testbench ();

reg         clk          = 0;
reg         apb_mux_sel  = 0;

reg         apbi0_psel    = 0;
reg         apbi0_pwrite  = 0;
reg         apbi0_penable = 0;
reg [7:0]   apbi0_paddr   = 0;
reg [31:0]  apbi0_pwdata  = 0;
wire        apbi0_pready     ;
wire        apbi0_pslverr    ;
wire [31:0] apbi0_prdata     ;

reg         apbi1_psel    = 0;
reg         apbi1_pwrite  = 0;
reg         apbi1_penable = 0;
reg [7:0]   apbi1_paddr   = 0;
reg [31:0]  apbi1_pwdata  = 0;
wire        apbi1_pready     ;
wire        apbi1_pslverr    ;
wire [31:0] apbi1_prdata     ;

wire         apbt_psel  ;
wire         apbt_pwrite;
wire         apbt_penable;
wire [7:0]   apbt_paddr ;
wire [31:0]  apbt_pwdata;
reg          apbt_pready  = 0;
reg          apbt_pslverr = 0;
reg [31:0]   apbt_prdata  = 0;


reg [31:0]  apb0_rddata  = 0;
reg [31:0]  apb1_rddata  = 0;

reg         error        = 1;

reg [31:0]  data_mem [255:0];

COREAPB3MUX # 
(
  .ADDR_WIDTH (8          ),
  .DATA_WIDTH (32         )
) dut
(
  .APBI0_PSEL    (apbi0_psel    ),
  .APBI0_PWRITE  (apbi0_pwrite  ),
  .APBI0_PADDR   (apbi0_paddr   ),
  .APBI0_PWDATA  (apbi0_pwdata  ),
  .APBI0_PENABLE (apbi0_penable ),
  .APBI0_PREADY  (apbi0_pready  ),
  .APBI0_PRDATA  (apbi0_prdata  ),
  .APBI0_PSLVERR (apbi0_pslverr ),
  
  .APBI1_PSEL    (apbi1_psel    ),  
  .APBI1_PWRITE  (apbi1_pwrite  ),
  .APBI1_PADDR   (apbi1_paddr   ),
  .APBI1_PWDATA  (apbi1_pwdata  ),
  .APBI1_PENABLE (apbi1_penable ),
  .APBI1_PREADY  (apbi1_pready  ),
  .APBI1_PRDATA  (apbi1_prdata  ),
  .APBI1_PSLVERR (apbi1_pslverr ),
	
  .APBT_PSEL     (apbt_psel     ),
  .APBT_PWRITE   (apbt_pwrite   ),
  .APBT_PADDR    (apbt_paddr    ),
  .APBT_PWDATA   (apbt_pwdata   ),
  .APBT_PENABLE  (apbt_penable  ),
  .APBT_PREADY   (apbt_pready   ),
  .APBT_PRDATA   (apbt_prdata   ),
  .APBT_PSLVERR  (apbt_pslverr  ),

  .APB_MUX_SEL   (apb_mux_sel   )
);

task APB0_Write; 
  input [7:0]  addr;
  input [31:0] wrdata;
  begin
    @(posedge clk)
      apbi0_psel   = 1'b1;
      apbi0_paddr  = addr; 
      apbi0_pwdata = wrdata;	  
	  apbi0_pwrite = 1'b1;
    @(posedge clk)
      apbi0_penable = 1'b1;
	  wait(apbt_pready);
    @(posedge clk)	  
      apbi0_psel    = 1'b0;
	  apbi0_pwrite  = 1'b0;
      apbi0_penable = 1'b0;	  
  end 
endtask

task APB1_Write; 
  input [7:0]  addr;
  input [31:0] wrdata;
  begin
    @(posedge clk)
      apbi1_psel   = 1'b1;
      apbi1_paddr  = addr; 
      apbi1_pwdata = wrdata;	  
	  apbi1_pwrite = 1'b1;
    @(posedge clk)
      apbi1_penable = 1'b1;
	  wait(apbt_pready);
    @(posedge clk)
      apbi1_psel    = 1'b0;
	  apbi1_pwrite  = 1'b0;
      apbi1_penable = 1'b0;	  
  end 
endtask

task APB0_Read; 
  input  [7:0]  addr;
  output [31:0] apb0_rddata;
  begin
    apb0_rddata = 0;
    @(posedge clk)
      apbi0_psel    = 1'b1;
      apbi0_paddr   = addr; 
	  apbi0_pwrite  = 1'b0;
    @(posedge clk)
      apbi0_penable = 1'b1;
	  wait(apbt_pready)	  
    @(posedge clk)
	  apb0_rddata   = apbt_prdata;
	  apbi0_psel    = 1'b0;
	  apbi0_penable = 1'b0;  
  end 
endtask

task APB1_Read; 
  input  [7:0]  addr;
  output [31:0] apb1_rddata;
  begin
    apb1_rddata = 0;
    @(posedge clk)
      apbi1_psel    = 1'b1;
      apbi1_paddr   = addr; 
	  apbi1_pwrite  = 1'b0;
    @(posedge clk)
      apbi1_penable = 1'b1;
	  wait(apbt_pready)	  
    @(posedge clk)
	  apb1_rddata   = apbt_prdata;
	  apbi1_psel    = 1'b0;
	  apbi1_penable = 1'b0;  
  end 
endtask

always
  #5 clk <= ~clk;


always@(posedge clk)
  begin 
    if(apbt_psel & apbt_pwrite & apbt_penable)
	  data_mem[apbt_paddr] <= apbt_pwdata;
  end 

always@(*)
  begin 
    if(apbt_psel & ~apbt_pwrite & apbt_penable)
	  apbt_prdata = data_mem[apbt_paddr];
  end   

always@(posedge clk)
  begin 
    if(apbt_psel)
	  apbt_pready = $urandom_range(0,1);
	else 
	  apbt_pready = 0;
  end   

always@(*)
  begin 
    apbt_pslverr = 0;
  end   
  
initial 
  begin 
    $display ($time," Initiate Write Transaction from APB3 Initiator 0\n");
    @(posedge clk)
    apb_mux_sel = 0;
    APB0_Write(8'h2c,32'h01);
    
    $display ($time," Initiate Write Transaction from APB3 Initiator 1\n");  
    @(posedge clk)
    apb_mux_sel = 1;
    APB1_Write(8'h18,32'h03);
    
    $display ($time," Initiate Read Transaction from APB3 Initiator 0\n");
    @(posedge clk)
    apb_mux_sel = 0;
    APB0_Read(8'h2c,apb0_rddata);
    
    if(apb0_rddata != 32'h01)
      begin 
	    $display ($time, " Data mismatch found. Expected = 32'h01, Actual= %h\n",apb0_rddata);
	    error = 1'b1;
	  end 
    else 
      begin 
	    $display ($time, " Received expected data\n");
	    error = 1'b0;
	  end 
    
    
    $display ($time," Initiate Read Transaction from APB3 Initiator 1\n");  
    @(posedge clk)
    apb_mux_sel = 1;
    APB1_Read(8'h18,apb1_rddata);
    
    if(apb1_rddata != 32'h03)
      begin 
	    $display ($time, " Data mismatch found. Expected = 32'h03, Actual= %h\n",apb1_rddata);
	    error = 1'b1;
	  end 
    else 
      begin 
	    $display ($time, " Received expected data\n");
	    error = 1'b0;
	  end   
    
	@(posedge clk)
	if(error)
	  $display ($time, " Test fail\n");
	else 
	  $display ($time, " Test pass\n");
	  
	#500;
	$stop;
  end 
endmodule 