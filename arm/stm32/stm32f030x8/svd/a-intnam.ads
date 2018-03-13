--
--  Copyright (C) 2018, AdaCore
--

--  This spec has been automatically generated from STM32F030.svd

--  This is a version for the STM32F030 MCU
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   --  System tick
   Sys_Tick                       : constant Interrupt_ID := -1;

   --  Window Watchdog interrupt
   WWDG                           : constant Interrupt_ID := 0;

   --  PVD and VDDIO2 supply comparator interrupt
   PVD                            : constant Interrupt_ID := 1;

   --  RCC and CRS global interrupts
   RCC_CRS                        : constant Interrupt_ID := 4;

   --  EXTI Line[1:0] interrupts
   EXTI0_1                        : constant Interrupt_ID := 5;

   --  EXTI Line[3:2] interrupts
   EXTI2_3                        : constant Interrupt_ID := 6;

   --  EXTI Line15 and EXTI4 interrupts
   EXTI4_15                       : constant Interrupt_ID := 7;

   --  DMA channel 1 interrupt
   DMA_CH1                        : constant Interrupt_ID := 9;

   --  DMA channel 2 and 3 interrupts
   DMA_CH2_3                      : constant Interrupt_ID := 10;

   --  DMA channel 4, 5, 6 and 7 interrupts
   DMA_CH4_5_6_7                  : constant Interrupt_ID := 11;

   --  ADC and comparator interrupts
   ADC_COMP                       : constant Interrupt_ID := 12;

   --  TIM1 break, update, trigger and commutation interrupt
   TIM1_BRK_UP_TRG_COM            : constant Interrupt_ID := 13;

   --  TIM1 Capture Compare interrupt
   TIM1_CC                        : constant Interrupt_ID := 14;

   --  TIM2 global interrupt
   TIM2                           : constant Interrupt_ID := 15;

   --  TIM3 global interrupt
   TIM3                           : constant Interrupt_ID := 16;

   --  TIM6 global interrupt and DAC underrun interrupt
   TIM6_DAC                       : constant Interrupt_ID := 17;

   --  TIM7 global interrupt
   TIM7                           : constant Interrupt_ID := 18;

   --  TIM14 global interrupt
   TIM14                          : constant Interrupt_ID := 19;

   --  I2C1 global interrupt
   I2C1                           : constant Interrupt_ID := 23;

   --  I2C2 global interrupt
   I2C2                           : constant Interrupt_ID := 24;

   --  SPI1_global_interrupt
   SPI1                           : constant Interrupt_ID := 25;

   --  SPI2 global interrupt
   SPI2                           : constant Interrupt_ID := 26;

   --  USART1 global interrupt
   USART1                         : constant Interrupt_ID := 27;

   --  USART2 global interrupt
   USART2                         : constant Interrupt_ID := 28;

   --  USART3 and USART4 global interrupt
   USART3_4                       : constant Interrupt_ID := 29;

end Ada.Interrupts.Names;
