--
--  Copyright (C) 2017, AdaCore
--
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   Sys_Tick_Interrupt    : constant Interrupt_ID := -1;
   DMA_Interrupt         : constant Interrupt_ID := 0;
   GPIO_EVEN_Interrupt   : constant Interrupt_ID := 1;
   TIMER0_Interrupt      : constant Interrupt_ID := 2;
   USART0_RX_Interrupt   : constant Interrupt_ID := 3;
   USART0_TX_Interrupt   : constant Interrupt_ID := 4;
   ACMP0_ACMP1_Interrupt : constant Interrupt_ID := 5;
   ADC0_Interrupt        : constant Interrupt_ID := 6;
   DAC0_Interrupt        : constant Interrupt_ID := 7;
   I2C0_Interrupt        : constant Interrupt_ID := 8;
   GPIO_ODD_Interrupt    : constant Interrupt_ID := 9;
   TIMER1_Interrupt      : constant Interrupt_ID := 10;
   USART1_RX_Interrupt   : constant Interrupt_ID := 11;
   USART1_TX_Interrupt   : constant Interrupt_ID := 12;
   LESENSE_Interrupt     : constant Interrupt_ID := 13;
   LEUART0_Interrupt     : constant Interrupt_ID := 14;
   LETIMER0_Interrupt    : constant Interrupt_ID := 15;
   PCNT0_Interrupt       : constant Interrupt_ID := 16;
   RTC_Interrupt         : constant Interrupt_ID := 17;
   CMU_Interrupt         : constant Interrupt_ID := 18;
   VCMP_Interrupt        : constant Interrupt_ID := 19;
   LCD_Interrupt         : constant Interrupt_ID := 20;
   MSC_Interrupt         : constant Interrupt_ID := 21;
   AES_Interrupt         : constant Interrupt_ID := 22;

end Ada.Interrupts.Names;
