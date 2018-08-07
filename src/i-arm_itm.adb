with Interfaces; use Interfaces;

package body Interfaces.ARM_ITM is

   procedure Send_Char (C : Character) is
   begin
      if ITM_Periph.TCR.ITMENA and ITM_Periph.TER.STIMENA (0) then
         while ITM_Periph.Port.Words (0) = 0 loop
            null;
         end loop;
         ITM_Periph.Port.Bytes (0) := Character'Pos (C);
      end if;
   end Send_Char;

end Interfaces.ARM_ITM;
