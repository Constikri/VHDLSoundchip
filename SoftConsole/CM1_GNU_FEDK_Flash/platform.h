/*******************************************************************************
 * (c) Copyright 2008 Actel Corporation.  All rights reserved.
 *
 *  This header file contains the base address of all the peripherals in the
 *  system.
 * 
 * SVN $Rev$
 * SVN $LastChangedDate$
 */
 
#ifndef PLATFORM_HEADER
#define PLATFORM_HEADER

/*------------------------------------------------------------------------------
 * APB bus clock speed:
 */
/* ??? Where do we get this value?
 */
#define SYSTEM_CLOCK_SPEED	16000000UL
#define APB_CLOCK_SPEED		SYSTEM_CLOCK_SPEED

/*------------------------------------------------------------------------------
 * Peripherals memory map:
 */
/* These will appear in the CoreConsole memory map.  The SPI's may not due
 * to a bug with it not listing any registers.
 */
#define TIMER_BASE_ADDR				0xC0000000UL
#define CORE_INT_BASE_ADDR			0xC1000000UL
#define GPIO_BASE_ADDR				0xC2000000UL
#define EXT_UART_BASE_ADDR			0xC3000000UL
#define SPI0_BASE_ADDR				0xC9000000UL 
#define SPI1_BASE_ADDR				0xCA000000UL
#define SPI2_BASE_ADDR				0xCB000000UL

/*------------------------------------------------------------------------------
 * IRQ assignments:
 */
/* These appear in the config for your CoreInterrupt instance.  */
#define TIMER_IRQ_NB				0
#define EXT_UART_TX_RDY_IRQ_NB		1
#define EXT_UART_RX_RDY_IRQ_NB		2
#define SPI0_IRQ_NB					3
#define SPI1_IRQ_NB					5
#define SPI2_IRQ_NB					6

#endif /* PLATFORM_HEADER */
