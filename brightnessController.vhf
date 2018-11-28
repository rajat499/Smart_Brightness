library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;


entity mod15 is
    port( clock: in std_logic;
          outputClock: out std_logic);
end mod15;

architecture arch_mod15 of mod15 is
    signal y: std_logic_vector(3 downto 0) :="0000";
    signal tempOutClk: std_logic := '0';
begin
   process (clock) begin
      if (clock = '1' and clock'event) then
        y <= y+1;
      end if;
      if(y="1110") then
        tempOutClk<= not tempOutClk;
        y<="0000";
       end if;
    end process;
  outputClock <= tempOutClk;
end architecture arch_mod15;

--library IEEE;
--vuse IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use ieee.std_logic_unsigned.all;

--entity freqDivider is
 --   port(clock100mhz: in std_logic;
   --     outputClockFinal: out std_logic);
--end  freqDivider;

--architecture finalClock of freqDivider is
  --  signal temp1, temp2, temp3, temp4: std_logic;
--begin
  --  D1: entity  work.mod16(arch_mod16) port map(clock100mhz, temp1);
--    D2: entity  work.mod16(arch_mod16) port map(temp1, temp2);
  --  D3: entity  work.mod16(arch_mod16) port map(temp2, temp3);
    --D4: entity  work.mod16(arch_mod16) port map(temp3, temp4);
 --   D5: entity  work.mod16(arch_mod16) port map(temp4, outputClockFinal);

--end architecture finalClock;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity counter16 is
    port ( clk : in std_logic;
            output4: out std_logic_vector(3 downto 0));
end counter16;

architecture arch_counter16 of counter16 is
   -- signal c : std_logic;
    signal y : std_logic_vector(3 downto 0) :="0000";
begin
   -- L1: entity work.freqDivider(finalClock) port map (clk,c);
        process (clk) begin
            if (clk = '1' and clk'event) then
                y <= y+1;
            end if;
        end process;
    output4 <= y; 
end architecture arch_counter16;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity counter32 is
    port ( clk : in std_logic;
            outputClk: out std_logic);
end counter32;

architecture arch_counter32 of counter32 is
   -- signal c : std_logic;
    signal y : std_logic_vector(4 downto 0) := "00000";
begin
   -- L1: entity work.freqDivider(finalClock) port map (clk,c);
        process (clk) begin
            if (clk = '1' and clk'event) then
                y <= y+1;
            end if;
            outputClk <= y(4) and y(3) and y(2) and y(1) and y(0);
        end process; 
end architecture arch_counter32;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity main is
    port( Clock: in std_logic ;
          output_mode0: out std_logic_vector(15 downto 0));
end main;

architecture arch_main of main is 
    signal temp: std_logic_vector(3 downto 0);
    signal dummyOutput: std_logic_vector(15 downto 0);
    begin
    K1: entity work.counter16(arch_counter16) port map(Clock, temp);
    with temp select dummyOutput <=
        "1111111111111111" when "0000",
        "1111111111111110" when "0001",
        "1111111111111100" when "0010",
        "1111111111111000" when "0011",
        "1111111111110000" when "0100",
        "1111111111100000" when "0101",
        "1111111111000000" when "0110",
        "1111111110000000" when "0111",
        "1111111100000000" when "1000",
        "1111111000000000" when "1001",
        "1111110000000000" when "1010",
        "1111100000000000" when "1011",
        "1111000000000000" when "1100",
        "1110000000000000" when "1101",
        "1100000000000000" when "1110",
        "1000000000000000" when "1111",
        "0000000000000000" when others;
    
    output_mode0 <= dummyOutput;      
end architecture arch_main;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity dec4_16 is
    port (S: in std_logic_vector(3 downto 0);
          Y: out std_logic_vector(15 downto 0));
end dec4_16;

architecture ssa of dec4_16 is
begin
with S select
Y <="0000000000000001" when "0000",
    "0000000000000010" when "0001",
    "0000000000000100" when "0010",
    "0000000000001000" when "0011",
    "0000000000010000" when "0100",
    "0000000000100000" when "0101",
    "0000000001000000" when "0110",
    "0000000010000000" when "0111",
    "0000000100000000" when "1000",
    "0000001000000000" when "1001",
    "0000010000000000" when "1010",
    "0000100000000000" when "1011",
    "0001000000000000" when "1100",
    "0010000000000000" when "1101",
    "0100000000000000" when "1110",
    "1000000000000000" when others;
end architecture ssa;   

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
         
entity Bin2SevenSeg is
    port( Bin: in std_logic_vector(3 downto 0);
          SS: out std_logic_vector(6 downto 0) );
end Bin2SevenSeg;         

architecture struct of Bin2SevenSeg is
    signal Y: std_logic_vector(15 downto 0);
begin
    D: entity work.dec4_16(ssa) port map(Bin, Y);
    SS(0) <= Y(1) or Y(4) or Y(11) or Y(13);
    SS(1) <= Y(5) or Y(6) or Y(11) or Y(12) or Y(14) or Y(15);
    SS(2) <= Y(2) or Y(14) or Y(12) or Y(15);
    SS(3) <= Y(1) or Y(4) or Y(7) or Y(10) or Y(15);
    SS(4) <= Y(1) or Y(3) or Y(4) or Y(5) or Y(7) or Y(9);
    SS(5) <= Y(1) or Y(2) or Y(3) or Y(7) or Y(13);
    SS(6) <= Y(0) or Y(1) or Y(7) or Y(12);
end architecture struct;   

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity operation1 is
    port(
          ss: in std_logic_vector(3 downto 0);
          clock: in std_logic;
          output_op: out std_logic_vector(15 downto 0));
end operation1;

architecture arch_operation1 of operation1 is
    signal temp: std_logic_vector(3 downto 0);
    signal temp1, temp2: unsigned(3 downto 0);
begin
    D: entity work.counter16(arch_counter16) port map(clock, temp);
    temp1<= unsigned(ss);
    temp2<= unsigned(temp);
    output_op <= "1111111111111111" when temp2 <= temp1 else "0000000000000000";
end architecture arch_operation1;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity final is
    port(
        mode0: in std_logic;
        InputClock: in std_logic;
        input0: in std_logic_vector(3 downto 0);
        anode0: out std_logic_vector(3 downto 0);
        cathode0: out std_logic_vector(6 downto 0);
        output0: out std_logic_vector(15 downto 0));
end final;

architecture arch_final of final is
    signal temp1, temp2: std_logic_vector(15 downto 0);
    signal tempCathode: std_logic_vector(6 downto 0);
begin
 A: entity work.main(arch_main) port map(InputClock, temp1);
 B: entity work.operation1(arch_operation1) port map(input0, InputClock, temp2);
 C: entity work.Bin2SevenSeg(struct) port map(input0, tempCathode);
 
 with mode0 select output0 <=
    temp1 when '0',
    temp2 when others;
    
 with mode0 select anode0 <=
    "1111" when '0',
    "0111" when others;
 
 with mode0 select cathode0 <=
    "1111111" when '0',
    tempCathode when others;
    
end architecture arch_final;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity dataCounter is
    port(
           cs : in std_logic;
           sdo: in std_logic;
           sclk: in std_logic;
           outCounter: out std_logic_vector(14 downto 0));
end dataCounter;

architecture arch_dataCounter of dataCounter is
    signal y: std_logic_vector(14 downto 0);
begin
    process (sclk) begin
            if (sclk = '1' and sclk'event and cs='0') then
                y <= y(13 downto 0) & sdo;
            end if;
    end process;
    outCounter <= y; 
end architecture arch_dataCounter;

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use ieee.std_logic_unsigned.all;

--entity dataOutput is
   -- port(
   --        sdo: in std_logic;
   --        counter: in std_logic_vector(3 downto 0);
   --        outData: out std_logic_vector(3 downto 0));
--end dataOutput;

--architecture arch_dataOutput of dataOutput is
--    signal temp, temp2: std_logic_vector(3 downto 0);
--begin
 --   with counter select temp<=
 --       temp(2 downto 0) & sdo when "0011",
 --       temp(2 downto 0) & sdo when "0100",
 --       temp(2 downto 0) & sdo when "0101",
 --       temp(2 downto 0) & sdo when "0110",
 --       temp when others;
     
  --   with counter select temp2<=
  --      temp when "1111",
  --      temp2 when others; 
     
 -- outData<= temp2;              
--end architecture arch_dataOutput;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity lab5Extended is
    port(
        mode: in std_logic;
        finalInputClock: in std_logic;
        sdoFromBoard: in std_logic;
        CS: out std_logic;
        SCK: out std_logic;
        anode: out std_logic_vector(3 downto 0);
        cathode: out std_logic_vector(6 downto 0);
        output: out std_logic_vector(15 downto 0));
end lab5Extended;

architecture arch_lab5Extended of lab5Extended is
    signal tempInput: std_logic_vector(3 downto 0);
    signal tempRegister: std_logic_vector(14 downto 0);
    signal tempSCLK, incs: std_logic;
begin
    A: entity work.counter32(arch_counter32) port map(finalInputClock, tempSCLK);
    D:  entity work.mod15(arch_mod15) port map(tempSCLK, incs);
    CS<= incs;
    SCK<= tempSCLK;
    D2: entity work.dataCounter(arch_dataCounter) port map(incs, sdoFromBoard, tempSCLK, tempRegister);
         process(tempSCLK)
         begin
            if(tempSCLK = '1' and tempSCLK'event and incs = '1') then
            tempInput <= tempRegister(10 downto 7);
            end if; 
        end process;
    D4: entity work.final(arch_final) port map(mode, finalInputClock, tempInput, anode, cathode, output);
end arch_lab5Extended;
