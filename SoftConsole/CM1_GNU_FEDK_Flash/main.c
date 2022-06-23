/*******************************************************************************
 * (c) Copyright 2008 Actel Corporation.  All rights reserved.
 * 
 *  SPI FLASH basic test.
 * 
 * SVN $Revision: 1554 $
 * SVN $Date: 2009-10-22 16:34:17 +0100 (Thu, 22 Oct 2009) $
 */
#include "core_spi.h"
#include "corespi_regs.h"
#include "cpu_types.h"
#include "platform.h"
#include <string.h>
#include "core_irq_ctrl.h"
#include "coreinterrupt_regs.h"
#include "cortex_nvic.h"
#include "cortex_nvic_regs.h"
#include "hal.h"
#include "core_gpio.h"


/* defines for Winbond W25X16 SPI Flash */

#define FLASH_MANUFACTURER_ID   (uint8_t) 0xEF
#define FLASH_DEVICE_ID         (uint16_t)0x3015
#define DEVICE_ID_READ          (uint8_t) 0x9F
#define READ_STATUS             (uint8_t) 0x05
#define BUSY_BIT_MASK           (uint8_t) 0x01
#define SECTOR_ERASE            (uint8_t) 0x20
#define PAGE_PROG               (uint8_t) 0x02
#define PAGE_READ               (uint8_t) 0x03


/* slave test */
uint8_t SLAVE_TEST_FLAG=0x5a; 

/* GPIO pins for eeprom chip select */
#define EEPROM_CS_HIGH      GPIO_set_bits( &g_slave_select_gpio, GPIO_BIT_0, 1 )
#define EEPROM_CS_LOW       GPIO_set_bits( &g_slave_select_gpio, GPIO_BIT_0, 0 )

/* function prototypes */

void FLASH_read_device_id 
(
    SPI_instance_t * this_spi,
    uint8_t * manufacturer_id,
    uint16_t * device_id
);

uint8_t FLASH_get_status( SPI_instance_t * this_spi );

void FLASH_wait_ready( SPI_instance_t * this_spi );

void FLASH_write_read(SPI_instance_t * this_spi);

uint8_t FLASH_sector_program
(
    SPI_instance_t * this_spi,
    addr_t sectorAdd,
    addr_t progAdd,
    uint8_t * writeData,
    uint8_t * retData,
    uint8_t dataSize
);

void FLASH_read
(
    SPI_instance_t * this_spi,
    uint32_t address,
    uint8_t * rx_buffer,
    uint32_t rx_buffer_size
);


/* test patterns for flash test */

uint8_t writeData[]={0x01,0x10,0x02,0x20,0x04,0x40,0x08,0x80,\
                     0xaa,0x55,0xaa,0xa5,0x5a,0xee,0x77,0x11,\
                     0x22,0x33,0x44,0x55,0x66,0x77,0x88,0x99,\
                     0xaa,0xbb,0xcc,0xdd,0xee,0xff,0x0f,0xf0 };

gpio_instance_t g_slave_select_gpio;

/*******************************************************************************
 *
 */

int main()
{
    SPI_instance_t core_spi0;
     
    uint8_t manufacturer_id = 0;
    uint16_t device_id = 0;
    volatile uint32_t errors = 0;    
    volatile uint8_t rx_buffer[10];
    
    GPIO_init( &g_slave_select_gpio, GPIO_BASE_ADDR, 1 );
    
    EEPROM_CS_HIGH;
         
    /***************************************************************************
     * Configure SPI.
     */
          
    /* SPI_init sets default configuration parameters */
     SPI_init(&core_spi0, SPI0_BASE_ADDR, SPI_MODE_MASTER, SPI_MODE0, PCLK_DIV_256 );
      
    /***************************************************************************
     * Check SPI Flash part manufacturer and device ID.
     */
    FLASH_read_device_id(&core_spi0, &manufacturer_id, &device_id );
    if ( (manufacturer_id != FLASH_MANUFACTURER_ID) || (device_id != FLASH_DEVICE_ID))
    {
        ++errors; 
    }
        
    /**************************************************************************
     * Erase a flash sector and write some test patterns 
     *
     */ 
    FLASH_write_read(&core_spi0);
    
    FLASH_read(&core_spi0, 0x10, rx_buffer, sizeof(rx_buffer) );
    
    FLASH_read(&core_spi0, 0x00, rx_buffer, sizeof(rx_buffer) );
    
    /* infinite loop */
    while ( 1 )
    {
        ;
    }
    
    return 0;
}

/*******************************************************************************
 *
 */
void FLASH_read_device_id
(
    SPI_instance_t * this_spi,    
    uint8_t * manufacturer_id,
    uint16_t * device_id
)
{
    uint8_t errCount=0;
    uint8_t read_device_id_cmd = DEVICE_ID_READ;
    uint8_t read_buffer[4];
    
    SPI_slave_select(this_spi, SPI_SLAVE_0 );
    EEPROM_CS_LOW;
    SPI_block_read(this_spi, &read_device_id_cmd, 1, read_buffer, sizeof(read_buffer));
    EEPROM_CS_HIGH;

    *manufacturer_id = read_buffer[0];
    *device_id = (read_buffer[1] << 8) | read_buffer[2];
}

/*******************************************************************************
 *
 */
void FLASH_read
(
    SPI_instance_t * this_spi,
    uint32_t address,
    uint8_t * rx_buffer,
    uint32_t rx_buffer_size
)
{
    uint8_t errCount=0;
    uint8_t readCmd[4];
    
    /* setup the SPI core and slave device */    
    SPI_set_port(this_spi,SPI0_BASE_ADDR);   /*  select SPI Core0  */             
    SPI_set_mode(this_spi,SPI_MODE_MASTER);  /*  master mode       */
    SPI_enable(this_spi);                    /*  enable SPI Core0  */
          
    /* setup the read command and address */
    readCmd[0]=PAGE_READ;
    readCmd[1]=( ( address & 0x00FF0000 ) >> 16 );
    readCmd[2]=( ( address & 0x0000FF00 ) >> 8 );
    readCmd[3]=( address & 0x000000FF );                
    
     /* send the read command and read back the data from flash */    
    EEPROM_CS_LOW;
    errCount+=SPI_transfer( this_spi, readCmd, NULL, sizeof(readCmd) );
    errCount+=SPI_transfer( this_spi, rx_buffer, rx_buffer, rx_buffer_size );
    EEPROM_CS_HIGH;     
    
    /* disable Core0 */
    SPI_disable(this_spi);
}

/*******************************************************************************
 *
 */
uint8_t FLASH_get_status( SPI_instance_t * this_spi )
{
    uint8_t status;
    uint8_t command = READ_STATUS;
    
    EEPROM_CS_LOW;
    SPI_block_read( this_spi, &command, sizeof(uint8_t), &status, sizeof(uint8_t) );
    EEPROM_CS_HIGH;
    
    return status;
}

/*******************************************************************************
 *
 */
void FLASH_wait_ready( SPI_instance_t * this_spi )
{
    uint8_t busy_bit;
    
    do
    {
        busy_bit = FLASH_get_status(this_spi) & BUSY_BIT_MASK;
    } while( busy_bit == 1 );
}


/******************************************************************************
 * FLASH_write_read
 * 
 * This function configures the CoreSPI to communicate with the SPI flash 
 * device on slave0 and then erases and programs the device 
 *  
 */

void FLASH_write_read(SPI_instance_t * this_spi)
{            
    addr_t sectorAdd=0x00;
    addr_t progAdd=0x00;
    uint8_t dataSize=sizeof(writeData);
    uint8_t retData[dataSize];      
        
    /* setup the SPI core and slave device */    
    SPI_set_port(this_spi,SPI0_BASE_ADDR);   /*  select SPI Core0  */             
    SPI_set_mode(this_spi,SPI_MODE_MASTER);  /*  master mode       */
       SPI_enable(this_spi);                    /*  enable SPI Core0  */
          
       /* configure the appropriate parameters for accessing slave0 (eeprom) */
    SPI_configure (this_spi, SPI_SLAVE_0, SPI_MODE0, PCLK_DIV_4, SPI_MSB_FIRST);
        
    /* select the target device (slave0) - this configures the SPI core
       based on the parameters setup by SPI_configure */
    SPI_slave_select(this_spi,SPI_SLAVE_0);          
        
    /* erase and program */
    FLASH_sector_program (this_spi, sectorAdd, progAdd, writeData, \
                          retData, dataSize);
       
    /* disable Core0 */
    SPI_disable(this_spi);
}
    
   
/*******************************************************************************
 * FLASH_sector_program
 * 
 * Erase a flash sector and then write and read some data patterns
 * 
 * If errors occur the error counter is incremented and the count is returned 
 * to the caller on exit  
 * 
 */
uint8_t FLASH_sector_program
(
    SPI_instance_t * this_spi,
    addr_t sectorAdd,
    addr_t progAdd,
    uint8_t * writeData,
    uint8_t * retData,
    uint8_t dataSize
)
{
    uint8_t checkData;
    uint8_t errCount=0;
    uint8_t WE_CMD=0x06;    
    
    uint8_t eraseCmd[4];
    uint8_t progCmd[4];
    uint8_t readCmd[4];
        
    EEPROM_CS_HIGH;  

    /* setup the sector erase command and address */
    eraseCmd[0]=SECTOR_ERASE;
    eraseCmd[1]=((sectorAdd&(0x00FF0000))>>16);
    eraseCmd[2]=((sectorAdd&(0x0000FF00))>>8);
    eraseCmd[3]=(sectorAdd&(0x000000FF));    
        
    /* setup the page program command and address */
    progCmd[0]=PAGE_PROG;
    progCmd[1]=((progAdd&(0x00FF0000))>>16);
    progCmd[2]=((progAdd&(0x0000FF00))>>8);
    progCmd[3]=(progAdd&(0x000000FF));
            
    /* setup the read command and address */
    readCmd[0]=PAGE_READ;
    readCmd[1]=((progAdd&(0x00FF0000))>>16);
    readCmd[2]=((progAdd&(0x0000FF00))>>8);
    readCmd[3]=(progAdd&(0x000000FF));                
                         
    /* write enable */
    EEPROM_CS_LOW;
    errCount+=SPI_write_byte(this_spi,&WE_CMD);
    EEPROM_CS_HIGH;
        
    /* send the sector erase command */    
    EEPROM_CS_LOW;
    errCount+= SPI_transfer(this_spi,eraseCmd,NULL,sizeof(eraseCmd));
    EEPROM_CS_HIGH;
    FLASH_wait_ready(this_spi); 
    
    EEPROM_CS_LOW;
    errCount+=SPI_write_byte(this_spi,&WE_CMD);
    EEPROM_CS_HIGH;
    
    /* send the page program command and program the data into flash */    
    EEPROM_CS_LOW;
    errCount+=SPI_transfer(this_spi,progCmd,NULL,sizeof(progCmd));
    errCount+=SPI_transfer(this_spi,writeData,NULL,dataSize);
    EEPROM_CS_HIGH;
    FLASH_wait_ready(this_spi);
      
     /* send the read command and read back the data from flash */    
    EEPROM_CS_LOW;
    errCount+=SPI_transfer(this_spi,readCmd,NULL,sizeof(readCmd));
    errCount+=SPI_transfer(this_spi,retData,retData,dataSize);
    EEPROM_CS_HIGH;     
        
    /* verify the data returned from eeprom */    
    for(checkData=0;checkData<dataSize;checkData++)
    {
        if(retData[checkData]!=writeData[checkData])
            errCount++;
    }                    
    
     return(errCount);   
}

