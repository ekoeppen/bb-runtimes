------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--          Copyright (C) 2012-2017, Free Software Foundation, Inc.         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

pragma Ada_2012; -- To work around pre-commit check?
pragma Suppress (All_Checks);

--  This initialization procedure mainly initializes the PLLs and
--  all derived clocks.

with Ada.Unchecked_Conversion;

with Interfaces.STM32;           use Interfaces, Interfaces.STM32;
with Interfaces.STM32.FLASH;     use Interfaces.STM32.FLASH;
with Interfaces.STM32.RCC;       use Interfaces.STM32.RCC;

with System.BB.Parameters;       use System.BB.Parameters;
with System.BB.Board_Parameters; use System.BB.Board_Parameters;
with System.STM32;               use System.STM32;

procedure Setup_Pll is
   procedure Initialize_Clocks;
   procedure Reset_Clocks;

   ------------------------------
   -- Clock Tree Configuration --
   ------------------------------

   HSE_Enabled     : constant Boolean := True;  -- use high-speed ext. clock
   HSE_Bypass      : constant Boolean := False; -- don't bypass ext. resonator
   LSI_Enabled     : constant Boolean := True;  -- use low-speed internal clock

   Activate_PLL       : constant Boolean := True;

   -----------------------
   -- Initialize_Clocks --
   -----------------------

   procedure Initialize_Clocks
   is
      -------------------------------
      -- Compute Clock Frequencies --
      -------------------------------

      PLLCLKIN     : constant Integer := 8_000_000;

      PLLMUL_Value : constant Integer :=
                      Clock_Frequency / PLLCLKIN;

      PLLCLKOUT   : constant Integer := PLLCLKIN * PLLMUL_Value;

      PLLMUL      : constant UInt4 := UInt4 (PLLMUL_Value) - 2;

      SW          : constant SYSCLK_Source :=
                      (if Activate_PLL then SYSCLK_SRC_PLL
                       else (if HSE_Enabled then SYSCLK_SRC_HSE
                             else SYSCLK_SRC_HSI));
      SW_Value    : constant CFGR_SW_Field :=
                      SYSCLK_Source'Enum_Rep (SW);

      SYSCLK      : constant Integer := (if Activate_PLL
                                         then PLLCLKOUT
                                         else HSICLK);

      HCLK        : constant Integer :=
                      (if not AHB_PRE.Enabled
                       then SYSCLK
                       else
                         (case AHB_PRE.Value is
                             when DIV2   => SYSCLK / 2,
                             when DIV4   => SYSCLK / 4,
                             when DIV8   => SYSCLK / 8,
                             when DIV16  => SYSCLK / 16,
                             when DIV64  => SYSCLK / 64,
                             when DIV128 => SYSCLK / 128,
                             when DIV256 => SYSCLK / 256,
                             when DIV512 => SYSCLK / 512));
      PCLK1       : constant Integer :=
                      (if not APB1_PRE.Enabled
                       then HCLK
                       else
                         (case APB1_PRE.Value is
                             when DIV2  => HCLK / 2,
                             when DIV4  => HCLK / 4,
                             when DIV8  => HCLK / 8,
                             when DIV16 => HCLK / 16));
      PCLK2       : constant Integer :=
                      (if not APB2_PRE.Enabled
                       then HCLK
                       else
                         (case APB2_PRE.Value is
                             when DIV2  => HCLK / 2,
                             when DIV4  => HCLK / 4,
                             when DIV8  => HCLK / 8,
                             when DIV16 => HCLK / 16));

      function To_AHB is new Ada.Unchecked_Conversion
        (AHB_Prescaler, UInt4);
      function To_APB is new Ada.Unchecked_Conversion
        (APB_Prescaler, UInt3);

   begin

      --  Check configuration
      pragma Compile_Time_Error
        (Activate_PLL and PLLCLKOUT not in PLLOUT_Range,
           "Invalid clock configuration");

      pragma Compile_Time_Error
        (SYSCLK /= Clock_Frequency,
           "Cannot generate requested clock");

      pragma Compile_Time_Error
        (HCLK not in HCLK_Range
           or else PCLK1 not in PCLK1_Range
           or else PCLK2 not in PCLK2_Range,
           "Invalid AHB/APB prescalers configuration");

      --  PWR clock enable

      RCC_Periph.APB1ENR.PWREN := 1;

      --  Reset the power interface
      RCC_Periph.APB1RSTR.PWRRST := 1;
      RCC_Periph.APB1RSTR.PWRRST := 0;

      if not HSE_Enabled then
         --  Setup internal clock and wait for HSI stabilisation.

         RCC_Periph.CR.HSION := 1;

         loop
            exit when RCC_Periph.CR.HSIRDY = 1;
         end loop;

      else
         --  Configure high-speed external clock, if enabled

         RCC_Periph.CR.HSEON := 1;
         RCC_Periph.CR.HSEBYP := (if HSE_Bypass then 1 else 0);

         loop
            exit when RCC_Periph.CR.HSERDY = 1;
         end loop;
      end if;

      --  Configure low-speed internal clock if enabled

      if LSI_Enabled then
         RCC_Periph.CSR.LSION := 1;

         loop
            exit when RCC_Periph.CSR.LSIRDY = 1;
         end loop;
      end if;

      --  Activate PLL if enabled
      if Activate_PLL then
         --  Disable the main PLL before configuring it
         RCC_Periph.CR.PLLON := 0;

         --  Configure the PLL clock source, multiplication and division
         --  factors
         RCC_Periph.CFGR :=
           (PLLMUL => PLLMUL,
            PLLSRC => (if HSE_Enabled then 1 else 0),
            others => <>);

         RCC_Periph.CR.PLLON := 1;
         loop
            exit when RCC_Periph.CR.PLLRDY = 1;
         end loop;
      end if;

      --  Configure flash
      --  Must be done before increasing the frequency, otherwise the CPU
      --  won't be able to fetch new instructions.

      FLASH_Periph.ACR :=
        (LATENCY => FLASH_Latency,
         PRFTBE  => 1,
         others  => <>);

      --  Configure derived clocks

      RCC_Periph.CFGR :=
        (SW      => SW_Value,
         HPRE    => To_AHB (AHB_PRE),
         PPRE    => (As_Array => True,
                     Arr      => (1 => To_APB (APB1_PRE),
                                  2 => To_APB (APB2_PRE))),
         MCO     => MC01_Clock_Selection'Enum_Rep (MC01SEL_HSI),
         others  => <>);

      if Activate_PLL then
         loop
            exit when RCC_Periph.CFGR.SWS =
              SYSCLK_Source'Enum_Rep (SYSCLK_SRC_PLL);
         end loop;
      end if;
   end Initialize_Clocks;

   ------------------
   -- Reset_Clocks --
   ------------------

   procedure Reset_Clocks is
   begin
      --  Switch on high speed internal clock
      RCC_Periph.CR.HSION := 1;

      --  Reset CFGR regiser
      RCC_Periph.CFGR := (others => <>);

      --  Reset HSEON, CSSON and PLLON bits
      RCC_Periph.CR.HSEON := 0;
      RCC_Periph.CR.CSSON := 0;
      RCC_Periph.CR.PLLON := 0;

      --  Reset PLL configuration register
      RCC_Periph.CFGR := (others => <>);

      --  Reset HSE bypass bit
      RCC_Periph.CR.HSEBYP := 0;

      --  Disable all interrupts
      RCC_Periph.CIR := (others => <>);
   end Reset_Clocks;

begin
   Reset_Clocks;
   Initialize_Clocks;
end Setup_Pll;
