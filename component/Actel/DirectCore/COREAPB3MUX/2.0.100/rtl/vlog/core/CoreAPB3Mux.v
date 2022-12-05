///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: MICROCHIP
//
// IP Core: COREAPB3MUX
//
//
// Abstract     : (1) This is the top module.It implements APB Mux.
//                
//                 
//                   
//
//  COPYRIGHT 2021 BY MICROCHIP
//  THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
//  FROM MICROCHIP CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
//  MICROCHIP FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
//  NO BACK-UP OF THE FILE SHOULD BE MADE. 
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ns

module COREAPB3MUX #
(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32
)
(
  input                    APBI0_PSEL      ,
  input                    APBI0_PWRITE    ,
  input [ADDR_WIDTH-1:0 ]  APBI0_PADDR     ,
  input [DATA_WIDTH-1:0]   APBI0_PWDATA    ,
  input                    APBI0_PENABLE   ,
  output                   APBI0_PREADY    ,
  output [DATA_WIDTH-1:0]  APBI0_PRDATA    ,
  output                   APBI0_PSLVERR   ,
										   
  input                    APBI1_PSEL      ,
  input                    APBI1_PWRITE    ,
  input [ADDR_WIDTH-1:0 ]  APBI1_PADDR     ,
  input [DATA_WIDTH-1:0]   APBI1_PWDATA    ,
  input                    APBI1_PENABLE   ,
  output                   APBI1_PREADY    ,
  output [DATA_WIDTH-1:0]  APBI1_PRDATA    ,
  output                   APBI1_PSLVERR   ,
										   
  output                   APBT_PSEL       ,
  output                   APBT_PWRITE     ,
  output [ADDR_WIDTH-1:0 ] APBT_PADDR      ,
  output [DATA_WIDTH-1:0]  APBT_PWDATA     ,
  output                   APBT_PENABLE    ,
  input                    APBT_PREADY     ,
  input  [DATA_WIDTH-1:0]  APBT_PRDATA     ,
  input                    APBT_PSLVERR    ,

  input                    APB_MUX_SEL  
)/* synthesis syn_hier = "fixed" syn_preserve=1 syn_noprune=1 */;


  assign APBT_PSEL     = APB_MUX_SEL ? APBI1_PSEL    : APBI0_PSEL;
  assign APBT_PWRITE   = APB_MUX_SEL ? APBI1_PWRITE  : APBI0_PWRITE;
  assign APBT_PADDR    = APB_MUX_SEL ? APBI1_PADDR   : APBI0_PADDR;
  assign APBT_PWDATA   = APB_MUX_SEL ? APBI1_PWDATA  : APBI0_PWDATA;
  assign APBT_PENABLE  = APB_MUX_SEL ? APBI1_PENABLE : APBI0_PENABLE;
  
  assign APBI0_PREADY  = APB_MUX_SEL ? 1'b0          : APBT_PREADY;
  assign APBI1_PREADY  = APB_MUX_SEL ? APBT_PREADY   : 1'b0;

  assign APBI0_PRDATA  = APB_MUX_SEL ? 0             : APBT_PRDATA;
  assign APBI1_PRDATA  = APB_MUX_SEL ? APBT_PRDATA   : 0;

  assign APBI0_PSLVERR = APB_MUX_SEL ? 1'b0          : APBT_PSLVERR;
  assign APBI1_PSLVERR = APB_MUX_SEL ? APBT_PSLVERR  : 1'b0;
  
endmodule 