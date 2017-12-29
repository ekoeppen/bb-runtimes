--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from STM32F103.svd

--  This is a version for the STM32F103 MCU
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

   --  PVD through EXTI line detection interrupt
   PVD                        : constant Interrupt_ID := 1;

   --  Tamper interrupt
   TAMPER                     : constant Interrupt_ID := 2;

   --  RTC global interrupt
   RTC                        : constant Interrupt_ID := 3;

   --  Flash global interrupt
   FLASH                      : constant Interrupt_ID := 4;

   --  RCC global interrupt
   RCC                        : constant Interrupt_ID := 5;

   --  EXTI Line0 interrupt
   EXTI0                      : constant Interrupt_ID := 6;

   --  EXTI Line1 interrupt
   EXTI1                      : constant Interrupt_ID := 7;

   --  EXTI Line2 interrupt
   EXTI2                      : constant Interrupt_ID := 8;

   --  EXTI Line3 interrupt
   EXTI3                      : constant Interrupt_ID := 9;

   --  EXTI Line4 interrupt
   EXTI4                      : constant Interrupt_ID := 10;

   --  DMA1 Channel1 global interrupt
   DMA1_Channel1              : constant Interrupt_ID := 11;

   --  DMA1 Channel2 global interrupt
   DMA1_Channel2              : constant Interrupt_ID := 12;

   --  DMA1 Channel3 global interrupt
   DMA1_Channel3              : constant Interrupt_ID := 13;

   --  DMA1 Channel4 global interrupt
   DMA1_Channel4              : constant Interrupt_ID := 14;

   --  DMA1 Channel5 global interrupt
   DMA1_Channel5              : constant Interrupt_ID := 15;

   --  DMA1 Channel6 global interrupt
   DMA1_Channel6              : constant Interrupt_ID := 16;

   --  DMA1 Channel7 global interrupt
   DMA1_Channel7              : constant Interrupt_ID := 17;

   --  ADC1 and ADC2 global interrupt
   ADC1_2                     : constant Interrupt_ID := 18;

   --  USB High Priority or CAN TX interrupts
   USB_HP_CAN_TX              : constant Interrupt_ID := 19;

   --  USB Low Priority or CAN RX0 interrupts
   USB_LP_CAN_RX0             : constant Interrupt_ID := 20;

   --  CAN RX1 interrupt
   CAN_RX1                    : constant Interrupt_ID := 21;

   --  CAN SCE interrupt
   CAN_SCE                    : constant Interrupt_ID := 22;

   --  EXTI Line[9:5] interrupts
   EXTI9_5                    : constant Interrupt_ID := 23;

   --  TIM1 Break interrupt
   TIM1_BRK                   : constant Interrupt_ID := 24;

   --  TIM1 Update interrupt
   TIM1_UP                    : constant Interrupt_ID := 25;

   --  TIM1 Trigger and Commutation interrupts
   TIM1_TRG_COM               : constant Interrupt_ID := 26;

   --  TIM1 Capture Compare interrupt
   TIM1_CC                    : constant Interrupt_ID := 27;

   --  TIM2 global interrupt
   TIM2                       : constant Interrupt_ID := 28;

   --  TIM3 global interrupt
   TIM3                       : constant Interrupt_ID := 29;

   --  TIM4 global interrupt
   TIM4                       : constant Interrupt_ID := 30;

   --  I2C1 event interrupt
   I2C1_EV                    : constant Interrupt_ID := 31;

   --  I2C1 error interrupt
   I2C1_ER                    : constant Interrupt_ID := 32;

   --  I2C2 event interrupt
   I2C2_EV                    : constant Interrupt_ID := 33;

   --  I2C2 error interrupt
   I2C2_ER                    : constant Interrupt_ID := 34;

   --  SPI1 global interrupt
   SPI1                       : constant Interrupt_ID := 35;

   --  SPI2 global interrupt
   SPI2                       : constant Interrupt_ID := 36;

   --  USART1 global interrupt
   USART1                     : constant Interrupt_ID := 37;

   --  USART2 global interrupt
   USART2                     : constant Interrupt_ID := 38;

   --  USART3 global interrupt
   USART3                     : constant Interrupt_ID := 39;

   --  EXTI Line[15:10] interrupts
   EXTI15_10                  : constant Interrupt_ID := 40;

   --  RTC Alarms through EXTI line interrupt
   RTCAlarm                   : constant Interrupt_ID := 41;

   --  TIM8 Break interrupt
   TIM8_BRK                   : constant Interrupt_ID := 43;

   --  TIM8 Update interrupt
   TIM8_UP                    : constant Interrupt_ID := 44;

   --  TIM8 Trigger and Commutation interrupts
   TIM8_TRG_COM               : constant Interrupt_ID := 45;

   --  TIM8 Capture Compare interrupt
   TIM8_CC                    : constant Interrupt_ID := 46;

   --  ADC3 global interrupt
   ADC3                       : constant Interrupt_ID := 47;

   --  FSMC global interrupt
   FSMC                       : constant Interrupt_ID := 48;

   --  SDIO global interrupt
   SDIO                       : constant Interrupt_ID := 49;

   --  TIM5 global interrupt
   TIM5                       : constant Interrupt_ID := 50;

   --  SPI3 global interrupt
   SPI3                       : constant Interrupt_ID := 51;

   --  UART4 global interrupt
   UART4                      : constant Interrupt_ID := 52;

   --  UART5 global interrupt
   UART5                      : constant Interrupt_ID := 53;

   --  TIM6 global interrupt
   TIM6                       : constant Interrupt_ID := 54;

   --  TIM7 global interrupt
   TIM7                       : constant Interrupt_ID := 55;

   --  DMA2 Channel1 global interrupt
   DMA2_Channel1              : constant Interrupt_ID := 56;

   --  DMA2 Channel2 global interrupt
   DMA2_Channel2              : constant Interrupt_ID := 57;

   --  DMA2 Channel3 global interrupt
   DMA2_Channel3              : constant Interrupt_ID := 58;

   --  DMA2 Channel4 and DMA2 Channel5 global interrupt
   DMA2_Channel4_5            : constant Interrupt_ID := 59;

end Ada.Interrupts.Names;
