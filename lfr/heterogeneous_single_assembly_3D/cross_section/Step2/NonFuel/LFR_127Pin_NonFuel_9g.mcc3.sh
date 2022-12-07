#!/bin/bash
# ***************************************************************************************
# LFR 127-pin fuel assembly 
# Strategy: 
#          1) Homogenize each axial region of fuel assembly radially -> 1041g MCC3 infinite medium
#          2) Represent axial regions in TWODANT    -> 1041g RZMFLX
#          3) [Non-fuel regions] Collapse 1041g MCC3 infinite medium mixture with RZMFLX
#      **  4) [Fuel/Control] Collapse 1D MCC3 cylinder geometry with RZMFLX 
# ***************************************************************************************

lib=/software/MCC3
cp ../../Step1/LFR_InnerFuel_HOM_1041g_TWODANT.mcc3.sh.rzmflx rzmflx

cat > input << EOF
&library
     c_mcclibdir  ="$lib/lib.mcc.new"
     c_pwlibdir   ="$lib/lib.pw.200.new","."
/
&control
     c_group_structure       =ANL9
     i_number_region         =9
     c_geometry_type         =mixture
     i_scattering_order      =3
     c_externalspectrum_ufg  =rzmflx
/
&material

i_externalspectrum(1)=1
t_composition(:, 1)=
! A=Lower Core Plate (AISI 316, DS4-Wrapper, Pb)
FE54_7   FE54A   2.3571E-03   693.0
FE56_7   FE56A   3.7002E-02   693.0
FE57_7   FE57A   8.5453E-04   693.0
FE58_7   FE58A   1.1372E-04   693.0
NI58_7   NI58A   4.9645E-03   693.0
NI60_7   NI60A   1.9123E-03   693.0
NI61_7   NI61A   8.3135E-05   693.0
NI62_7   NI62A   2.6501E-04   693.0
NI64_7   NI64A   6.7529E-05   693.0
CR50_7   CR50A   4.6700E-04   693.0
CR52_7   CR52A   9.0056E-03   693.0
CR53_7   CR53A   1.0212E-03   693.0
CR54_7   CR54A   2.5419E-04   693.0
MN55_7   MN55A   6.8040E-04   693.0
MO92_7   MO92A   1.2088E-04   693.0
MO94_7   MO94A   7.5345E-05   693.0
MO95_7   MO95A   1.2968E-04   693.0
MO96_7   MO96A   1.3587E-04   693.0
MO97_7   MO97A   7.7789E-05   693.0
MO98_7   MO98A   1.9655E-04   693.0
MO1007   MO100A  7.8441E-05   693.0
SI28_7   SI28A   6.3469E-04   693.0
SI29_7   SI29A   3.2228E-05   693.0
SI30_7   SI30A   2.1245E-05   693.0
C____7   CA      1.4140E-04   693.0
P31__7   P31A    2.9631E-05   693.0
S32__7   S32A    1.5017E-05   693.0
S33__7   S33A    1.2022E-07   693.0
S34__7   S34A    6.7864E-07   693.0
S36__7   S36A    3.1638E-09   693.0
TI46_7   TI46A   4.3921E-06   693.0
TI47_7   TI47A   3.9608E-06   693.0
TI48_7   TI48A   3.9246E-05   693.0
TI49_7   TI49A   2.8801E-06   693.0
TI50_7   TI50A   2.7577E-06   693.0
V____7   VA      3.7518E-06   693.0
ZR90_7   ZR90A   1.0779E-06   693.0
ZR91_7   ZR91A   2.3507E-07   693.0
ZR92_7   ZR92A   3.5931E-07   693.0
ZR94_7   ZR94A   3.6413E-07   693.0
ZR96_7   ZR96A   5.8663E-08   693.0
W182_7   W182A   2.7550E-07   693.0
W183_7   W183A   1.4877E-07   693.0
W184_7   W184A   3.1979E-07   693.0
W186_7   W186A   2.9556E-07   693.0
CU63_7   CU63A   2.0804E-06   693.0
CU65_7   CU65A   9.2725E-07   693.0
CO59_7   CO59A   3.2430E-06   693.0
CA40_7   CA40A   4.6229E-06   693.0
CA42_7   CA42A   3.0854E-08   693.0
CA43_7   CA43A   6.4378E-09   693.0
CA44_7   CA44A   9.9476E-08   693.0
CA46_7   CA46A   1.9075E-10   693.0
CA48_7   CA48A   8.9176E-09   693.0
NB93_7   NB93A   1.0286E-06   693.0
N14__7   N14A    6.7973E-06   693.0
N15__7   N15A    2.5106E-08   693.0
AL27_7   AL27A   3.5417E-06   693.0
TA1817   TA181A  5.2812E-07   693.0
B10__7   B10A    7.0367E-07   693.0
B11__7   B11A    2.8324E-06   693.0
PB2047   PB204A  1.1702E-04   693.0
PB2067   PB206A  2.0144E-03   693.0
PB2077   PB207A  1.8472E-03   693.0
PB2087   PB208A  4.3799E-03   693.0

i_externalspectrum(2)=2
t_composition(:, 2)= 
! B=Inlet Wrapper (DS4-Wrapper, Pb)
FE54_7   FE54B   2.6147E-04   693.0
FE56_7   FE56B   4.1044E-03   693.0
FE57_7   FE57B   9.4790E-05   693.0
FE58_7   FE58B   1.2615E-05   693.0
NI58_7   NI58B   6.8720E-04   693.0
NI60_7   NI60B   2.6471E-04   693.0
NI61_7   NI61B   1.1508E-05   693.0
NI62_7   NI62B   3.6683E-05   693.0
NI64_7   NI64B   9.3475E-06   693.0
CR50_7   CR50B   4.6316E-05   693.0
CR52_7   CR52B   8.9315E-04   693.0
CR53_7   CR53B   1.0128E-04   693.0
CR54_7   CR54B   2.5210E-05   693.0
MN55_7   MN55B   1.0437E-04   693.0
MO92_7   MO92B   8.8679E-06   693.0
MO94_7   MO94B   5.5275E-06   693.0
MO95_7   MO95B   9.5133E-06   693.0
MO96_7   MO96B   9.9675E-06   693.0
MO97_7   MO97B   5.7068E-06   693.0
MO98_7   MO98B   1.4419E-05   693.0
MO1007   MO100B  5.7546E-06   693.0
SI28_7   SI28B   1.0670E-04   693.0
SI29_7   SI29B   5.4179E-06   693.0
SI30_7   SI30B   3.5715E-06   693.0
C____7   CB      2.8642E-05   693.0
P31__7   P31B    5.5534E-06   693.0
S32__7   S32B    1.6977E-06   693.0
S33__7   S33B    1.3592E-08   693.0
S34__7   S34B    7.6723E-08   693.0
S36__7   S36B    3.5768E-10   693.0
TI46_7   TI46B   2.6352E-06   693.0
TI47_7   TI47B   2.3765E-06   693.0
TI48_7   TI48B   2.3548E-05   693.0
TI49_7   TI49B   1.7281E-06   693.0
TI50_7   TI50B   1.6546E-06   693.0
V____7   VB      2.2511E-06   693.0
ZR90_7   ZR90B   6.4675E-07   693.0
ZR91_7   ZR91B   1.4104E-07   693.0
ZR92_7   ZR92B   2.1558E-07   693.0
ZR94_7   ZR94B   2.1848E-07   693.0
ZR96_7   ZR96B   3.5198E-08   693.0
W182_7   W182B   1.6530E-07   693.0
W183_7   W183B   8.9261E-08   693.0
W184_7   W184B   1.9187E-07   693.0
W186_7   W186B   1.7734E-07   693.0
CU63_7   CU63B   1.2482E-06   693.0
CU65_7   CU65B   5.5635E-07   693.0
CO59_7   CO59B   1.9458E-06   693.0
CA40_7   CA40B   2.7737E-06   693.0
CA42_7   CA42B   1.8512E-08   693.0
CA43_7   CA43B   3.8627E-09   693.0
CA44_7   CA44B   5.9686E-08   693.0
CA46_7   CA46B   1.1445E-10   693.0
CA48_7   CA48B   5.3506E-09   693.0
NB93_7   NB93B   6.1715E-07   693.0
N14__7   N14B    4.0784E-06   693.0
N15__7   N15B    1.5064E-08   693.0
AL27_7   AL27B   2.1250E-06   693.0
TA1817   TA181B  3.1687E-07   693.0
B10__7   B10B    4.2220E-07   693.0
B11__7   B11B    1.6994E-06   693.0
PB2047   PB204B  3.8856E-04   693.0
PB2067   PB206B  6.6887E-03   693.0
PB2077   PB207B  6.1336E-03   693.0
PB2087   PB208B  1.4543E-02   693.0

i_externalspectrum(3)=3
t_composition(:, 3)=  
! C=Lower Bundle Grid and Pins Plug (DS4-Wrapper, DS4-Clad, Pb)
FE54_7   FE54C   1.2517E-03   693.0
FE56_7   FE56C   1.9649E-02   693.0
FE57_7   FE57C   4.5378E-04   693.0
FE58_7   FE58C   6.0390E-05   693.0
NI58_7   NI58C   3.2898E-03   693.0
NI60_7   NI60C   1.2672E-03   693.0
NI61_7   NI61C   5.5090E-05   693.0
NI62_7   NI62C   1.7561E-04   693.0
NI64_7   NI64C   4.4748E-05   693.0
CR50_7   CR50C   2.2172E-04   693.0
CR52_7   CR52C   4.2757E-03   693.0
CR53_7   CR53C   4.8483E-04   693.0
CR54_7   CR54C   1.2068E-04   693.0
MN55_7   MN55C   4.9962E-04   693.0
MO92_7   MO92C   4.2453E-05   693.0
MO94_7   MO94C   2.6461E-05   693.0
MO95_7   MO95C   4.5542E-05   693.0
MO96_7   MO96C   4.7716E-05   693.0
MO97_7   MO97C   2.7320E-05   693.0
MO98_7   MO98C   6.9028E-05   693.0
MO1007   MO100C  2.7548E-05   693.0
SI28_7   SI28C   5.1079E-04   693.0
SI29_7   SI29C   2.5937E-05   693.0
SI30_7   SI30C   1.7098E-05   693.0
C____7   CC      1.3712E-04   693.0
P31__7   P31C    2.6585E-05   693.0
S32__7   S32C    8.1275E-06   693.0
S33__7   S33C    6.5068E-08   693.0
S34__7   S34C    3.6729E-07   693.0
S36__7   S36C    1.7123E-09   693.0
TI46_7   TI46C   1.2615E-05   693.0
TI47_7   TI47C   1.1377E-05   693.0
TI48_7   TI48C   1.1273E-04   693.0
TI49_7   TI49C   8.2727E-06   693.0
TI50_7   TI50C   7.9210E-06   693.0
V____7   VC      1.0776E-05   693.0
ZR90_7   ZR90C   3.0962E-06   693.0
ZR91_7   ZR91C   6.7520E-07   693.0
ZR92_7   ZR92C   1.0321E-06   693.0
ZR94_7   ZR94C   1.0459E-06   693.0
ZR96_7   ZR96C   1.6850E-07   693.0
W182_7   W182C   7.9132E-07   693.0
W183_7   W183C   4.2731E-07   693.0
W184_7   W184C   9.1853E-07   693.0
W186_7   W186C   8.4895E-07   693.0
CU63_7   CU63C   5.9755E-06   693.0
CU65_7   CU65C   2.6634E-06   693.0
CO59_7   CO59C   9.3151E-06   693.0
CA40_7   CA40C   1.3278E-05   693.0
CA42_7   CA42C   8.8623E-08   693.0
CA43_7   CA43C   1.8492E-08   693.0
CA44_7   CA44C   2.8573E-07   693.0
CA46_7   CA46C   5.4790E-10   693.0
CA48_7   CA48C   2.5614E-08   693.0
NB93_7   NB93C   2.9544E-06   693.0
N14__7   N14C    1.9524E-05   693.0
N15__7   N15C    7.2114E-08   693.0
AL27_7   AL27C   1.0173E-05   693.0
TA1817   TA181C  1.5169E-06   693.0
B10__7   B10C    2.0212E-06   693.0
B11__7   B11C    8.1355E-06   693.0
PB2047   PB204C  2.5702E-04   693.0
PB2067   PB206C  4.4244E-03   693.0
PB2077   PB207C  4.0572E-03   693.0
PB2087   PB208C  9.6199E-03   693.0

i_externalspectrum(4)=4
t_composition(:, 4)=  
! D=Lower Gas Plenum (tube) (DS4-Wrapper, DS4-Clad, Helium, Pb)
FE54_7   FE54D   9.7769E-04   693.0
FE56_7   FE56D   1.5348E-02   693.0
FE57_7   FE57D   3.5445E-04   693.0
FE58_7   FE58D   4.7170E-05   693.0
NI58_7   NI58D   2.5696E-03   693.0
NI60_7   NI60D   9.8982E-04   693.0
NI61_7   NI61D   4.3031E-05   693.0
NI62_7   NI62D   1.3717E-04   693.0
NI64_7   NI64D   3.4953E-05   693.0
CR50_7   CR50D   1.7319E-04   693.0
CR52_7   CR52D   3.3398E-03   693.0
CR53_7   CR53D   3.7870E-04   693.0
CR54_7   CR54D   9.4267E-05   693.0
MN55_7   MN55D   3.9025E-04   693.0
MO92_7   MO92D   3.3160E-05   693.0
MO94_7   MO94D   2.0669E-05   693.0
MO95_7   MO95D   3.5573E-05   693.0
MO96_7   MO96D   3.7271E-05   693.0
MO97_7   MO97D   2.1339E-05   693.0
MO98_7   MO98D   5.3918E-05   693.0
MO1007   MO100D  2.1518E-05   693.0
SI28_7   SI28D   3.9897E-04   693.0
SI29_7   SI29D   2.0259E-05   693.0
SI30_7   SI30D   1.3355E-05   693.0
C____7   CD      1.0710E-04   693.0
P31__7   P31D    2.0766E-05   693.0
S32__7   S32D    6.3484E-06   693.0
S33__7   S33D    5.0824E-08   693.0
S34__7   S34D    2.8689E-07   693.0
S36__7   S36D    1.3375E-09   693.0
TI46_7   TI46D   9.8539E-06   693.0
TI47_7   TI47D   8.8864E-06   693.0
TI48_7   TI48D   8.8052E-05   693.0
TI49_7   TI49D   6.4618E-06   693.0
TI50_7   TI50D   6.1870E-06   693.0
V____7   VD      8.4174E-06   693.0
ZR90_7   ZR90D   2.4184E-06   693.0
ZR91_7   ZR91D   5.2739E-07   693.0
ZR92_7   ZR92D   8.0613E-07   693.0
ZR94_7   ZR94D   8.1694E-07   693.0
ZR96_7   ZR96D   1.3161E-07   693.0
W182_7   W182D   6.1810E-07   693.0
W183_7   W183D   3.3377E-07   693.0
W184_7   W184D   7.1746E-07   693.0
W186_7   W186D   6.6311E-07   693.0
CU63_7   CU63D   4.6675E-06   693.0
CU65_7   CU65D   2.0804E-06   693.0
CO59_7   CO59D   7.2760E-06   693.0
CA40_7   CA40D   1.0372E-05   693.0
CA42_7   CA42D   6.9223E-08   693.0
CA43_7   CA43D   1.4444E-08   693.0
CA44_7   CA44D   2.2318E-07   693.0
CA46_7   CA46D   4.2796E-10   693.0
CA48_7   CA48D   2.0007E-08   693.0
NB93_7   NB93D   2.3077E-06   693.0
N14__7   N14D    1.5250E-05   693.0
N15__7   N15D    5.6328E-08   693.0
AL27_7   AL27D   7.9461E-06   693.0
TA1817   TA181D  1.1849E-06   693.0
B10__7   B10D    1.5787E-06   693.0
B11__7   B11D    6.3546E-06   693.0
HE4__7   HE4D    6.8773E-06   693.0
PB2047   PB204D  1.7712E-04   693.0
PB2067   PB206D  3.0489E-03   693.0
PB2077   PB207D  2.7959E-03   693.0
PB2087   PB208D  6.6292E-03   693.0

i_externalspectrum(5)=5
t_composition(:, 5)=  
! E=Lower thermal insulator (DS4-Wrapper, DS4-Clad, Helium, Pb, YSZ)
FE54_7   FE54E   7.5276E-04   693.0
FE56_7   FE56E   1.1817E-02   693.0
FE57_7   FE57E   2.7290E-04   693.0
FE58_7   FE58E   3.6318E-05   693.0
NI58_7   NI58E   1.9785E-03   693.0
NI60_7   NI60E   7.6209E-04   693.0
NI61_7   NI61E   3.3131E-05   693.0
NI62_7   NI62E   1.0561E-04   693.0
NI64_7   NI64E   2.6911E-05   693.0
CR50_7   CR50E   1.3334E-04   693.0
CR52_7   CR52E   2.5714E-03   693.0
CR53_7   CR53E   2.9157E-04   693.0
CR54_7   CR54E   7.2579E-05   693.0
MN55_7   MN55E   3.0047E-04   693.0
MO92_7   MO92E   2.5531E-05   693.0
MO94_7   MO94E   1.5914E-05   693.0
MO95_7   MO95E   2.7389E-05   693.0
MO96_7   MO96E   2.8696E-05   693.0
MO97_7   MO97E   1.6430E-05   693.0
MO98_7   MO98E   4.1513E-05   693.0
MO1007   MO100E  1.6567E-05   693.0
SI28_7   SI28E   3.0718E-04   693.0
SI29_7   SI29E   1.5598E-05   693.0
SI30_7   SI30E   1.0282E-05   693.0
C____7   CE      8.2461E-05   693.0
P31__7   P31E    1.5988E-05   693.0
S32__7   S32E    4.8878E-06   693.0
S33__7   S33E    3.9131E-08   693.0
S34__7   S34E    2.2089E-07   693.0
S36__7   S36E    1.0298E-09   693.0
TI46_7   TI46E   7.5868E-06   693.0
TI47_7   TI47E   6.8419E-06   693.0
TI48_7   TI48E   6.7794E-05   693.0
TI49_7   TI49E   4.9751E-06   693.0
TI50_7   TI50E   4.7636E-06   693.0
V____7   VE      6.4809E-06   693.0
ZR90_7   ZR90E   3.8368E-03   693.0
ZR91_7   ZR91E   8.3671E-04   693.0
ZR92_7   ZR92E   1.2789E-03   693.0
ZR94_7   ZR94E   1.2961E-03   693.0
ZR96_7   ZR96E   2.0880E-04   693.0
W182_7   W182E   4.7589E-07   693.0
W183_7   W183E   2.5698E-07   693.0
W184_7   W184E   5.5240E-07   693.0
W186_7   W186E   5.1055E-07   693.0
CU63_7   CU63E   3.5936E-06   693.0
CU65_7   CU65E   1.6017E-06   693.0
CO59_7   CO59E   5.6020E-06   693.0
CA40_7   CA40E   7.9856E-06   693.0
CA42_7   CA42E   5.3297E-08   693.0
CA43_7   CA43E   1.1121E-08   693.0
CA44_7   CA44E   1.7184E-07   693.0
CA46_7   CA46E   3.2950E-10   693.0
CA48_7   CA48E   1.5404E-08   693.0
NB93_7   NB93E   1.7768E-06   693.0
N14__7   N14E    1.1742E-05   693.0
N15__7   N15E    4.3369E-08   693.0
AL27_7   AL27E   6.1180E-06   693.0
TA1817   TA181E  9.1226E-07   693.0
B10__7   B10E    1.2155E-06   693.0
B11__7   B11E    4.8926E-06   693.0
HE4__7   HE4E    8.2368E-07   693.0
PB2047   PB204E  1.7712E-04   693.0
PB2067   PB206E  3.0489E-03   693.0
PB2077   PB207E  2.7959E-03   693.0
PB2087   PB208E  6.6292E-03   693.0
Y89__7   Y89E    1.2963E-03   693.0
O16__7   O16E    1.6852E-02   693.0

! Removed fuel since the 1D cross sections are collapsed with RZMFLX rather than the homogeneous ones
i_externalspectrum(6)=7    ! numbering is offset due to removal of composition 6
t_composition(:, 6)=  
! G=Upper thermal insulator (DS4-Wrapper, DS4-Clad, Helium, Pb, YSZ)
FE54_7   FE54G   7.5276E-04   923.0
FE56_7   FE56G   1.1817E-02   923.0
FE57_7   FE57G   2.7290E-04   923.0
FE58_7   FE58G   3.6318E-05   923.0
NI58_7   NI58G   1.9785E-03   923.0
NI60_7   NI60G   7.6209E-04   923.0
NI61_7   NI61G   3.3131E-05   923.0
NI62_7   NI62G   1.0561E-04   923.0
NI64_7   NI64G   2.6911E-05   923.0
CR50_7   CR50G   1.3334E-04   923.0
CR52_7   CR52G   2.5714E-03   923.0
CR53_7   CR53G   2.9157E-04   923.0
CR54_7   CR54G   7.2579E-05   923.0
MN55_7   MN55G   3.0047E-04   923.0
MO92_7   MO92G   2.5531E-05   923.0
MO94_7   MO94G   1.5914E-05   923.0
MO95_7   MO95G   2.7389E-05   923.0
MO96_7   MO96G   2.8696E-05   923.0
MO97_7   MO97G   1.6430E-05   923.0
MO98_7   MO98G   4.1513E-05   923.0
MO1007   MO100G  1.6567E-05   923.0
SI28_7   SI28G   3.0718E-04   923.0
SI29_7   SI29G   1.5598E-05   923.0
SI30_7   SI30G   1.0282E-05   923.0
C____7   CG      8.2461E-05   923.0
P31__7   P31G    1.5988E-05   923.0
S32__7   S32G    4.8878E-06   923.0
S33__7   S33G    3.9131E-08   923.0
S34__7   S34G    2.2089E-07   923.0
S36__7   S36G    1.0298E-09   923.0
TI46_7   TI46G   7.5868E-06   923.0
TI47_7   TI47G   6.8419E-06   923.0
TI48_7   TI48G   6.7794E-05   923.0
TI49_7   TI49G   4.9751E-06   923.0
TI50_7   TI50G   4.7636E-06   923.0
V____7   VG      6.4809E-06   923.0
ZR90_7   ZR90G   3.8368E-03   923.0
ZR91_7   ZR91G   8.3671E-04   923.0
ZR92_7   ZR92G   1.2789E-03   923.0
ZR94_7   ZR94G   1.2961E-03   923.0
ZR96_7   ZR96G   2.0880E-04   923.0
W182_7   W182G   4.7589E-07   923.0
W183_7   W183G   2.5698E-07   923.0
W184_7   W184G   5.5240E-07   923.0
W186_7   W186G   5.1055E-07   923.0
CU63_7   CU63G   3.5936E-06   923.0
CU65_7   CU65G   1.6017E-06   923.0
CO59_7   CO59G   5.6020E-06   923.0
CA40_7   CA40G   7.9856E-06   923.0
CA42_7   CA42G   5.3297E-08   923.0
CA43_7   CA43G   1.1121E-08   923.0
CA44_7   CA44G   1.7184E-07   923.0
CA46_7   CA46G   3.2950E-10   923.0
CA48_7   CA48G   1.5404E-08   923.0
NB93_7   NB93G   1.7768E-06   923.0
N14__7   N14G    1.1742E-05   923.0
N15__7   N15G    4.3369E-08   923.0
AL27_7   AL27G   6.1180E-06   923.0
TA1817   TA181G  9.1226E-07   923.0
B10__7   B10G    1.2155E-06   923.0
B11__7   B11G    4.8926E-06   923.0
HE4__7   HE4G    8.2368E-07   923.0
PB2047   PB204G  1.7712E-04   923.0
PB2067   PB206G  3.0489E-03   923.0
PB2077   PB207G  2.7959E-03   923.0
PB2087   PB208G  6.6292E-03   923.0
Y89__7   Y89G    1.2963E-03   923.0
O16__7   O16G    1.6852E-02   923.0

i_externalspectrum(7)=8
t_composition(:, 7)=  
! H=Upper gas plenum (spring) (DS4-Wrapper, DS4-Clad, Helium, Pb)
FE54_7   FE54H   8.7383E-04   923.0
FE56_7   FE56H   1.3717E-02   923.0
FE57_7   FE57H   3.1679E-04   923.0
FE58_7   FE58H   4.2159E-05   923.0
NI58_7   NI58H   2.2967E-03   923.0
NI60_7   NI60H   8.8466E-04   923.0
NI61_7   NI61H   3.8459E-05   923.0
NI62_7   NI62H   1.2260E-04   923.0
NI64_7   NI64H   3.1240E-05   923.0
CR50_7   CR50H   1.5479E-04   923.0
CR52_7   CR52H   2.9850E-03   923.0
CR53_7   CR53H   3.3847E-04   923.0
CR54_7   CR54H   8.4252E-05   923.0
MN55_7   MN55H   3.4880E-04   923.0
MO92_7   MO92H   2.9637E-05   923.0
MO94_7   MO94H   1.8473E-05   923.0
MO95_7   MO95H   3.1794E-05   923.0
MO96_7   MO96H   3.3312E-05   923.0
MO97_7   MO97H   1.9072E-05   923.0
MO98_7   MO98H   4.8190E-05   923.0
MO1007   MO100H  1.9232E-05   923.0
SI28_7   SI28H   3.5659E-04   923.0
SI29_7   SI29H   1.8107E-05   923.0
SI30_7   SI30H   1.1936E-05   923.0
C____7   CH      9.5723E-05   923.0
P31__7   P31H    1.8560E-05   923.0
S32__7   S32H    5.6739E-06   923.0
S33__7   S33H    4.5425E-08   923.0
S34__7   S34H    2.5641E-07   923.0
S36__7   S36H    1.1954E-09   923.0
TI46_7   TI46H   8.8071E-06   923.0
TI47_7   TI47H   7.9424E-06   923.0
TI48_7   TI48H   7.8698E-05   923.0
TI49_7   TI49H   5.7753E-06   923.0
TI50_7   TI50H   5.5298E-06   923.0
V____7   VH      7.5232E-06   923.0
ZR90_7   ZR90H   2.1615E-06   923.0
ZR91_7   ZR91H   4.7137E-07   923.0
ZR92_7   ZR92H   7.2049E-07   923.0
ZR94_7   ZR94H   7.3016E-07   923.0
ZR96_7   ZR96H   1.1763E-07   923.0
W182_7   W182H   5.5243E-07   923.0
W183_7   W183H   2.9831E-07   923.0
W184_7   W184H   6.4124E-07   923.0
W186_7   W186H   5.9267E-07   923.0
CU63_7   CU63H   4.1716E-06   923.0
CU65_7   CU65H   1.8593E-06   923.0
CO59_7   CO59H   6.5030E-06   923.0
CA40_7   CA40H   9.2699E-06   923.0
CA42_7   CA42H   6.1869E-08   923.0
CA43_7   CA43H   1.2909E-08   923.0
CA44_7   CA44H   1.9947E-07   923.0
CA46_7   CA46H   3.8250E-10   923.0
CA48_7   CA48H   1.7882E-08   923.0
NB93_7   NB93H   2.0625E-06   923.0
N14__7   N14H    1.3630E-05   923.0
N15__7   N15H    5.0344E-08   923.0
AL27_7   AL27H   7.1020E-06   923.0
TA1817   TA181H  1.0590E-06   923.0
B10__7   B10H    1.4110E-06   923.0
B11__7   B11H    5.6795E-06   923.0
HE4__7   HE4H    7.6960E-06   923.0
PB2047   PB204H  1.7712E-04   923.0
PB2067   PB206H  3.0489E-03   923.0
PB2077   PB207H  2.7959E-03   923.0
PB2087   PB208H  6.6292E-03   923.0

i_externalspectrum(8)=9
t_composition(:,8)= 
! I=Upper Bundle Grid and Pins Plug (DS4-Wrapper, DS4-Clad, Pb)
FE54_7   FE54I   1.2517E-03   923.0
FE56_7   FE56I   1.9649E-02   923.0
FE57_7   FE57I   4.5378E-04   923.0
FE58_7   FE58I   6.0390E-05   923.0
NI58_7   NI58I   3.2898E-03   923.0
NI60_7   NI60I   1.2672E-03   923.0
NI61_7   NI61I   5.5090E-05   923.0
NI62_7   NI62I   1.7561E-04   923.0
NI64_7   NI64I   4.4748E-05   923.0
CR50_7   CR50I   2.2172E-04   923.0
CR52_7   CR52I   4.2757E-03   923.0
CR53_7   CR53I   4.8483E-04   923.0
CR54_7   CR54I   1.2068E-04   923.0
MN55_7   MN55I   4.9962E-04   923.0
MO92_7   MO92I   4.2453E-05   923.0
MO94_7   MO94I   2.6461E-05   923.0
MO95_7   MO95I   4.5542E-05   923.0
MO96_7   MO96I   4.7716E-05   923.0
MO97_7   MO97I   2.7320E-05   923.0
MO98_7   MO98I   6.9028E-05   923.0
MO1007   MO100I  2.7548E-05   923.0
SI28_7   SI28I   5.1079E-04   923.0
SI29_7   SI29I   2.5937E-05   923.0
SI30_7   SI30I   1.7098E-05   923.0
C____7   CI      1.3712E-04   923.0
P31__7   P31I    2.6585E-05   923.0
S32__7   S32I    8.1275E-06   923.0
S33__7   S33I    6.5068E-08   923.0
S34__7   S34I    3.6729E-07   923.0
S36__7   S36I    1.7123E-09   923.0
TI46_7   TI46I   1.2615E-05   923.0
TI47_7   TI47I   1.1377E-05   923.0
TI48_7   TI48I   1.1273E-04   923.0
TI49_7   TI49I   8.2727E-06   923.0
TI50_7   TI50I   7.9210E-06   923.0
V____7   VI      1.0776E-05   923.0
ZR90_7   ZR90I   3.0962E-06   923.0
ZR91_7   ZR91I   6.7520E-07   923.0
ZR92_7   ZR92I   1.0321E-06   923.0
ZR94_7   ZR94I   1.0459E-06   923.0
ZR96_7   ZR96I   1.6850E-07   923.0
W182_7   W182I   7.9132E-07   923.0
W183_7   W183I   4.2731E-07   923.0
W184_7   W184I   9.1853E-07   923.0
W186_7   W186I   8.4895E-07   923.0
CU63_7   CU63I   5.9755E-06   923.0
CU65_7   CU65I   2.6634E-06   923.0
CO59_7   CO59I   9.3151E-06   923.0
CA40_7   CA40I   1.3278E-05   923.0
CA42_7   CA42I   8.8623E-08   923.0
CA43_7   CA43I   1.8492E-08   923.0
CA44_7   CA44I   2.8573E-07   923.0
CA46_7   CA46I   5.4790E-10   923.0
CA48_7   CA48I   2.5614E-08   923.0
NB93_7   NB93I   2.9544E-06   923.0
N14__7   N14I    1.9524E-05   923.0
N15__7   N15I    7.2114E-08   923.0
AL27_7   AL27I   1.0173E-05   923.0
TA1817   TA181I  1.5169E-06   923.0
B10__7   B10I    2.0212E-06   923.0
B11__7   B11I    8.1355E-06   923.0
PB2047   PB204I  2.5702E-04   923.0
PB2067   PB206I  4.4244E-03   923.0
PB2077   PB207I  4.0572E-03   923.0
PB2087   PB208I  9.6199E-03   923.0

i_externalspectrum(9)=10
t_composition(:, 9)= 
! J=Outlet Wrapper (DS4-Wrapper, Pb)
FE54_7   FE54J   7.6045E-04   923.0
FE56_7   FE56J   1.1937E-02   923.0
FE57_7   FE57J   2.7569E-04   923.0
FE58_7   FE58J   3.6689E-05   923.0
NI58_7   NI58J   1.9987E-03   923.0
NI60_7   NI60J   7.6988E-04   923.0
NI61_7   NI61J   3.3469E-05   923.0
NI62_7   NI62J   1.0669E-04   923.0
NI64_7   NI64J   2.7186E-05   923.0
CR50_7   CR50J   1.3471E-04   923.0
CR52_7   CR52J   2.5977E-03   923.0
CR53_7   CR53J   2.9456E-04   923.0
CR54_7   CR54J   7.3321E-05   923.0
MN55_7   MN55J   3.0354E-04   923.0
MO92_7   MO92J   2.5792E-05   923.0
MO94_7   MO94J   1.6076E-05   923.0
MO95_7   MO95J   2.7669E-05   923.0
MO96_7   MO96J   2.8990E-05   923.0
MO97_7   MO97J   1.6598E-05   923.0
MO98_7   MO98J   4.1938E-05   923.0
MO1007   MO100J  1.6737E-05   923.0
SI28_7   SI28J   3.1032E-04   923.0
SI29_7   SI29J   1.5757E-05   923.0
SI30_7   SI30J   1.0387E-05   923.0
C____7   CJ      8.3303E-05   923.0
P31__7   P31J    1.6152E-05   923.0
S32__7   S32J    4.9378E-06   923.0
S33__7   S33J    3.9531E-08   923.0
S34__7   S34J    2.2314E-07   923.0
S36__7   S36J    1.0403E-09   923.0
TI46_7   TI46J   7.6644E-06   923.0
TI47_7   TI47J   6.9119E-06   923.0
TI48_7   TI48J   6.8487E-05   923.0
TI49_7   TI49J   5.0260E-06   923.0
TI50_7   TI50J   4.8123E-06   923.0
V____7   VJ      6.5471E-06   923.0
ZR90_7   ZR90J   1.8810E-06   923.0
ZR91_7   ZR91J   4.1021E-07   923.0
ZR92_7   ZR92J   6.2701E-07   923.0
ZR94_7   ZR94J   6.3542E-07   923.0
ZR96_7   ZR96J   1.0237E-07   923.0
W182_7   W182J   4.8076E-07   923.0
W183_7   W183J   2.5961E-07   923.0
W184_7   W184J   5.5804E-07   923.0
W186_7   W186J   5.1577E-07   923.0
CU63_7   CU63J   3.6304E-06   923.0
CU65_7   CU65J   1.6181E-06   923.0
CO59_7   CO59J   5.6593E-06   923.0
CA40_7   CA40J   8.0672E-06   923.0
CA42_7   CA42J   5.3842E-08   923.0
CA43_7   CA43J   1.1234E-08   923.0
CA44_7   CA44J   1.7359E-07   923.0
CA46_7   CA46J   3.3287E-10   923.0
CA48_7   CA48J   1.5562E-08   923.0
NB93_7   NB93J   1.7949E-06   923.0
N14__7   N14J    1.1862E-05   923.0
N15__7   N15J    4.3812E-08   923.0
AL27_7   AL27J   6.1805E-06   923.0
TA1817   TA181J  9.2159E-07   923.0
B10__7   B10J    1.2279E-06   923.0
B11__7   B11J    4.9426E-06   923.0
PB2047   PB204J  3.2241E-04   923.0
PB2067   PB206J  5.5500E-03   923.0
PB2077   PB207J  5.0894E-03   923.0
PB2087   PB208J  1.2067E-02   923.0

/
EOF

################################################
# End of the MCC3 input file
################################################
# $lib/mcc3.x
~/codes/mcc3/src/mcc3.x

mv ISOTXS.merged          $0.ISOTXS