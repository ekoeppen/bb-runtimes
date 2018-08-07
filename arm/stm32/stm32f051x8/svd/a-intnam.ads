--
--  Copyright (C) 2018, AdaCore
--

--  This spec has been automatically generated from STM32F0xx.svd

--  This is a version for the STM32F0xx MCU
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   --  System tick
   Sys_Tick                   : constant Interrupt_ID := -1;

   --  Window Watchdog interrupt
   WWDG                       : constant Interrupt_ID := 0;

   --  PVD through EXTI line detection
   PVD                        : constant Interrupt_ID := 1;

   --  RTC global interrupt
   RTC                        : constant Interrupt_ID := 2;

   --  Flash global interrupt
   FLASH                      : constant Interrupt_ID := 3;

   --  RCC global interrupt
   RCC                        : constant Interrupt_ID := 4;

   --  EXTI Line[1:0] interrupts
   EXTI0_1                    : constant Interrupt_ID := 5;

   --  EXTI Line[3:2] interrupts
   EXTI2_3                    : constant Interrupt_ID := 6;

   --  EXTI Line15 and EXTI4 interrupts
   EXTI4_15                   : constant Interrupt_ID := 7;

   --  Touch sensing interrupt
   TSC                        : constant Interrupt_ID := 8;

   --  DMA channel 1 interrupt
   DMA_CH1                    : constant Interrupt_ID := 9;

   --  DMA channel 2 and 3 interrupts
   DMA_CH2_3                  : constant Interrupt_ID := 10;

   --  DMA channel 4 and 5 interrupts
   DMA_CH4_5                  : constant Interrupt_ID := 11;

   --  ADC and comparator 1 and 2
   ADC_COMP                   : constant Interrupt_ID := 12;

   --  TIM1 Break, update, trigger and
   TIM1_BRK_UP                : constant Interrupt_ID := 13;

   --  TIM1 Capture Compare interrupt
   TIM1_CC                    : constant Interrupt_ID := 14;

   --  TIM2 global interrupt
   TIM2                       : constant Interrupt_ID := 15;

   --  TIM3 global interrupt
   TIM3                       : constant Interrupt_ID := 16;

   --  TIM6 global interrupt and DAC
   TIM6_DAC                   : constant Interrupt_ID := 17;

   --  TIM14 global interrupt
   TIM14                      : constant Interrupt_ID := 19;

   --  TIM15 global interrupt
   TIM15                      : constant Interrupt_ID := 20;

   --  TIM16 global interrupt
   TIM16                      : constant Interrupt_ID := 21;

   --  TIM17 global interrupt
   TIM17                      : constant Interrupt_ID := 22;

   --  I2C1 global interrupt
   I2C1                       : constant Interrupt_ID := 23;

   --  I2C2 global interrupt
   I2C2                       : constant Interrupt_ID := 24;

   --  SPI1_global_interrupt
   SPI1                       : constant Interrupt_ID := 25;

   --  SPI2 global interrupt
   SPI2                       : constant Interrupt_ID := 26;

   --  USART1 global interrupt
   USART1                     : constant Interrupt_ID := 27;

   --  USART2 global interrupt
   USART2                     : constant Interrupt_ID := 28;

   --  CEC global interrupt
   CEC                        : constant Interrupt_ID := 30;

end Ada.Interrupts.Names;
