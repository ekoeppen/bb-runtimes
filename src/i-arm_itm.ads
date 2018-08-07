--  This spec has been automatically generated from cm4f.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces;
with System;

package Interfaces.ARM_ITM is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   type UInt2 is mod 2**2
     with Size => 2;
   type UInt4 is mod 2**4
     with Size => 4;
   type UInt7 is mod 2**6
     with Size => 7;

   ---------------
   -- Registers --
   ---------------

   type Port_Register_Words is array (0 .. 31) of Interfaces.Unsigned_32
     with Component_Size => 32, Volatile;

   type Port_Register_Bytes is array (0 .. 127) of Interfaces.Unsigned_8
     with Component_Size => 8, Volatile;

   type Port_Register
      (As_Words : Boolean := True)
   is record
      case As_Words is
         when True => Words : Port_Register_Words;
         when False => Bytes : Port_Register_Bytes;
      end case;
   end record
      with Unchecked_Union;

   type STIMENA_Register_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   type TER_Register is record
      STIMENA : STIMENA_Register_Array;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TER_Register use record
      STIMENA at 0 range 0 .. 31;
   end record;

   type TPR_Register is record
      PRIVMASK : UInt4;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPR_Register use record
      PRIVMASK at 0 range 0 .. 3;
   end record;

   type TCR_Register is record
      ITMENA      : Boolean := False;
      TSENA       : Boolean := False;
      SYNCENA     : Boolean := False;
      DWTENA      : Boolean := False;
      SWOENA      : Boolean := False;
      TSPrescale  : UInt2 := 0;
      ATBID       : UInt7 := 0;
      BUSY        : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCR_Register use record
      ITMENA      at 0 range 0 .. 0;
      TSENA       at 0 range 1 .. 1;
      SYNCENA     at 0 range 2 .. 2;
      DWTENA      at 0 range 3 .. 3;
      SWOENA      at 0 range 4 .. 4;
      TSPrescale  at 0 range 8 .. 9;
      ATBID       at 0 range 16 .. 22;
      BUSY        at 0 range 23 .. 23;
   end record;

   type IWR_Register is record
      ATVALIDM : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IWR_Register use record
      ATVALIDM at 0 range 0 .. 0;
   end record;

   type IRR_Register is record
      ATREADYM : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IRR_Register use record
      ATREADYM at 0 range 0 .. 0;
   end record;

   type IMCR_Register is record
      INTEGRATION : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IMCR_Register use record
      INTEGRATION at 0 range 0 .. 0;
   end record;

   type LAR_Register is record
      Lock_Access : Interfaces.Unsigned_32;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LAR_Register use record
      Lock_Access at 0 range 0 .. 31;
   end record;

   type LSR_Register is record
      Present  : Boolean := False;
      Acc      : Boolean := False;
      ByteAcc  : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LSR_Register use record
      Present  at 0 range 0 .. 0;
      Acc      at 0 range 1 .. 1;
      ByteAcc  at 0 range 2 .. 2;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type ITM_Peripheral is record
      Port : aliased Port_Register;
      TER  : aliased TER_Register;
      TPR  : aliased TPR_Register;
      TCR  : aliased TCR_Register;
      IWR  : aliased IWR_Register;
      IRR  : aliased IRR_Register;
      IMCR : aliased IMCR_Register;
      LAR  : aliased LAR_Register;
      LSR  : aliased LSR_Register;
   end record
     with Volatile;

   for ITM_Peripheral use record
      Port  at 16#000# range 0 .. 1023;
      TER   at 16#E00# range 0 .. 31;
      TPR   at 16#E40# range 0 .. 31;
      TCR   at 16#E80# range 0 .. 31;
      IWR   at 16#EF8# range 0 .. 31;
      IRR   at 16#EFC# range 0 .. 31;
      IMCR  at 16#F00# range 0 .. 31;
      LAR   at 16#FB0# range 0 .. 31;
      LSR   at 16#FB4# range 0 .. 31;
   end record;

   ITM_Periph : aliased ITM_Peripheral
     with Import, Address => System'To_Address(16#E000_0000#);

   procedure Send_Char (C : Character);

end Interfaces.ARM_ITM;

