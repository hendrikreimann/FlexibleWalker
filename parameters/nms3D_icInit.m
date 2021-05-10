
%% R. Ramadan 23.4.2019
%% Set initial conditions for the model with base at the trunk. The values
%% are converted from the H.Geyer 2015 model which has its base at the foot


ICs.lLeg.ankle.qP0             = paramIC(2)   	*100*pi/180; %[rad]
ICs.lLeg.knee.qP0             = paramIC(3)   	*180*pi/180; %[rad]
ICs.lLeg.hip.qP0             = paramIC(4) 	*165*pi/180; %[rad]
ICs.lLeg.hip.qR0            = paramIC(8)*(-1)*pi/180;

% Right leg
ICs.rLeg.ankle.qP0=pi/2-0.2;
ICs.rLeg.knee.qP0             = paramIC(6)  	*165*pi/180; %[rad]
ICs.rLeg.hip.qP0             = paramIC(7)   	*200*pi/180; %[rad]
ICs.rLeg.hip.qR0            = paramIC(9)*(-1)*pi/180;


%ICs.rLeg.ankle.qP0             = 0.181; %[rad]
%ICs.rLeg.knee.qP0             = 1.267; %[rad]
%ICs.rLeg.hip.qP0             =0.6682; %[rad]
%ICs.rLeg.hip.qR0            = 0.06853;


ICs.state0.vx0 = paramIC(1)  	*1.3; %[m/s] 
ICs.state0.vy0 = paramIC(10)*.2;
ICs.state0.x0  = .2;
ICs.state0.y0  = .1;
ICs.state0.z0  = paramIC(11)      *.01;
ICs.state0.yaw0 = 0*pi/180;
ICs.state0.roll0  = (-1)*pi/180;



ICs.trunk.x0=-0.088974;       ICs.trunk.vx0=1.3;   
ICs.trunk.y0=1.325033;        ICs.trunk.vy0=0.0; 
ICs.trunk.z0=-0.017019;       ICs.trunk.vz0=-0.2;

ICs.target0.saggital=70*pi/180;
ICs.target0.frontal=90*pi/180;

 ICs.trunk.qR0= -2.5517e-04;
 ICs.trunk.qP0= -0.1700;
 ICs.trunk.qY0= -0.0030;
 
 

