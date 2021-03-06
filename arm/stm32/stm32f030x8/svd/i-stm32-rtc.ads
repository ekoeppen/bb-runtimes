--
--  Copyright (C) 2018, AdaCore
--

--  This spec has been automatically generated from STM32F030.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.STM32.RTC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype TR_SU_Field is Interfaces.STM32.UInt4;
   subtype TR_ST_Field is Interfaces.STM32.UInt3;
   subtype TR_MNU_Field is Interfaces.STM32.UInt4;
   subtype TR_MNT_Field is Interfaces.STM32.UInt3;
   subtype TR_HU_Field is Interfaces.STM32.UInt4;
   subtype TR_HT_Field is Interfaces.STM32.UInt2;
   subtype TR_PM_Field is Interfaces.STM32.Bit;

   --  time register
   type TR_Register is record
      --  Second units in BCD format
      SU             : TR_SU_Field := 16#0#;
      --  Second tens in BCD format
      ST             : TR_ST_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.STM32.Bit := 16#0#;
      --  Minute units in BCD format
      MNU            : TR_MNU_Field := 16#0#;
      --  Minute tens in BCD format
      MNT            : TR_MNT_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  Hour units in BCD format
      HU             : TR_HU_Field := 16#0#;
      --  Hour tens in BCD format
      HT             : TR_HT_Field := 16#0#;
      --  AM/PM notation
      PM             : TR_PM_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : Interfaces.STM32.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype DR_DU_Field is Interfaces.STM32.UInt4;
   subtype DR_DT_Field is Interfaces.STM32.UInt2;
   subtype DR_MU_Field is Interfaces.STM32.UInt4;
   subtype DR_MT_Field is Interfaces.STM32.Bit;
   subtype DR_WDU_Field is Interfaces.STM32.UInt3;
   subtype DR_YU_Field is Interfaces.STM32.UInt4;
   subtype DR_YT_Field is Interfaces.STM32.UInt4;

   --  date register
   type DR_Register is record
      --  Date units in BCD format
      DU             : DR_DU_Field := 16#1#;
      --  Date tens in BCD format
      DT             : DR_DT_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  Month units in BCD format
      MU             : DR_MU_Field := 16#1#;
      --  Month tens in BCD format
      MT             : DR_MT_Field := 16#0#;
      --  Week day units
      WDU            : DR_WDU_Field := 16#1#;
      --  Year units in BCD format
      YU             : DR_YU_Field := 16#0#;
      --  Year tens in BCD format
      YT             : DR_YT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.STM32.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      YU             at 0 range 16 .. 19;
      YT             at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CR_TSEDGE_Field is Interfaces.STM32.Bit;
   subtype CR_REFCKON_Field is Interfaces.STM32.Bit;
   subtype CR_BYPSHAD_Field is Interfaces.STM32.Bit;
   subtype CR_FMT_Field is Interfaces.STM32.Bit;
   subtype CR_ALRAE_Field is Interfaces.STM32.Bit;
   subtype CR_TSE_Field is Interfaces.STM32.Bit;
   subtype CR_ALRAIE_Field is Interfaces.STM32.Bit;
   subtype CR_TSIE_Field is Interfaces.STM32.Bit;
   subtype CR_ADD1H_Field is Interfaces.STM32.Bit;
   subtype CR_SUB1H_Field is Interfaces.STM32.Bit;
   subtype CR_BKP_Field is Interfaces.STM32.Bit;
   subtype CR_COSEL_Field is Interfaces.STM32.Bit;
   subtype CR_POL_Field is Interfaces.STM32.Bit;
   subtype CR_OSEL_Field is Interfaces.STM32.UInt2;
   subtype CR_COE_Field is Interfaces.STM32.Bit;

   --  control register
   type CR_Register is record
      --  unspecified
      Reserved_0_2   : Interfaces.STM32.UInt3 := 16#0#;
      --  Time-stamp event active edge
      TSEDGE         : CR_TSEDGE_Field := 16#0#;
      --  RTC_REFIN reference clock detection enable (50 or 60 Hz)
      REFCKON        : CR_REFCKON_Field := 16#0#;
      --  Bypass the shadow registers
      BYPSHAD        : CR_BYPSHAD_Field := 16#0#;
      --  Hour format
      FMT            : CR_FMT_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.STM32.Bit := 16#0#;
      --  Alarm A enable
      ALRAE          : CR_ALRAE_Field := 16#0#;
      --  unspecified
      Reserved_9_10  : Interfaces.STM32.UInt2 := 16#0#;
      --  timestamp enable
      TSE            : CR_TSE_Field := 16#0#;
      --  Alarm A interrupt enable
      ALRAIE         : CR_ALRAIE_Field := 16#0#;
      --  unspecified
      Reserved_13_14 : Interfaces.STM32.UInt2 := 16#0#;
      --  Time-stamp interrupt enable
      TSIE           : CR_TSIE_Field := 16#0#;
      --  Write-only. Add 1 hour (summer time change)
      ADD1H          : CR_ADD1H_Field := 16#0#;
      --  Write-only. Subtract 1 hour (winter time change)
      SUB1H          : CR_SUB1H_Field := 16#0#;
      --  Backup
      BKP            : CR_BKP_Field := 16#0#;
      --  Calibration output selection
      COSEL          : CR_COSEL_Field := 16#0#;
      --  Output polarity
      POL            : CR_POL_Field := 16#0#;
      --  Output selection
      OSEL           : CR_OSEL_Field := 16#0#;
      --  Calibration output enable
      COE            : CR_COE_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.STM32.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      TSEDGE         at 0 range 3 .. 3;
      REFCKON        at 0 range 4 .. 4;
      BYPSHAD        at 0 range 5 .. 5;
      FMT            at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      ALRAE          at 0 range 8 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      TSE            at 0 range 11 .. 11;
      ALRAIE         at 0 range 12 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      TSIE           at 0 range 15 .. 15;
      ADD1H          at 0 range 16 .. 16;
      SUB1H          at 0 range 17 .. 17;
      BKP            at 0 range 18 .. 18;
      COSEL          at 0 range 19 .. 19;
      POL            at 0 range 20 .. 20;
      OSEL           at 0 range 21 .. 22;
      COE            at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype ISR_ALRAWF_Field is Interfaces.STM32.Bit;
   subtype ISR_SHPF_Field is Interfaces.STM32.Bit;
   subtype ISR_INITS_Field is Interfaces.STM32.Bit;
   subtype ISR_RSF_Field is Interfaces.STM32.Bit;
   subtype ISR_INITF_Field is Interfaces.STM32.Bit;
   subtype ISR_INIT_Field is Interfaces.STM32.Bit;
   subtype ISR_ALRAF_Field is Interfaces.STM32.Bit;
   subtype ISR_TSF_Field is Interfaces.STM32.Bit;
   subtype ISR_TSOVF_Field is Interfaces.STM32.Bit;
   subtype ISR_TAMP1F_Field is Interfaces.STM32.Bit;
   subtype ISR_TAMP2F_Field is Interfaces.STM32.Bit;
   subtype ISR_RECALPF_Field is Interfaces.STM32.Bit;

   --  initialization and status register
   type ISR_Register is record
      --  Read-only. Alarm A write flag
      ALRAWF         : ISR_ALRAWF_Field := 16#1#;
      --  unspecified
      Reserved_1_2   : Interfaces.STM32.UInt2 := 16#3#;
      --  Shift operation pending
      SHPF           : ISR_SHPF_Field := 16#0#;
      --  Read-only. Initialization status flag
      INITS          : ISR_INITS_Field := 16#0#;
      --  Registers synchronization flag
      RSF            : ISR_RSF_Field := 16#0#;
      --  Read-only. Initialization flag
      INITF          : ISR_INITF_Field := 16#0#;
      --  Initialization mode
      INIT           : ISR_INIT_Field := 16#0#;
      --  Alarm A flag
      ALRAF          : ISR_ALRAF_Field := 16#0#;
      --  unspecified
      Reserved_9_10  : Interfaces.STM32.UInt2 := 16#0#;
      --  Time-stamp flag
      TSF            : ISR_TSF_Field := 16#0#;
      --  Time-stamp overflow flag
      TSOVF          : ISR_TSOVF_Field := 16#0#;
      --  RTC_TAMP1 detection flag
      TAMP1F         : ISR_TAMP1F_Field := 16#0#;
      --  RTC_TAMP2 detection flag
      TAMP2F         : ISR_TAMP2F_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  Read-only. Recalibration pending Flag
      RECALPF        : ISR_RECALPF_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.STM32.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      ALRAWF         at 0 range 0 .. 0;
      Reserved_1_2   at 0 range 1 .. 2;
      SHPF           at 0 range 3 .. 3;
      INITS          at 0 range 4 .. 4;
      RSF            at 0 range 5 .. 5;
      INITF          at 0 range 6 .. 6;
      INIT           at 0 range 7 .. 7;
      ALRAF          at 0 range 8 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      TSF            at 0 range 11 .. 11;
      TSOVF          at 0 range 12 .. 12;
      TAMP1F         at 0 range 13 .. 13;
      TAMP2F         at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      RECALPF        at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype PRER_PREDIV_S_Field is Interfaces.STM32.UInt15;
   subtype PRER_PREDIV_A_Field is Interfaces.STM32.UInt7;

   --  prescaler register
   type PRER_Register is record
      --  Synchronous prescaler factor
      PREDIV_S       : PRER_PREDIV_S_Field := 16#FF#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  Asynchronous prescaler factor
      PREDIV_A       : PRER_PREDIV_A_Field := 16#7F#;
      --  unspecified
      Reserved_23_31 : Interfaces.STM32.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRER_Register use record
      PREDIV_S       at 0 range 0 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      PREDIV_A       at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype ALRMAR_SU_Field is Interfaces.STM32.UInt4;
   subtype ALRMAR_ST_Field is Interfaces.STM32.UInt3;
   subtype ALRMAR_MSK1_Field is Interfaces.STM32.Bit;
   subtype ALRMAR_MNU_Field is Interfaces.STM32.UInt4;
   subtype ALRMAR_MNT_Field is Interfaces.STM32.UInt3;
   subtype ALRMAR_MSK2_Field is Interfaces.STM32.Bit;
   subtype ALRMAR_HU_Field is Interfaces.STM32.UInt4;
   subtype ALRMAR_HT_Field is Interfaces.STM32.UInt2;
   subtype ALRMAR_PM_Field is Interfaces.STM32.Bit;
   subtype ALRMAR_MSK3_Field is Interfaces.STM32.Bit;
   subtype ALRMAR_DU_Field is Interfaces.STM32.UInt4;
   subtype ALRMAR_DT_Field is Interfaces.STM32.UInt2;
   subtype ALRMAR_WDSEL_Field is Interfaces.STM32.Bit;
   subtype ALRMAR_MSK4_Field is Interfaces.STM32.Bit;

   --  alarm A register
   type ALRMAR_Register is record
      --  Second units in BCD format.
      SU    : ALRMAR_SU_Field := 16#0#;
      --  Second tens in BCD format.
      ST    : ALRMAR_ST_Field := 16#0#;
      --  Alarm A seconds mask
      MSK1  : ALRMAR_MSK1_Field := 16#0#;
      --  Minute units in BCD format.
      MNU   : ALRMAR_MNU_Field := 16#0#;
      --  Minute tens in BCD format.
      MNT   : ALRMAR_MNT_Field := 16#0#;
      --  Alarm A minutes mask
      MSK2  : ALRMAR_MSK2_Field := 16#0#;
      --  Hour units in BCD format.
      HU    : ALRMAR_HU_Field := 16#0#;
      --  Hour tens in BCD format.
      HT    : ALRMAR_HT_Field := 16#0#;
      --  AM/PM notation
      PM    : ALRMAR_PM_Field := 16#0#;
      --  Alarm A hours mask
      MSK3  : ALRMAR_MSK3_Field := 16#0#;
      --  Date units or day in BCD format.
      DU    : ALRMAR_DU_Field := 16#0#;
      --  Date tens in BCD format.
      DT    : ALRMAR_DT_Field := 16#0#;
      --  Week day selection
      WDSEL : ALRMAR_WDSEL_Field := 16#0#;
      --  Alarm A date mask
      MSK4  : ALRMAR_MSK4_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMAR_Register use record
      SU    at 0 range 0 .. 3;
      ST    at 0 range 4 .. 6;
      MSK1  at 0 range 7 .. 7;
      MNU   at 0 range 8 .. 11;
      MNT   at 0 range 12 .. 14;
      MSK2  at 0 range 15 .. 15;
      HU    at 0 range 16 .. 19;
      HT    at 0 range 20 .. 21;
      PM    at 0 range 22 .. 22;
      MSK3  at 0 range 23 .. 23;
      DU    at 0 range 24 .. 27;
      DT    at 0 range 28 .. 29;
      WDSEL at 0 range 30 .. 30;
      MSK4  at 0 range 31 .. 31;
   end record;

   subtype WPR_KEY_Field is Interfaces.STM32.Byte;

   --  write protection register
   type WPR_Register is record
      --  Write-only. Write protection key
      KEY           : WPR_KEY_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.STM32.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WPR_Register use record
      KEY           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSR_SS_Field is Interfaces.STM32.UInt16;

   --  sub second register
   type SSR_Register is record
      --  Read-only. Sub second value
      SS             : SSR_SS_Field;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SHIFTR_SUBFS_Field is Interfaces.STM32.UInt15;
   subtype SHIFTR_ADD1S_Field is Interfaces.STM32.Bit;

   --  shift control register
   type SHIFTR_Register is record
      --  Write-only. Subtract a fraction of a second
      SUBFS          : SHIFTR_SUBFS_Field := 16#0#;
      --  unspecified
      Reserved_15_30 : Interfaces.STM32.UInt16 := 16#0#;
      --  Write-only. Reserved
      ADD1S          : SHIFTR_ADD1S_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHIFTR_Register use record
      SUBFS          at 0 range 0 .. 14;
      Reserved_15_30 at 0 range 15 .. 30;
      ADD1S          at 0 range 31 .. 31;
   end record;

   subtype TSTR_SU_Field is Interfaces.STM32.UInt4;
   subtype TSTR_ST_Field is Interfaces.STM32.UInt3;
   subtype TSTR_MNU_Field is Interfaces.STM32.UInt4;
   subtype TSTR_MNT_Field is Interfaces.STM32.UInt3;
   subtype TSTR_HU_Field is Interfaces.STM32.UInt4;
   subtype TSTR_HT_Field is Interfaces.STM32.UInt2;
   subtype TSTR_PM_Field is Interfaces.STM32.Bit;

   --  timestamp time register
   type TSTR_Register is record
      --  Read-only. Second units in BCD format.
      SU             : TSTR_SU_Field;
      --  Read-only. Second tens in BCD format.
      ST             : TSTR_ST_Field;
      --  unspecified
      Reserved_7_7   : Interfaces.STM32.Bit;
      --  Read-only. Minute units in BCD format.
      MNU            : TSTR_MNU_Field;
      --  Read-only. Minute tens in BCD format.
      MNT            : TSTR_MNT_Field;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit;
      --  Read-only. Hour units in BCD format.
      HU             : TSTR_HU_Field;
      --  Read-only. Hour tens in BCD format.
      HT             : TSTR_HT_Field;
      --  Read-only. AM/PM notation
      PM             : TSTR_PM_Field;
      --  unspecified
      Reserved_23_31 : Interfaces.STM32.UInt9;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSTR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype TSDR_DU_Field is Interfaces.STM32.UInt4;
   subtype TSDR_DT_Field is Interfaces.STM32.UInt2;
   subtype TSDR_MU_Field is Interfaces.STM32.UInt4;
   subtype TSDR_MT_Field is Interfaces.STM32.Bit;
   subtype TSDR_WDU_Field is Interfaces.STM32.UInt3;

   --  timestamp date register
   type TSDR_Register is record
      --  Read-only. Date units in BCD format
      DU             : TSDR_DU_Field;
      --  Read-only. Date tens in BCD format
      DT             : TSDR_DT_Field;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2;
      --  Read-only. Month units in BCD format
      MU             : TSDR_MU_Field;
      --  Read-only. Month tens in BCD format
      MT             : TSDR_MT_Field;
      --  Read-only. Week day units
      WDU            : TSDR_WDU_Field;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSDR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TSSSR_SS_Field is Interfaces.STM32.UInt16;

   --  time-stamp sub second register
   type TSSSR_Register is record
      --  Read-only. Sub second value
      SS             : TSSSR_SS_Field;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSSSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CALR_CALM_Field is Interfaces.STM32.UInt9;
   subtype CALR_CALW16_Field is Interfaces.STM32.Bit;
   subtype CALR_CALW8_Field is Interfaces.STM32.Bit;
   subtype CALR_CALP_Field is Interfaces.STM32.Bit;

   --  calibration register
   type CALR_Register is record
      --  Calibration minus
      CALM           : CALR_CALM_Field := 16#0#;
      --  unspecified
      Reserved_9_12  : Interfaces.STM32.UInt4 := 16#0#;
      --  Reserved
      CALW16         : CALR_CALW16_Field := 16#0#;
      --  Use a 16-second calibration cycle period
      CALW8          : CALR_CALW8_Field := 16#0#;
      --  Use an 8-second calibration cycle period
      CALP           : CALR_CALP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CALR_Register use record
      CALM           at 0 range 0 .. 8;
      Reserved_9_12  at 0 range 9 .. 12;
      CALW16         at 0 range 13 .. 13;
      CALW8          at 0 range 14 .. 14;
      CALP           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TAFCR_TAMP1E_Field is Interfaces.STM32.Bit;
   subtype TAFCR_TAMP1TRG_Field is Interfaces.STM32.Bit;
   subtype TAFCR_TAMPIE_Field is Interfaces.STM32.Bit;
   subtype TAFCR_TAMP2E_Field is Interfaces.STM32.Bit;
   subtype TAFCR_TAMP2_TRG_Field is Interfaces.STM32.Bit;
   subtype TAFCR_TAMPTS_Field is Interfaces.STM32.Bit;
   subtype TAFCR_TAMPFREQ_Field is Interfaces.STM32.UInt3;
   subtype TAFCR_TAMPFLT_Field is Interfaces.STM32.UInt2;
   subtype TAFCR_TAMP_PRCH_Field is Interfaces.STM32.UInt2;
   subtype TAFCR_TAMP_PUDIS_Field is Interfaces.STM32.Bit;
   subtype TAFCR_PC13VALUE_Field is Interfaces.STM32.Bit;
   subtype TAFCR_PC13MODE_Field is Interfaces.STM32.Bit;
   subtype TAFCR_PC14VALUE_Field is Interfaces.STM32.Bit;
   subtype TAFCR_PC14MODE_Field is Interfaces.STM32.Bit;
   subtype TAFCR_PC15VALUE_Field is Interfaces.STM32.Bit;
   subtype TAFCR_PC15MODE_Field is Interfaces.STM32.Bit;

   --  tamper and alternate function configuration register
   type TAFCR_Register is record
      --  RTC_TAMP1 input detection enable
      TAMP1E         : TAFCR_TAMP1E_Field := 16#0#;
      --  Active level for RTC_TAMP1 input
      TAMP1TRG       : TAFCR_TAMP1TRG_Field := 16#0#;
      --  Tamper interrupt enable
      TAMPIE         : TAFCR_TAMPIE_Field := 16#0#;
      --  RTC_TAMP2 input detection enable
      TAMP2E         : TAFCR_TAMP2E_Field := 16#0#;
      --  Active level for RTC_TAMP2 input
      TAMP2_TRG      : TAFCR_TAMP2_TRG_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : Interfaces.STM32.UInt2 := 16#0#;
      --  Activate timestamp on tamper detection event
      TAMPTS         : TAFCR_TAMPTS_Field := 16#0#;
      --  Tamper sampling frequency
      TAMPFREQ       : TAFCR_TAMPFREQ_Field := 16#0#;
      --  RTC_TAMPx filter count
      TAMPFLT        : TAFCR_TAMPFLT_Field := 16#0#;
      --  RTC_TAMPx precharge duration
      TAMP_PRCH      : TAFCR_TAMP_PRCH_Field := 16#0#;
      --  RTC_TAMPx pull-up disable
      TAMP_PUDIS     : TAFCR_TAMP_PUDIS_Field := 16#0#;
      --  unspecified
      Reserved_16_17 : Interfaces.STM32.UInt2 := 16#0#;
      --  RTC_ALARM output type/PC13 value
      PC13VALUE      : TAFCR_PC13VALUE_Field := 16#0#;
      --  PC13 mode
      PC13MODE       : TAFCR_PC13MODE_Field := 16#0#;
      --  PC14 value
      PC14VALUE      : TAFCR_PC14VALUE_Field := 16#0#;
      --  PC14 mode
      PC14MODE       : TAFCR_PC14MODE_Field := 16#0#;
      --  PC15 value
      PC15VALUE      : TAFCR_PC15VALUE_Field := 16#0#;
      --  PC15 mode
      PC15MODE       : TAFCR_PC15MODE_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.STM32.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TAFCR_Register use record
      TAMP1E         at 0 range 0 .. 0;
      TAMP1TRG       at 0 range 1 .. 1;
      TAMPIE         at 0 range 2 .. 2;
      TAMP2E         at 0 range 3 .. 3;
      TAMP2_TRG      at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      TAMPTS         at 0 range 7 .. 7;
      TAMPFREQ       at 0 range 8 .. 10;
      TAMPFLT        at 0 range 11 .. 12;
      TAMP_PRCH      at 0 range 13 .. 14;
      TAMP_PUDIS     at 0 range 15 .. 15;
      Reserved_16_17 at 0 range 16 .. 17;
      PC13VALUE      at 0 range 18 .. 18;
      PC13MODE       at 0 range 19 .. 19;
      PC14VALUE      at 0 range 20 .. 20;
      PC14MODE       at 0 range 21 .. 21;
      PC15VALUE      at 0 range 22 .. 22;
      PC15MODE       at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype ALRMASSR_SS_Field is Interfaces.STM32.UInt15;
   subtype ALRMASSR_MASKSS_Field is Interfaces.STM32.UInt4;

   --  alarm A sub second register
   type ALRMASSR_Register is record
      --  Sub seconds value
      SS             : ALRMASSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : Interfaces.STM32.UInt9 := 16#0#;
      --  Mask the most-significant bits starting at this bit
      MASKSS         : ALRMASSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.STM32.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMASSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Real-time clock
   type RTC_Peripheral is record
      --  time register
      TR       : aliased TR_Register;
      --  date register
      DR       : aliased DR_Register;
      --  control register
      CR       : aliased CR_Register;
      --  initialization and status register
      ISR      : aliased ISR_Register;
      --  prescaler register
      PRER     : aliased PRER_Register;
      --  alarm A register
      ALRMAR   : aliased ALRMAR_Register;
      --  write protection register
      WPR      : aliased WPR_Register;
      --  sub second register
      SSR      : aliased SSR_Register;
      --  shift control register
      SHIFTR   : aliased SHIFTR_Register;
      --  timestamp time register
      TSTR     : aliased TSTR_Register;
      --  timestamp date register
      TSDR     : aliased TSDR_Register;
      --  time-stamp sub second register
      TSSSR    : aliased TSSSR_Register;
      --  calibration register
      CALR     : aliased CALR_Register;
      --  tamper and alternate function configuration register
      TAFCR    : aliased TAFCR_Register;
      --  alarm A sub second register
      ALRMASSR : aliased ALRMASSR_Register;
      --  backup register
      BKP0R    : aliased Interfaces.STM32.UInt32;
      --  backup register
      BKP1R    : aliased Interfaces.STM32.UInt32;
      --  backup register
      BKP2R    : aliased Interfaces.STM32.UInt32;
      --  backup register
      BKP3R    : aliased Interfaces.STM32.UInt32;
      --  backup register
      BKP4R    : aliased Interfaces.STM32.UInt32;
   end record
     with Volatile;

   for RTC_Peripheral use record
      TR       at 16#0# range 0 .. 31;
      DR       at 16#4# range 0 .. 31;
      CR       at 16#8# range 0 .. 31;
      ISR      at 16#C# range 0 .. 31;
      PRER     at 16#10# range 0 .. 31;
      ALRMAR   at 16#1C# range 0 .. 31;
      WPR      at 16#24# range 0 .. 31;
      SSR      at 16#28# range 0 .. 31;
      SHIFTR   at 16#2C# range 0 .. 31;
      TSTR     at 16#30# range 0 .. 31;
      TSDR     at 16#34# range 0 .. 31;
      TSSSR    at 16#38# range 0 .. 31;
      CALR     at 16#3C# range 0 .. 31;
      TAFCR    at 16#40# range 0 .. 31;
      ALRMASSR at 16#44# range 0 .. 31;
      BKP0R    at 16#50# range 0 .. 31;
      BKP1R    at 16#54# range 0 .. 31;
      BKP2R    at 16#58# range 0 .. 31;
      BKP3R    at 16#5C# range 0 .. 31;
      BKP4R    at 16#60# range 0 .. 31;
   end record;

   --  Real-time clock
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => System'To_Address (16#40002800#);

end Interfaces.STM32.RTC;
