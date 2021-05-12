%
% nms3D_mInit.m - initialize muscle parameters of human neuromuscular model
%
% H Geyer, March 2018
%


% initialize muscle param structure
mParams.muscles = [];



% =============== %
% MUSCLE DYNAMICS %
% =============== %

% Shared muscle tendon parameters
% -------------------------------

% excitation-contraction coupling
mParams.muscles.preA =  0.01; %[] preactivation
%mParams.muscles.preA =  0; %[] preactivation
mParams.muscles.tauA =  0.01; %[s] excitation-contrction coupling delay time constant

% contractile element (CE) force-length relationship
mParams.muscles.w    =  0.56; %[lopt] width
mParams.muscles.c    =  0.05; %[]; remaining force at +/- width

% CE force-velocity relationship
mParams.muscles.N    =   1.5; %[Fmax] eccentric force enhancement

% Series elastic element (SE) force-length relationship
mParams.muscles.eref =  0.04; %[lslack] tendon reference strain
mParams.muscles.K    =     5; %[] shape factor

% Damping factor
mParams.muscles.beta= 0.1;

% stretch reflex
mParams.muscles.K_l  =     5; %[] shape factor
mParams.muscles.K_v  =  0.03; %[] shape factor
mParams.muscles.h    =  0.65; %[] resting level


% Muscle-specific parameters (vectoried)
% --------------------------------------

% acronyms:
%
% HAB  - hip abductors
% HAD  - hip adductors
% HFL  - hip flexors
% GLU  - glutei muscles
% HAM  - hamstring muscle
% RF   - rectus femoris muscle
% VAS  - vasti muscles
% BFSH - biceps femoris short head muscle
% GAS  - gastrocnemius muscle
% SOL  - soleus muscle
% TA   - tibialis anterior muscle

% muscle name 
mParams.muscles.Names     = {'HAB' 'HAD' 'HFL' 'GLU' 'HAM' 'RF' 'VAS' 'BFSH' 'GAS' 'SOL' 'TA'};

% maximum isometric force [N]
mParams.muscles.FmaxVec   = [3000 4500 2000 1500 3000 1200 6000  350 1500 4000  800];

% optimum fiber length [m]
mParams.muscles.loptVec   = [0.09 0.10 0.11 0.11 0.10 0.08 0.08 0.12 0.05 0.04 0.06];

% maximum contraction velocity [lopt/s] .* lopt
mParams.muscles.vmaxVec   = [  12   12   12   12   12   12   12   12   12    6   12] ...
                               .* mParams.muscles.loptVec;

% tendon slack length [m]
mParams.muscles.lslackVec = [0.07 0.18 0.10 0.13 0.31 0.35 0.23 0.10 0.40 0.26 0.24];



% ========================== %
% Muscle-Skeleton Attachment %
% ========================== %
  
% The muscle moment arm functions are characterized by a maximum and 
% minimum moment arm, rMx and rMn, by the corresponding joint angles
% qMx and qMn, and by the joint angle qRef at which the muscle takes on
% the reference length lm = lslack+lopt.
%
% In previous models, the moment arm function was represented by either
% a constant or a cosine function. The representation is trivial, 
% r(q) = rMx (q-qMx). The second representation is given by
% r(q) = rMx cos(a*(q-qMx)), where a is a scaling factor with
% a = acos(rMn/rMx) / (qMn-qMx).
%
% In the present model, the latter function r(q) is represented by the
% polynomial approximation of the cosine function (cos x = 1 - x^2/2):
% r(q) = rMx - c0 (q-qMx)^2, where c0 = (rMx-rMn)/(qMn-qMx)^2.
% 
% The resulting change in muscle length, dl, then becomes
% dl(q) = c1 + rMx*q - c0/3*(q-qMx)^3 with c1 = c0/3*(qRef-qMx)^3 - rMx*qRef.
%



% ---------------------------------------
% Individual Muscle Moment Arm Parameters
% ---------------------------------------

% hip abductor (HAB)
mParams.muscles.HAB.r0    =      0.06; % [m] constant moment arm
mParams.muscles.HAB.qRef  = 10*pi/180; % [rad] reference angle at which MTU length equals sum of lopt and lslack
mParams.muscles.HAB.rho   =       0.7; % [] pennation factor        

% hip adductor (HAD)
mParams.muscles.HAD.r0    =      0.03; % [m] constant moment arm 
mParams.muscles.HAD.qRef  = 15*pi/180; % [rad] reference angle at which MTU length equals sum of lopt and lslack
mParams.muscles.HAD.rho   =         1; % [] pennation factor   

% hip flexor group (HFL)
mParams.muscles.HFL.r0    =       0.08; % [m] constant moment arm 
mParams.muscles.HFL.qRef  = 160*pi/180; % [rad] reference angle at which MTU length equals sum of lopt and lslack 
mParams.muscles.HFL.rho   =        0.5; % [] pennation factor            

% glutei group (GLU)
mParams.muscles.GLU.r0    =       0.08; % [m] constant moment arm  
mParams.muscles.GLU.qRef  = 120*pi/180; % [rad] reference angle at which MTU length equals sum of lopt and lslack
mParams.muscles.GLU.rho   =        0.5; % [] pennation factor 

% hamstring group (HAM) at hip
mParams.muscles.HAM.r0H   =       0.08;  % [m] constant moment arm
mParams.muscles.HAM.qRefH = 150*pi/180;  % [rad] reference angle at which MTU length equals sum of lopt and lslack 
mParams.muscles.HAM.rhoH  =        0.5;  % [] pennation factor     

% hamstring group (HAM) at knee
mParams.muscles.HAM.r0K   =       0.05; % [m] constant moment arm 
mParams.muscles.HAM.qRefK = 180*pi/180; % [rad] reference angle at which MTU length equals sum of lopt and lslack 
mParams.muscles.HAM.rhoK  =        0.5; % [] pennation factor   

% rectus femoris (RF) at hip
mParams.muscles.RF.r0H    =       0.08; % [m] constant moment arm  
mParams.muscles.RF.qRefH  = 170*pi/180; % [rad] reference angle at which MTU length equals sum of lopt and lslack
mParams.muscles.RF.rhoH   =        0.3; % [] pennation factor  

% rectus femoris (RF) at knee
mParams.muscles.RF.rMxK   =       0.06; % [m] max moment arm
mParams.muscles.RF.rMnK   =       0.04; % [m] min moment arm
mParams.muscles.RF.qMxK   = 165*pi/180; % [rad] angle of r=rMx
mParams.muscles.RF.qMnK   =  45*pi/180; % [rad] angle of r=rMn
mParams.muscles.RF.qRefK  = 125*pi/180; % [rad] reference angle at which MTU length equals lopt + slack
mParams.muscles.RF.c0K    = (mParams.muscles.RF.rMxK-mParams.muscles.RF.rMnK) / (mParams.muscles.RF.qMnK-mParams.muscles.RF.qMxK)^2; % constant c0 for r(q)
mParams.muscles.RF.c1K    = mParams.muscles.RF.c0K/3*(mParams.muscles.RF.qRefK-mParams.muscles.RF.qMxK)^3-mParams.muscles.RF.rMxK*mParams.muscles.RF.qRefK; % constant c1 for dl(q)
mParams.muscles.RF.rhoK   =        0.5; % [] pennation factor   

% vasti group (VAS)
mParams.muscles.VAS.rMx   =       0.06;   % [m] max moment arm
mParams.muscles.VAS.rMn   =       0.04;   % [m] min moment arm
mParams.muscles.VAS.qMx   = 165*pi/180;   % [rad] angle of r=rMx
mParams.muscles.VAS.qMn   =  45*pi/180;   % [rad] angle of r=rMn
mParams.muscles.VAS.qRef  = 120*pi/180;   % [rad] reference angle at which MTU length equals lopt + slack
mParams.muscles.VAS.c0    = (mParams.muscles.VAS.rMx-mParams.muscles.VAS.rMn) / (mParams.muscles.VAS.qMn-mParams.muscles.VAS.qMx)^2; % constant c0 for r(q)
mParams.muscles.VAS.c1    = mParams.muscles.VAS.c0/3*(mParams.muscles.VAS.qRef-mParams.muscles.VAS.qMx)^3-mParams.muscles.VAS.rMx*mParams.muscles.VAS.qRef; % constant c1 for dl(q)
mParams.muscles.VAS.rho   = 0.6; % [] pennation factor         

% biceps femoris short head (BFSH)
mParams.muscles.BFSH.r0   = 0.04;         % [m] constant moment arm 
mParams.muscles.BFSH.qRef = 160*pi/180;   % [rad] reference angle at which MTU length equals lopt + slack
mParams.muscles.BFSH.rho  = 0.7;          % [] pennation factor

% gastrocnemius (GAS) at knee
mParams.muscles.GAS.rMxK  = 0.05;         % [m] max moment arm
mParams.muscles.GAS.rMnK  = 0.02;         % [m] min moment arm
mParams.muscles.GAS.qMxK  = 140*pi/180;   % [rad] angle of r=rMx
mParams.muscles.GAS.qMnK  =  45*pi/180;   % [rad] angle of r=rMn
mParams.muscles.GAS.qRefK = 165*pi/180;   % [rad] reference angle at which MTU length equals lopt + slack
mParams.muscles.GAS.c0K   = (mParams.muscles.GAS.rMxK-mParams.muscles.GAS.rMnK) / (mParams.muscles.GAS.qMnK-mParams.muscles.GAS.qMxK)^2; % constant c0 for r(q)
mParams.muscles.GAS.c1K   = mParams.muscles.GAS.c0K/3*(mParams.muscles.GAS.qRefK-mParams.muscles.GAS.qMxK)^3-mParams.muscles.GAS.rMxK*mParams.muscles.GAS.qRefK; % constant c1 for dl(q)
mParams.muscles.GAS.rhoK  = 0.7;          % [] pennation factor

% gastrocnemius (GAS) at ankle
mParams.muscles.GAS.rMxA  = 0.06;         % [m] max moment arm
mParams.muscles.GAS.rMnA  = 0.02;         % [m] min moment arm
mParams.muscles.GAS.qMxA  = 100*pi/180;  	% [rad] angle of r=rMx
mParams.muscles.GAS.qMnA  = 180*pi/180; 	% [rad] angle of r=rMn
mParams.muscles.GAS.qRefA =  80*pi/180;  	% [rad] reference angle at which MTU length equals lopt + slack
mParams.muscles.GAS.c0A   = (mParams.muscles.GAS.rMxA-mParams.muscles.GAS.rMnA) / (mParams.muscles.GAS.qMnA-mParams.muscles.GAS.qMxA)^2; % constant c0 for r(q)
mParams.muscles.GAS.c1A   = mParams.muscles.GAS.c0A/3*(mParams.muscles.GAS.qRefA-mParams.muscles.GAS.qMxA)^3-mParams.muscles.GAS.rMxA*mParams.muscles.GAS.qRefA; % constant c1 for dl(q)
mParams.muscles.GAS.rhoA  = 0.7; 	        % [] pennation factor 

% soleus (SOL)
mParams.muscles.SOL.rMx   = 0.06;         % [m] max moment arm
mParams.muscles.SOL.rMn   = 0.02;         % [m] min moment arm
mParams.muscles.SOL.qMx   = 100*pi/180;   % [rad] angle of r=rMx
mParams.muscles.SOL.qMn   = 180*pi/180;   % [rad] angle of r=rMn
mParams.muscles.SOL.qRef  =  90*pi/180;   % [rad] reference angle at which MTU length equals lopt + slack
mParams.muscles.SOL.c0    = (mParams.muscles.SOL.rMx-mParams.muscles.SOL.rMn) / (mParams.muscles.SOL.qMn-mParams.muscles.SOL.qMx)^2; % constant c0 for r(q)
mParams.muscles.SOL.c1    = mParams.muscles.SOL.c0/3*(mParams.muscles.SOL.qRef-mParams.muscles.SOL.qMx)^3-mParams.muscles.SOL.rMx*mParams.muscles.SOL.qRef; % constant c1 for dl(q)
mParams.muscles.SOL.rho   = 0.5;          % [] pennation factor  

% tibialis anterior (TA)
mParams.muscles.TA.rMx    = 0.04;         % [m] max moment arm
mParams.muscles.TA.rMn    = 0.01;         % [m] max moment arm
mParams.muscles.TA.qMx    =  80*pi/180;   % [rad] angle of r=rMx
mParams.muscles.TA.qMn    = 180*pi/180;   % [rad] angle of r=rMn
mParams.muscles.TA.qRef   = 110*pi/180;   % [rad] reference angle at which MTU length equals lopt + slack
mParams.muscles.TA.c0     = (mParams.muscles.TA.rMx-mParams.muscles.TA.rMn) / (mParams.muscles.TA.qMn-mParams.muscles.TA.qMx)^2; % constant c0 for r(q)
mParams.muscles.TA.c1     = mParams.muscles.TA.c0/3*(mParams.muscles.TA.qRef-mParams.muscles.TA.qMx)^3-mParams.muscles.TA.rMx*mParams.muscles.TA.qRef; % constant c1 for dl(q)
mParams.muscles.TA.rho    = 0.7;          % [] pennation factor  



