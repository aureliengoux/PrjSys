
-- 
-- Definition of  top
-- 
--      Thu Jan 11 10:56:02 2018
--      
--      Precision RTL Synthesis, 2014a.1_64-bit
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- Library use clause for technology cells
library unisim,simprim ;
use unisim.vcomponents.all,simprim.vcomponents.all;

entity round is 
   port (
      clk : IN std_logic ;
      nrst : IN std_logic ;
      start : IN std_logic ;
      count : IN std_logic_vector (5 DOWNTO 0) ;
      key_i : IN std_logic_vector (127 DOWNTO 0) ;
      data_in : IN std_logic_vector (63 DOWNTO 0) ;
      data_out : OUT std_logic_vector (63 DOWNTO 0) ;
      p_rtlc3n140 : IN std_logic ;
      p_rtlcn0 : IN std_logic ;
      p_rtlc3n143 : IN std_logic ;
      p_rtlcn11 : IN std_logic) ;
end round ;

architecture rtl_round of round is 
   signal data_out_EXMPLR277: std_logic_vector (63 DOWNTO 0) ;
   
   signal cr_key: std_logic_vector (127 DOWNTO 0) ;
   
   signal nx7392z2, nx6395z2, nx5398z2, nx4401z2, nx3404z2, nx2407z2, 
      nx1410z2, nx413z2, nx64952z2, nx63955z2, nx53733z2, nx54730z2, 
      nx55727z2, nx56724z2, nx57721z2, nx58718z2, nx59715z2, nx60712z2, 
      nx61709z2, nx62706z2, nx64702z2, nx163z2, nx1160z2, nx2157z2, nx3154z2, 
      nx4151z2, nx5148z2, nx6145z2, nx7142z2, nx8139z2, nx10135z2, nx11132z2, 
      nx13126z2, nx19108z2, nx21104z2, nx29080z2, nx38055z2, nx44039z2, 
      nx40733z2, nx39736z2, nx38739z2, nx37742z2, nx36745z2, nx35748z2, 
      nx34751z2, nx33754z2, nx32757z2, nx31760z2, nx39508z2, nx40505z2, 
      nx41502z2, nx42499z2, nx43496z2, nx44493z2, nx45490z2, nx46487z2, 
      nx47484z2, nx48481z2, nx50477z2, nx51474z2, nx52471z2, nx53468z2, 
      nx54465z2, nx55462z2, nx56459z2, nx57456z2, nx58453z2, nx59450z2, 
      nx61446z2, nx62443z2, nx63440z2, nx64437z2, nx65434z2, nx895z2, 
      nx1892z2, nx2889z2, nx3886z2, nx4883z2, nx6879z2, nx7876z2, nx8873z2, 
      nx9870z2, nx10867z2, nx11864z2, nx12861z2, nx13858z2, nx14855z2, 
      nx15852z2, nx17848z2, nx18845z2, nx19842z2, nx20839z2, nx21836z2, 
      nx22833z2, nx23830z2, nx24827z2, nx25824z2, nx26821z2, nx28817z2, 
      nx29814z2, nx30811z2, nx31808z2, nx32805z2, nx33802z2, nx34799z2, 
      nx35796z2, nx36793z2, nx37790z2, nx39786z2, nx40783z2, nx41780z2, 
      nx42777z2, nx43774z2, nx44771z2, nx45768z2, nx46765z2, nx47762z2, 
      nx48759z2, nx50755z2, nx51752z2, nx52749z2, nx53746z2, nx54743z2, 
      nx55740z2, nx56737z2, nx57734z2, nx58731z2, nx59728z2, nx61724z2, 
      nx62721z2, nx63718z2, nx64715z2, nx176z2, nx1173z2, nx2170z2, nx3167z2, 
      nx4164z2, nx5161z2, nx9360z2, nx10357z2, nx11354z2, nx12351z2, 
      nx13348z2, nx14345z2, nx15342z2, nx16339z2, nx17336z2, nx18333z2, 
      nx20329z2, nx21326z2, nx22323z2, nx23320z2, nx24317z2, nx25314z2, 
      nx26311z2, nx27308z2, nx28305z2, nx29302z2, nx31298z2, nx32295z2, 
      nx33292z2, nx34289z2, nx35286z2, nx36283z2, nx37280z2, nx38277z2, 
      nx7392z3, nx7392z1, nx6395z3, nx6395z1, nx5398z3, nx5398z1, nx4401z3, 
      nx4401z1, nx3404z3, nx3404z1, nx2407z3, nx2407z1, nx1410z3, nx1410z1, 
      nx413z3, nx413z1, nx64952z3, nx64952z1, nx63955z3, nx63955z1, 
      nx53733z3, nx53733z1, nx54730z3, nx54730z1, nx55727z3, nx55727z1, 
      nx56724z3, nx56724z1, nx57721z3, nx57721z1, nx58718z3, nx58718z1, 
      nx59715z3, nx59715z1, nx60712z3, nx60712z1, nx61709z3, nx61709z1, 
      nx62706z3, nx62706z1, nx64702z3, nx64702z1, nx163z3, nx163z1, nx1160z3, 
      nx1160z1, nx2157z3, nx2157z1, nx3154z3, nx3154z1, nx4151z3, nx4151z1, 
      nx5148z3, nx5148z1, nx6145z3, nx6145z1, nx7142z3, nx7142z1, nx8139z3, 
      nx8139z1, nx10135z3, nx10135z1, nx11132z3, nx11132z1, nx12129z5, 
      nx12129z4, nx12129z3, nx12129z2, nx12129z1, nx13126z5, nx13126z4, 
      nx13126z3, nx13126z1, nx14123z5, nx14123z4, nx14123z3, nx14123z2, 
      nx14123z1, nx15120z5, nx15120z4, nx15120z3, nx15120z2, nx15120z1, 
      nx16117z5, nx16117z4, nx16117z3, nx16117z2, nx16117z1, nx17114z5, 
      nx17114z4, nx17114z3, nx17114z2, nx17114z1, nx18111z5, nx18111z4, 
      nx18111z3, nx18111z2, nx18111z1, nx19108z5, nx19108z4, nx19108z3, 
      nx19108z1, nx21104z5, nx21104z4, nx21104z3, nx21104z1, nx22101z5, 
      nx22101z4, nx22101z3, nx22101z2, nx22101z1, nx23098z5, nx23098z4, 
      nx23098z3, nx23098z2, nx23098z1, nx24095z5, nx24095z4, nx24095z3, 
      nx24095z2, nx24095z1, nx25092z5, nx25092z4, nx25092z3, nx25092z2, 
      nx25092z1, nx26089z5, nx26089z4, nx26089z3, nx26089z2, nx26089z1, 
      nx27086z5, nx27086z4, nx27086z3, nx27086z2, nx27086z1, nx28083z5, 
      nx28083z4, nx28083z3, nx28083z2, nx28083z1, nx29080z5, nx29080z4, 
      nx29080z3, nx29080z1, nx30077z5, nx30077z4, nx30077z3, nx30077z2, 
      nx30077z1, nx32073z5, nx32073z4, nx32073z3, nx32073z2, nx32073z1, 
      nx33070z5, nx33070z4, nx33070z3, nx33070z2, nx33070z1, nx34067z5, 
      nx34067z4, nx34067z3, nx34067z2, nx34067z1, nx35064z5, nx35064z4, 
      nx35064z3, nx35064z2, nx35064z1, nx36061z5, nx36061z4, nx36061z3, 
      nx36061z2, nx36061z1, nx37058z5, nx37058z4, nx37058z3, nx37058z2, 
      nx37058z1, nx38055z5, nx38055z4, nx38055z3, nx38055z1, nx39052z5, 
      nx39052z4, nx39052z3, nx39052z2, nx39052z1, nx40049z5, nx40049z4, 
      nx40049z3, nx40049z2, nx40049z1, nx41046z5, nx41046z4, nx41046z3, 
      nx41046z2, nx41046z1, nx43042z6, nx43042z5, nx43042z3, nx43042z2, 
      nx43042z1, nx44039z5, nx44039z4, nx44039z3, nx44039z1, nx45036z5, 
      nx45036z4, nx45036z3, nx45036z2, nx45036z1, nx46033z6, nx46033z5, 
      nx46033z4, nx46033z3, nx46033z2, nx40733z3, nx40733z1, nx39736z3, 
      nx39736z1, nx38739z3, nx38739z1, nx37742z3, nx37742z1, nx36745z3, 
      nx36745z1, nx35748z3, nx35748z1, nx34751z3, nx34751z1, nx33754z3, 
      nx33754z1, nx32757z3, nx32757z1, nx31760z3, nx31760z1, nx39508z3, 
      nx39508z1, nx40505z3, nx40505z1, nx41502z3, nx41502z1, nx42499z3, 
      nx42499z1, nx43496z3, nx43496z1, nx44493z3, nx44493z1, nx45490z3, 
      nx45490z1, nx46487z3, nx46487z1, nx47484z3, nx47484z1, nx48481z3, 
      nx48481z1, nx50477z3, nx50477z1, nx51474z3, nx51474z1, nx52471z3, 
      nx52471z1, nx53468z3, nx53468z1, nx54465z3, nx54465z1, nx55462z3, 
      nx55462z1, nx56459z3, nx56459z1, nx57456z3, nx57456z1, nx58453z3, 
      nx58453z1, nx59450z3, nx59450z1, nx61446z3, nx61446z1, nx62443z3, 
      nx62443z1, nx63440z3, nx63440z1, nx64437z3, nx64437z1, nx65434z3, 
      nx65434z1, nx895z3, nx895z1, nx1892z3, nx1892z1, nx2889z3, nx2889z1, 
      nx3886z3, nx3886z1, nx4883z3, nx4883z1, nx6879z3, nx6879z1, nx7876z3, 
      nx7876z1, nx8873z3, nx8873z1, nx9870z3, nx9870z1, nx10867z3, nx10867z1, 
      nx11864z3, nx11864z1, nx12861z3, nx12861z1, nx13858z3, nx13858z1, 
      nx14855z3, nx14855z1, nx15852z3, nx15852z1, nx17848z3, nx17848z1, 
      nx18845z3, nx18845z1, nx19842z3, nx19842z1, nx20839z3, nx20839z1, 
      nx21836z3, nx21836z1, nx22833z3, nx22833z1, nx23830z3, nx23830z1, 
      nx24827z3, nx24827z1, nx25824z3, nx25824z1, nx26821z3, nx26821z1, 
      nx28817z3, nx28817z1, nx29814z3, nx29814z1, nx30811z3, nx30811z1, 
      nx31808z3, nx31808z1, nx32805z3, nx32805z1, nx33802z3, nx33802z1, 
      nx34799z3, nx34799z1, nx35796z3, nx35796z1, nx36793z3, nx36793z1, 
      nx37790z3, nx37790z1, nx39786z3, nx39786z1, nx40783z3, nx40783z1, 
      nx41780z3, nx41780z1, nx42777z3, nx42777z1, nx43774z3, nx43774z1, 
      nx44771z3, nx44771z1, nx45768z3, nx45768z1, nx46765z3, nx46765z1, 
      nx47762z3, nx47762z1, nx48759z3, nx48759z1, nx50755z3, nx50755z1, 
      nx51752z3, nx51752z1, nx52749z3, nx52749z1, nx53746z3, nx53746z1, 
      nx54743z3, nx54743z1, nx55740z3, nx55740z1, nx56737z3, nx56737z1, 
      nx57734z3, nx57734z1, nx58731z3, nx58731z1, nx59728z3, nx59728z1, 
      nx61724z3, nx61724z1, nx62721z3, nx62721z1, nx63718z3, nx63718z1, 
      nx64715z3, nx64715z1, nx176z3, nx176z1, nx1173z3, nx1173z1, nx2170z12, 
      nx2170z10, nx2170z9, nx2170z8, nx2170z7, nx2170z6, nx2170z5, nx2170z4, 
      nx2170z3, nx2170z1, nx3167z5, nx3167z3, nx3167z1, nx4164z5, nx3167z4, 
      nx4164z3, nx4164z1, nx5161z5, nx4164z4, nx5161z3, nx5161z1, nx9360z5, 
      nx5161z4, nx9360z3, nx9360z1, nx10357z5, nx9360z4, nx10357z3, 
      nx10357z1, nx11354z5, nx10357z4, nx11354z3, nx11354z1, nx12351z5, 
      nx11354z4, nx12351z3, nx12351z1, nx13348z5, nx12351z4, nx13348z3, 
      nx13348z1, nx14345z5, nx13348z4, nx14345z3, nx14345z1, nx15342z5, 
      nx14345z4, nx15342z3, nx15342z1, nx16339z5, nx15342z4, nx16339z3, 
      nx16339z1, nx17336z5, nx16339z4, nx17336z3, nx17336z1, nx18333z5, 
      nx17336z4, nx18333z3, nx18333z1, nx20329z5, nx18333z4, nx20329z3, 
      nx20329z1, nx21326z5, nx20329z4, nx21326z3, nx21326z1, nx22323z5, 
      nx21326z4, nx22323z3, nx22323z1, nx23320z5, nx22323z4, nx23320z3, 
      nx23320z1, nx24317z5, nx23320z4, nx24317z3, nx24317z1, nx25314z5, 
      nx24317z4, nx25314z3, nx25314z1, nx26311z5, nx25314z4, nx26311z3, 
      nx26311z1, nx27308z5, nx26311z4, nx27308z3, nx27308z1, nx28305z5, 
      nx27308z4, nx28305z3, nx28305z1, nx29302z5, nx28305z4, nx29302z3, 
      nx29302z1, nx31298z5, nx29302z4, nx31298z3, nx31298z1, nx32295z5, 
      nx31298z4, nx32295z3, nx32295z1, nx33292z5, nx32295z4, nx33292z3, 
      nx33292z1, nx34289z5, nx33292z4, nx34289z3, nx34289z1, nx35286z5, 
      nx34289z4, nx35286z3, nx35286z1, nx36283z5, nx35286z4, nx36283z3, 
      nx36283z1, nx37280z5, nx36283z4, nx37280z3, nx37280z1, nx38277z4, 
      nx37280z4, nx2170z11, nx38277z3, nx38277z1: std_logic ;

begin
   data_out(63) <= data_out_EXMPLR277(63) ;
   data_out(62) <= data_out_EXMPLR277(62) ;
   data_out(61) <= data_out_EXMPLR277(61) ;
   data_out(60) <= data_out_EXMPLR277(60) ;
   data_out(59) <= data_out_EXMPLR277(59) ;
   data_out(58) <= data_out_EXMPLR277(58) ;
   data_out(57) <= data_out_EXMPLR277(57) ;
   data_out(56) <= data_out_EXMPLR277(56) ;
   data_out(55) <= data_out_EXMPLR277(55) ;
   data_out(54) <= data_out_EXMPLR277(54) ;
   data_out(53) <= data_out_EXMPLR277(53) ;
   data_out(52) <= data_out_EXMPLR277(52) ;
   data_out(51) <= data_out_EXMPLR277(51) ;
   data_out(50) <= data_out_EXMPLR277(50) ;
   data_out(49) <= data_out_EXMPLR277(49) ;
   data_out(48) <= data_out_EXMPLR277(48) ;
   data_out(47) <= data_out_EXMPLR277(47) ;
   data_out(46) <= data_out_EXMPLR277(46) ;
   data_out(45) <= data_out_EXMPLR277(45) ;
   data_out(44) <= data_out_EXMPLR277(44) ;
   data_out(43) <= data_out_EXMPLR277(43) ;
   data_out(42) <= data_out_EXMPLR277(42) ;
   data_out(41) <= data_out_EXMPLR277(41) ;
   data_out(40) <= data_out_EXMPLR277(40) ;
   data_out(39) <= data_out_EXMPLR277(39) ;
   data_out(38) <= data_out_EXMPLR277(38) ;
   data_out(37) <= data_out_EXMPLR277(37) ;
   data_out(36) <= data_out_EXMPLR277(36) ;
   data_out(35) <= data_out_EXMPLR277(35) ;
   data_out(34) <= data_out_EXMPLR277(34) ;
   data_out(33) <= data_out_EXMPLR277(33) ;
   data_out(32) <= data_out_EXMPLR277(32) ;
   data_out(31) <= data_out_EXMPLR277(31) ;
   data_out(30) <= data_out_EXMPLR277(30) ;
   data_out(29) <= data_out_EXMPLR277(29) ;
   data_out(28) <= data_out_EXMPLR277(28) ;
   data_out(27) <= data_out_EXMPLR277(27) ;
   data_out(26) <= data_out_EXMPLR277(26) ;
   data_out(25) <= data_out_EXMPLR277(25) ;
   data_out(24) <= data_out_EXMPLR277(24) ;
   data_out(23) <= data_out_EXMPLR277(23) ;
   data_out(22) <= data_out_EXMPLR277(22) ;
   data_out(21) <= data_out_EXMPLR277(21) ;
   data_out(20) <= data_out_EXMPLR277(20) ;
   data_out(19) <= data_out_EXMPLR277(19) ;
   data_out(18) <= data_out_EXMPLR277(18) ;
   data_out(17) <= data_out_EXMPLR277(17) ;
   data_out(16) <= data_out_EXMPLR277(16) ;
   data_out(15) <= data_out_EXMPLR277(15) ;
   data_out(14) <= data_out_EXMPLR277(14) ;
   data_out(13) <= data_out_EXMPLR277(13) ;
   data_out(12) <= data_out_EXMPLR277(12) ;
   data_out(11) <= data_out_EXMPLR277(11) ;
   data_out(10) <= data_out_EXMPLR277(10) ;
   data_out(9) <= data_out_EXMPLR277(9) ;
   data_out(8) <= data_out_EXMPLR277(8) ;
   data_out(7) <= data_out_EXMPLR277(7) ;
   data_out(6) <= data_out_EXMPLR277(6) ;
   data_out(5) <= data_out_EXMPLR277(5) ;
   data_out(4) <= data_out_EXMPLR277(4) ;
   data_out(3) <= data_out_EXMPLR277(3) ;
   data_out(2) <= data_out_EXMPLR277(2) ;
   data_out(1) <= data_out_EXMPLR277(1) ;
   data_out(0) <= data_out_EXMPLR277(0) ;
   reg_cr_key_127 : FDCP port map ( Q=>cr_key(127), C=>clk, CLR=>nx38277z1, 
      D=>nx38277z2, PRE=>nx38277z4);
   reg_cr_key_126 : FDCP port map ( Q=>cr_key(126), C=>clk, CLR=>nx37280z1, 
      D=>nx37280z2, PRE=>nx37280z5);
   reg_cr_key_125 : FDCP port map ( Q=>cr_key(125), C=>clk, CLR=>nx36283z1, 
      D=>nx36283z2, PRE=>nx36283z5);
   reg_cr_key_124 : FDCP port map ( Q=>cr_key(124), C=>clk, CLR=>nx35286z1, 
      D=>nx35286z2, PRE=>nx35286z5);
   reg_cr_key_123 : FDCP port map ( Q=>cr_key(123), C=>clk, CLR=>nx34289z1, 
      D=>nx34289z2, PRE=>nx34289z5);
   reg_cr_key_122 : FDCP port map ( Q=>cr_key(122), C=>clk, CLR=>nx33292z1, 
      D=>nx33292z2, PRE=>nx33292z5);
   reg_cr_key_121 : FDCP port map ( Q=>cr_key(121), C=>clk, CLR=>nx32295z1, 
      D=>nx32295z2, PRE=>nx32295z5);
   reg_cr_key_120 : FDCP port map ( Q=>cr_key(120), C=>clk, CLR=>nx31298z1, 
      D=>nx31298z2, PRE=>nx31298z5);
   reg_cr_key_119 : FDCP port map ( Q=>cr_key(119), C=>clk, CLR=>nx29302z1, 
      D=>nx29302z2, PRE=>nx29302z5);
   reg_cr_key_118 : FDCP port map ( Q=>cr_key(118), C=>clk, CLR=>nx28305z1, 
      D=>nx28305z2, PRE=>nx28305z5);
   reg_cr_key_117 : FDCP port map ( Q=>cr_key(117), C=>clk, CLR=>nx27308z1, 
      D=>nx27308z2, PRE=>nx27308z5);
   reg_cr_key_116 : FDCP port map ( Q=>cr_key(116), C=>clk, CLR=>nx26311z1, 
      D=>nx26311z2, PRE=>nx26311z5);
   reg_cr_key_115 : FDCP port map ( Q=>cr_key(115), C=>clk, CLR=>nx25314z1, 
      D=>nx25314z2, PRE=>nx25314z5);
   reg_cr_key_114 : FDCP port map ( Q=>cr_key(114), C=>clk, CLR=>nx24317z1, 
      D=>nx24317z2, PRE=>nx24317z5);
   reg_cr_key_113 : FDCP port map ( Q=>cr_key(113), C=>clk, CLR=>nx23320z1, 
      D=>nx23320z2, PRE=>nx23320z5);
   reg_cr_key_112 : FDCP port map ( Q=>cr_key(112), C=>clk, CLR=>nx22323z1, 
      D=>nx22323z2, PRE=>nx22323z5);
   reg_cr_key_111 : FDCP port map ( Q=>cr_key(111), C=>clk, CLR=>nx21326z1, 
      D=>nx21326z2, PRE=>nx21326z5);
   reg_cr_key_110 : FDCP port map ( Q=>cr_key(110), C=>clk, CLR=>nx20329z1, 
      D=>nx20329z2, PRE=>nx20329z5);
   reg_cr_key_109 : FDCP port map ( Q=>cr_key(109), C=>clk, CLR=>nx18333z1, 
      D=>nx18333z2, PRE=>nx18333z5);
   reg_cr_key_108 : FDCP port map ( Q=>cr_key(108), C=>clk, CLR=>nx17336z1, 
      D=>nx17336z2, PRE=>nx17336z5);
   reg_cr_key_107 : FDCP port map ( Q=>cr_key(107), C=>clk, CLR=>nx16339z1, 
      D=>nx16339z2, PRE=>nx16339z5);
   reg_cr_key_106 : FDCP port map ( Q=>cr_key(106), C=>clk, CLR=>nx15342z1, 
      D=>nx15342z2, PRE=>nx15342z5);
   reg_cr_key_105 : FDCP port map ( Q=>cr_key(105), C=>clk, CLR=>nx14345z1, 
      D=>nx14345z2, PRE=>nx14345z5);
   reg_cr_key_104 : FDCP port map ( Q=>cr_key(104), C=>clk, CLR=>nx13348z1, 
      D=>nx13348z2, PRE=>nx13348z5);
   reg_cr_key_103 : FDCP port map ( Q=>cr_key(103), C=>clk, CLR=>nx12351z1, 
      D=>nx12351z2, PRE=>nx12351z5);
   reg_cr_key_102 : FDCP port map ( Q=>cr_key(102), C=>clk, CLR=>nx11354z1, 
      D=>nx11354z2, PRE=>nx11354z5);
   reg_cr_key_101 : FDCP port map ( Q=>cr_key(101), C=>clk, CLR=>nx10357z1, 
      D=>nx10357z2, PRE=>nx10357z5);
   reg_cr_key_100 : FDCP port map ( Q=>cr_key(100), C=>clk, CLR=>nx9360z1, D
      =>nx9360z2, PRE=>nx9360z5);
   reg_cr_key_99 : FDCP port map ( Q=>cr_key(99), C=>clk, CLR=>nx5161z1, D=>
      nx5161z2, PRE=>nx5161z5);
   reg_cr_key_98 : FDCP port map ( Q=>cr_key(98), C=>clk, CLR=>nx4164z1, D=>
      nx4164z2, PRE=>nx4164z5);
   reg_cr_key_97 : FDCP port map ( Q=>cr_key(97), C=>clk, CLR=>nx3167z1, D=>
      nx3167z2, PRE=>nx3167z5);
   reg_cr_key_96 : FDCP port map ( Q=>cr_key(96), C=>clk, CLR=>nx2170z1, D=>
      nx2170z2, PRE=>nx2170z12);
   reg_cr_key_95 : FDCP port map ( Q=>cr_key(95), C=>clk, CLR=>nx1173z1, D=>
      nx1173z2, PRE=>nx1173z3);
   reg_cr_key_94 : FDCP port map ( Q=>cr_key(94), C=>clk, CLR=>nx176z1, D=>
      nx176z2, PRE=>nx176z3);
   reg_cr_key_93 : FDCP port map ( Q=>cr_key(93), C=>clk, CLR=>nx64715z1, D
      =>nx64715z2, PRE=>nx64715z3);
   reg_cr_key_92 : FDCP port map ( Q=>cr_key(92), C=>clk, CLR=>nx63718z1, D
      =>nx63718z2, PRE=>nx63718z3);
   reg_cr_key_91 : FDCP port map ( Q=>cr_key(91), C=>clk, CLR=>nx62721z1, D
      =>nx62721z2, PRE=>nx62721z3);
   reg_cr_key_90 : FDCP port map ( Q=>cr_key(90), C=>clk, CLR=>nx61724z1, D
      =>nx61724z2, PRE=>nx61724z3);
   reg_cr_key_89 : FDCP port map ( Q=>cr_key(89), C=>clk, CLR=>nx59728z1, D
      =>nx59728z2, PRE=>nx59728z3);
   reg_cr_key_88 : FDCP port map ( Q=>cr_key(88), C=>clk, CLR=>nx58731z1, D
      =>nx58731z2, PRE=>nx58731z3);
   reg_cr_key_87 : FDCP port map ( Q=>cr_key(87), C=>clk, CLR=>nx57734z1, D
      =>nx57734z2, PRE=>nx57734z3);
   reg_cr_key_86 : FDCP port map ( Q=>cr_key(86), C=>clk, CLR=>nx56737z1, D
      =>nx56737z2, PRE=>nx56737z3);
   reg_cr_key_85 : FDCP port map ( Q=>cr_key(85), C=>clk, CLR=>nx55740z1, D
      =>nx55740z2, PRE=>nx55740z3);
   reg_cr_key_84 : FDCP port map ( Q=>cr_key(84), C=>clk, CLR=>nx54743z1, D
      =>nx54743z2, PRE=>nx54743z3);
   reg_cr_key_83 : FDCP port map ( Q=>cr_key(83), C=>clk, CLR=>nx53746z1, D
      =>nx53746z2, PRE=>nx53746z3);
   reg_cr_key_82 : FDCP port map ( Q=>cr_key(82), C=>clk, CLR=>nx52749z1, D
      =>nx52749z2, PRE=>nx52749z3);
   reg_cr_key_81 : FDCP port map ( Q=>cr_key(81), C=>clk, CLR=>nx51752z1, D
      =>nx51752z2, PRE=>nx51752z3);
   reg_cr_key_80 : FDCP port map ( Q=>cr_key(80), C=>clk, CLR=>nx50755z1, D
      =>nx50755z2, PRE=>nx50755z3);
   reg_cr_key_79 : FDCP port map ( Q=>cr_key(79), C=>clk, CLR=>nx48759z1, D
      =>nx48759z2, PRE=>nx48759z3);
   reg_cr_key_78 : FDCP port map ( Q=>cr_key(78), C=>clk, CLR=>nx47762z1, D
      =>nx47762z2, PRE=>nx47762z3);
   reg_cr_key_77 : FDCP port map ( Q=>cr_key(77), C=>clk, CLR=>nx46765z1, D
      =>nx46765z2, PRE=>nx46765z3);
   reg_cr_key_76 : FDCP port map ( Q=>cr_key(76), C=>clk, CLR=>nx45768z1, D
      =>nx45768z2, PRE=>nx45768z3);
   reg_cr_key_75 : FDCP port map ( Q=>cr_key(75), C=>clk, CLR=>nx44771z1, D
      =>nx44771z2, PRE=>nx44771z3);
   reg_cr_key_74 : FDCP port map ( Q=>cr_key(74), C=>clk, CLR=>nx43774z1, D
      =>nx43774z2, PRE=>nx43774z3);
   reg_cr_key_73 : FDCP port map ( Q=>cr_key(73), C=>clk, CLR=>nx42777z1, D
      =>nx42777z2, PRE=>nx42777z3);
   reg_cr_key_72 : FDCP port map ( Q=>cr_key(72), C=>clk, CLR=>nx41780z1, D
      =>nx41780z2, PRE=>nx41780z3);
   reg_cr_key_71 : FDCP port map ( Q=>cr_key(71), C=>clk, CLR=>nx40783z1, D
      =>nx40783z2, PRE=>nx40783z3);
   reg_cr_key_70 : FDCP port map ( Q=>cr_key(70), C=>clk, CLR=>nx39786z1, D
      =>nx39786z2, PRE=>nx39786z3);
   reg_cr_key_69 : FDCP port map ( Q=>cr_key(69), C=>clk, CLR=>nx37790z1, D
      =>nx37790z2, PRE=>nx37790z3);
   reg_cr_key_68 : FDCP port map ( Q=>cr_key(68), C=>clk, CLR=>nx36793z1, D
      =>nx36793z2, PRE=>nx36793z3);
   reg_cr_key_67 : FDCP port map ( Q=>cr_key(67), C=>clk, CLR=>nx35796z1, D
      =>nx35796z2, PRE=>nx35796z3);
   reg_cr_key_66 : FDCP port map ( Q=>cr_key(66), C=>clk, CLR=>nx34799z1, D
      =>nx34799z2, PRE=>nx34799z3);
   reg_cr_key_65 : FDCP port map ( Q=>cr_key(65), C=>clk, CLR=>nx33802z1, D
      =>nx33802z2, PRE=>nx33802z3);
   reg_cr_key_64 : FDCP port map ( Q=>cr_key(64), C=>clk, CLR=>nx32805z1, D
      =>nx32805z2, PRE=>nx32805z3);
   reg_cr_key_63 : FDCP port map ( Q=>cr_key(63), C=>clk, CLR=>nx31808z1, D
      =>nx31808z2, PRE=>nx31808z3);
   reg_cr_key_62 : FDCP port map ( Q=>cr_key(62), C=>clk, CLR=>nx30811z1, D
      =>nx30811z2, PRE=>nx30811z3);
   reg_cr_key_61 : FDCP port map ( Q=>cr_key(61), C=>clk, CLR=>nx29814z1, D
      =>nx29814z2, PRE=>nx29814z3);
   reg_cr_key_60 : FDCP port map ( Q=>cr_key(60), C=>clk, CLR=>nx28817z1, D
      =>nx28817z2, PRE=>nx28817z3);
   reg_cr_key_59 : FDCP port map ( Q=>cr_key(59), C=>clk, CLR=>nx26821z1, D
      =>nx26821z2, PRE=>nx26821z3);
   reg_cr_key_58 : FDCP port map ( Q=>cr_key(58), C=>clk, CLR=>nx25824z1, D
      =>nx25824z2, PRE=>nx25824z3);
   reg_cr_key_57 : FDCP port map ( Q=>cr_key(57), C=>clk, CLR=>nx24827z1, D
      =>nx24827z2, PRE=>nx24827z3);
   reg_cr_key_56 : FDCP port map ( Q=>cr_key(56), C=>clk, CLR=>nx23830z1, D
      =>nx23830z2, PRE=>nx23830z3);
   reg_cr_key_55 : FDCP port map ( Q=>cr_key(55), C=>clk, CLR=>nx22833z1, D
      =>nx22833z2, PRE=>nx22833z3);
   reg_cr_key_54 : FDCP port map ( Q=>cr_key(54), C=>clk, CLR=>nx21836z1, D
      =>nx21836z2, PRE=>nx21836z3);
   reg_cr_key_53 : FDCP port map ( Q=>cr_key(53), C=>clk, CLR=>nx20839z1, D
      =>nx20839z2, PRE=>nx20839z3);
   reg_cr_key_52 : FDCP port map ( Q=>cr_key(52), C=>clk, CLR=>nx19842z1, D
      =>nx19842z2, PRE=>nx19842z3);
   reg_cr_key_51 : FDCP port map ( Q=>cr_key(51), C=>clk, CLR=>nx18845z1, D
      =>nx18845z2, PRE=>nx18845z3);
   reg_cr_key_50 : FDCP port map ( Q=>cr_key(50), C=>clk, CLR=>nx17848z1, D
      =>nx17848z2, PRE=>nx17848z3);
   reg_cr_key_49 : FDCP port map ( Q=>cr_key(49), C=>clk, CLR=>nx15852z1, D
      =>nx15852z2, PRE=>nx15852z3);
   reg_cr_key_48 : FDCP port map ( Q=>cr_key(48), C=>clk, CLR=>nx14855z1, D
      =>nx14855z2, PRE=>nx14855z3);
   reg_cr_key_47 : FDCP port map ( Q=>cr_key(47), C=>clk, CLR=>nx13858z1, D
      =>nx13858z2, PRE=>nx13858z3);
   reg_cr_key_46 : FDCP port map ( Q=>cr_key(46), C=>clk, CLR=>nx12861z1, D
      =>nx12861z2, PRE=>nx12861z3);
   reg_cr_key_45 : FDCP port map ( Q=>cr_key(45), C=>clk, CLR=>nx11864z1, D
      =>nx11864z2, PRE=>nx11864z3);
   reg_cr_key_44 : FDCP port map ( Q=>cr_key(44), C=>clk, CLR=>nx10867z1, D
      =>nx10867z2, PRE=>nx10867z3);
   reg_cr_key_43 : FDCP port map ( Q=>cr_key(43), C=>clk, CLR=>nx9870z1, D=>
      nx9870z2, PRE=>nx9870z3);
   reg_cr_key_42 : FDCP port map ( Q=>cr_key(42), C=>clk, CLR=>nx8873z1, D=>
      nx8873z2, PRE=>nx8873z3);
   reg_cr_key_41 : FDCP port map ( Q=>cr_key(41), C=>clk, CLR=>nx7876z1, D=>
      nx7876z2, PRE=>nx7876z3);
   reg_cr_key_40 : FDCP port map ( Q=>cr_key(40), C=>clk, CLR=>nx6879z1, D=>
      nx6879z2, PRE=>nx6879z3);
   reg_cr_key_39 : FDCP port map ( Q=>cr_key(39), C=>clk, CLR=>nx4883z1, D=>
      nx4883z2, PRE=>nx4883z3);
   reg_cr_key_38 : FDCP port map ( Q=>cr_key(38), C=>clk, CLR=>nx3886z1, D=>
      nx3886z2, PRE=>nx3886z3);
   reg_cr_key_37 : FDCP port map ( Q=>cr_key(37), C=>clk, CLR=>nx2889z1, D=>
      nx2889z2, PRE=>nx2889z3);
   reg_cr_key_36 : FDCP port map ( Q=>cr_key(36), C=>clk, CLR=>nx1892z1, D=>
      nx1892z2, PRE=>nx1892z3);
   reg_cr_key_35 : FDCP port map ( Q=>cr_key(35), C=>clk, CLR=>nx895z1, D=>
      nx895z2, PRE=>nx895z3);
   reg_cr_key_34 : FDCP port map ( Q=>cr_key(34), C=>clk, CLR=>nx65434z1, D
      =>nx65434z2, PRE=>nx65434z3);
   reg_cr_key_33 : FDCP port map ( Q=>cr_key(33), C=>clk, CLR=>nx64437z1, D
      =>nx64437z2, PRE=>nx64437z3);
   reg_cr_key_32 : FDCP port map ( Q=>cr_key(32), C=>clk, CLR=>nx63440z1, D
      =>nx63440z2, PRE=>nx63440z3);
   reg_cr_key_31 : FDCP port map ( Q=>cr_key(31), C=>clk, CLR=>nx62443z1, D
      =>nx62443z2, PRE=>nx62443z3);
   reg_cr_key_30 : FDCP port map ( Q=>cr_key(30), C=>clk, CLR=>nx61446z1, D
      =>nx61446z2, PRE=>nx61446z3);
   reg_cr_key_29 : FDCP port map ( Q=>cr_key(29), C=>clk, CLR=>nx59450z1, D
      =>nx59450z2, PRE=>nx59450z3);
   reg_cr_key_28 : FDCP port map ( Q=>cr_key(28), C=>clk, CLR=>nx58453z1, D
      =>nx58453z2, PRE=>nx58453z3);
   reg_cr_key_27 : FDCP port map ( Q=>cr_key(27), C=>clk, CLR=>nx57456z1, D
      =>nx57456z2, PRE=>nx57456z3);
   reg_cr_key_26 : FDCP port map ( Q=>cr_key(26), C=>clk, CLR=>nx56459z1, D
      =>nx56459z2, PRE=>nx56459z3);
   reg_cr_key_25 : FDCP port map ( Q=>cr_key(25), C=>clk, CLR=>nx55462z1, D
      =>nx55462z2, PRE=>nx55462z3);
   reg_cr_key_24 : FDCP port map ( Q=>cr_key(24), C=>clk, CLR=>nx54465z1, D
      =>nx54465z2, PRE=>nx54465z3);
   reg_cr_key_23 : FDCP port map ( Q=>cr_key(23), C=>clk, CLR=>nx53468z1, D
      =>nx53468z2, PRE=>nx53468z3);
   reg_cr_key_22 : FDCP port map ( Q=>cr_key(22), C=>clk, CLR=>nx52471z1, D
      =>nx52471z2, PRE=>nx52471z3);
   reg_cr_key_21 : FDCP port map ( Q=>cr_key(21), C=>clk, CLR=>nx51474z1, D
      =>nx51474z2, PRE=>nx51474z3);
   reg_cr_key_20 : FDCP port map ( Q=>cr_key(20), C=>clk, CLR=>nx50477z1, D
      =>nx50477z2, PRE=>nx50477z3);
   reg_cr_key_19 : FDCP port map ( Q=>cr_key(19), C=>clk, CLR=>nx48481z1, D
      =>nx48481z2, PRE=>nx48481z3);
   reg_cr_key_18 : FDCP port map ( Q=>cr_key(18), C=>clk, CLR=>nx47484z1, D
      =>nx47484z2, PRE=>nx47484z3);
   reg_cr_key_17 : FDCP port map ( Q=>cr_key(17), C=>clk, CLR=>nx46487z1, D
      =>nx46487z2, PRE=>nx46487z3);
   reg_cr_key_16 : FDCP port map ( Q=>cr_key(16), C=>clk, CLR=>nx45490z1, D
      =>nx45490z2, PRE=>nx45490z3);
   reg_cr_key_15 : FDCP port map ( Q=>cr_key(15), C=>clk, CLR=>nx44493z1, D
      =>nx44493z2, PRE=>nx44493z3);
   reg_cr_key_14 : FDCP port map ( Q=>cr_key(14), C=>clk, CLR=>nx43496z1, D
      =>nx43496z2, PRE=>nx43496z3);
   reg_cr_key_13 : FDCP port map ( Q=>cr_key(13), C=>clk, CLR=>nx42499z1, D
      =>nx42499z2, PRE=>nx42499z3);
   reg_cr_key_12 : FDCP port map ( Q=>cr_key(12), C=>clk, CLR=>nx41502z1, D
      =>nx41502z2, PRE=>nx41502z3);
   reg_cr_key_11 : FDCP port map ( Q=>cr_key(11), C=>clk, CLR=>nx40505z1, D
      =>nx40505z2, PRE=>nx40505z3);
   reg_cr_key_10 : FDCP port map ( Q=>cr_key(10), C=>clk, CLR=>nx39508z1, D
      =>nx39508z2, PRE=>nx39508z3);
   reg_cr_key_9 : FDCP port map ( Q=>cr_key(9), C=>clk, CLR=>nx31760z1, D=>
      nx31760z2, PRE=>nx31760z3);
   reg_cr_key_8 : FDCP port map ( Q=>cr_key(8), C=>clk, CLR=>nx32757z1, D=>
      nx32757z2, PRE=>nx32757z3);
   reg_cr_key_7 : FDCP port map ( Q=>cr_key(7), C=>clk, CLR=>nx33754z1, D=>
      nx33754z2, PRE=>nx33754z3);
   reg_cr_key_6 : FDCP port map ( Q=>cr_key(6), C=>clk, CLR=>nx34751z1, D=>
      nx34751z2, PRE=>nx34751z3);
   reg_cr_key_5 : FDCP port map ( Q=>cr_key(5), C=>clk, CLR=>nx35748z1, D=>
      nx35748z2, PRE=>nx35748z3);
   reg_cr_key_4 : FDCP port map ( Q=>cr_key(4), C=>clk, CLR=>nx36745z1, D=>
      nx36745z2, PRE=>nx36745z3);
   reg_cr_key_3 : FDCP port map ( Q=>cr_key(3), C=>clk, CLR=>nx37742z1, D=>
      nx37742z2, PRE=>nx37742z3);
   reg_cr_key_2 : FDCP port map ( Q=>cr_key(2), C=>clk, CLR=>nx38739z1, D=>
      nx38739z2, PRE=>nx38739z3);
   reg_cr_key_1 : FDCP port map ( Q=>cr_key(1), C=>clk, CLR=>nx39736z1, D=>
      nx39736z2, PRE=>nx39736z3);
   reg_cr_key_0 : FDCP port map ( Q=>cr_key(0), C=>clk, CLR=>nx40733z1, D=>
      nx40733z2, PRE=>nx40733z3);
   reg_cr_data_63 : FDCPE port map ( Q=>data_out_EXMPLR277(63), C=>clk, CE=>
      p_rtlcn11, CLR=>nx46033z2, D=>nx46033z3, PRE=>nx46033z6);
   reg_cr_data_62 : FDCPE port map ( Q=>data_out_EXMPLR277(62), C=>clk, CE=>
      p_rtlcn11, CLR=>nx45036z1, D=>nx45036z2, PRE=>nx45036z5);
   reg_cr_data_61 : FDCPE port map ( Q=>data_out_EXMPLR277(61), C=>clk, CE=>
      p_rtlcn11, CLR=>nx44039z1, D=>nx44039z2, PRE=>nx44039z5);
   reg_cr_data_60 : FDCPE port map ( Q=>data_out_EXMPLR277(60), C=>clk, CE=>
      p_rtlcn11, CLR=>nx43042z1, D=>nx43042z2, PRE=>nx43042z6);
   reg_cr_data_59 : FDCPE port map ( Q=>data_out_EXMPLR277(59), C=>clk, CE=>
      p_rtlcn11, CLR=>nx41046z1, D=>nx41046z2, PRE=>nx41046z5);
   reg_cr_data_58 : FDCPE port map ( Q=>data_out_EXMPLR277(58), C=>clk, CE=>
      p_rtlcn11, CLR=>nx40049z1, D=>nx40049z2, PRE=>nx40049z5);
   reg_cr_data_57 : FDCPE port map ( Q=>data_out_EXMPLR277(57), C=>clk, CE=>
      p_rtlcn11, CLR=>nx39052z1, D=>nx39052z2, PRE=>nx39052z5);
   reg_cr_data_56 : FDCPE port map ( Q=>data_out_EXMPLR277(56), C=>clk, CE=>
      p_rtlcn11, CLR=>nx38055z1, D=>nx38055z2, PRE=>nx38055z5);
   reg_cr_data_55 : FDCPE port map ( Q=>data_out_EXMPLR277(55), C=>clk, CE=>
      p_rtlcn11, CLR=>nx37058z1, D=>nx37058z2, PRE=>nx37058z5);
   reg_cr_data_54 : FDCPE port map ( Q=>data_out_EXMPLR277(54), C=>clk, CE=>
      p_rtlcn11, CLR=>nx36061z1, D=>nx36061z2, PRE=>nx36061z5);
   reg_cr_data_53 : FDCPE port map ( Q=>data_out_EXMPLR277(53), C=>clk, CE=>
      p_rtlcn11, CLR=>nx35064z1, D=>nx35064z2, PRE=>nx35064z5);
   reg_cr_data_52 : FDCPE port map ( Q=>data_out_EXMPLR277(52), C=>clk, CE=>
      p_rtlcn11, CLR=>nx34067z1, D=>nx34067z2, PRE=>nx34067z5);
   reg_cr_data_51 : FDCPE port map ( Q=>data_out_EXMPLR277(51), C=>clk, CE=>
      p_rtlcn11, CLR=>nx33070z1, D=>nx33070z2, PRE=>nx33070z5);
   reg_cr_data_50 : FDCPE port map ( Q=>data_out_EXMPLR277(50), C=>clk, CE=>
      p_rtlcn11, CLR=>nx32073z1, D=>nx32073z2, PRE=>nx32073z5);
   reg_cr_data_49 : FDCPE port map ( Q=>data_out_EXMPLR277(49), C=>clk, CE=>
      p_rtlcn11, CLR=>nx30077z1, D=>nx30077z2, PRE=>nx30077z5);
   reg_cr_data_48 : FDCPE port map ( Q=>data_out_EXMPLR277(48), C=>clk, CE=>
      p_rtlcn11, CLR=>nx29080z1, D=>nx29080z2, PRE=>nx29080z5);
   reg_cr_data_47 : FDCPE port map ( Q=>data_out_EXMPLR277(47), C=>clk, CE=>
      p_rtlcn11, CLR=>nx28083z1, D=>nx28083z2, PRE=>nx28083z5);
   reg_cr_data_46 : FDCPE port map ( Q=>data_out_EXMPLR277(46), C=>clk, CE=>
      p_rtlcn11, CLR=>nx27086z1, D=>nx27086z2, PRE=>nx27086z5);
   reg_cr_data_45 : FDCPE port map ( Q=>data_out_EXMPLR277(45), C=>clk, CE=>
      p_rtlcn11, CLR=>nx26089z1, D=>nx26089z2, PRE=>nx26089z5);
   reg_cr_data_44 : FDCPE port map ( Q=>data_out_EXMPLR277(44), C=>clk, CE=>
      p_rtlcn11, CLR=>nx25092z1, D=>nx25092z2, PRE=>nx25092z5);
   reg_cr_data_43 : FDCPE port map ( Q=>data_out_EXMPLR277(43), C=>clk, CE=>
      p_rtlcn11, CLR=>nx24095z1, D=>nx24095z2, PRE=>nx24095z5);
   reg_cr_data_42 : FDCPE port map ( Q=>data_out_EXMPLR277(42), C=>clk, CE=>
      p_rtlcn11, CLR=>nx23098z1, D=>nx23098z2, PRE=>nx23098z5);
   reg_cr_data_41 : FDCPE port map ( Q=>data_out_EXMPLR277(41), C=>clk, CE=>
      p_rtlcn11, CLR=>nx22101z1, D=>nx22101z2, PRE=>nx22101z5);
   reg_cr_data_40 : FDCPE port map ( Q=>data_out_EXMPLR277(40), C=>clk, CE=>
      p_rtlcn11, CLR=>nx21104z1, D=>nx21104z2, PRE=>nx21104z5);
   reg_cr_data_39 : FDCPE port map ( Q=>data_out_EXMPLR277(39), C=>clk, CE=>
      p_rtlcn11, CLR=>nx19108z1, D=>nx19108z2, PRE=>nx19108z5);
   reg_cr_data_38 : FDCPE port map ( Q=>data_out_EXMPLR277(38), C=>clk, CE=>
      p_rtlcn11, CLR=>nx18111z1, D=>nx18111z2, PRE=>nx18111z5);
   reg_cr_data_37 : FDCPE port map ( Q=>data_out_EXMPLR277(37), C=>clk, CE=>
      p_rtlcn11, CLR=>nx17114z1, D=>nx17114z2, PRE=>nx17114z5);
   reg_cr_data_36 : FDCPE port map ( Q=>data_out_EXMPLR277(36), C=>clk, CE=>
      p_rtlcn11, CLR=>nx16117z1, D=>nx16117z2, PRE=>nx16117z5);
   reg_cr_data_35 : FDCPE port map ( Q=>data_out_EXMPLR277(35), C=>clk, CE=>
      p_rtlcn11, CLR=>nx15120z1, D=>nx15120z2, PRE=>nx15120z5);
   reg_cr_data_34 : FDCPE port map ( Q=>data_out_EXMPLR277(34), C=>clk, CE=>
      p_rtlcn11, CLR=>nx14123z1, D=>nx14123z2, PRE=>nx14123z5);
   reg_cr_data_33 : FDCPE port map ( Q=>data_out_EXMPLR277(33), C=>clk, CE=>
      p_rtlcn11, CLR=>nx13126z1, D=>nx13126z2, PRE=>nx13126z5);
   reg_cr_data_32 : FDCPE port map ( Q=>data_out_EXMPLR277(32), C=>clk, CE=>
      p_rtlcn11, CLR=>nx12129z1, D=>nx12129z2, PRE=>nx12129z5);
   reg_cr_data_31 : FDCPE port map ( Q=>data_out_EXMPLR277(31), C=>clk, CE=>
      p_rtlcn11, CLR=>nx11132z1, D=>nx11132z2, PRE=>nx11132z3);
   reg_cr_data_30 : FDCPE port map ( Q=>data_out_EXMPLR277(30), C=>clk, CE=>
      p_rtlcn11, CLR=>nx10135z1, D=>nx10135z2, PRE=>nx10135z3);
   reg_cr_data_29 : FDCPE port map ( Q=>data_out_EXMPLR277(29), C=>clk, CE=>
      p_rtlcn11, CLR=>nx8139z1, D=>nx8139z2, PRE=>nx8139z3);
   reg_cr_data_28 : FDCPE port map ( Q=>data_out_EXMPLR277(28), C=>clk, CE=>
      p_rtlcn11, CLR=>nx7142z1, D=>nx7142z2, PRE=>nx7142z3);
   reg_cr_data_27 : FDCPE port map ( Q=>data_out_EXMPLR277(27), C=>clk, CE=>
      p_rtlcn11, CLR=>nx6145z1, D=>nx6145z2, PRE=>nx6145z3);
   reg_cr_data_26 : FDCPE port map ( Q=>data_out_EXMPLR277(26), C=>clk, CE=>
      p_rtlcn11, CLR=>nx5148z1, D=>nx5148z2, PRE=>nx5148z3);
   reg_cr_data_25 : FDCPE port map ( Q=>data_out_EXMPLR277(25), C=>clk, CE=>
      p_rtlcn11, CLR=>nx4151z1, D=>nx4151z2, PRE=>nx4151z3);
   reg_cr_data_24 : FDCPE port map ( Q=>data_out_EXMPLR277(24), C=>clk, CE=>
      p_rtlcn11, CLR=>nx3154z1, D=>nx3154z2, PRE=>nx3154z3);
   reg_cr_data_23 : FDCPE port map ( Q=>data_out_EXMPLR277(23), C=>clk, CE=>
      p_rtlcn11, CLR=>nx2157z1, D=>nx2157z2, PRE=>nx2157z3);
   reg_cr_data_22 : FDCPE port map ( Q=>data_out_EXMPLR277(22), C=>clk, CE=>
      p_rtlcn11, CLR=>nx1160z1, D=>nx1160z2, PRE=>nx1160z3);
   reg_cr_data_21 : FDCPE port map ( Q=>data_out_EXMPLR277(21), C=>clk, CE=>
      p_rtlcn11, CLR=>nx163z1, D=>nx163z2, PRE=>nx163z3);
   reg_cr_data_20 : FDCPE port map ( Q=>data_out_EXMPLR277(20), C=>clk, CE=>
      p_rtlcn11, CLR=>nx64702z1, D=>nx64702z2, PRE=>nx64702z3);
   reg_cr_data_19 : FDCPE port map ( Q=>data_out_EXMPLR277(19), C=>clk, CE=>
      p_rtlcn11, CLR=>nx62706z1, D=>nx62706z2, PRE=>nx62706z3);
   reg_cr_data_18 : FDCPE port map ( Q=>data_out_EXMPLR277(18), C=>clk, CE=>
      p_rtlcn11, CLR=>nx61709z1, D=>nx61709z2, PRE=>nx61709z3);
   reg_cr_data_17 : FDCPE port map ( Q=>data_out_EXMPLR277(17), C=>clk, CE=>
      p_rtlcn11, CLR=>nx60712z1, D=>nx60712z2, PRE=>nx60712z3);
   reg_cr_data_16 : FDCPE port map ( Q=>data_out_EXMPLR277(16), C=>clk, CE=>
      p_rtlcn11, CLR=>nx59715z1, D=>nx59715z2, PRE=>nx59715z3);
   reg_cr_data_15 : FDCPE port map ( Q=>data_out_EXMPLR277(15), C=>clk, CE=>
      p_rtlcn11, CLR=>nx58718z1, D=>nx58718z2, PRE=>nx58718z3);
   reg_cr_data_14 : FDCPE port map ( Q=>data_out_EXMPLR277(14), C=>clk, CE=>
      p_rtlcn11, CLR=>nx57721z1, D=>nx57721z2, PRE=>nx57721z3);
   reg_cr_data_13 : FDCPE port map ( Q=>data_out_EXMPLR277(13), C=>clk, CE=>
      p_rtlcn11, CLR=>nx56724z1, D=>nx56724z2, PRE=>nx56724z3);
   reg_cr_data_12 : FDCPE port map ( Q=>data_out_EXMPLR277(12), C=>clk, CE=>
      p_rtlcn11, CLR=>nx55727z1, D=>nx55727z2, PRE=>nx55727z3);
   reg_cr_data_11 : FDCPE port map ( Q=>data_out_EXMPLR277(11), C=>clk, CE=>
      p_rtlcn11, CLR=>nx54730z1, D=>nx54730z2, PRE=>nx54730z3);
   reg_cr_data_10 : FDCPE port map ( Q=>data_out_EXMPLR277(10), C=>clk, CE=>
      p_rtlcn11, CLR=>nx53733z1, D=>nx53733z2, PRE=>nx53733z3);
   reg_cr_data_9 : FDCPE port map ( Q=>data_out_EXMPLR277(9), C=>clk, CE=>
      p_rtlcn11, CLR=>nx63955z1, D=>nx63955z2, PRE=>nx63955z3);
   reg_cr_data_8 : FDCPE port map ( Q=>data_out_EXMPLR277(8), C=>clk, CE=>
      p_rtlcn11, CLR=>nx64952z1, D=>nx64952z2, PRE=>nx64952z3);
   reg_cr_data_7 : FDCPE port map ( Q=>data_out_EXMPLR277(7), C=>clk, CE=>
      p_rtlcn11, CLR=>nx413z1, D=>nx413z2, PRE=>nx413z3);
   reg_cr_data_6 : FDCPE port map ( Q=>data_out_EXMPLR277(6), C=>clk, CE=>
      p_rtlcn11, CLR=>nx1410z1, D=>nx1410z2, PRE=>nx1410z3);
   reg_cr_data_5 : FDCPE port map ( Q=>data_out_EXMPLR277(5), C=>clk, CE=>
      p_rtlcn11, CLR=>nx2407z1, D=>nx2407z2, PRE=>nx2407z3);
   reg_cr_data_4 : FDCPE port map ( Q=>data_out_EXMPLR277(4), C=>clk, CE=>
      p_rtlcn11, CLR=>nx3404z1, D=>nx3404z2, PRE=>nx3404z3);
   reg_cr_data_3 : FDCPE port map ( Q=>data_out_EXMPLR277(3), C=>clk, CE=>
      p_rtlcn11, CLR=>nx4401z1, D=>nx4401z2, PRE=>nx4401z3);
   reg_cr_data_2 : FDCPE port map ( Q=>data_out_EXMPLR277(2), C=>clk, CE=>
      p_rtlcn11, CLR=>nx5398z1, D=>nx5398z2, PRE=>nx5398z3);
   reg_cr_data_1 : FDCPE port map ( Q=>data_out_EXMPLR277(1), C=>clk, CE=>
      p_rtlcn11, CLR=>nx6395z1, D=>nx6395z2, PRE=>nx6395z3);
   reg_cr_data_0 : FDCPE port map ( Q=>data_out_EXMPLR277(0), C=>clk, CE=>
      p_rtlcn11, CLR=>nx7392z1, D=>nx7392z2, PRE=>nx7392z3);
   ix7392z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx7392z2, I0=>start, I1=>data_in(0), I2=>
      data_out_EXMPLR277(32));
   ix6395z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx6395z2, I0=>start, I1=>data_in(1), I2=>
      data_out_EXMPLR277(33));
   ix5398z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx5398z2, I0=>start, I1=>data_in(2), I2=>
      data_out_EXMPLR277(34));
   ix4401z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx4401z2, I0=>start, I1=>data_in(3), I2=>
      data_out_EXMPLR277(35));
   ix3404z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx3404z2, I0=>start, I1=>data_in(4), I2=>
      data_out_EXMPLR277(36));
   ix2407z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx2407z2, I0=>start, I1=>data_in(5), I2=>
      data_out_EXMPLR277(37));
   ix1410z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx1410z2, I0=>start, I1=>data_in(6), I2=>
      data_out_EXMPLR277(38));
   ix413z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx413z2, I0=>start, I1=>data_in(7), I2=>
      data_out_EXMPLR277(39));
   ix64952z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx64952z2, I0=>start, I1=>data_in(8), I2=>
      data_out_EXMPLR277(40));
   ix63955z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx63955z2, I0=>start, I1=>data_in(9), I2=>
      data_out_EXMPLR277(41));
   ix53733z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx53733z2, I0=>start, I1=>data_in(10), I2=>
      data_out_EXMPLR277(42));
   ix54730z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx54730z2, I0=>start, I1=>data_in(11), I2=>
      data_out_EXMPLR277(43));
   ix55727z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx55727z2, I0=>start, I1=>data_in(12), I2=>
      data_out_EXMPLR277(44));
   ix56724z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx56724z2, I0=>start, I1=>data_in(13), I2=>
      data_out_EXMPLR277(45));
   ix57721z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx57721z2, I0=>start, I1=>data_in(14), I2=>
      data_out_EXMPLR277(46));
   ix58718z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx58718z2, I0=>start, I1=>data_in(15), I2=>
      data_out_EXMPLR277(47));
   ix59715z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx59715z2, I0=>start, I1=>data_in(16), I2=>
      data_out_EXMPLR277(48));
   ix60712z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx60712z2, I0=>start, I1=>data_in(17), I2=>
      data_out_EXMPLR277(49));
   ix61709z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx61709z2, I0=>start, I1=>data_in(18), I2=>
      data_out_EXMPLR277(50));
   ix62706z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx62706z2, I0=>start, I1=>data_in(19), I2=>
      data_out_EXMPLR277(51));
   ix64702z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx64702z2, I0=>start, I1=>data_in(20), I2=>
      data_out_EXMPLR277(52));
   ix163z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx163z2, I0=>start, I1=>data_in(21), I2=>
      data_out_EXMPLR277(53));
   ix1160z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx1160z2, I0=>start, I1=>data_in(22), I2=>
      data_out_EXMPLR277(54));
   ix2157z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx2157z2, I0=>start, I1=>data_in(23), I2=>
      data_out_EXMPLR277(55));
   ix3154z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx3154z2, I0=>start, I1=>data_in(24), I2=>
      data_out_EXMPLR277(56));
   ix4151z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx4151z2, I0=>start, I1=>data_in(25), I2=>
      data_out_EXMPLR277(57));
   ix5148z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx5148z2, I0=>start, I1=>data_in(26), I2=>
      data_out_EXMPLR277(58));
   ix6145z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx6145z2, I0=>start, I1=>data_in(27), I2=>
      data_out_EXMPLR277(59));
   ix7142z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx7142z2, I0=>start, I1=>data_in(28), I2=>
      data_out_EXMPLR277(60));
   ix8139z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx8139z2, I0=>start, I1=>data_in(29), I2=>
      data_out_EXMPLR277(61));
   ix10135z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx10135z2, I0=>start, I1=>data_in(30), I2=>
      data_out_EXMPLR277(62));
   ix11132z1531 : LUT3
      generic map (INIT => X"D8") 
       port map ( O=>nx11132z2, I0=>start, I1=>data_in(31), I2=>
      data_out_EXMPLR277(63));
   ix13126z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx13126z2, I0=>nx13126z3, I1=>nx13126z4, I2=>start, I3
      =>data_in(33));
   ix19108z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx19108z2, I0=>nx19108z3, I1=>nx19108z4, I2=>start, I3
      =>data_in(39));
   ix21104z64297 : LUT4
      generic map (INIT => X"F606") 
       port map ( O=>nx21104z2, I0=>nx21104z3, I1=>nx21104z4, I2=>start, I3
      =>data_in(40));
   ix29080z59380 : LUT4
      generic map (INIT => X"E2D1") 
       port map ( O=>nx29080z2, I0=>nx29080z3, I1=>start, I2=>data_in(48), 
      I3=>data_out_EXMPLR277(16));
   ix38055z64297 : LUT4
      generic map (INIT => X"F606") 
       port map ( O=>nx38055z2, I0=>nx38055z3, I1=>nx38055z4, I2=>start, I3
      =>data_in(56));
   ix44039z64297 : LUT4
      generic map (INIT => X"F606") 
       port map ( O=>nx44039z2, I0=>nx44039z3, I1=>nx44039z4, I2=>start, I3
      =>data_in(61));
   ix40733z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx40733z2, I0=>start, I1=>key_i(0), I2=>cr_key(32), I3
      =>p_rtlc3n143);
   ix39736z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx39736z2, I0=>start, I1=>key_i(1), I2=>cr_key(33), I3
      =>p_rtlc3n143);
   ix38739z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx38739z2, I0=>start, I1=>key_i(2), I2=>cr_key(34), I3
      =>p_rtlc3n143);
   ix37742z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx37742z2, I0=>start, I1=>key_i(3), I2=>cr_key(35), I3
      =>p_rtlc3n143);
   ix36745z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx36745z2, I0=>start, I1=>key_i(4), I2=>cr_key(36), I3
      =>p_rtlc3n143);
   ix35748z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx35748z2, I0=>start, I1=>key_i(5), I2=>cr_key(37), I3
      =>p_rtlc3n143);
   ix34751z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx34751z2, I0=>start, I1=>key_i(6), I2=>cr_key(38), I3
      =>p_rtlc3n143);
   ix33754z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx33754z2, I0=>start, I1=>key_i(7), I2=>cr_key(39), I3
      =>p_rtlc3n143);
   ix32757z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx32757z2, I0=>start, I1=>key_i(8), I2=>cr_key(40), I3
      =>p_rtlc3n143);
   ix31760z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx31760z2, I0=>start, I1=>key_i(9), I2=>cr_key(41), I3
      =>p_rtlc3n143);
   ix39508z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx39508z2, I0=>start, I1=>key_i(10), I2=>cr_key(42), I3
      =>p_rtlc3n143);
   ix40505z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx40505z2, I0=>start, I1=>key_i(11), I2=>cr_key(43), I3
      =>p_rtlc3n143);
   ix41502z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx41502z2, I0=>start, I1=>key_i(12), I2=>cr_key(44), I3
      =>p_rtlc3n143);
   ix42499z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx42499z2, I0=>start, I1=>key_i(13), I2=>cr_key(45), I3
      =>p_rtlc3n143);
   ix43496z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx43496z2, I0=>start, I1=>key_i(14), I2=>cr_key(46), I3
      =>p_rtlc3n143);
   ix44493z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx44493z2, I0=>start, I1=>key_i(15), I2=>cr_key(47), I3
      =>p_rtlc3n143);
   ix45490z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx45490z2, I0=>start, I1=>key_i(16), I2=>cr_key(48), I3
      =>p_rtlc3n143);
   ix46487z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx46487z2, I0=>start, I1=>key_i(17), I2=>cr_key(49), I3
      =>p_rtlc3n143);
   ix47484z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx47484z2, I0=>start, I1=>key_i(18), I2=>cr_key(50), I3
      =>p_rtlc3n143);
   ix48481z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx48481z2, I0=>start, I1=>key_i(19), I2=>cr_key(51), I3
      =>p_rtlc3n143);
   ix50477z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx50477z2, I0=>start, I1=>key_i(20), I2=>cr_key(52), I3
      =>p_rtlc3n143);
   ix51474z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx51474z2, I0=>start, I1=>key_i(21), I2=>cr_key(53), I3
      =>p_rtlc3n143);
   ix52471z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx52471z2, I0=>start, I1=>key_i(22), I2=>cr_key(54), I3
      =>p_rtlc3n143);
   ix53468z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx53468z2, I0=>start, I1=>key_i(23), I2=>cr_key(55), I3
      =>p_rtlc3n143);
   ix54465z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx54465z2, I0=>start, I1=>key_i(24), I2=>cr_key(56), I3
      =>p_rtlc3n143);
   ix55462z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx55462z2, I0=>start, I1=>key_i(25), I2=>cr_key(57), I3
      =>p_rtlc3n143);
   ix56459z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx56459z2, I0=>start, I1=>key_i(26), I2=>cr_key(58), I3
      =>p_rtlc3n143);
   ix57456z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx57456z2, I0=>start, I1=>key_i(27), I2=>cr_key(59), I3
      =>p_rtlc3n143);
   ix58453z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx58453z2, I0=>start, I1=>key_i(28), I2=>cr_key(60), I3
      =>p_rtlc3n143);
   ix59450z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx59450z2, I0=>start, I1=>key_i(29), I2=>cr_key(61), I3
      =>p_rtlc3n143);
   ix61446z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx61446z2, I0=>start, I1=>key_i(30), I2=>cr_key(62), I3
      =>p_rtlc3n143);
   ix62443z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx62443z2, I0=>start, I1=>key_i(31), I2=>cr_key(63), I3
      =>p_rtlc3n143);
   ix63440z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx63440z2, I0=>start, I1=>key_i(32), I2=>cr_key(64), I3
      =>p_rtlc3n143);
   ix64437z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx64437z2, I0=>start, I1=>key_i(33), I2=>cr_key(65), I3
      =>p_rtlc3n143);
   ix65434z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx65434z2, I0=>start, I1=>key_i(34), I2=>cr_key(66), I3
      =>p_rtlc3n143);
   ix895z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx895z2, I0=>start, I1=>key_i(35), I2=>cr_key(67), I3=>
      p_rtlc3n143);
   ix1892z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx1892z2, I0=>start, I1=>key_i(36), I2=>cr_key(68), I3
      =>p_rtlc3n143);
   ix2889z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx2889z2, I0=>start, I1=>key_i(37), I2=>cr_key(69), I3
      =>p_rtlc3n143);
   ix3886z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx3886z2, I0=>start, I1=>key_i(38), I2=>cr_key(70), I3
      =>p_rtlc3n143);
   ix4883z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx4883z2, I0=>start, I1=>key_i(39), I2=>cr_key(71), I3
      =>p_rtlc3n143);
   ix6879z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx6879z2, I0=>start, I1=>key_i(40), I2=>cr_key(72), I3
      =>p_rtlc3n143);
   ix7876z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx7876z2, I0=>start, I1=>key_i(41), I2=>cr_key(73), I3
      =>p_rtlc3n143);
   ix8873z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx8873z2, I0=>start, I1=>key_i(42), I2=>cr_key(74), I3
      =>p_rtlc3n143);
   ix9870z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx9870z2, I0=>start, I1=>key_i(43), I2=>cr_key(75), I3
      =>p_rtlc3n143);
   ix10867z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx10867z2, I0=>start, I1=>key_i(44), I2=>cr_key(76), I3
      =>p_rtlc3n143);
   ix11864z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx11864z2, I0=>start, I1=>key_i(45), I2=>cr_key(77), I3
      =>p_rtlc3n143);
   ix12861z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx12861z2, I0=>start, I1=>key_i(46), I2=>cr_key(78), I3
      =>p_rtlc3n143);
   ix13858z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx13858z2, I0=>start, I1=>key_i(47), I2=>cr_key(79), I3
      =>p_rtlc3n143);
   ix14855z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx14855z2, I0=>start, I1=>key_i(48), I2=>cr_key(80), I3
      =>p_rtlc3n143);
   ix15852z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx15852z2, I0=>start, I1=>key_i(49), I2=>cr_key(81), I3
      =>p_rtlc3n143);
   ix17848z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx17848z2, I0=>start, I1=>key_i(50), I2=>cr_key(82), I3
      =>p_rtlc3n143);
   ix18845z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx18845z2, I0=>start, I1=>key_i(51), I2=>cr_key(83), I3
      =>p_rtlc3n143);
   ix19842z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx19842z2, I0=>start, I1=>key_i(52), I2=>cr_key(84), I3
      =>p_rtlc3n143);
   ix20839z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx20839z2, I0=>start, I1=>key_i(53), I2=>cr_key(85), I3
      =>p_rtlc3n143);
   ix21836z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx21836z2, I0=>start, I1=>key_i(54), I2=>cr_key(86), I3
      =>p_rtlc3n143);
   ix22833z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx22833z2, I0=>start, I1=>key_i(55), I2=>cr_key(87), I3
      =>p_rtlc3n143);
   ix23830z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx23830z2, I0=>start, I1=>key_i(56), I2=>cr_key(88), I3
      =>p_rtlc3n143);
   ix24827z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx24827z2, I0=>start, I1=>key_i(57), I2=>cr_key(89), I3
      =>p_rtlc3n143);
   ix25824z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx25824z2, I0=>start, I1=>key_i(58), I2=>cr_key(90), I3
      =>p_rtlc3n143);
   ix26821z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx26821z2, I0=>start, I1=>key_i(59), I2=>cr_key(91), I3
      =>p_rtlc3n143);
   ix28817z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx28817z2, I0=>start, I1=>key_i(60), I2=>cr_key(92), I3
      =>p_rtlc3n143);
   ix29814z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx29814z2, I0=>start, I1=>key_i(61), I2=>cr_key(93), I3
      =>p_rtlc3n143);
   ix30811z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx30811z2, I0=>start, I1=>key_i(62), I2=>cr_key(94), I3
      =>p_rtlc3n143);
   ix31808z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx31808z2, I0=>start, I1=>key_i(63), I2=>cr_key(95), I3
      =>p_rtlc3n143);
   ix32805z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx32805z2, I0=>start, I1=>key_i(64), I2=>cr_key(96), I3
      =>p_rtlc3n143);
   ix33802z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx33802z2, I0=>start, I1=>key_i(65), I2=>cr_key(97), I3
      =>p_rtlc3n143);
   ix34799z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx34799z2, I0=>start, I1=>key_i(66), I2=>cr_key(98), I3
      =>p_rtlc3n143);
   ix35796z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx35796z2, I0=>start, I1=>key_i(67), I2=>cr_key(99), I3
      =>p_rtlc3n143);
   ix36793z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx36793z2, I0=>start, I1=>key_i(68), I2=>cr_key(100), 
      I3=>p_rtlc3n143);
   ix37790z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx37790z2, I0=>start, I1=>key_i(69), I2=>cr_key(101), 
      I3=>p_rtlc3n143);
   ix39786z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx39786z2, I0=>start, I1=>key_i(70), I2=>cr_key(102), 
      I3=>p_rtlc3n143);
   ix40783z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx40783z2, I0=>start, I1=>key_i(71), I2=>cr_key(103), 
      I3=>p_rtlc3n143);
   ix41780z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx41780z2, I0=>start, I1=>key_i(72), I2=>cr_key(104), 
      I3=>p_rtlc3n143);
   ix42777z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx42777z2, I0=>start, I1=>key_i(73), I2=>cr_key(105), 
      I3=>p_rtlc3n143);
   ix43774z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx43774z2, I0=>start, I1=>key_i(74), I2=>cr_key(106), 
      I3=>p_rtlc3n143);
   ix44771z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx44771z2, I0=>start, I1=>key_i(75), I2=>cr_key(107), 
      I3=>p_rtlc3n143);
   ix45768z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx45768z2, I0=>start, I1=>key_i(76), I2=>cr_key(108), 
      I3=>p_rtlc3n143);
   ix46765z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx46765z2, I0=>start, I1=>key_i(77), I2=>cr_key(109), 
      I3=>p_rtlc3n143);
   ix47762z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx47762z2, I0=>start, I1=>key_i(78), I2=>cr_key(110), 
      I3=>p_rtlc3n143);
   ix48759z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx48759z2, I0=>start, I1=>key_i(79), I2=>cr_key(111), 
      I3=>p_rtlc3n143);
   ix50755z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx50755z2, I0=>start, I1=>key_i(80), I2=>cr_key(112), 
      I3=>p_rtlc3n143);
   ix51752z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx51752z2, I0=>start, I1=>key_i(81), I2=>cr_key(113), 
      I3=>p_rtlc3n143);
   ix52749z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx52749z2, I0=>start, I1=>key_i(82), I2=>cr_key(114), 
      I3=>p_rtlc3n143);
   ix53746z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx53746z2, I0=>start, I1=>key_i(83), I2=>cr_key(115), 
      I3=>p_rtlc3n143);
   ix54743z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx54743z2, I0=>start, I1=>key_i(84), I2=>cr_key(116), 
      I3=>p_rtlc3n143);
   ix55740z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx55740z2, I0=>start, I1=>key_i(85), I2=>cr_key(117), 
      I3=>p_rtlc3n143);
   ix56737z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx56737z2, I0=>start, I1=>key_i(86), I2=>cr_key(118), 
      I3=>p_rtlc3n143);
   ix57734z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx57734z2, I0=>start, I1=>key_i(87), I2=>cr_key(119), 
      I3=>p_rtlc3n143);
   ix58731z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx58731z2, I0=>start, I1=>key_i(88), I2=>cr_key(120), 
      I3=>p_rtlc3n143);
   ix59728z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx59728z2, I0=>start, I1=>key_i(89), I2=>cr_key(121), 
      I3=>p_rtlc3n143);
   ix61724z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx61724z2, I0=>start, I1=>key_i(90), I2=>cr_key(122), 
      I3=>p_rtlc3n143);
   ix62721z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx62721z2, I0=>start, I1=>key_i(91), I2=>cr_key(123), 
      I3=>p_rtlc3n143);
   ix63718z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx63718z2, I0=>start, I1=>key_i(92), I2=>cr_key(124), 
      I3=>p_rtlc3n143);
   ix64715z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx64715z2, I0=>start, I1=>key_i(93), I2=>cr_key(125), 
      I3=>p_rtlc3n143);
   ix176z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx176z2, I0=>start, I1=>key_i(94), I2=>cr_key(126), I3
      =>p_rtlc3n143);
   ix1173z56747 : LUT4
      generic map (INIT => X"D888") 
       port map ( O=>nx1173z2, I0=>start, I1=>key_i(95), I2=>cr_key(127), I3
      =>p_rtlc3n143);
   ix2170z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx2170z2, I0=>nx2170z3, I1=>start, I2=>key_i(96), I3=>
      p_rtlc3n143);
   ix3167z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx3167z2, I0=>nx3167z3, I1=>start, I2=>key_i(97), I3=>
      p_rtlc3n143);
   ix4164z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx4164z2, I0=>nx4164z3, I1=>start, I2=>key_i(98), I3=>
      p_rtlc3n143);
   ix5161z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx5161z2, I0=>nx5161z3, I1=>start, I2=>key_i(99), I3=>
      p_rtlc3n143);
   ix9360z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx9360z2, I0=>nx9360z3, I1=>start, I2=>key_i(100), I3=>
      p_rtlc3n143);
   ix10357z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx10357z2, I0=>nx10357z3, I1=>start, I2=>key_i(101), I3
      =>p_rtlc3n143);
   ix11354z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx11354z2, I0=>nx11354z3, I1=>start, I2=>key_i(102), I3
      =>p_rtlc3n143);
   ix12351z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx12351z2, I0=>nx12351z3, I1=>start, I2=>key_i(103), I3
      =>p_rtlc3n143);
   ix13348z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx13348z2, I0=>nx13348z3, I1=>start, I2=>key_i(104), I3
      =>p_rtlc3n143);
   ix14345z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx14345z2, I0=>nx14345z3, I1=>start, I2=>key_i(105), I3
      =>p_rtlc3n143);
   ix15342z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx15342z2, I0=>nx15342z3, I1=>start, I2=>key_i(106), I3
      =>p_rtlc3n143);
   ix16339z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx16339z2, I0=>nx16339z3, I1=>start, I2=>key_i(107), I3
      =>p_rtlc3n143);
   ix17336z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx17336z2, I0=>nx17336z3, I1=>start, I2=>key_i(108), I3
      =>p_rtlc3n143);
   ix18333z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx18333z2, I0=>nx18333z3, I1=>start, I2=>key_i(109), I3
      =>p_rtlc3n143);
   ix20329z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx20329z2, I0=>nx20329z3, I1=>start, I2=>key_i(110), I3
      =>p_rtlc3n143);
   ix21326z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx21326z2, I0=>nx21326z3, I1=>start, I2=>key_i(111), I3
      =>p_rtlc3n143);
   ix22323z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx22323z2, I0=>nx22323z3, I1=>start, I2=>key_i(112), I3
      =>p_rtlc3n143);
   ix23320z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx23320z2, I0=>nx23320z3, I1=>start, I2=>key_i(113), I3
      =>p_rtlc3n143);
   ix24317z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx24317z2, I0=>nx24317z3, I1=>start, I2=>key_i(114), I3
      =>p_rtlc3n143);
   ix25314z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx25314z2, I0=>nx25314z3, I1=>start, I2=>key_i(115), I3
      =>p_rtlc3n143);
   ix26311z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx26311z2, I0=>nx26311z3, I1=>start, I2=>key_i(116), I3
      =>p_rtlc3n143);
   ix27308z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx27308z2, I0=>nx27308z3, I1=>start, I2=>key_i(117), I3
      =>p_rtlc3n143);
   ix28305z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx28305z2, I0=>nx28305z3, I1=>start, I2=>key_i(118), I3
      =>p_rtlc3n143);
   ix29302z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx29302z2, I0=>nx29302z3, I1=>start, I2=>key_i(119), I3
      =>p_rtlc3n143);
   ix31298z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx31298z2, I0=>nx31298z3, I1=>start, I2=>key_i(120), I3
      =>p_rtlc3n143);
   ix32295z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx32295z2, I0=>nx32295z3, I1=>start, I2=>key_i(121), I3
      =>p_rtlc3n143);
   ix33292z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx33292z2, I0=>nx33292z3, I1=>start, I2=>key_i(122), I3
      =>p_rtlc3n143);
   ix34289z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx34289z2, I0=>nx34289z3, I1=>start, I2=>key_i(123), I3
      =>p_rtlc3n143);
   ix35286z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx35286z2, I0=>nx35286z3, I1=>start, I2=>key_i(124), I3
      =>p_rtlc3n143);
   ix36283z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx36283z2, I0=>nx36283z3, I1=>start, I2=>key_i(125), I3
      =>p_rtlc3n143);
   ix37280z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx37280z2, I0=>nx37280z3, I1=>start, I2=>key_i(126), I3
      =>p_rtlc3n143);
   ix38277z59363 : LUT4
      generic map (INIT => X"E2C0") 
       port map ( O=>nx38277z2, I0=>nx38277z3, I1=>start, I2=>key_i(127), I3
      =>p_rtlc3n143);
   ix7392z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx7392z3, I0=>nrst, I1=>data_in(0));
   ix7392z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx7392z1, I0=>nrst, I1=>data_in(0));
   ix6395z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx6395z3, I0=>nrst, I1=>data_in(1));
   ix6395z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx6395z1, I0=>nrst, I1=>data_in(1));
   ix5398z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx5398z3, I0=>nrst, I1=>data_in(2));
   ix5398z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx5398z1, I0=>nrst, I1=>data_in(2));
   ix4401z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx4401z3, I0=>nrst, I1=>data_in(3));
   ix4401z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx4401z1, I0=>nrst, I1=>data_in(3));
   ix3404z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx3404z3, I0=>nrst, I1=>data_in(4));
   ix3404z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx3404z1, I0=>nrst, I1=>data_in(4));
   ix2407z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx2407z3, I0=>nrst, I1=>data_in(5));
   ix2407z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx2407z1, I0=>nrst, I1=>data_in(5));
   ix1410z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx1410z3, I0=>nrst, I1=>data_in(6));
   ix1410z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx1410z1, I0=>nrst, I1=>data_in(6));
   ix413z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx413z3, I0=>nrst, I1=>data_in(7));
   ix413z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx413z1, I0=>nrst, I1=>data_in(7));
   ix64952z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx64952z3, I0=>nrst, I1=>data_in(8));
   ix64952z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx64952z1, I0=>nrst, I1=>data_in(8));
   ix63955z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx63955z3, I0=>nrst, I1=>data_in(9));
   ix63955z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx63955z1, I0=>nrst, I1=>data_in(9));
   ix53733z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx53733z3, I0=>nrst, I1=>data_in(10));
   ix53733z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx53733z1, I0=>nrst, I1=>data_in(10));
   ix54730z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx54730z3, I0=>nrst, I1=>data_in(11));
   ix54730z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx54730z1, I0=>nrst, I1=>data_in(11));
   ix55727z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx55727z3, I0=>nrst, I1=>data_in(12));
   ix55727z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx55727z1, I0=>nrst, I1=>data_in(12));
   ix56724z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx56724z3, I0=>nrst, I1=>data_in(13));
   ix56724z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx56724z1, I0=>nrst, I1=>data_in(13));
   ix57721z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx57721z3, I0=>nrst, I1=>data_in(14));
   ix57721z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx57721z1, I0=>nrst, I1=>data_in(14));
   ix58718z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx58718z3, I0=>nrst, I1=>data_in(15));
   ix58718z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx58718z1, I0=>nrst, I1=>data_in(15));
   ix59715z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx59715z3, I0=>nrst, I1=>data_in(16));
   ix59715z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx59715z1, I0=>nrst, I1=>data_in(16));
   ix60712z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx60712z3, I0=>nrst, I1=>data_in(17));
   ix60712z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx60712z1, I0=>nrst, I1=>data_in(17));
   ix61709z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx61709z3, I0=>nrst, I1=>data_in(18));
   ix61709z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx61709z1, I0=>nrst, I1=>data_in(18));
   ix62706z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx62706z3, I0=>nrst, I1=>data_in(19));
   ix62706z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx62706z1, I0=>nrst, I1=>data_in(19));
   ix64702z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx64702z3, I0=>nrst, I1=>data_in(20));
   ix64702z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx64702z1, I0=>nrst, I1=>data_in(20));
   ix163z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx163z3, I0=>nrst, I1=>data_in(21));
   ix163z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx163z1, I0=>nrst, I1=>data_in(21));
   ix1160z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx1160z3, I0=>nrst, I1=>data_in(22));
   ix1160z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx1160z1, I0=>nrst, I1=>data_in(22));
   ix2157z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx2157z3, I0=>nrst, I1=>data_in(23));
   ix2157z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx2157z1, I0=>nrst, I1=>data_in(23));
   ix3154z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx3154z3, I0=>nrst, I1=>data_in(24));
   ix3154z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx3154z1, I0=>nrst, I1=>data_in(24));
   ix4151z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx4151z3, I0=>nrst, I1=>data_in(25));
   ix4151z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx4151z1, I0=>nrst, I1=>data_in(25));
   ix5148z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx5148z3, I0=>nrst, I1=>data_in(26));
   ix5148z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx5148z1, I0=>nrst, I1=>data_in(26));
   ix6145z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx6145z3, I0=>nrst, I1=>data_in(27));
   ix6145z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx6145z1, I0=>nrst, I1=>data_in(27));
   ix7142z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx7142z3, I0=>nrst, I1=>data_in(28));
   ix7142z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx7142z1, I0=>nrst, I1=>data_in(28));
   ix8139z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx8139z3, I0=>nrst, I1=>data_in(29));
   ix8139z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx8139z1, I0=>nrst, I1=>data_in(29));
   ix10135z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx10135z3, I0=>nrst, I1=>data_in(30));
   ix10135z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx10135z1, I0=>nrst, I1=>data_in(30));
   ix11132z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx11132z3, I0=>nrst, I1=>data_in(31));
   ix11132z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx11132z1, I0=>nrst, I1=>data_in(31));
   ix12129z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx12129z5, I0=>nrst, I1=>data_in(32));
   ix12129z35892 : LUT4
      generic map (INIT => X"870F") 
       port map ( O=>nx12129z4, I0=>data_out_EXMPLR277(63), I1=>
      data_out_EXMPLR277(56), I2=>data_out_EXMPLR277(0), I3=>p_rtlc3n143);
   ix12129z1424 : LUT3
      generic map (INIT => X"6C") 
       port map ( O=>nx12129z3, I0=>data_out_EXMPLR277(62), I1=>cr_key(0), 
      I2=>p_rtlc3n143);
   ix12129z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx12129z2, I0=>nx12129z3, I1=>nx12129z4, I2=>start, I3
      =>data_in(32));
   ix12129z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx12129z1, I0=>nrst, I1=>data_in(32));
   ix13126z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx13126z5, I0=>nrst, I1=>data_in(33));
   ix13126z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx13126z4, I0=>data_out_EXMPLR277(63), I1=>
      data_out_EXMPLR277(1), I2=>cr_key(1), I3=>p_rtlc3n143);
   ix13126z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx13126z3, I0=>data_out_EXMPLR277(57), I1=>
      data_out_EXMPLR277(32), I2=>p_rtlc3n143);
   ix13126z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx13126z1, I0=>nrst, I1=>data_in(33));
   ix14123z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx14123z5, I0=>nrst, I1=>data_in(34));
   ix14123z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx14123z4, I0=>data_out_EXMPLR277(32), I1=>
      data_out_EXMPLR277(2), I2=>cr_key(2), I3=>p_rtlc3n143);
   ix14123z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx14123z3, I0=>data_out_EXMPLR277(58), I1=>
      data_out_EXMPLR277(33), I2=>p_rtlc3n143);
   ix14123z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx14123z2, I0=>nx14123z3, I1=>nx14123z4, I2=>start, I3
      =>data_in(34));
   ix14123z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx14123z1, I0=>nrst, I1=>data_in(34));
   ix15120z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx15120z5, I0=>nrst, I1=>data_in(35));
   ix15120z35892 : LUT4
      generic map (INIT => X"870F") 
       port map ( O=>nx15120z4, I0=>data_out_EXMPLR277(59), I1=>
      data_out_EXMPLR277(34), I2=>data_out_EXMPLR277(3), I3=>p_rtlc3n143);
   ix15120z1463 : LUT3
      generic map (INIT => X"93") 
       port map ( O=>nx15120z3, I0=>data_out_EXMPLR277(33), I1=>cr_key(3), 
      I2=>p_rtlc3n143);
   ix15120z64297 : LUT4
      generic map (INIT => X"F606") 
       port map ( O=>nx15120z2, I0=>nx15120z3, I1=>nx15120z4, I2=>start, I3
      =>data_in(35));
   ix15120z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx15120z1, I0=>nrst, I1=>data_in(35));
   ix16117z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx16117z5, I0=>nrst, I1=>data_in(36));
   ix16117z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx16117z4, I0=>data_out_EXMPLR277(34), I1=>
      data_out_EXMPLR277(4), I2=>cr_key(4), I3=>p_rtlc3n143);
   ix16117z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx16117z3, I0=>data_out_EXMPLR277(60), I1=>
      data_out_EXMPLR277(35), I2=>p_rtlc3n143);
   ix16117z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx16117z2, I0=>nx16117z3, I1=>nx16117z4, I2=>start, I3
      =>data_in(36));
   ix16117z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx16117z1, I0=>nrst, I1=>data_in(36));
   ix17114z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx17114z5, I0=>nrst, I1=>data_in(37));
   ix17114z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx17114z4, I0=>data_out_EXMPLR277(35), I1=>
      data_out_EXMPLR277(5), I2=>cr_key(5), I3=>p_rtlc3n143);
   ix17114z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx17114z3, I0=>data_out_EXMPLR277(61), I1=>
      data_out_EXMPLR277(36), I2=>p_rtlc3n143);
   ix17114z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx17114z2, I0=>nx17114z3, I1=>nx17114z4, I2=>start, I3
      =>data_in(37));
   ix17114z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx17114z1, I0=>nrst, I1=>data_in(37));
   ix18111z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx18111z5, I0=>nrst, I1=>data_in(38));
   ix18111z35892 : LUT4
      generic map (INIT => X"870F") 
       port map ( O=>nx18111z4, I0=>data_out_EXMPLR277(62), I1=>
      data_out_EXMPLR277(37), I2=>data_out_EXMPLR277(6), I3=>p_rtlc3n143);
   ix18111z1463 : LUT3
      generic map (INIT => X"93") 
       port map ( O=>nx18111z3, I0=>data_out_EXMPLR277(36), I1=>cr_key(6), 
      I2=>p_rtlc3n143);
   ix18111z64297 : LUT4
      generic map (INIT => X"F606") 
       port map ( O=>nx18111z2, I0=>nx18111z3, I1=>nx18111z4, I2=>start, I3
      =>data_in(38));
   ix18111z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx18111z1, I0=>nrst, I1=>data_in(38));
   ix19108z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx19108z5, I0=>nrst, I1=>data_in(39));
   ix19108z35892 : LUT4
      generic map (INIT => X"870F") 
       port map ( O=>nx19108z4, I0=>data_out_EXMPLR277(63), I1=>
      data_out_EXMPLR277(38), I2=>data_out_EXMPLR277(7), I3=>p_rtlc3n143);
   ix19108z1424 : LUT3
      generic map (INIT => X"6C") 
       port map ( O=>nx19108z3, I0=>data_out_EXMPLR277(37), I1=>cr_key(7), 
      I2=>p_rtlc3n143);
   ix19108z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx19108z1, I0=>nrst, I1=>data_in(39));
   ix21104z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx21104z5, I0=>nrst, I1=>data_in(40));
   ix21104z35892 : LUT4
      generic map (INIT => X"870F") 
       port map ( O=>nx21104z4, I0=>data_out_EXMPLR277(39), I1=>
      data_out_EXMPLR277(32), I2=>data_out_EXMPLR277(8), I3=>p_rtlc3n143);
   ix21104z1463 : LUT3
      generic map (INIT => X"93") 
       port map ( O=>nx21104z3, I0=>data_out_EXMPLR277(38), I1=>cr_key(8), 
      I2=>p_rtlc3n143);
   ix21104z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx21104z1, I0=>nrst, I1=>data_in(40));
   ix22101z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx22101z5, I0=>nrst, I1=>data_in(41));
   ix22101z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx22101z4, I0=>data_out_EXMPLR277(39), I1=>
      data_out_EXMPLR277(9), I2=>cr_key(9), I3=>p_rtlc3n143);
   ix22101z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx22101z3, I0=>data_out_EXMPLR277(40), I1=>
      data_out_EXMPLR277(33), I2=>p_rtlc3n143);
   ix22101z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx22101z2, I0=>nx22101z3, I1=>nx22101z4, I2=>start, I3
      =>data_in(41));
   ix22101z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx22101z1, I0=>nrst, I1=>data_in(41));
   ix23098z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx23098z5, I0=>nrst, I1=>data_in(42));
   ix23098z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx23098z4, I0=>data_out_EXMPLR277(40), I1=>
      data_out_EXMPLR277(10), I2=>cr_key(10), I3=>p_rtlc3n143);
   ix23098z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx23098z3, I0=>data_out_EXMPLR277(41), I1=>
      data_out_EXMPLR277(34), I2=>p_rtlc3n143);
   ix23098z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx23098z2, I0=>nx23098z3, I1=>nx23098z4, I2=>start, I3
      =>data_in(42));
   ix23098z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx23098z1, I0=>nrst, I1=>data_in(42));
   ix24095z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx24095z5, I0=>nrst, I1=>data_in(43));
   ix24095z35892 : LUT4
      generic map (INIT => X"870F") 
       port map ( O=>nx24095z4, I0=>data_out_EXMPLR277(42), I1=>
      data_out_EXMPLR277(35), I2=>data_out_EXMPLR277(11), I3=>p_rtlc3n143);
   ix24095z1424 : LUT3
      generic map (INIT => X"6C") 
       port map ( O=>nx24095z3, I0=>data_out_EXMPLR277(41), I1=>cr_key(11), 
      I2=>p_rtlc3n143);
   ix24095z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx24095z2, I0=>nx24095z3, I1=>nx24095z4, I2=>start, I3
      =>data_in(43));
   ix24095z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx24095z1, I0=>nrst, I1=>data_in(43));
   ix25092z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx25092z5, I0=>nrst, I1=>data_in(44));
   ix25092z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx25092z4, I0=>data_out_EXMPLR277(42), I1=>
      data_out_EXMPLR277(12), I2=>cr_key(12), I3=>p_rtlc3n143);
   ix25092z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx25092z3, I0=>data_out_EXMPLR277(43), I1=>
      data_out_EXMPLR277(36), I2=>p_rtlc3n143);
   ix25092z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx25092z2, I0=>nx25092z3, I1=>nx25092z4, I2=>start, I3
      =>data_in(44));
   ix25092z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx25092z1, I0=>nrst, I1=>data_in(44));
   ix26089z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx26089z5, I0=>nrst, I1=>data_in(45));
   ix26089z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx26089z4, I0=>data_out_EXMPLR277(43), I1=>
      data_out_EXMPLR277(13), I2=>cr_key(13), I3=>p_rtlc3n143);
   ix26089z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx26089z3, I0=>data_out_EXMPLR277(44), I1=>
      data_out_EXMPLR277(37), I2=>p_rtlc3n143);
   ix26089z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx26089z2, I0=>nx26089z3, I1=>nx26089z4, I2=>start, I3
      =>data_in(45));
   ix26089z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx26089z1, I0=>nrst, I1=>data_in(45));
   ix27086z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx27086z5, I0=>nrst, I1=>data_in(46));
   ix27086z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx27086z4, I0=>data_out_EXMPLR277(44), I1=>
      data_out_EXMPLR277(14), I2=>cr_key(14), I3=>p_rtlc3n143);
   ix27086z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx27086z3, I0=>data_out_EXMPLR277(45), I1=>
      data_out_EXMPLR277(38), I2=>p_rtlc3n143);
   ix27086z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx27086z2, I0=>nx27086z3, I1=>nx27086z4, I2=>start, I3
      =>data_in(46));
   ix27086z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx27086z1, I0=>nrst, I1=>data_in(46));
   ix28083z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx28083z5, I0=>nrst, I1=>data_in(47));
   ix28083z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx28083z4, I0=>data_out_EXMPLR277(45), I1=>
      data_out_EXMPLR277(15), I2=>cr_key(15), I3=>p_rtlc3n143);
   ix28083z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx28083z3, I0=>data_out_EXMPLR277(46), I1=>
      data_out_EXMPLR277(39), I2=>p_rtlc3n143);
   ix28083z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx28083z2, I0=>nx28083z3, I1=>nx28083z4, I2=>start, I3
      =>data_in(47));
   ix28083z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx28083z1, I0=>nrst, I1=>data_in(47));
   ix29080z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx29080z5, I0=>nrst, I1=>data_in(48));
   ix29080z1325 : LUT2
      generic map (INIT => X"8") 
       port map ( O=>nx29080z4, I0=>data_out_EXMPLR277(47), I1=>
      data_out_EXMPLR277(40));
   ix29080z28211 : LUT4
      generic map (INIT => X"690F") 
       port map ( O=>nx29080z3, I0=>nx29080z4, I1=>data_out_EXMPLR277(46), 
      I2=>cr_key(16), I3=>p_rtlc3n143);
   ix29080z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx29080z1, I0=>nrst, I1=>data_in(48));
   ix30077z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx30077z5, I0=>nrst, I1=>data_in(49));
   ix30077z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx30077z4, I0=>data_out_EXMPLR277(47), I1=>
      data_out_EXMPLR277(17), I2=>cr_key(17), I3=>p_rtlc3n143);
   ix30077z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx30077z3, I0=>data_out_EXMPLR277(48), I1=>
      data_out_EXMPLR277(41), I2=>p_rtlc3n143);
   ix30077z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx30077z2, I0=>nx30077z3, I1=>nx30077z4, I2=>start, I3
      =>data_in(49));
   ix30077z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx30077z1, I0=>nrst, I1=>data_in(49));
   ix32073z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx32073z5, I0=>nrst, I1=>data_in(50));
   ix32073z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx32073z4, I0=>data_out_EXMPLR277(48), I1=>
      data_out_EXMPLR277(18), I2=>cr_key(18), I3=>p_rtlc3n143);
   ix32073z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx32073z3, I0=>data_out_EXMPLR277(49), I1=>
      data_out_EXMPLR277(42), I2=>p_rtlc3n143);
   ix32073z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx32073z2, I0=>nx32073z3, I1=>nx32073z4, I2=>start, I3
      =>data_in(50));
   ix32073z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx32073z1, I0=>nrst, I1=>data_in(50));
   ix33070z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx33070z5, I0=>nrst, I1=>data_in(51));
   ix33070z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx33070z4, I0=>data_out_EXMPLR277(49), I1=>
      data_out_EXMPLR277(19), I2=>cr_key(19), I3=>p_rtlc3n143);
   ix33070z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx33070z3, I0=>data_out_EXMPLR277(50), I1=>
      data_out_EXMPLR277(43), I2=>p_rtlc3n143);
   ix33070z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx33070z2, I0=>nx33070z3, I1=>nx33070z4, I2=>start, I3
      =>data_in(51));
   ix33070z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx33070z1, I0=>nrst, I1=>data_in(51));
   ix34067z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx34067z5, I0=>nrst, I1=>data_in(52));
   ix34067z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx34067z4, I0=>data_out_EXMPLR277(50), I1=>
      data_out_EXMPLR277(20), I2=>cr_key(20), I3=>p_rtlc3n143);
   ix34067z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx34067z3, I0=>data_out_EXMPLR277(51), I1=>
      data_out_EXMPLR277(44), I2=>p_rtlc3n143);
   ix34067z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx34067z2, I0=>nx34067z3, I1=>nx34067z4, I2=>start, I3
      =>data_in(52));
   ix34067z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx34067z1, I0=>nrst, I1=>data_in(52));
   ix35064z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx35064z5, I0=>nrst, I1=>data_in(53));
   ix35064z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx35064z4, I0=>data_out_EXMPLR277(51), I1=>
      data_out_EXMPLR277(21), I2=>cr_key(21), I3=>p_rtlc3n143);
   ix35064z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx35064z3, I0=>data_out_EXMPLR277(52), I1=>
      data_out_EXMPLR277(45), I2=>p_rtlc3n143);
   ix35064z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx35064z2, I0=>nx35064z3, I1=>nx35064z4, I2=>start, I3
      =>data_in(53));
   ix35064z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx35064z1, I0=>nrst, I1=>data_in(53));
   ix36061z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx36061z5, I0=>nrst, I1=>data_in(54));
   ix36061z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx36061z4, I0=>data_out_EXMPLR277(52), I1=>
      data_out_EXMPLR277(22), I2=>cr_key(22), I3=>p_rtlc3n143);
   ix36061z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx36061z3, I0=>data_out_EXMPLR277(53), I1=>
      data_out_EXMPLR277(46), I2=>p_rtlc3n143);
   ix36061z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx36061z2, I0=>nx36061z3, I1=>nx36061z4, I2=>start, I3
      =>data_in(54));
   ix36061z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx36061z1, I0=>nrst, I1=>data_in(54));
   ix37058z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx37058z5, I0=>nrst, I1=>data_in(55));
   ix37058z35892 : LUT4
      generic map (INIT => X"870F") 
       port map ( O=>nx37058z4, I0=>data_out_EXMPLR277(54), I1=>
      data_out_EXMPLR277(47), I2=>data_out_EXMPLR277(23), I3=>p_rtlc3n143);
   ix37058z1424 : LUT3
      generic map (INIT => X"6C") 
       port map ( O=>nx37058z3, I0=>data_out_EXMPLR277(53), I1=>cr_key(23), 
      I2=>p_rtlc3n143);
   ix37058z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx37058z2, I0=>nx37058z3, I1=>nx37058z4, I2=>start, I3
      =>data_in(55));
   ix37058z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx37058z1, I0=>nrst, I1=>data_in(55));
   ix38055z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx38055z5, I0=>nrst, I1=>data_in(56));
   ix38055z1445 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx38055z4, I0=>data_out_EXMPLR277(55), I1=>
      data_out_EXMPLR277(48), I2=>p_rtlc3n143);
   ix38055z39776 : LUT4
      generic map (INIT => X"963C") 
       port map ( O=>nx38055z3, I0=>data_out_EXMPLR277(54), I1=>
      data_out_EXMPLR277(24), I2=>cr_key(24), I3=>p_rtlc3n143);
   ix38055z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx38055z1, I0=>nrst, I1=>data_in(56));
   ix39052z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx39052z5, I0=>nrst, I1=>data_in(57));
   ix39052z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx39052z4, I0=>data_out_EXMPLR277(55), I1=>
      data_out_EXMPLR277(25), I2=>cr_key(25), I3=>p_rtlc3n143);
   ix39052z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx39052z3, I0=>data_out_EXMPLR277(56), I1=>
      data_out_EXMPLR277(49), I2=>p_rtlc3n143);
   ix39052z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx39052z2, I0=>nx39052z3, I1=>nx39052z4, I2=>start, I3
      =>data_in(57));
   ix39052z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx39052z1, I0=>nrst, I1=>data_in(57));
   ix40049z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx40049z5, I0=>nrst, I1=>data_in(58));
   ix40049z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx40049z4, I0=>data_out_EXMPLR277(56), I1=>
      data_out_EXMPLR277(26), I2=>cr_key(26), I3=>p_rtlc3n143);
   ix40049z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx40049z3, I0=>data_out_EXMPLR277(57), I1=>
      data_out_EXMPLR277(50), I2=>p_rtlc3n143);
   ix40049z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx40049z2, I0=>nx40049z3, I1=>nx40049z4, I2=>start, I3
      =>data_in(58));
   ix40049z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx40049z1, I0=>nrst, I1=>data_in(58));
   ix41046z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx41046z5, I0=>nrst, I1=>data_in(59));
   ix41046z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx41046z4, I0=>data_out_EXMPLR277(57), I1=>
      data_out_EXMPLR277(27), I2=>cr_key(27), I3=>p_rtlc3n143);
   ix41046z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx41046z3, I0=>data_out_EXMPLR277(58), I1=>
      data_out_EXMPLR277(51), I2=>p_rtlc3n143);
   ix41046z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx41046z2, I0=>nx41046z3, I1=>nx41046z4, I2=>start, I3
      =>data_in(59));
   ix41046z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx41046z1, I0=>nrst, I1=>data_in(59));
   ix43042z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx43042z6, I0=>nrst, I1=>data_in(60));
   ix43042z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx43042z5, I0=>data_out_EXMPLR277(58), I1=>
      data_out_EXMPLR277(28), I2=>cr_key(28), I3=>p_rtlc3n143);
   ix43042z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx43042z3, I0=>data_out_EXMPLR277(59), I1=>
      data_out_EXMPLR277(52), I2=>p_rtlc3n143);
   ix43042z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx43042z2, I0=>nx43042z3, I1=>nx43042z5, I2=>start, I3
      =>data_in(60));
   ix43042z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx43042z1, I0=>nrst, I1=>data_in(60));
   ix44039z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx44039z5, I0=>nrst, I1=>data_in(61));
   ix44039z1445 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx44039z4, I0=>data_out_EXMPLR277(60), I1=>
      data_out_EXMPLR277(53), I2=>p_rtlc3n143);
   ix44039z39776 : LUT4
      generic map (INIT => X"963C") 
       port map ( O=>nx44039z3, I0=>data_out_EXMPLR277(59), I1=>
      data_out_EXMPLR277(29), I2=>cr_key(29), I3=>p_rtlc3n143);
   ix44039z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx44039z1, I0=>nrst, I1=>data_in(61));
   ix45036z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx45036z5, I0=>nrst, I1=>data_in(62));
   ix45036z28392 : LUT4
      generic map (INIT => X"69C3") 
       port map ( O=>nx45036z4, I0=>data_out_EXMPLR277(60), I1=>
      data_out_EXMPLR277(30), I2=>cr_key(30), I3=>p_rtlc3n143);
   ix45036z1444 : LUT3
      generic map (INIT => X"80") 
       port map ( O=>nx45036z3, I0=>data_out_EXMPLR277(61), I1=>
      data_out_EXMPLR277(54), I2=>p_rtlc3n143);
   ix45036z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx45036z2, I0=>nx45036z3, I1=>nx45036z4, I2=>start, I3
      =>data_in(62));
   ix45036z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx45036z1, I0=>nrst, I1=>data_in(62));
   ix46033z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx46033z6, I0=>nrst, I1=>data_in(63));
   ix46033z35892 : LUT4
      generic map (INIT => X"870F") 
       port map ( O=>nx46033z5, I0=>data_out_EXMPLR277(62), I1=>
      data_out_EXMPLR277(55), I2=>data_out_EXMPLR277(31), I3=>p_rtlc3n143);
   ix46033z1424 : LUT3
      generic map (INIT => X"6C") 
       port map ( O=>nx46033z4, I0=>data_out_EXMPLR277(61), I1=>cr_key(31), 
      I2=>p_rtlc3n143);
   ix46033z65068 : LUT4
      generic map (INIT => X"F909") 
       port map ( O=>nx46033z3, I0=>nx46033z4, I1=>nx46033z5, I2=>start, I3
      =>data_in(63));
   ix46033z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx46033z2, I0=>nrst, I1=>data_in(63));
   ix40733z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx40733z3, I0=>nrst, I1=>key_i(0));
   ix40733z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx40733z1, I0=>nrst, I1=>key_i(0));
   ix39736z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx39736z3, I0=>nrst, I1=>key_i(1));
   ix39736z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx39736z1, I0=>nrst, I1=>key_i(1));
   ix38739z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx38739z3, I0=>nrst, I1=>key_i(2));
   ix38739z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx38739z1, I0=>nrst, I1=>key_i(2));
   ix37742z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx37742z3, I0=>nrst, I1=>key_i(3));
   ix37742z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx37742z1, I0=>nrst, I1=>key_i(3));
   ix36745z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx36745z3, I0=>nrst, I1=>key_i(4));
   ix36745z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx36745z1, I0=>nrst, I1=>key_i(4));
   ix35748z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx35748z3, I0=>nrst, I1=>key_i(5));
   ix35748z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx35748z1, I0=>nrst, I1=>key_i(5));
   ix34751z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx34751z3, I0=>nrst, I1=>key_i(6));
   ix34751z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx34751z1, I0=>nrst, I1=>key_i(6));
   ix33754z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx33754z3, I0=>nrst, I1=>key_i(7));
   ix33754z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx33754z1, I0=>nrst, I1=>key_i(7));
   ix32757z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx32757z3, I0=>nrst, I1=>key_i(8));
   ix32757z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx32757z1, I0=>nrst, I1=>key_i(8));
   ix31760z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx31760z3, I0=>nrst, I1=>key_i(9));
   ix31760z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx31760z1, I0=>nrst, I1=>key_i(9));
   ix39508z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx39508z3, I0=>nrst, I1=>key_i(10));
   ix39508z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx39508z1, I0=>nrst, I1=>key_i(10));
   ix40505z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx40505z3, I0=>nrst, I1=>key_i(11));
   ix40505z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx40505z1, I0=>nrst, I1=>key_i(11));
   ix41502z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx41502z3, I0=>nrst, I1=>key_i(12));
   ix41502z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx41502z1, I0=>nrst, I1=>key_i(12));
   ix42499z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx42499z3, I0=>nrst, I1=>key_i(13));
   ix42499z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx42499z1, I0=>nrst, I1=>key_i(13));
   ix43496z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx43496z3, I0=>nrst, I1=>key_i(14));
   ix43496z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx43496z1, I0=>nrst, I1=>key_i(14));
   ix44493z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx44493z3, I0=>nrst, I1=>key_i(15));
   ix44493z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx44493z1, I0=>nrst, I1=>key_i(15));
   ix45490z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx45490z3, I0=>nrst, I1=>key_i(16));
   ix45490z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx45490z1, I0=>nrst, I1=>key_i(16));
   ix46487z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx46487z3, I0=>nrst, I1=>key_i(17));
   ix46487z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx46487z1, I0=>nrst, I1=>key_i(17));
   ix47484z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx47484z3, I0=>nrst, I1=>key_i(18));
   ix47484z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx47484z1, I0=>nrst, I1=>key_i(18));
   ix48481z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx48481z3, I0=>nrst, I1=>key_i(19));
   ix48481z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx48481z1, I0=>nrst, I1=>key_i(19));
   ix50477z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx50477z3, I0=>nrst, I1=>key_i(20));
   ix50477z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx50477z1, I0=>nrst, I1=>key_i(20));
   ix51474z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx51474z3, I0=>nrst, I1=>key_i(21));
   ix51474z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx51474z1, I0=>nrst, I1=>key_i(21));
   ix52471z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx52471z3, I0=>nrst, I1=>key_i(22));
   ix52471z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx52471z1, I0=>nrst, I1=>key_i(22));
   ix53468z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx53468z3, I0=>nrst, I1=>key_i(23));
   ix53468z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx53468z1, I0=>nrst, I1=>key_i(23));
   ix54465z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx54465z3, I0=>nrst, I1=>key_i(24));
   ix54465z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx54465z1, I0=>nrst, I1=>key_i(24));
   ix55462z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx55462z3, I0=>nrst, I1=>key_i(25));
   ix55462z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx55462z1, I0=>nrst, I1=>key_i(25));
   ix56459z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx56459z3, I0=>nrst, I1=>key_i(26));
   ix56459z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx56459z1, I0=>nrst, I1=>key_i(26));
   ix57456z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx57456z3, I0=>nrst, I1=>key_i(27));
   ix57456z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx57456z1, I0=>nrst, I1=>key_i(27));
   ix58453z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx58453z3, I0=>nrst, I1=>key_i(28));
   ix58453z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx58453z1, I0=>nrst, I1=>key_i(28));
   ix59450z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx59450z3, I0=>nrst, I1=>key_i(29));
   ix59450z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx59450z1, I0=>nrst, I1=>key_i(29));
   ix61446z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx61446z3, I0=>nrst, I1=>key_i(30));
   ix61446z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx61446z1, I0=>nrst, I1=>key_i(30));
   ix62443z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx62443z3, I0=>nrst, I1=>key_i(31));
   ix62443z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx62443z1, I0=>nrst, I1=>key_i(31));
   ix63440z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx63440z3, I0=>nrst, I1=>key_i(32));
   ix63440z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx63440z1, I0=>nrst, I1=>key_i(32));
   ix64437z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx64437z3, I0=>nrst, I1=>key_i(33));
   ix64437z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx64437z1, I0=>nrst, I1=>key_i(33));
   ix65434z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx65434z3, I0=>nrst, I1=>key_i(34));
   ix65434z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx65434z1, I0=>nrst, I1=>key_i(34));
   ix895z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx895z3, I0=>nrst, I1=>key_i(35));
   ix895z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx895z1, I0=>nrst, I1=>key_i(35));
   ix1892z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx1892z3, I0=>nrst, I1=>key_i(36));
   ix1892z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx1892z1, I0=>nrst, I1=>key_i(36));
   ix2889z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx2889z3, I0=>nrst, I1=>key_i(37));
   ix2889z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx2889z1, I0=>nrst, I1=>key_i(37));
   ix3886z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx3886z3, I0=>nrst, I1=>key_i(38));
   ix3886z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx3886z1, I0=>nrst, I1=>key_i(38));
   ix4883z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx4883z3, I0=>nrst, I1=>key_i(39));
   ix4883z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx4883z1, I0=>nrst, I1=>key_i(39));
   ix6879z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx6879z3, I0=>nrst, I1=>key_i(40));
   ix6879z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx6879z1, I0=>nrst, I1=>key_i(40));
   ix7876z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx7876z3, I0=>nrst, I1=>key_i(41));
   ix7876z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx7876z1, I0=>nrst, I1=>key_i(41));
   ix8873z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx8873z3, I0=>nrst, I1=>key_i(42));
   ix8873z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx8873z1, I0=>nrst, I1=>key_i(42));
   ix9870z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx9870z3, I0=>nrst, I1=>key_i(43));
   ix9870z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx9870z1, I0=>nrst, I1=>key_i(43));
   ix10867z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx10867z3, I0=>nrst, I1=>key_i(44));
   ix10867z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx10867z1, I0=>nrst, I1=>key_i(44));
   ix11864z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx11864z3, I0=>nrst, I1=>key_i(45));
   ix11864z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx11864z1, I0=>nrst, I1=>key_i(45));
   ix12861z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx12861z3, I0=>nrst, I1=>key_i(46));
   ix12861z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx12861z1, I0=>nrst, I1=>key_i(46));
   ix13858z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx13858z3, I0=>nrst, I1=>key_i(47));
   ix13858z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx13858z1, I0=>nrst, I1=>key_i(47));
   ix14855z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx14855z3, I0=>nrst, I1=>key_i(48));
   ix14855z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx14855z1, I0=>nrst, I1=>key_i(48));
   ix15852z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx15852z3, I0=>nrst, I1=>key_i(49));
   ix15852z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx15852z1, I0=>nrst, I1=>key_i(49));
   ix17848z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx17848z3, I0=>nrst, I1=>key_i(50));
   ix17848z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx17848z1, I0=>nrst, I1=>key_i(50));
   ix18845z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx18845z3, I0=>nrst, I1=>key_i(51));
   ix18845z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx18845z1, I0=>nrst, I1=>key_i(51));
   ix19842z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx19842z3, I0=>nrst, I1=>key_i(52));
   ix19842z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx19842z1, I0=>nrst, I1=>key_i(52));
   ix20839z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx20839z3, I0=>nrst, I1=>key_i(53));
   ix20839z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx20839z1, I0=>nrst, I1=>key_i(53));
   ix21836z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx21836z3, I0=>nrst, I1=>key_i(54));
   ix21836z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx21836z1, I0=>nrst, I1=>key_i(54));
   ix22833z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx22833z3, I0=>nrst, I1=>key_i(55));
   ix22833z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx22833z1, I0=>nrst, I1=>key_i(55));
   ix23830z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx23830z3, I0=>nrst, I1=>key_i(56));
   ix23830z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx23830z1, I0=>nrst, I1=>key_i(56));
   ix24827z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx24827z3, I0=>nrst, I1=>key_i(57));
   ix24827z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx24827z1, I0=>nrst, I1=>key_i(57));
   ix25824z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx25824z3, I0=>nrst, I1=>key_i(58));
   ix25824z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx25824z1, I0=>nrst, I1=>key_i(58));
   ix26821z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx26821z3, I0=>nrst, I1=>key_i(59));
   ix26821z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx26821z1, I0=>nrst, I1=>key_i(59));
   ix28817z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx28817z3, I0=>nrst, I1=>key_i(60));
   ix28817z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx28817z1, I0=>nrst, I1=>key_i(60));
   ix29814z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx29814z3, I0=>nrst, I1=>key_i(61));
   ix29814z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx29814z1, I0=>nrst, I1=>key_i(61));
   ix30811z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx30811z3, I0=>nrst, I1=>key_i(62));
   ix30811z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx30811z1, I0=>nrst, I1=>key_i(62));
   ix31808z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx31808z3, I0=>nrst, I1=>key_i(63));
   ix31808z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx31808z1, I0=>nrst, I1=>key_i(63));
   ix32805z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx32805z3, I0=>nrst, I1=>key_i(64));
   ix32805z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx32805z1, I0=>nrst, I1=>key_i(64));
   ix33802z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx33802z3, I0=>nrst, I1=>key_i(65));
   ix33802z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx33802z1, I0=>nrst, I1=>key_i(65));
   ix34799z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx34799z3, I0=>nrst, I1=>key_i(66));
   ix34799z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx34799z1, I0=>nrst, I1=>key_i(66));
   ix35796z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx35796z3, I0=>nrst, I1=>key_i(67));
   ix35796z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx35796z1, I0=>nrst, I1=>key_i(67));
   ix36793z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx36793z3, I0=>nrst, I1=>key_i(68));
   ix36793z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx36793z1, I0=>nrst, I1=>key_i(68));
   ix37790z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx37790z3, I0=>nrst, I1=>key_i(69));
   ix37790z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx37790z1, I0=>nrst, I1=>key_i(69));
   ix39786z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx39786z3, I0=>nrst, I1=>key_i(70));
   ix39786z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx39786z1, I0=>nrst, I1=>key_i(70));
   ix40783z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx40783z3, I0=>nrst, I1=>key_i(71));
   ix40783z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx40783z1, I0=>nrst, I1=>key_i(71));
   ix41780z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx41780z3, I0=>nrst, I1=>key_i(72));
   ix41780z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx41780z1, I0=>nrst, I1=>key_i(72));
   ix42777z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx42777z3, I0=>nrst, I1=>key_i(73));
   ix42777z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx42777z1, I0=>nrst, I1=>key_i(73));
   ix43774z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx43774z3, I0=>nrst, I1=>key_i(74));
   ix43774z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx43774z1, I0=>nrst, I1=>key_i(74));
   ix44771z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx44771z3, I0=>nrst, I1=>key_i(75));
   ix44771z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx44771z1, I0=>nrst, I1=>key_i(75));
   ix45768z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx45768z3, I0=>nrst, I1=>key_i(76));
   ix45768z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx45768z1, I0=>nrst, I1=>key_i(76));
   ix46765z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx46765z3, I0=>nrst, I1=>key_i(77));
   ix46765z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx46765z1, I0=>nrst, I1=>key_i(77));
   ix47762z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx47762z3, I0=>nrst, I1=>key_i(78));
   ix47762z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx47762z1, I0=>nrst, I1=>key_i(78));
   ix48759z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx48759z3, I0=>nrst, I1=>key_i(79));
   ix48759z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx48759z1, I0=>nrst, I1=>key_i(79));
   ix50755z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx50755z3, I0=>nrst, I1=>key_i(80));
   ix50755z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx50755z1, I0=>nrst, I1=>key_i(80));
   ix51752z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx51752z3, I0=>nrst, I1=>key_i(81));
   ix51752z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx51752z1, I0=>nrst, I1=>key_i(81));
   ix52749z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx52749z3, I0=>nrst, I1=>key_i(82));
   ix52749z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx52749z1, I0=>nrst, I1=>key_i(82));
   ix53746z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx53746z3, I0=>nrst, I1=>key_i(83));
   ix53746z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx53746z1, I0=>nrst, I1=>key_i(83));
   ix54743z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx54743z3, I0=>nrst, I1=>key_i(84));
   ix54743z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx54743z1, I0=>nrst, I1=>key_i(84));
   ix55740z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx55740z3, I0=>nrst, I1=>key_i(85));
   ix55740z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx55740z1, I0=>nrst, I1=>key_i(85));
   ix56737z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx56737z3, I0=>nrst, I1=>key_i(86));
   ix56737z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx56737z1, I0=>nrst, I1=>key_i(86));
   ix57734z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx57734z3, I0=>nrst, I1=>key_i(87));
   ix57734z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx57734z1, I0=>nrst, I1=>key_i(87));
   ix58731z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx58731z3, I0=>nrst, I1=>key_i(88));
   ix58731z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx58731z1, I0=>nrst, I1=>key_i(88));
   ix59728z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx59728z3, I0=>nrst, I1=>key_i(89));
   ix59728z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx59728z1, I0=>nrst, I1=>key_i(89));
   ix61724z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx61724z3, I0=>nrst, I1=>key_i(90));
   ix61724z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx61724z1, I0=>nrst, I1=>key_i(90));
   ix62721z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx62721z3, I0=>nrst, I1=>key_i(91));
   ix62721z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx62721z1, I0=>nrst, I1=>key_i(91));
   ix63718z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx63718z3, I0=>nrst, I1=>key_i(92));
   ix63718z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx63718z1, I0=>nrst, I1=>key_i(92));
   ix64715z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx64715z3, I0=>nrst, I1=>key_i(93));
   ix64715z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx64715z1, I0=>nrst, I1=>key_i(93));
   ix176z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx176z3, I0=>nrst, I1=>key_i(94));
   ix176z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx176z1, I0=>nrst, I1=>key_i(94));
   ix1173z1320 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx1173z3, I0=>nrst, I1=>key_i(95));
   ix1173z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx1173z1, I0=>nrst, I1=>key_i(95));
   ix2170z1329 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx2170z12, I0=>nrst, I1=>key_i(96));
   ix2170z28353 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx2170z10, I0=>nx2170z11, I1=>cr_key(100), I2=>
      cr_key(33), I3=>cr_key(0));
   ix2170z48631 : LUT4
      generic map (INIT => X"B8CD") 
       port map ( O=>nx2170z9, I0=>count(3), I1=>count(2), I2=>count(1), I3
      =>count(0));
   ix2170z24216 : LUT4
      generic map (INIT => X"596F") 
       port map ( O=>nx2170z8, I0=>count(3), I1=>count(2), I2=>count(1), I3
      =>count(0));
   ix2170z2098 : LUT4
      generic map (INIT => X"030A") 
       port map ( O=>nx2170z7, I0=>nx2170z8, I1=>nx2170z9, I2=>count(5), I3
      =>count(4));
   ix2170z18542 : LUT4
      generic map (INIT => X"4347") 
       port map ( O=>nx2170z6, I0=>count(3), I1=>count(2), I2=>count(1), I3
      =>count(0));
   ix2170z36556 : LUT4
      generic map (INIT => X"89A6") 
       port map ( O=>nx2170z5, I0=>count(3), I1=>count(2), I2=>count(1), I3
      =>count(0));
   ix2170z13765 : LUT4
      generic map (INIT => X"30A0") 
       port map ( O=>nx2170z4, I0=>nx2170z5, I1=>nx2170z6, I2=>count(5), I3
      =>count(4));
   ix2170z1541 : LUT3
      generic map (INIT => X"E1") 
       port map ( O=>nx2170z3, I0=>nx2170z4, I1=>nx2170z7, I2=>nx2170z10);
   ix2170z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx2170z1, I0=>nrst, I1=>key_i(96));
   ix3167z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx3167z5, I0=>nrst, I1=>key_i(97));
   ix3167z39821 : LUT4
      generic map (INIT => X"9669") 
       port map ( O=>nx3167z3, I0=>nx3167z4, I1=>cr_key(100), I2=>cr_key(33), 
      I3=>cr_key(1));
   ix3167z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx3167z1, I0=>nrst, I1=>key_i(97));
   ix4164z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx4164z5, I0=>nrst, I1=>key_i(98));
   ix3167z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx3167z4, I0=>cr_key(101), I1=>cr_key(34));
   ix4164z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx4164z3, I0=>cr_key(101), I1=>cr_key(34), I2=>
      cr_key(2), I3=>nx4164z4);
   ix4164z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx4164z1, I0=>nrst, I1=>key_i(98));
   ix5161z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx5161z5, I0=>nrst, I1=>key_i(99));
   ix4164z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx4164z4, I0=>cr_key(102), I1=>cr_key(35));
   ix5161z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx5161z3, I0=>cr_key(102), I1=>cr_key(35), I2=>
      cr_key(3), I3=>nx5161z4);
   ix5161z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx5161z1, I0=>nrst, I1=>key_i(99));
   ix9360z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx9360z5, I0=>nrst, I1=>key_i(100));
   ix5161z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx5161z4, I0=>cr_key(103), I1=>cr_key(36));
   ix9360z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx9360z3, I0=>cr_key(103), I1=>cr_key(36), I2=>
      cr_key(4), I3=>nx9360z4);
   ix9360z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx9360z1, I0=>nrst, I1=>key_i(100));
   ix10357z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx10357z5, I0=>nrst, I1=>key_i(101));
   ix9360z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx9360z4, I0=>cr_key(104), I1=>cr_key(37));
   ix10357z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx10357z3, I0=>cr_key(104), I1=>cr_key(37), I2=>
      cr_key(5), I3=>nx10357z4);
   ix10357z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx10357z1, I0=>nrst, I1=>key_i(101));
   ix11354z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx11354z5, I0=>nrst, I1=>key_i(102));
   ix10357z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx10357z4, I0=>cr_key(105), I1=>cr_key(38));
   ix11354z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx11354z3, I0=>cr_key(105), I1=>cr_key(38), I2=>
      cr_key(6), I3=>nx11354z4);
   ix11354z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx11354z1, I0=>nrst, I1=>key_i(102));
   ix12351z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx12351z5, I0=>nrst, I1=>key_i(103));
   ix11354z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx11354z4, I0=>cr_key(106), I1=>cr_key(39));
   ix12351z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx12351z3, I0=>cr_key(106), I1=>cr_key(39), I2=>
      cr_key(7), I3=>nx12351z4);
   ix12351z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx12351z1, I0=>nrst, I1=>key_i(103));
   ix13348z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx13348z5, I0=>nrst, I1=>key_i(104));
   ix12351z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx12351z4, I0=>cr_key(107), I1=>cr_key(40));
   ix13348z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx13348z3, I0=>cr_key(107), I1=>cr_key(40), I2=>
      cr_key(8), I3=>nx13348z4);
   ix13348z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx13348z1, I0=>nrst, I1=>key_i(104));
   ix14345z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx14345z5, I0=>nrst, I1=>key_i(105));
   ix13348z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx13348z4, I0=>cr_key(108), I1=>cr_key(41));
   ix14345z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx14345z3, I0=>cr_key(108), I1=>cr_key(41), I2=>
      cr_key(9), I3=>nx14345z4);
   ix14345z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx14345z1, I0=>nrst, I1=>key_i(105));
   ix15342z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx15342z5, I0=>nrst, I1=>key_i(106));
   ix14345z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx14345z4, I0=>cr_key(109), I1=>cr_key(42));
   ix15342z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx15342z3, I0=>cr_key(109), I1=>cr_key(42), I2=>
      cr_key(10), I3=>nx15342z4);
   ix15342z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx15342z1, I0=>nrst, I1=>key_i(106));
   ix16339z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx16339z5, I0=>nrst, I1=>key_i(107));
   ix15342z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx15342z4, I0=>cr_key(110), I1=>cr_key(43));
   ix16339z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx16339z3, I0=>cr_key(110), I1=>cr_key(43), I2=>
      cr_key(11), I3=>nx16339z4);
   ix16339z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx16339z1, I0=>nrst, I1=>key_i(107));
   ix17336z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx17336z5, I0=>nrst, I1=>key_i(108));
   ix16339z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx16339z4, I0=>cr_key(111), I1=>cr_key(44));
   ix17336z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx17336z3, I0=>cr_key(111), I1=>cr_key(44), I2=>
      cr_key(12), I3=>nx17336z4);
   ix17336z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx17336z1, I0=>nrst, I1=>key_i(108));
   ix18333z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx18333z5, I0=>nrst, I1=>key_i(109));
   ix17336z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx17336z4, I0=>cr_key(112), I1=>cr_key(45));
   ix18333z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx18333z3, I0=>cr_key(112), I1=>cr_key(45), I2=>
      cr_key(13), I3=>nx18333z4);
   ix18333z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx18333z1, I0=>nrst, I1=>key_i(109));
   ix20329z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx20329z5, I0=>nrst, I1=>key_i(110));
   ix18333z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx18333z4, I0=>cr_key(113), I1=>cr_key(46));
   ix20329z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx20329z3, I0=>cr_key(113), I1=>cr_key(46), I2=>
      cr_key(14), I3=>nx20329z4);
   ix20329z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx20329z1, I0=>nrst, I1=>key_i(110));
   ix21326z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx21326z5, I0=>nrst, I1=>key_i(111));
   ix20329z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx20329z4, I0=>cr_key(114), I1=>cr_key(47));
   ix21326z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx21326z3, I0=>cr_key(114), I1=>cr_key(47), I2=>
      cr_key(15), I3=>nx21326z4);
   ix21326z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx21326z1, I0=>nrst, I1=>key_i(111));
   ix22323z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx22323z5, I0=>nrst, I1=>key_i(112));
   ix21326z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx21326z4, I0=>cr_key(115), I1=>cr_key(48));
   ix22323z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx22323z3, I0=>cr_key(115), I1=>cr_key(48), I2=>
      cr_key(16), I3=>nx22323z4);
   ix22323z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx22323z1, I0=>nrst, I1=>key_i(112));
   ix23320z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx23320z5, I0=>nrst, I1=>key_i(113));
   ix22323z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx22323z4, I0=>cr_key(116), I1=>cr_key(49));
   ix23320z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx23320z3, I0=>cr_key(116), I1=>cr_key(49), I2=>
      cr_key(17), I3=>nx23320z4);
   ix23320z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx23320z1, I0=>nrst, I1=>key_i(113));
   ix24317z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx24317z5, I0=>nrst, I1=>key_i(114));
   ix23320z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx23320z4, I0=>cr_key(117), I1=>cr_key(50));
   ix24317z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx24317z3, I0=>cr_key(117), I1=>cr_key(50), I2=>
      cr_key(18), I3=>nx24317z4);
   ix24317z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx24317z1, I0=>nrst, I1=>key_i(114));
   ix25314z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx25314z5, I0=>nrst, I1=>key_i(115));
   ix24317z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx24317z4, I0=>cr_key(118), I1=>cr_key(51));
   ix25314z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx25314z3, I0=>cr_key(118), I1=>cr_key(51), I2=>
      cr_key(19), I3=>nx25314z4);
   ix25314z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx25314z1, I0=>nrst, I1=>key_i(115));
   ix26311z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx26311z5, I0=>nrst, I1=>key_i(116));
   ix25314z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx25314z4, I0=>cr_key(119), I1=>cr_key(52));
   ix26311z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx26311z3, I0=>cr_key(119), I1=>cr_key(52), I2=>
      cr_key(20), I3=>nx26311z4);
   ix26311z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx26311z1, I0=>nrst, I1=>key_i(116));
   ix27308z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx27308z5, I0=>nrst, I1=>key_i(117));
   ix26311z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx26311z4, I0=>cr_key(120), I1=>cr_key(53));
   ix27308z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx27308z3, I0=>cr_key(120), I1=>cr_key(53), I2=>
      cr_key(21), I3=>nx27308z4);
   ix27308z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx27308z1, I0=>nrst, I1=>key_i(117));
   ix28305z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx28305z5, I0=>nrst, I1=>key_i(118));
   ix27308z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx27308z4, I0=>cr_key(121), I1=>cr_key(54));
   ix28305z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx28305z3, I0=>cr_key(121), I1=>cr_key(54), I2=>
      cr_key(22), I3=>nx28305z4);
   ix28305z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx28305z1, I0=>nrst, I1=>key_i(118));
   ix29302z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx29302z5, I0=>nrst, I1=>key_i(119));
   ix28305z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx28305z4, I0=>cr_key(122), I1=>cr_key(55));
   ix29302z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx29302z3, I0=>cr_key(122), I1=>cr_key(55), I2=>
      cr_key(23), I3=>nx29302z4);
   ix29302z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx29302z1, I0=>nrst, I1=>key_i(119));
   ix31298z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx31298z5, I0=>nrst, I1=>key_i(120));
   ix29302z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx29302z4, I0=>cr_key(123), I1=>cr_key(56));
   ix31298z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx31298z3, I0=>cr_key(123), I1=>cr_key(56), I2=>
      cr_key(24), I3=>nx31298z4);
   ix31298z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx31298z1, I0=>nrst, I1=>key_i(120));
   ix32295z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx32295z5, I0=>nrst, I1=>key_i(121));
   ix31298z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx31298z4, I0=>cr_key(124), I1=>cr_key(57));
   ix32295z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx32295z3, I0=>cr_key(124), I1=>cr_key(57), I2=>
      cr_key(25), I3=>nx32295z4);
   ix32295z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx32295z1, I0=>nrst, I1=>key_i(121));
   ix33292z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx33292z5, I0=>nrst, I1=>key_i(122));
   ix32295z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx32295z4, I0=>cr_key(125), I1=>cr_key(58));
   ix33292z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx33292z3, I0=>cr_key(125), I1=>cr_key(58), I2=>
      cr_key(26), I3=>nx33292z4);
   ix33292z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx33292z1, I0=>nrst, I1=>key_i(122));
   ix34289z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx34289z5, I0=>nrst, I1=>key_i(123));
   ix33292z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx33292z4, I0=>cr_key(126), I1=>cr_key(59));
   ix34289z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx34289z3, I0=>cr_key(126), I1=>cr_key(59), I2=>
      cr_key(27), I3=>nx34289z4);
   ix34289z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx34289z1, I0=>nrst, I1=>key_i(123));
   ix35286z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx35286z5, I0=>nrst, I1=>key_i(124));
   ix34289z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx34289z4, I0=>cr_key(127), I1=>cr_key(60));
   ix35286z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx35286z3, I0=>cr_key(127), I1=>cr_key(60), I2=>
      cr_key(28), I3=>nx35286z4);
   ix35286z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx35286z1, I0=>nrst, I1=>key_i(124));
   ix36283z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx36283z5, I0=>nrst, I1=>key_i(125));
   ix35286z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx35286z4, I0=>cr_key(96), I1=>cr_key(61));
   ix36283z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx36283z3, I0=>cr_key(96), I1=>cr_key(61), I2=>
      cr_key(29), I3=>nx36283z4);
   ix36283z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx36283z1, I0=>nrst, I1=>key_i(125));
   ix37280z1322 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx37280z5, I0=>nrst, I1=>key_i(126));
   ix36283z1326 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx36283z4, I0=>cr_key(97), I1=>cr_key(62));
   ix37280z39821 : LUT4
      generic map (INIT => X"9669") 
       port map ( O=>nx37280z3, I0=>cr_key(97), I1=>cr_key(62), I2=>
      cr_key(30), I3=>nx37280z4);
   ix37280z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx37280z1, I0=>nrst, I1=>key_i(126));
   ix38277z1321 : LUT2
      generic map (INIT => X"4") 
       port map ( O=>nx38277z4, I0=>nrst, I1=>key_i(127));
   ix37280z1323 : LUT2
      generic map (INIT => X"6") 
       port map ( O=>nx37280z4, I0=>cr_key(98), I1=>cr_key(63));
   ix2170z1333 : LUT2
      generic map (INIT => X"9") 
       port map ( O=>nx2170z11, I0=>cr_key(99), I1=>cr_key(32));
   ix38277z28346 : LUT4
      generic map (INIT => X"6996") 
       port map ( O=>nx38277z3, I0=>cr_key(98), I1=>cr_key(63), I2=>
      cr_key(31), I3=>nx2170z11);
   ix38277z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx38277z1, I0=>nrst, I1=>key_i(127));
end rtl_round ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- Library use clause for technology cells
library unisim,simprim ;
use unisim.vcomponents.all,simprim.vcomponents.all;

entity top is 
   port (
      clk : IN std_logic ;
      nrst : IN std_logic ;
      start : IN std_logic ;
      key_i : IN std_logic_vector (127 DOWNTO 0) ;
      plaintext : IN std_logic_vector (63 DOWNTO 0) ;
      ciphertext : OUT std_logic_vector (63 DOWNTO 0) ;
      done : OUT std_logic) ;
end top ;

architecture rtl_top of top is 
   component round
      port (
         clk : IN std_logic ;
         nrst : IN std_logic ;
         start : IN std_logic ;
         count : IN std_logic_vector (5 DOWNTO 0) ;
         key_i : IN std_logic_vector (127 DOWNTO 0) ;
         data_in : IN std_logic_vector (63 DOWNTO 0) ;
         data_out : OUT std_logic_vector (63 DOWNTO 0) ;
         p_rtlc3n140 : IN std_logic ;
         p_rtlcn0 : IN std_logic ;
         p_rtlc3n143 : IN std_logic ;
         p_rtlcn11 : IN std_logic) ;
   end component ;
   signal ciphertext_dup_0: std_logic_vector (63 DOWNTO 0) ;
   
   signal s_count: std_logic_vector (5 DOWNTO 0) ;
   
   signal clk_int, nrst_int, start_int: std_logic ;
   
   signal key_i_int: std_logic_vector (127 DOWNTO 0) ;
   
   signal plaintext_int: std_logic_vector (63 DOWNTO 0) ;
   
   signal done_dup_0, nx22393z1, counter_map_not_nrst, nx11351z1, nx12348z1, 
      nx13345z1, nx14342z1, nx15339z1, nx16336z3, nx14342z2, nx15339z2, 
      nx16336z2, nx16336z1: std_logic ;
   type DANGLING_type is array (0 downto 0,511 downto 0) of std_logic ;
   signal DANGLING : DANGLING_type ;

begin
   round_map : round port map ( clk=>clk_int, nrst=>nrst_int, start=>
      start_int, count(5)=>s_count(5), count(4)=>s_count(4), count(3)=>
      s_count(3), count(2)=>s_count(2), count(1)=>s_count(1), count(0)=>
      s_count(0), key_i(127)=>key_i_int(127), key_i(126)=>key_i_int(126), 
      key_i(125)=>key_i_int(125), key_i(124)=>key_i_int(124), key_i(123)=>
      key_i_int(123), key_i(122)=>key_i_int(122), key_i(121)=>key_i_int(121), 
      key_i(120)=>key_i_int(120), key_i(119)=>key_i_int(119), key_i(118)=>
      key_i_int(118), key_i(117)=>key_i_int(117), key_i(116)=>key_i_int(116), 
      key_i(115)=>key_i_int(115), key_i(114)=>key_i_int(114), key_i(113)=>
      key_i_int(113), key_i(112)=>key_i_int(112), key_i(111)=>key_i_int(111), 
      key_i(110)=>key_i_int(110), key_i(109)=>key_i_int(109), key_i(108)=>
      key_i_int(108), key_i(107)=>key_i_int(107), key_i(106)=>key_i_int(106), 
      key_i(105)=>key_i_int(105), key_i(104)=>key_i_int(104), key_i(103)=>
      key_i_int(103), key_i(102)=>key_i_int(102), key_i(101)=>key_i_int(101), 
      key_i(100)=>key_i_int(100), key_i(99)=>key_i_int(99), key_i(98)=>
      key_i_int(98), key_i(97)=>key_i_int(97), key_i(96)=>key_i_int(96), 
      key_i(95)=>key_i_int(95), key_i(94)=>key_i_int(94), key_i(93)=>
      key_i_int(93), key_i(92)=>key_i_int(92), key_i(91)=>key_i_int(91), 
      key_i(90)=>key_i_int(90), key_i(89)=>key_i_int(89), key_i(88)=>
      key_i_int(88), key_i(87)=>key_i_int(87), key_i(86)=>key_i_int(86), 
      key_i(85)=>key_i_int(85), key_i(84)=>key_i_int(84), key_i(83)=>
      key_i_int(83), key_i(82)=>key_i_int(82), key_i(81)=>key_i_int(81), 
      key_i(80)=>key_i_int(80), key_i(79)=>key_i_int(79), key_i(78)=>
      key_i_int(78), key_i(77)=>key_i_int(77), key_i(76)=>key_i_int(76), 
      key_i(75)=>key_i_int(75), key_i(74)=>key_i_int(74), key_i(73)=>
      key_i_int(73), key_i(72)=>key_i_int(72), key_i(71)=>key_i_int(71), 
      key_i(70)=>key_i_int(70), key_i(69)=>key_i_int(69), key_i(68)=>
      key_i_int(68), key_i(67)=>key_i_int(67), key_i(66)=>key_i_int(66), 
      key_i(65)=>key_i_int(65), key_i(64)=>key_i_int(64), key_i(63)=>
      key_i_int(63), key_i(62)=>key_i_int(62), key_i(61)=>key_i_int(61), 
      key_i(60)=>key_i_int(60), key_i(59)=>key_i_int(59), key_i(58)=>
      key_i_int(58), key_i(57)=>key_i_int(57), key_i(56)=>key_i_int(56), 
      key_i(55)=>key_i_int(55), key_i(54)=>key_i_int(54), key_i(53)=>
      key_i_int(53), key_i(52)=>key_i_int(52), key_i(51)=>key_i_int(51), 
      key_i(50)=>key_i_int(50), key_i(49)=>key_i_int(49), key_i(48)=>
      key_i_int(48), key_i(47)=>key_i_int(47), key_i(46)=>key_i_int(46), 
      key_i(45)=>key_i_int(45), key_i(44)=>key_i_int(44), key_i(43)=>
      key_i_int(43), key_i(42)=>key_i_int(42), key_i(41)=>key_i_int(41), 
      key_i(40)=>key_i_int(40), key_i(39)=>key_i_int(39), key_i(38)=>
      key_i_int(38), key_i(37)=>key_i_int(37), key_i(36)=>key_i_int(36), 
      key_i(35)=>key_i_int(35), key_i(34)=>key_i_int(34), key_i(33)=>
      key_i_int(33), key_i(32)=>key_i_int(32), key_i(31)=>key_i_int(31), 
      key_i(30)=>key_i_int(30), key_i(29)=>key_i_int(29), key_i(28)=>
      key_i_int(28), key_i(27)=>key_i_int(27), key_i(26)=>key_i_int(26), 
      key_i(25)=>key_i_int(25), key_i(24)=>key_i_int(24), key_i(23)=>
      key_i_int(23), key_i(22)=>key_i_int(22), key_i(21)=>key_i_int(21), 
      key_i(20)=>key_i_int(20), key_i(19)=>key_i_int(19), key_i(18)=>
      key_i_int(18), key_i(17)=>key_i_int(17), key_i(16)=>key_i_int(16), 
      key_i(15)=>key_i_int(15), key_i(14)=>key_i_int(14), key_i(13)=>
      key_i_int(13), key_i(12)=>key_i_int(12), key_i(11)=>key_i_int(11), 
      key_i(10)=>key_i_int(10), key_i(9)=>key_i_int(9), key_i(8)=>
      key_i_int(8), key_i(7)=>key_i_int(7), key_i(6)=>key_i_int(6), key_i(5)
      =>key_i_int(5), key_i(4)=>key_i_int(4), key_i(3)=>key_i_int(3), 
      key_i(2)=>key_i_int(2), key_i(1)=>key_i_int(1), key_i(0)=>key_i_int(0), 
      data_in(63)=>plaintext_int(63), data_in(62)=>plaintext_int(62), 
      data_in(61)=>plaintext_int(61), data_in(60)=>plaintext_int(60), 
      data_in(59)=>plaintext_int(59), data_in(58)=>plaintext_int(58), 
      data_in(57)=>plaintext_int(57), data_in(56)=>plaintext_int(56), 
      data_in(55)=>plaintext_int(55), data_in(54)=>plaintext_int(54), 
      data_in(53)=>plaintext_int(53), data_in(52)=>plaintext_int(52), 
      data_in(51)=>plaintext_int(51), data_in(50)=>plaintext_int(50), 
      data_in(49)=>plaintext_int(49), data_in(48)=>plaintext_int(48), 
      data_in(47)=>plaintext_int(47), data_in(46)=>plaintext_int(46), 
      data_in(45)=>plaintext_int(45), data_in(44)=>plaintext_int(44), 
      data_in(43)=>plaintext_int(43), data_in(42)=>plaintext_int(42), 
      data_in(41)=>plaintext_int(41), data_in(40)=>plaintext_int(40), 
      data_in(39)=>plaintext_int(39), data_in(38)=>plaintext_int(38), 
      data_in(37)=>plaintext_int(37), data_in(36)=>plaintext_int(36), 
      data_in(35)=>plaintext_int(35), data_in(34)=>plaintext_int(34), 
      data_in(33)=>plaintext_int(33), data_in(32)=>plaintext_int(32), 
      data_in(31)=>plaintext_int(31), data_in(30)=>plaintext_int(30), 
      data_in(29)=>plaintext_int(29), data_in(28)=>plaintext_int(28), 
      data_in(27)=>plaintext_int(27), data_in(26)=>plaintext_int(26), 
      data_in(25)=>plaintext_int(25), data_in(24)=>plaintext_int(24), 
      data_in(23)=>plaintext_int(23), data_in(22)=>plaintext_int(22), 
      data_in(21)=>plaintext_int(21), data_in(20)=>plaintext_int(20), 
      data_in(19)=>plaintext_int(19), data_in(18)=>plaintext_int(18), 
      data_in(17)=>plaintext_int(17), data_in(16)=>plaintext_int(16), 
      data_in(15)=>plaintext_int(15), data_in(14)=>plaintext_int(14), 
      data_in(13)=>plaintext_int(13), data_in(12)=>plaintext_int(12), 
      data_in(11)=>plaintext_int(11), data_in(10)=>plaintext_int(10), 
      data_in(9)=>plaintext_int(9), data_in(8)=>plaintext_int(8), data_in(7)
      =>plaintext_int(7), data_in(6)=>plaintext_int(6), data_in(5)=>
      plaintext_int(5), data_in(4)=>plaintext_int(4), data_in(3)=>
      plaintext_int(3), data_in(2)=>plaintext_int(2), data_in(1)=>
      plaintext_int(1), data_in(0)=>plaintext_int(0), data_out(63)=>
      ciphertext_dup_0(63), data_out(62)=>ciphertext_dup_0(62), data_out(61)
      =>ciphertext_dup_0(61), data_out(60)=>ciphertext_dup_0(60), 
      data_out(59)=>ciphertext_dup_0(59), data_out(58)=>ciphertext_dup_0(58), 
      data_out(57)=>ciphertext_dup_0(57), data_out(56)=>ciphertext_dup_0(56), 
      data_out(55)=>ciphertext_dup_0(55), data_out(54)=>ciphertext_dup_0(54), 
      data_out(53)=>ciphertext_dup_0(53), data_out(52)=>ciphertext_dup_0(52), 
      data_out(51)=>ciphertext_dup_0(51), data_out(50)=>ciphertext_dup_0(50), 
      data_out(49)=>ciphertext_dup_0(49), data_out(48)=>ciphertext_dup_0(48), 
      data_out(47)=>ciphertext_dup_0(47), data_out(46)=>ciphertext_dup_0(46), 
      data_out(45)=>ciphertext_dup_0(45), data_out(44)=>ciphertext_dup_0(44), 
      data_out(43)=>ciphertext_dup_0(43), data_out(42)=>ciphertext_dup_0(42), 
      data_out(41)=>ciphertext_dup_0(41), data_out(40)=>ciphertext_dup_0(40), 
      data_out(39)=>ciphertext_dup_0(39), data_out(38)=>ciphertext_dup_0(38), 
      data_out(37)=>ciphertext_dup_0(37), data_out(36)=>ciphertext_dup_0(36), 
      data_out(35)=>ciphertext_dup_0(35), data_out(34)=>ciphertext_dup_0(34), 
      data_out(33)=>ciphertext_dup_0(33), data_out(32)=>ciphertext_dup_0(32), 
      data_out(31)=>ciphertext_dup_0(31), data_out(30)=>ciphertext_dup_0(30), 
      data_out(29)=>ciphertext_dup_0(29), data_out(28)=>ciphertext_dup_0(28), 
      data_out(27)=>ciphertext_dup_0(27), data_out(26)=>ciphertext_dup_0(26), 
      data_out(25)=>ciphertext_dup_0(25), data_out(24)=>ciphertext_dup_0(24), 
      data_out(23)=>ciphertext_dup_0(23), data_out(22)=>ciphertext_dup_0(22), 
      data_out(21)=>ciphertext_dup_0(21), data_out(20)=>ciphertext_dup_0(20), 
      data_out(19)=>ciphertext_dup_0(19), data_out(18)=>ciphertext_dup_0(18), 
      data_out(17)=>ciphertext_dup_0(17), data_out(16)=>ciphertext_dup_0(16), 
      data_out(15)=>ciphertext_dup_0(15), data_out(14)=>ciphertext_dup_0(14), 
      data_out(13)=>ciphertext_dup_0(13), data_out(12)=>ciphertext_dup_0(12), 
      data_out(11)=>ciphertext_dup_0(11), data_out(10)=>ciphertext_dup_0(10), 
      data_out(9)=>ciphertext_dup_0(9), data_out(8)=>ciphertext_dup_0(8), 
      data_out(7)=>ciphertext_dup_0(7), data_out(6)=>ciphertext_dup_0(6), 
      data_out(5)=>ciphertext_dup_0(5), data_out(4)=>ciphertext_dup_0(4), 
      data_out(3)=>ciphertext_dup_0(3), data_out(2)=>ciphertext_dup_0(2), 
      data_out(1)=>ciphertext_dup_0(1), data_out(0)=>ciphertext_dup_0(0), 
      p_rtlc3n140=>DANGLING(0,0), p_rtlcn0=>DANGLING(0,1), p_rtlc3n143=>
      nx22393z1, p_rtlcn11=>nx16336z1);
   done_obuf : OBUF port map ( O=>done, I=>done_dup_0);
   ciphertext_obuf_0 : OBUF port map ( O=>ciphertext(0), I=>
      ciphertext_dup_0(0));
   ciphertext_obuf_1 : OBUF port map ( O=>ciphertext(1), I=>
      ciphertext_dup_0(1));
   ciphertext_obuf_2 : OBUF port map ( O=>ciphertext(2), I=>
      ciphertext_dup_0(2));
   ciphertext_obuf_3 : OBUF port map ( O=>ciphertext(3), I=>
      ciphertext_dup_0(3));
   ciphertext_obuf_4 : OBUF port map ( O=>ciphertext(4), I=>
      ciphertext_dup_0(4));
   ciphertext_obuf_5 : OBUF port map ( O=>ciphertext(5), I=>
      ciphertext_dup_0(5));
   ciphertext_obuf_6 : OBUF port map ( O=>ciphertext(6), I=>
      ciphertext_dup_0(6));
   ciphertext_obuf_7 : OBUF port map ( O=>ciphertext(7), I=>
      ciphertext_dup_0(7));
   ciphertext_obuf_8 : OBUF port map ( O=>ciphertext(8), I=>
      ciphertext_dup_0(8));
   ciphertext_obuf_9 : OBUF port map ( O=>ciphertext(9), I=>
      ciphertext_dup_0(9));
   ciphertext_obuf_10 : OBUF port map ( O=>ciphertext(10), I=>
      ciphertext_dup_0(10));
   ciphertext_obuf_11 : OBUF port map ( O=>ciphertext(11), I=>
      ciphertext_dup_0(11));
   ciphertext_obuf_12 : OBUF port map ( O=>ciphertext(12), I=>
      ciphertext_dup_0(12));
   ciphertext_obuf_13 : OBUF port map ( O=>ciphertext(13), I=>
      ciphertext_dup_0(13));
   ciphertext_obuf_14 : OBUF port map ( O=>ciphertext(14), I=>
      ciphertext_dup_0(14));
   ciphertext_obuf_15 : OBUF port map ( O=>ciphertext(15), I=>
      ciphertext_dup_0(15));
   ciphertext_obuf_16 : OBUF port map ( O=>ciphertext(16), I=>
      ciphertext_dup_0(16));
   ciphertext_obuf_17 : OBUF port map ( O=>ciphertext(17), I=>
      ciphertext_dup_0(17));
   ciphertext_obuf_18 : OBUF port map ( O=>ciphertext(18), I=>
      ciphertext_dup_0(18));
   ciphertext_obuf_19 : OBUF port map ( O=>ciphertext(19), I=>
      ciphertext_dup_0(19));
   ciphertext_obuf_20 : OBUF port map ( O=>ciphertext(20), I=>
      ciphertext_dup_0(20));
   ciphertext_obuf_21 : OBUF port map ( O=>ciphertext(21), I=>
      ciphertext_dup_0(21));
   ciphertext_obuf_22 : OBUF port map ( O=>ciphertext(22), I=>
      ciphertext_dup_0(22));
   ciphertext_obuf_23 : OBUF port map ( O=>ciphertext(23), I=>
      ciphertext_dup_0(23));
   ciphertext_obuf_24 : OBUF port map ( O=>ciphertext(24), I=>
      ciphertext_dup_0(24));
   ciphertext_obuf_25 : OBUF port map ( O=>ciphertext(25), I=>
      ciphertext_dup_0(25));
   ciphertext_obuf_26 : OBUF port map ( O=>ciphertext(26), I=>
      ciphertext_dup_0(26));
   ciphertext_obuf_27 : OBUF port map ( O=>ciphertext(27), I=>
      ciphertext_dup_0(27));
   ciphertext_obuf_28 : OBUF port map ( O=>ciphertext(28), I=>
      ciphertext_dup_0(28));
   ciphertext_obuf_29 : OBUF port map ( O=>ciphertext(29), I=>
      ciphertext_dup_0(29));
   ciphertext_obuf_30 : OBUF port map ( O=>ciphertext(30), I=>
      ciphertext_dup_0(30));
   ciphertext_obuf_31 : OBUF port map ( O=>ciphertext(31), I=>
      ciphertext_dup_0(31));
   ciphertext_obuf_32 : OBUF port map ( O=>ciphertext(32), I=>
      ciphertext_dup_0(32));
   ciphertext_obuf_33 : OBUF port map ( O=>ciphertext(33), I=>
      ciphertext_dup_0(33));
   ciphertext_obuf_34 : OBUF port map ( O=>ciphertext(34), I=>
      ciphertext_dup_0(34));
   ciphertext_obuf_35 : OBUF port map ( O=>ciphertext(35), I=>
      ciphertext_dup_0(35));
   ciphertext_obuf_36 : OBUF port map ( O=>ciphertext(36), I=>
      ciphertext_dup_0(36));
   ciphertext_obuf_37 : OBUF port map ( O=>ciphertext(37), I=>
      ciphertext_dup_0(37));
   ciphertext_obuf_38 : OBUF port map ( O=>ciphertext(38), I=>
      ciphertext_dup_0(38));
   ciphertext_obuf_39 : OBUF port map ( O=>ciphertext(39), I=>
      ciphertext_dup_0(39));
   ciphertext_obuf_40 : OBUF port map ( O=>ciphertext(40), I=>
      ciphertext_dup_0(40));
   ciphertext_obuf_41 : OBUF port map ( O=>ciphertext(41), I=>
      ciphertext_dup_0(41));
   ciphertext_obuf_42 : OBUF port map ( O=>ciphertext(42), I=>
      ciphertext_dup_0(42));
   ciphertext_obuf_43 : OBUF port map ( O=>ciphertext(43), I=>
      ciphertext_dup_0(43));
   ciphertext_obuf_44 : OBUF port map ( O=>ciphertext(44), I=>
      ciphertext_dup_0(44));
   ciphertext_obuf_45 : OBUF port map ( O=>ciphertext(45), I=>
      ciphertext_dup_0(45));
   ciphertext_obuf_46 : OBUF port map ( O=>ciphertext(46), I=>
      ciphertext_dup_0(46));
   ciphertext_obuf_47 : OBUF port map ( O=>ciphertext(47), I=>
      ciphertext_dup_0(47));
   ciphertext_obuf_48 : OBUF port map ( O=>ciphertext(48), I=>
      ciphertext_dup_0(48));
   ciphertext_obuf_49 : OBUF port map ( O=>ciphertext(49), I=>
      ciphertext_dup_0(49));
   ciphertext_obuf_50 : OBUF port map ( O=>ciphertext(50), I=>
      ciphertext_dup_0(50));
   ciphertext_obuf_51 : OBUF port map ( O=>ciphertext(51), I=>
      ciphertext_dup_0(51));
   ciphertext_obuf_52 : OBUF port map ( O=>ciphertext(52), I=>
      ciphertext_dup_0(52));
   ciphertext_obuf_53 : OBUF port map ( O=>ciphertext(53), I=>
      ciphertext_dup_0(53));
   ciphertext_obuf_54 : OBUF port map ( O=>ciphertext(54), I=>
      ciphertext_dup_0(54));
   ciphertext_obuf_55 : OBUF port map ( O=>ciphertext(55), I=>
      ciphertext_dup_0(55));
   ciphertext_obuf_56 : OBUF port map ( O=>ciphertext(56), I=>
      ciphertext_dup_0(56));
   ciphertext_obuf_57 : OBUF port map ( O=>ciphertext(57), I=>
      ciphertext_dup_0(57));
   ciphertext_obuf_58 : OBUF port map ( O=>ciphertext(58), I=>
      ciphertext_dup_0(58));
   ciphertext_obuf_59 : OBUF port map ( O=>ciphertext(59), I=>
      ciphertext_dup_0(59));
   ciphertext_obuf_60 : OBUF port map ( O=>ciphertext(60), I=>
      ciphertext_dup_0(60));
   ciphertext_obuf_61 : OBUF port map ( O=>ciphertext(61), I=>
      ciphertext_dup_0(61));
   ciphertext_obuf_62 : OBUF port map ( O=>ciphertext(62), I=>
      ciphertext_dup_0(62));
   ciphertext_obuf_63 : OBUF port map ( O=>ciphertext(63), I=>
      ciphertext_dup_0(63));
   plaintext_ibuf_0 : IBUF port map ( O=>plaintext_int(0), I=>plaintext(0));
   plaintext_ibuf_1 : IBUF port map ( O=>plaintext_int(1), I=>plaintext(1));
   plaintext_ibuf_2 : IBUF port map ( O=>plaintext_int(2), I=>plaintext(2));
   plaintext_ibuf_3 : IBUF port map ( O=>plaintext_int(3), I=>plaintext(3));
   plaintext_ibuf_4 : IBUF port map ( O=>plaintext_int(4), I=>plaintext(4));
   plaintext_ibuf_5 : IBUF port map ( O=>plaintext_int(5), I=>plaintext(5));
   plaintext_ibuf_6 : IBUF port map ( O=>plaintext_int(6), I=>plaintext(6));
   plaintext_ibuf_7 : IBUF port map ( O=>plaintext_int(7), I=>plaintext(7));
   plaintext_ibuf_8 : IBUF port map ( O=>plaintext_int(8), I=>plaintext(8));
   plaintext_ibuf_9 : IBUF port map ( O=>plaintext_int(9), I=>plaintext(9));
   plaintext_ibuf_10 : IBUF port map ( O=>plaintext_int(10), I=>
      plaintext(10));
   plaintext_ibuf_11 : IBUF port map ( O=>plaintext_int(11), I=>
      plaintext(11));
   plaintext_ibuf_12 : IBUF port map ( O=>plaintext_int(12), I=>
      plaintext(12));
   plaintext_ibuf_13 : IBUF port map ( O=>plaintext_int(13), I=>
      plaintext(13));
   plaintext_ibuf_14 : IBUF port map ( O=>plaintext_int(14), I=>
      plaintext(14));
   plaintext_ibuf_15 : IBUF port map ( O=>plaintext_int(15), I=>
      plaintext(15));
   plaintext_ibuf_16 : IBUF port map ( O=>plaintext_int(16), I=>
      plaintext(16));
   plaintext_ibuf_17 : IBUF port map ( O=>plaintext_int(17), I=>
      plaintext(17));
   plaintext_ibuf_18 : IBUF port map ( O=>plaintext_int(18), I=>
      plaintext(18));
   plaintext_ibuf_19 : IBUF port map ( O=>plaintext_int(19), I=>
      plaintext(19));
   plaintext_ibuf_20 : IBUF port map ( O=>plaintext_int(20), I=>
      plaintext(20));
   plaintext_ibuf_21 : IBUF port map ( O=>plaintext_int(21), I=>
      plaintext(21));
   plaintext_ibuf_22 : IBUF port map ( O=>plaintext_int(22), I=>
      plaintext(22));
   plaintext_ibuf_23 : IBUF port map ( O=>plaintext_int(23), I=>
      plaintext(23));
   plaintext_ibuf_24 : IBUF port map ( O=>plaintext_int(24), I=>
      plaintext(24));
   plaintext_ibuf_25 : IBUF port map ( O=>plaintext_int(25), I=>
      plaintext(25));
   plaintext_ibuf_26 : IBUF port map ( O=>plaintext_int(26), I=>
      plaintext(26));
   plaintext_ibuf_27 : IBUF port map ( O=>plaintext_int(27), I=>
      plaintext(27));
   plaintext_ibuf_28 : IBUF port map ( O=>plaintext_int(28), I=>
      plaintext(28));
   plaintext_ibuf_29 : IBUF port map ( O=>plaintext_int(29), I=>
      plaintext(29));
   plaintext_ibuf_30 : IBUF port map ( O=>plaintext_int(30), I=>
      plaintext(30));
   plaintext_ibuf_31 : IBUF port map ( O=>plaintext_int(31), I=>
      plaintext(31));
   plaintext_ibuf_32 : IBUF port map ( O=>plaintext_int(32), I=>
      plaintext(32));
   plaintext_ibuf_33 : IBUF port map ( O=>plaintext_int(33), I=>
      plaintext(33));
   plaintext_ibuf_34 : IBUF port map ( O=>plaintext_int(34), I=>
      plaintext(34));
   plaintext_ibuf_35 : IBUF port map ( O=>plaintext_int(35), I=>
      plaintext(35));
   plaintext_ibuf_36 : IBUF port map ( O=>plaintext_int(36), I=>
      plaintext(36));
   plaintext_ibuf_37 : IBUF port map ( O=>plaintext_int(37), I=>
      plaintext(37));
   plaintext_ibuf_38 : IBUF port map ( O=>plaintext_int(38), I=>
      plaintext(38));
   plaintext_ibuf_39 : IBUF port map ( O=>plaintext_int(39), I=>
      plaintext(39));
   plaintext_ibuf_40 : IBUF port map ( O=>plaintext_int(40), I=>
      plaintext(40));
   plaintext_ibuf_41 : IBUF port map ( O=>plaintext_int(41), I=>
      plaintext(41));
   plaintext_ibuf_42 : IBUF port map ( O=>plaintext_int(42), I=>
      plaintext(42));
   plaintext_ibuf_43 : IBUF port map ( O=>plaintext_int(43), I=>
      plaintext(43));
   plaintext_ibuf_44 : IBUF port map ( O=>plaintext_int(44), I=>
      plaintext(44));
   plaintext_ibuf_45 : IBUF port map ( O=>plaintext_int(45), I=>
      plaintext(45));
   plaintext_ibuf_46 : IBUF port map ( O=>plaintext_int(46), I=>
      plaintext(46));
   plaintext_ibuf_47 : IBUF port map ( O=>plaintext_int(47), I=>
      plaintext(47));
   plaintext_ibuf_48 : IBUF port map ( O=>plaintext_int(48), I=>
      plaintext(48));
   plaintext_ibuf_49 : IBUF port map ( O=>plaintext_int(49), I=>
      plaintext(49));
   plaintext_ibuf_50 : IBUF port map ( O=>plaintext_int(50), I=>
      plaintext(50));
   plaintext_ibuf_51 : IBUF port map ( O=>plaintext_int(51), I=>
      plaintext(51));
   plaintext_ibuf_52 : IBUF port map ( O=>plaintext_int(52), I=>
      plaintext(52));
   plaintext_ibuf_53 : IBUF port map ( O=>plaintext_int(53), I=>
      plaintext(53));
   plaintext_ibuf_54 : IBUF port map ( O=>plaintext_int(54), I=>
      plaintext(54));
   plaintext_ibuf_55 : IBUF port map ( O=>plaintext_int(55), I=>
      plaintext(55));
   plaintext_ibuf_56 : IBUF port map ( O=>plaintext_int(56), I=>
      plaintext(56));
   plaintext_ibuf_57 : IBUF port map ( O=>plaintext_int(57), I=>
      plaintext(57));
   plaintext_ibuf_58 : IBUF port map ( O=>plaintext_int(58), I=>
      plaintext(58));
   plaintext_ibuf_59 : IBUF port map ( O=>plaintext_int(59), I=>
      plaintext(59));
   plaintext_ibuf_60 : IBUF port map ( O=>plaintext_int(60), I=>
      plaintext(60));
   plaintext_ibuf_61 : IBUF port map ( O=>plaintext_int(61), I=>
      plaintext(61));
   plaintext_ibuf_62 : IBUF port map ( O=>plaintext_int(62), I=>
      plaintext(62));
   plaintext_ibuf_63 : IBUF port map ( O=>plaintext_int(63), I=>
      plaintext(63));
   key_i_ibuf_0 : IBUF port map ( O=>key_i_int(0), I=>key_i(0));
   key_i_ibuf_1 : IBUF port map ( O=>key_i_int(1), I=>key_i(1));
   key_i_ibuf_2 : IBUF port map ( O=>key_i_int(2), I=>key_i(2));
   key_i_ibuf_3 : IBUF port map ( O=>key_i_int(3), I=>key_i(3));
   key_i_ibuf_4 : IBUF port map ( O=>key_i_int(4), I=>key_i(4));
   key_i_ibuf_5 : IBUF port map ( O=>key_i_int(5), I=>key_i(5));
   key_i_ibuf_6 : IBUF port map ( O=>key_i_int(6), I=>key_i(6));
   key_i_ibuf_7 : IBUF port map ( O=>key_i_int(7), I=>key_i(7));
   key_i_ibuf_8 : IBUF port map ( O=>key_i_int(8), I=>key_i(8));
   key_i_ibuf_9 : IBUF port map ( O=>key_i_int(9), I=>key_i(9));
   key_i_ibuf_10 : IBUF port map ( O=>key_i_int(10), I=>key_i(10));
   key_i_ibuf_11 : IBUF port map ( O=>key_i_int(11), I=>key_i(11));
   key_i_ibuf_12 : IBUF port map ( O=>key_i_int(12), I=>key_i(12));
   key_i_ibuf_13 : IBUF port map ( O=>key_i_int(13), I=>key_i(13));
   key_i_ibuf_14 : IBUF port map ( O=>key_i_int(14), I=>key_i(14));
   key_i_ibuf_15 : IBUF port map ( O=>key_i_int(15), I=>key_i(15));
   key_i_ibuf_16 : IBUF port map ( O=>key_i_int(16), I=>key_i(16));
   key_i_ibuf_17 : IBUF port map ( O=>key_i_int(17), I=>key_i(17));
   key_i_ibuf_18 : IBUF port map ( O=>key_i_int(18), I=>key_i(18));
   key_i_ibuf_19 : IBUF port map ( O=>key_i_int(19), I=>key_i(19));
   key_i_ibuf_20 : IBUF port map ( O=>key_i_int(20), I=>key_i(20));
   key_i_ibuf_21 : IBUF port map ( O=>key_i_int(21), I=>key_i(21));
   key_i_ibuf_22 : IBUF port map ( O=>key_i_int(22), I=>key_i(22));
   key_i_ibuf_23 : IBUF port map ( O=>key_i_int(23), I=>key_i(23));
   key_i_ibuf_24 : IBUF port map ( O=>key_i_int(24), I=>key_i(24));
   key_i_ibuf_25 : IBUF port map ( O=>key_i_int(25), I=>key_i(25));
   key_i_ibuf_26 : IBUF port map ( O=>key_i_int(26), I=>key_i(26));
   key_i_ibuf_27 : IBUF port map ( O=>key_i_int(27), I=>key_i(27));
   key_i_ibuf_28 : IBUF port map ( O=>key_i_int(28), I=>key_i(28));
   key_i_ibuf_29 : IBUF port map ( O=>key_i_int(29), I=>key_i(29));
   key_i_ibuf_30 : IBUF port map ( O=>key_i_int(30), I=>key_i(30));
   key_i_ibuf_31 : IBUF port map ( O=>key_i_int(31), I=>key_i(31));
   key_i_ibuf_32 : IBUF port map ( O=>key_i_int(32), I=>key_i(32));
   key_i_ibuf_33 : IBUF port map ( O=>key_i_int(33), I=>key_i(33));
   key_i_ibuf_34 : IBUF port map ( O=>key_i_int(34), I=>key_i(34));
   key_i_ibuf_35 : IBUF port map ( O=>key_i_int(35), I=>key_i(35));
   key_i_ibuf_36 : IBUF port map ( O=>key_i_int(36), I=>key_i(36));
   key_i_ibuf_37 : IBUF port map ( O=>key_i_int(37), I=>key_i(37));
   key_i_ibuf_38 : IBUF port map ( O=>key_i_int(38), I=>key_i(38));
   key_i_ibuf_39 : IBUF port map ( O=>key_i_int(39), I=>key_i(39));
   key_i_ibuf_40 : IBUF port map ( O=>key_i_int(40), I=>key_i(40));
   key_i_ibuf_41 : IBUF port map ( O=>key_i_int(41), I=>key_i(41));
   key_i_ibuf_42 : IBUF port map ( O=>key_i_int(42), I=>key_i(42));
   key_i_ibuf_43 : IBUF port map ( O=>key_i_int(43), I=>key_i(43));
   key_i_ibuf_44 : IBUF port map ( O=>key_i_int(44), I=>key_i(44));
   key_i_ibuf_45 : IBUF port map ( O=>key_i_int(45), I=>key_i(45));
   key_i_ibuf_46 : IBUF port map ( O=>key_i_int(46), I=>key_i(46));
   key_i_ibuf_47 : IBUF port map ( O=>key_i_int(47), I=>key_i(47));
   key_i_ibuf_48 : IBUF port map ( O=>key_i_int(48), I=>key_i(48));
   key_i_ibuf_49 : IBUF port map ( O=>key_i_int(49), I=>key_i(49));
   key_i_ibuf_50 : IBUF port map ( O=>key_i_int(50), I=>key_i(50));
   key_i_ibuf_51 : IBUF port map ( O=>key_i_int(51), I=>key_i(51));
   key_i_ibuf_52 : IBUF port map ( O=>key_i_int(52), I=>key_i(52));
   key_i_ibuf_53 : IBUF port map ( O=>key_i_int(53), I=>key_i(53));
   key_i_ibuf_54 : IBUF port map ( O=>key_i_int(54), I=>key_i(54));
   key_i_ibuf_55 : IBUF port map ( O=>key_i_int(55), I=>key_i(55));
   key_i_ibuf_56 : IBUF port map ( O=>key_i_int(56), I=>key_i(56));
   key_i_ibuf_57 : IBUF port map ( O=>key_i_int(57), I=>key_i(57));
   key_i_ibuf_58 : IBUF port map ( O=>key_i_int(58), I=>key_i(58));
   key_i_ibuf_59 : IBUF port map ( O=>key_i_int(59), I=>key_i(59));
   key_i_ibuf_60 : IBUF port map ( O=>key_i_int(60), I=>key_i(60));
   key_i_ibuf_61 : IBUF port map ( O=>key_i_int(61), I=>key_i(61));
   key_i_ibuf_62 : IBUF port map ( O=>key_i_int(62), I=>key_i(62));
   key_i_ibuf_63 : IBUF port map ( O=>key_i_int(63), I=>key_i(63));
   key_i_ibuf_64 : IBUF port map ( O=>key_i_int(64), I=>key_i(64));
   key_i_ibuf_65 : IBUF port map ( O=>key_i_int(65), I=>key_i(65));
   key_i_ibuf_66 : IBUF port map ( O=>key_i_int(66), I=>key_i(66));
   key_i_ibuf_67 : IBUF port map ( O=>key_i_int(67), I=>key_i(67));
   key_i_ibuf_68 : IBUF port map ( O=>key_i_int(68), I=>key_i(68));
   key_i_ibuf_69 : IBUF port map ( O=>key_i_int(69), I=>key_i(69));
   key_i_ibuf_70 : IBUF port map ( O=>key_i_int(70), I=>key_i(70));
   key_i_ibuf_71 : IBUF port map ( O=>key_i_int(71), I=>key_i(71));
   key_i_ibuf_72 : IBUF port map ( O=>key_i_int(72), I=>key_i(72));
   key_i_ibuf_73 : IBUF port map ( O=>key_i_int(73), I=>key_i(73));
   key_i_ibuf_74 : IBUF port map ( O=>key_i_int(74), I=>key_i(74));
   key_i_ibuf_75 : IBUF port map ( O=>key_i_int(75), I=>key_i(75));
   key_i_ibuf_76 : IBUF port map ( O=>key_i_int(76), I=>key_i(76));
   key_i_ibuf_77 : IBUF port map ( O=>key_i_int(77), I=>key_i(77));
   key_i_ibuf_78 : IBUF port map ( O=>key_i_int(78), I=>key_i(78));
   key_i_ibuf_79 : IBUF port map ( O=>key_i_int(79), I=>key_i(79));
   key_i_ibuf_80 : IBUF port map ( O=>key_i_int(80), I=>key_i(80));
   key_i_ibuf_81 : IBUF port map ( O=>key_i_int(81), I=>key_i(81));
   key_i_ibuf_82 : IBUF port map ( O=>key_i_int(82), I=>key_i(82));
   key_i_ibuf_83 : IBUF port map ( O=>key_i_int(83), I=>key_i(83));
   key_i_ibuf_84 : IBUF port map ( O=>key_i_int(84), I=>key_i(84));
   key_i_ibuf_85 : IBUF port map ( O=>key_i_int(85), I=>key_i(85));
   key_i_ibuf_86 : IBUF port map ( O=>key_i_int(86), I=>key_i(86));
   key_i_ibuf_87 : IBUF port map ( O=>key_i_int(87), I=>key_i(87));
   key_i_ibuf_88 : IBUF port map ( O=>key_i_int(88), I=>key_i(88));
   key_i_ibuf_89 : IBUF port map ( O=>key_i_int(89), I=>key_i(89));
   key_i_ibuf_90 : IBUF port map ( O=>key_i_int(90), I=>key_i(90));
   key_i_ibuf_91 : IBUF port map ( O=>key_i_int(91), I=>key_i(91));
   key_i_ibuf_92 : IBUF port map ( O=>key_i_int(92), I=>key_i(92));
   key_i_ibuf_93 : IBUF port map ( O=>key_i_int(93), I=>key_i(93));
   key_i_ibuf_94 : IBUF port map ( O=>key_i_int(94), I=>key_i(94));
   key_i_ibuf_95 : IBUF port map ( O=>key_i_int(95), I=>key_i(95));
   key_i_ibuf_96 : IBUF port map ( O=>key_i_int(96), I=>key_i(96));
   key_i_ibuf_97 : IBUF port map ( O=>key_i_int(97), I=>key_i(97));
   key_i_ibuf_98 : IBUF port map ( O=>key_i_int(98), I=>key_i(98));
   key_i_ibuf_99 : IBUF port map ( O=>key_i_int(99), I=>key_i(99));
   key_i_ibuf_100 : IBUF port map ( O=>key_i_int(100), I=>key_i(100));
   key_i_ibuf_101 : IBUF port map ( O=>key_i_int(101), I=>key_i(101));
   key_i_ibuf_102 : IBUF port map ( O=>key_i_int(102), I=>key_i(102));
   key_i_ibuf_103 : IBUF port map ( O=>key_i_int(103), I=>key_i(103));
   key_i_ibuf_104 : IBUF port map ( O=>key_i_int(104), I=>key_i(104));
   key_i_ibuf_105 : IBUF port map ( O=>key_i_int(105), I=>key_i(105));
   key_i_ibuf_106 : IBUF port map ( O=>key_i_int(106), I=>key_i(106));
   key_i_ibuf_107 : IBUF port map ( O=>key_i_int(107), I=>key_i(107));
   key_i_ibuf_108 : IBUF port map ( O=>key_i_int(108), I=>key_i(108));
   key_i_ibuf_109 : IBUF port map ( O=>key_i_int(109), I=>key_i(109));
   key_i_ibuf_110 : IBUF port map ( O=>key_i_int(110), I=>key_i(110));
   key_i_ibuf_111 : IBUF port map ( O=>key_i_int(111), I=>key_i(111));
   key_i_ibuf_112 : IBUF port map ( O=>key_i_int(112), I=>key_i(112));
   key_i_ibuf_113 : IBUF port map ( O=>key_i_int(113), I=>key_i(113));
   key_i_ibuf_114 : IBUF port map ( O=>key_i_int(114), I=>key_i(114));
   key_i_ibuf_115 : IBUF port map ( O=>key_i_int(115), I=>key_i(115));
   key_i_ibuf_116 : IBUF port map ( O=>key_i_int(116), I=>key_i(116));
   key_i_ibuf_117 : IBUF port map ( O=>key_i_int(117), I=>key_i(117));
   key_i_ibuf_118 : IBUF port map ( O=>key_i_int(118), I=>key_i(118));
   key_i_ibuf_119 : IBUF port map ( O=>key_i_int(119), I=>key_i(119));
   key_i_ibuf_120 : IBUF port map ( O=>key_i_int(120), I=>key_i(120));
   key_i_ibuf_121 : IBUF port map ( O=>key_i_int(121), I=>key_i(121));
   key_i_ibuf_122 : IBUF port map ( O=>key_i_int(122), I=>key_i(122));
   key_i_ibuf_123 : IBUF port map ( O=>key_i_int(123), I=>key_i(123));
   key_i_ibuf_124 : IBUF port map ( O=>key_i_int(124), I=>key_i(124));
   key_i_ibuf_125 : IBUF port map ( O=>key_i_int(125), I=>key_i(125));
   key_i_ibuf_126 : IBUF port map ( O=>key_i_int(126), I=>key_i(126));
   key_i_ibuf_127 : IBUF port map ( O=>key_i_int(127), I=>key_i(127));
   start_ibuf : IBUF port map ( O=>start_int, I=>start);
   nrst_ibuf : IBUF port map ( O=>nrst_int, I=>nrst);
   counter_map_modgen_counter_count_reg_q_5 : FDCE port map ( Q=>s_count(5), 
      C=>clk_int, CE=>nx16336z1, CLR=>counter_map_not_nrst, D=>nx16336z3);
   counter_map_modgen_counter_count_reg_q_4 : FDCE port map ( Q=>s_count(4), 
      C=>clk_int, CE=>nx16336z1, CLR=>counter_map_not_nrst, D=>nx15339z1);
   counter_map_modgen_counter_count_reg_q_3 : FDCE port map ( Q=>s_count(3), 
      C=>clk_int, CE=>nx16336z1, CLR=>counter_map_not_nrst, D=>nx14342z1);
   counter_map_modgen_counter_count_reg_q_2 : FDCE port map ( Q=>s_count(2), 
      C=>clk_int, CE=>nx16336z1, CLR=>counter_map_not_nrst, D=>nx13345z1);
   counter_map_modgen_counter_count_reg_q_1 : FDCE port map ( Q=>s_count(1), 
      C=>clk_int, CE=>nx16336z1, CLR=>counter_map_not_nrst, D=>nx12348z1);
   counter_map_modgen_counter_count_reg_q_0 : FDCE port map ( Q=>s_count(0), 
      C=>clk_int, CE=>nx16336z1, CLR=>counter_map_not_nrst, D=>nx11351z1);
   ix26479z1482 : LUT4
      generic map (INIT => X"00A8") 
       port map ( O=>done_dup_0, I0=>s_count(5), I1=>s_count(4), I2=>
      nx16336z2, I3=>start_int);
   ix22393z23705 : LUT4
      generic map (INIT => X"5777") 
       port map ( O=>nx22393z1, I0=>s_count(5), I1=>s_count(4), I2=>
      s_count(3), I3=>s_count(2));
   ix15339z1315 : LUT1
      generic map (INIT => X"1") 
       port map ( O=>counter_map_not_nrst, I0=>nrst_int);
   ix11351z1315 : LUT2
      generic map (INIT => X"1") 
       port map ( O=>nx11351z1, I0=>s_count(0), I1=>start_int);
   ix12348z1334 : LUT3
      generic map (INIT => X"14") 
       port map ( O=>nx12348z1, I0=>start_int, I1=>s_count(1), I2=>
      s_count(0));
   ix13345z1420 : LUT4
      generic map (INIT => X"006A") 
       port map ( O=>nx13345z1, I0=>s_count(2), I1=>s_count(1), I2=>
      s_count(0), I3=>start_int);
   ix14342z1480 : LUT4
      generic map (INIT => X"00A6") 
       port map ( O=>nx14342z1, I0=>s_count(3), I1=>s_count(2), I2=>
      nx14342z2, I3=>start_int);
   ix15339z1380 : LUT3
      generic map (INIT => X"41") 
       port map ( O=>nx15339z1, I0=>start_int, I1=>s_count(4), I2=>nx15339z2
   );
   ix16336z1482 : LUT4
      generic map (INIT => X"00A6") 
       port map ( O=>nx16336z3, I0=>s_count(5), I1=>s_count(4), I2=>
      nx15339z2, I3=>start_int);
   ix14342z1322 : LUT2
      generic map (INIT => X"7") 
       port map ( O=>nx14342z2, I0=>s_count(1), I1=>s_count(0));
   ix15339z34083 : LUT4
      generic map (INIT => X"7FFF") 
       port map ( O=>nx15339z2, I0=>s_count(3), I1=>s_count(2), I2=>
      s_count(1), I3=>s_count(0));
   ix16336z1323 : LUT2
      generic map (INIT => X"8") 
       port map ( O=>nx16336z2, I0=>s_count(3), I1=>s_count(2));
   ix16336z1145 : LUT4
      generic map (INIT => X"FF57") 
       port map ( O=>nx16336z1, I0=>s_count(5), I1=>s_count(4), I2=>
      nx16336z2, I3=>start_int);
   clk_ibuf : BUFGP port map ( O=>clk_int, I=>clk);
end rtl_top ;

