

param=zeros(53,1);
% Basis Stimuli
 param(1)= 0.000466988281946;
 param(2)= 0.004668836908630;
 param(3)= 0.041277347641782;
 param(4)= 0.000164962915229;
 param(5)= 0.060635070766417;
 param(6)= 0.002287271574592;
 param(7)= 0.005735783172162;
 param(8)= 0.002112937585666;
 param(9)= 0.009377630083262;
 BasisStim=param(1:9);
 
 
 
% Compliant Leg
 param(10)= 0.000284465532182668;
 param(11)= 0.000778987977161135;
 param(12)= 0.000270358298897194;
 CompliantLeg=param(10:12);
 
 
 % Prevent Knee Overextension
param(13)=   0.000089277706753;
param(14)=   1.845748566401275;
param(15)=   0.082456492647579;
param(16)=   0.783773696247458;
param(17)=   1.169770204813124;
param(18)=   0.001420038692239;
PreventKneeOverextension=param(13:18); 

% Balance Trunk
param(19)=   0.159928337005625;
param(20)=   0.130386389789699;
param(21)=   0.486184074319788;
param(22)=   0.128572131321746;
param(23)=   1.296062721553886;
BalanceTrunk=param(19:23);



% Flex Ankle 
param(24)=   0.144232954682183;
param(25)=  -0.136101612968966;
param(26)=   0.000239204064530;
FlexAnkle=param(24:26);


% Lateral Control
param(27)=   0.005061548668064;
param(28)=   0.001880952131348;
param(29)=   0.000073220761435;
param(30)=   3.562773360693282;
param(31)=   0.627534849109971;
param(32)=   0.357091904724399;
param(33)=   0.113432802906987;
param(34)=   1.295007406594453;
param(35)=   0.006093266691444;
LateralControl=param(27:35);


% Compensate Swing Leg
param(36)=  0.044768140516679;
param(37)=  0.012115370232484;
param(38)=  0.019844772128168;
param(39)=  0.057719336660499;
param(40)=  1.303837761265876;
CompensateSwing=param(36:40);

% Theta0
param(41)=-0.127747894780279;
theta0=param(41);

%Balance Equation
param(42)=   0.470750800780965;
param(43)=   0.173853178764041;
param(44)=   0.133702489179586;
param(45)=   0.309093426102650;
Balance02=param(42:45);


param(46)=    0.298492561015485;
param(47)=    0.196032366729759;
param(48)=    0.015519778212749;
param(49)=    0.343119300552458;
Balance13=param(46:49);


% Target Joint Angles
param(50)=0.4372;
param(51)=2.0394;
Target02=param(50:51);

param(52)=-0.2062;
param(53)=3.1154;
Target13=param(52:53);



 
