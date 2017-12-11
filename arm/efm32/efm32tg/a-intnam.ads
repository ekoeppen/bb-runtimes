--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from EFM32TG842F32.svd

--  This is a version for the Silicon Labs EFM32TG842F32 Cortex-M MCU MCU
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   Sys_Tick             : constant Interrupt_ID := -1;
   DMA                  : constant Interrupt_ID := 0;
   GPIO_EVEN            : constant Interrupt_ID := 1;
   TIMER0               : constant Interrupt_ID := 2;
   USART0_RX            : constant Interrupt_ID := 3;
   USART0_TX            : constant Interrupt_ID := 4;
   ACMP0                : constant Interrupt_ID := 5;
   ADC0                 : constant Interrupt_ID := 6;
   DAC0                 : constant Interrupt_ID := 7;
   I2C0                 : constant Interrupt_ID := 8;
   GPIO_ODD             : constant Interrupt_ID := 9;
   TIMER1               : constant Interrupt_ID := 10;
   USART1_RX            : constant Interrupt_ID := 11;
   USART1_TX            : constant Interrupt_ID := 12;
   LESENSE              : constant Interrupt_ID := 13;
   LEUART0              : constant Interrupt_ID := 14;
   LETIMER0             : constant Interrupt_ID := 15;
   PCNT0                : constant Interrupt_ID := 16;
   RTC                  : constant Interrupt_ID := 17;
   CMU                  : constant Interrupt_ID := 18;
   VCMP                 : constant Interrupt_ID := 19;
   LCD                  : constant Interrupt_ID := 20;
   MSC                  : constant Interrupt_ID := 21;
   AES                  : constant Interrupt_ID := 22;

end Ada.Interrupts.Names;
